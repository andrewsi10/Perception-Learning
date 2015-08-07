clear all
RandStream.setGlobalStream(RandStream('mt19937ar', 'seed', sum(100*clock)));

resultsString = '\results';
if isunix == 1
    resultsString = '/results';
end

%Set up directory to store experiment results
rootDir = pwd();
if ~isdir([rootDir resultsString])
    mkdir([rootDir resultsString]);
    resultsDir = [rootDir resultsString];
else
    resultsDir = [rootDir resultsString];
end

%Create a results file and ensure it isn't overwriting anything
resultsFile = 'results1';
fullPath = fullfile(resultsDir, strcat(resultsFile, '.mat') );
temp = 2;
while exist(fullPath, 'file') == 2
    resultsFile = strcat(resultsFile(1:7), int2str(temp), '.mat');
    fullPath = fullfile(resultsDir, resultsFile );
    temp = temp + 1;
end

%Set up Screen and Window
Screen('Preference','SkipSyncTests',1);
[window, rect] = Screen('OpenWindow', 0);
Screen('BlendFunction', window, GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
HideCursor();

[TextureVector ImageWidth] = Readingimages(window);
[y, Fs] = audioread('everything is awesome.mp3');
player = audioplayer(y, Fs);
play(player);

%Run the trial and record responses
numTrials = 4;
responses = zeros(5, numTrials);
for i=1:numTrials
    [diff locdiff avg locavg subsetsize] = DisplayingLegos(window, rect, TextureVector, ImageWidth);
    responses(i, 1) = diff;
    responses(i, 2) = locdiff;
    responses(i, 3) = avg;
    responses(i, 4) = locavg;
    responses(i, 5) = subsetsize;
    
    if mod(i,50) == 0
        Screen('DrawText', window, 'Take a break!', rect(3)*0.5, rect(4)*0.5);
        Screen('DrawText', window, 'Press Space to Continue', rect(3)*0.5, rect(4)*0.5 + 50);
        Screen('Flip', window);
        WaitSecs(0.05);
        [~,~,keyCode] = KbCheck();
        while ~keyCode(KbName('space'))
            [~,~,keyCode] = KbCheck();
        end
    end
end

stop(player);

%Save the results file and close the Screen
save(fullPath, 'responses');
Screen('CloseAll');