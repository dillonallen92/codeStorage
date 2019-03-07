% This is a modified program from a book on dynamical systems
% Base code is from Dynamical Systems with Applications using MATLAB by Birkhauser Basel
% This is Program 5d: Animated bifurcation diagram for a SFR resonator, Chp 5 pg 102 (base script)
% The parameter kappa (related to fibre coupling) is increased. 
% I created the function, while loop, user input, and input checking for valid responses

clear, clc, close all;
tryAgain = true;

while tryAgain

    % Ask user for constant input
    C = input('Enter your C constant (keep around .3 - 1): '); % This increases the speed of the bifurcation
    kappaScale = input('Enter your kappa (keep around 0.001): '); % the scaling constant on the plot
    Pmax = input('Enter your maximum power: '); % The lower the max power, the higher up the bifurcation starts
    frameCount = input('Enter the amount of frames you wish to run (typical is 60): ');

    % Input check the amount of frames entered
    if (frameCount <= 0)
        disp('This is not a valid frame count. Try again.');
        frameCount = input('Enter the amount of frames you wish to run (typical is 60): ');
    end

    plotSFRBifurcation(frameCount, C, kappaScale, Pmax);

    uInput = input('Would you like to try again? (y/n) ', 's');

    if (uInput == 'y')
        tryAgain = true;
    else
        tryAgain = false;
    end

end

function plotSFRBifurcation(frameCount, C, kappaScale, Pmax)

    % Instantiate variables
    halfN=7999;
    N=2*halfN+1;
    N1=1+halfN;
    E1=zeros(1,N);
    E2=zeros(1,N); 
    Esqr=zeros(1,N);
    Esqr1=zeros(1,N);
    ptsup=zeros(1,N); 

    for j = 1:frameCount % amount of frames, typically 60
        F(j) = getframe;
        format long;
        E1(1)=0;
        kappa=kappaScale*j;
        phi=0;

        % Ramp the power up 
        for n=1:halfN
            E2(n+1)=E1(n)*exp(1i*(abs(C*E1(n))^2-phi)); 
            E1(n+1)=1i*sqrt(1-kappa)*sqrt(n*Pmax/N1)+sqrt(kappa)*E2(n+1); 
            Esqr(n+1)=abs(E1(n+1))^2;
        end

        % Ramp the power down 
        for n=N1:N
            E2(n+1)=E1(n)*exp(1i*(abs(C*E1(n))^2-phi)); 
            E1(n+1)=1i*sqrt(1-kappa)*sqrt(2*Pmax-n*Pmax/N1)+sqrt(kappa)*E2(n+1);
            Esqr(n+1)=abs(E1(n+1))^2; 
        end

        for n=1:halfN
            Esqr1(n)=Esqr(N+1-n); 
            ptsup(n)=n*Pmax/N1;
        end

        % Plot the bifurcation diagrams 
        fsize=15;
        hold 
        plot(ptsup(1:halfN), Esqr(1:halfN), '.', 'MarkerSize', 1, 'Color', 'r');
        plot(ptsup(1:halfN), Esqr1(1:halfN), '.', 'MarkerSize', 1, 'Color', 'b');
        xlabel('Input power');
        ylabel('Output power');
        title('Bifurcation diagram for an Optical Resonator');
    end

    movie(F,5)
end