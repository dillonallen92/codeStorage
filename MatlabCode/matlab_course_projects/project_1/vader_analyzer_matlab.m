function [posScore, compScore, neutScore, negScore] = vader_analyzer_matlab(sentence)

    % This is an attempt to copy the VADER (Valence Aware Dictionary and sEntiment Reasoner)
    % This algorithm was recently inducted into the NLTK library for Python, but I have noticed that
    % there is no equivalent for Matlab. 
    % Goal: This will be the main function script to do all the heavy lifting
    % Other scripts will be written to test and plot the results.

    % Check to see if it works by displaying the sentence back, in lower case
    disp(' ');
    sentence = lower(sentence);
    disp(sentence);
    disp(' ');

    % Using the mean positive sentiment score from the original work
    pos_inc = 0.293;
    neg_inc = -0.293;

    % pre-allocate the values to run faster and prevent errors
    posScore = 0; compScore = 0; neutScore = 0; negScore = 0;
    
    % First, I will create a list of strings that are positive and write a function to score the positive ranking
    posWordsList = {'absolutely', 'amazing' ,'amazingly', 'awfully', 'completely', 'considerably', 'decidedly', 'deeply', ...
                    'effing', 'enormously', 'entirely', 'especially', 'exceptionally', 'extremely', 'fabulously', ...
                    'flipping', 'flippin', 'fricking', 'frickin', 'friggin', 'fully', 'greatly', 'hella', ...
                    'highly', 'hugely', 'incredibly', 'intensely', 'majorly', 'more', 'most', 'particularly', ...
                    'purely', 'quite', 'really', 'remarkably', 'so', 'substantially', 'thoroughly', 'totally', ...
                    'tremendously', 'uber', 'unbelievably', 'unusually', 'utterly', 'very', 'good', 'decent', 'okay'};
    % Negative words list
    negWordsList = {'almost', 'barely', 'hardly', 'just enough', 'kind of', 'kinda', 'kindof', 'kind-of', ...
                    'less', 'little', 'marginally', 'occasionally', 'partly', 'scarcely', 'slightly', ...
                    'somewhat', 'sort of', 'sorta', 'sortof', 'sort-of', 'worst', 'stupid', 'awful', 'horrible', ...
                    'ridiculous', 'bad', 'waste', 'garbage', 'lack', 'dumb'};

    % use .contains to score from the positive list
    if sentence.contains(posWordsList)
        posScore = posScore + pos_inc;
    end

    if sentence.contains(negWordsList)
        negScore = negScore + neg_inc;
    end

    posScore = normalize_score(posScore, 15);
    negScore = normalize_score(negScore, 15);

    if abs(posScore) > abs(negScore)
        disp('The given sentence has an overall positive sentiment');
    else
        disp('The given sentence has an overall negative sentiment');
    end

    disp('  ');
    disp(['The positive sentiment score of the above sentence is ', num2str(posScore)]);
    disp(['The compound sentiment score of the above sentence is ', num2str(compScore)]);
    disp(['The neutral sentiment score of the above sentence is ', num2str(neutScore)]);
    disp(['The negative sentiment score of the above sentence is ', num2str(negScore)]);

    function score = normalize_score(score, alpha)

        % Normalize the score with some pre-determined alpha
        score = score / (sqrt(score^2 + alpha));
    
        % Keep the scores between -1 and 1
        if score > 1
            score = 1;
        elseif score < -1
            score = -1;
        else
            score = score;
        end
        
    end

end



