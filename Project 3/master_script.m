clear all
RandStream.setGlobalStream(RandStream('mt19937ar', 'seed', sum(100*clock)));

%Set up directory to store experiment results
rootDir = pwd();
if ~isdir([rootDir '\results'])
    mkdir([rootDir '\results']);
    resultsDir = [rootDir '\results'];
else
    resultsDir = [rootDir '\results'];
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

TextureVector = makingcircles(window);

%Run the trial and record responses
numTrials = 4;
responses = zeros(1, numTrials);
for i=1:numTrials
    difference = imagedisplay(window, rect, TextureVector);
    responses(i,1) = difference;
    
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
%save(fullPath, 'responses');
Screen('CloseAll');