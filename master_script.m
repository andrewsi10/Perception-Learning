clear all
temp = dummyfunction(5);
TextureVector = imagereader(1);
MorphVector = imagereader(2);
imagerandomizer(TextureVector);
ResultsFile = createresultsfile();
Screen('Preference','SkipSyncTests',1);
[Window, rect] = Screen('OpenWindow', 0);
Screen('BlendFunction', Window, GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
HideCursor();
numTrials = 10;
for i=1:10
    [deltamorph, userinput] = imagedisplay(Window, TextureVector, MorphVector);
    storeresponse(ResultsFile, deltamorph, userinput);
end
Screen('DrawText', Window, num2str(temp), 1366/2 - 200, 768/2 - 50);
Screen('Flip', Window);
WaitSecs(2);
Screen('CloseAll');