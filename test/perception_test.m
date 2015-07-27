disp('Hello World!');
for i=1:4:10
    disp(strcat('i = ', num2str(i)));
end
%{
%SAVING RESULTS
rootDir = pwd(); returns current folder path
if ~isdir(resultsDir)
resultsDir = [rootDir '/results/']; create results folder
resultsDir = mkdir(resultsDir);
end
result = cell(# of trials, # of results);
for itrial = 1:100
accuracy = ...
speed = ...
result{itrial, 1} = accuracy;
result{itrial, 2} = speed;
save(filename, 'result');
%filename is participant coded ID, don't overwrite!
end
%}

%{
%keyboard and mouse IO
kbCheck(); returns keys that are pressed
GetMouse(); returns 0 if button not pressed and 1 if pressed
GetClicks(); returns # of mouse clicks
reject key presses that aren't relevant to the experiment
while ~strcmp(kbCheck(), 0) %strcmp returns 1/true if two strings are identical
%}