% PROJECT 2
% Dillon Allen
% Goal: Design a class that allows the user to create a signal and implement 
% a low-pass, high-pass and bandpass filter. Plot all results.
% Probably scrapping this project for another one

classdef generateSignal
    % This is a class that generates signals and has a collection of filters.
    % Arguments are (amplitude, sample_freq, time_Stop, lower_bound for freq, upper_bound for freq, rand_noise_bool)
    properties
        a = 0;
        fs = 0;
        ts = 0;
        t = 0;
        lowf = 0;
        highf = 0;
        randFuzzBool = false;
        randFuzz = 0;
        inputSignal = 0;
    end

    methods 
            
        function mySignal = generateSignal(varargin)
            mySignal.a = varargin{1}; 
            mySignal.fs = varargin{2};
            mySignal.ts = varargin{3};
            mySignal.lowf = varargin{4};
            mySignal.highf = varargin{5};
            mySignal.randFuzzBool = varargin{6};
            mySignal.t = 0 : 1/(mySignal.fs) : mySignal.ts;
            freq_range = linspace(mySignal.lowf, mySignal.highf, 1/(mySignal.fs));
            if mySignal.randFuzzBool
                mySignal.randFuzz = randn(size(mySignal.t))/10;
            end
            mySignal.inputSignal = mySignal.a*sin(2*pi.*freq_range.*mySignal.t) + mySignal.randFuzz; 
        end

        function disp(mySignal)
            innerProdThing = mySignal.fs * 2 * pi;
            fprintf("First index of the fuzzy signal: %+f sin(%+f t) + %+f\n", mySignal.a, innerProdThing, mySignal.randFuzz(1));
            disp("Please note the whole signal is a collection of these!")
        end

        function plot(mySignal)
            plot(mySignal.t, mySignal.inputSignal);
            title("Signal Plot");
            ylabel("Voltage (V)");
            xlabel("Time (t)");
        end

        % TODO: Add, Mult, uMinus, Low-pass, High-pass, Bandpass filters.
        % TODO: Research other filters and plots

    end
end