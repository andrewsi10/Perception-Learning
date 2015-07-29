clear all
RandStream.setGlobalStream(RandStream('mt19937ar', 'seed', sum(100*clock)));
%Set up directory to store experiment results
rootDir = pwd();
if ~isdir([rootDir '/results/'])
    resultsDir = mkdir([rootDir '/results/']);
else
    resultsDir = [rootDir '/results/'];
end

%Set up Screen and Window
Screen('Preference','SkipSyncTests',1);
[window, rect] = Screen('OpenWindow', 0);
Screen('BlendFunction', window, GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
HideCursor();

[TextureVector, picture1, picture2, morph_dist, randLorR] = readingrandom(window);

%Run the trial and record responses
numTrials = 130;
responses = zeros(2, numTrials);
for i=1:numTrials
    [accuracy] = DisplayingImages(window, TextureVector, picture1(i), picture2(i), randLorR(i), rect);
    responses(i,1) = accuracy;
    responses(i,2) = morph_dist(i);
    if mod(i,50) == 0
        Screen('DrawText', window, 'Take a break!', rect(3)*0.5, rect(4)*0.5);
        Screen('Flip', window);
        WaitSecs(0.05);
        [~,~,keyCode] = KbCheck();
        while ~keyCode(KbName('space'))
            [~,~,keyCode] = KbCheck();
        end
    end
end
%Save the results file and close the Screen
fullPath = fullfile(resultsDir, 'results');
save(fullPath, 'responses');
Screen('CloseAll');