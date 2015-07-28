clear all
temp = dummyfunction(5);
TextureVector = imagereader(1);
MorphVector = imagereader(2);
imagerandomizer(TextureVector);
rootDir = pwd();
if ~isdir([rootDir '/results/'])
    resultsDir = mkdir([rootDir '/results/']);
else
    resultsDir = [rootDir '/results/'];
end
Screen('Preference','SkipSyncTests',1);
[Window, rect] = Screen('OpenWindow', 0);
Screen('BlendFunction', Window, GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
HideCursor();
numTrials = 10;
responses = zeros(2, numTrials);
for i=1:numTrials
    [deltamorph, userinput] = imagedisplay(Window, TextureVector, MorphVector);
    responses(1, numTrials) = userinput;
    responses(2, numTrials) = deltamorph;
end
fullPath = fullfile(resultsDir, 'results');
save(fullPath, 'responses');
Screen('CloseAll');