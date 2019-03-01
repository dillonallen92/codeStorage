classdef vader
    % Class for VADER Analysis
    properties (GetAccess = private)
        posScore       % Positive sentiment score
        compScore      % Compound sentiment score
        neutScore      % Neutral sentiment score
        negScore       % Negative sentiment score
        alpha = 15;    % Normalization constant
        posWordsList   % positive word list
        compWordsList  % Compound word list
        neutWordsList  % Neutral Word List
        negWordsList   % Negative word list
    end
    properties
        targetSentence % Target sentence
    end

    methods
        function obj = vader()
            % default constructor
        end
        
        function cs = cleanSentence(targetSentence)
            % This function will clean the sentence of stopwords
        end

        function normScore = normalizeScore(score, alpha)
            % This function will normalize the score for a given alpha value
        end

        function [posScore, compScore, neutScore, negScore] = sentimentCheck(cs)
            % This will run the sentiment checker
        end

        function dispScore(posScore, compScore, neutScore, negScore)
            % This will compare all 4 scores to determine the overall sentiment
            % then display the scores to the user
        end
    end

end