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
[Window, rect] = Screen('OpenWindow', 0);
Screen('BlendFunction', Window, GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
HideCursor();

[TextureVector, picture1, picture2, randLorR] = readingrandom(Window);

%Run the trial and record responses
numTrials = 10;
responses = zeros(2, numTrials);
for i=1:numTrials
    [deltamorph, userinput] = DisplayingImages(Window, TextureVector, MorphVector); %TODO
    responses(1, numTrials) = userinput;
    responses(2, numTrials) = deltamorph;
end

%Save the results file and close the Screen
fullPath = fullfile(resultsDir, 'results');
save(fullPath, 'responses');
Screen('CloseAll');