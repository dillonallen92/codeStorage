% Project 2 mark II
% Make a class that accepts an image and has image functions with it

classdef imageClass
    % Instantiate an image as an object of this function.
    % We can add motion_blur to the image, noise, and deblur the results.
    % Properties cover my image I (matrix of doubles), img (path)
    % mean of gaussian noise, variance of gassian noise, estimated
    % noise to signal ratio (nsr), Point Spread Function (PSF),
    % Blurred image matrix I_BLUR, blurred with noise matrix I_BLUR_NOISE
    % and the matrix resulting from the WNR (Wiener) filter
    properties
        I = [];
        img = [];
        noise_mean = 0;
        noise_var = 0;
        est_nsr = 0;
        I_PSF = [];
        I_BLUR = [];
        % I_NOISE = []; % saving this for later, maybe
        I_BLUR_NOISE = [];
        I_WNR3 = [];
        I_GRAY = [];
        I_EDGE = [];
    end

    methods

        % Constructor method to just get the image and matrix of doubles
        function myImg = set.I(myImg, imgPath)
            myImg.img = imgPath;
            myImg.I = im2double(imread(myImg.img));
        end

        % Method to display the original image
        function display_regular(myImg)
            imshow(myImg.I);
        end

        % Function to add motion blur
        function myImg = motion_blur(myImg, len, angle)
            myImg.I_PSF = fspecial('motion', len, angle);
            blurred = imfilter(myImg.I, myImg.I_PSF, 'conv', 'circular');
            myImg.I_BLUR = blurred;
        end

        % Function to display the blurred image
        function display_blur(myImg);
            imshow(myImg.I_BLUR);
        end

        % Function to add noise to the blurred image
        function myImg = add_noise2blurredI(myImg, noise_mean, noise_var)
            myImg.noise_mean = noise_mean;
            myImg.noise_var = noise_var;
            myImg.I_BLUR_NOISE = imnoise(myImg.I_BLUR, 'gaussian', myImg.noise_mean, myImg.noise_var);
        end

        % Image to deblur the image, with or without noise
        function myImg = deblur(myImg)

            % Calculate the noise to signal ratio
            myImg.est_nsr = myImg.noise_var / var(myImg.I(:));

            % If statement to check if blurred with noise exists
            if (sum(myImg.I_BLUR_NOISE) ~= 0)
                myImg.I_WNR3 = deconvwnr(myImg.I_BLUR_NOISE, myImg.I_PSF, myImg.est_nsr);
            else
                myImg.I_WNR3 = deconvwnr(myImg.I_BLUR, myImg.I_PSF, myImg.est_nsr);
            end

        end

        % Display the deblurred image
        function display_deblur(myImg)
            imshow(myImg.I_WNR3);
        end

        % Blur and noise all in one incase that is what you want
        function myImg = motion_blur_noise(myImg, len, angle, noise_mean, noise_var)
            myImg.I_PSF = fspecial('motion', len, angle);
            blurred = imfilter(myImg.I, myImg.I_PSF, 'conv', 'circular');
            myImg.I_BLUR = blurred;
            myImg.noise_mean = noise_mean;
            myImg.noise_var = noise_var;
            myImg.I_BLUR_NOISE = imnoise(myImg.I_BLUR, 'gaussian', myImg.noise_mean, myImg.noise_var);
        end

        % Testing random grayscaling/edge detection stuff
        function myImg = edge_detection(varargin)
            % First greyscale the image (recommended on matlab docs)
            % This function takes up to 2 arguments (for now), img and method
            myImg = varargin{1};

            myImg.I_GRAY = rgb2gray(myImg.I);

            % Now apply a filter and show it, based on number of arguments
            if nargin == 2
                method = varargin{2};
                myImg.I_EDGE = edge(myImg.I_GRAY, method);
            else
                myImg.I_EDGE = edge(myImg.I_GRAY, 'Canny');
            end

            if nargin == 3
                method = varargin{2};
                thresh = varargin{3};
                myImg.I_EDGE = edge(myImg.I_GRAY, method, thresh);
            end

            % TODO: Fix error in this statement, somewhere matrix dimensions don't agree

            % if nargin == 4
              %  method = varargin{2};
               % thresh = varargin{3};
                % if method == 'Sobel' | method == 'Prewitt' | method == 'Roberts'
                  %  dir = varargin{4};
                   % if method == 'Sobel' | method == 'Prewitt'
                    %    if dir ~= 'both' | dir ~= 'horizontal' | dir ~= 'vertical'
                     %       disp('You did not input a valid Sobel direction');
                      %  else
                       %     myImg.I_EDGE = edge(myImg.I_GRAY, method, thresh, dir)
                        % end
                    % elseif method == 'Roberts'
                      %  if dir ~= 'horizonal' | dir ~= 'vertical'
                       %     disp('This isnt a valid Prewitt direction');
                        % else
                          %  myImg.I_EDGE = edge(myImg.I_GRAY, method, thresh, dir);
                        % end
                    % else
                      %  disp('No idea what to do');
                    % end
                % elseif method == 'log' | method == 'Canny'
                  %  sigma = varargin{4};
                   % myImg.I_EDGE = edge(myImg.I_GRAY, method, thresh, sigma);
                % else
                %   disp('Not sure what to do here');
                % end
            % end

            imshow(myImg.I_EDGE);
        end

        % Display everything
        function disp_all(myImg)

            % Rename these to make conditionals less packed
            bs = sum(myImg.I_BLUR);
            bns = sum(myImg.I_BLUR_NOISE);
            wnr3s = sum(myImg.I_WNR3);

            if bs ~= 0 & bns ~=0 & wnr3s ~= 0
                subplot(221);
                imshow(myImg.I);
                title("Original Image")
                subplot(222);
                imshow(myImg.I_BLUR);
                title("Blurred Image")
                subplot(223);
                imshow(myImg.I_BLUR_NOISE);
                title("Blurred with Gaussian Noise")
                subplot(224);
                imshow(myImg.I_WNR3);
                title("WNR3 Filter Applied")
            elseif bs ~= 0 & bns ~= 0
                subplot(1,3,1);
                imshow(myImg.I);
                subplot(1,3,2);
                imshow(myImg.I_BLUR);
                subplot(1,3,3);
                imshow(myImg.I_BLUR_NOISE);
            elseif bs ~= 0 & wnr3s ~= 0
                subplot(131);
                imshow(myImg.I);
                subplot(132);
                imshow(myImg.I_BLUR);
                subplot(133);
                imshow(myImg.I_WNR3);
            elseif bs ~= 0
                subplot(1,2,1);
                imshow(myImg.I);
                subplot(1,2,2);
                imshow(myImg.I_BLUR);
            else
                disp("Not sure what you want, here is just the original image");
                imshow(myImg.I);
            end
        end

        % Function to clear everything (basically reset to base constructor)
        function myImg = clear_all(myImg)
            I = [];
            img = [];
            noise_mean = 0;
            noise_var = 0;
            est_nsr = 0;
            I_PSF = [];
            I_BLUR = [];
            I_BLUR_NOISE = [];
            I_WNR3 = [];
            I_GRAY = [];
            I_EDGE = [];
        end

    end

end
