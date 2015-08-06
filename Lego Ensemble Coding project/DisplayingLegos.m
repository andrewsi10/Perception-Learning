function [diff locdiff average local_average subsetsize] = imagedisplay(window, rect, TextureVector, ImageWidth)


%variables that can be changed
x_center = rect(3)/2;
y_center = rect(4)/2;
image_width = ImageWidth(1);
image_height = ImageWidth(1);
average = randi(150);
%distance between the centers of the images
radiusofimages = 300;
% array of degrees from 0 to 300 incrementing by 60 degs each time.
degrees = [0:60:300];
x = randi(4);

if x == 1
    numlegos = 1;
end
if x == 2
    numlegos = 2;
end
if x == 3
    numlegos = 4;
end
if x == 4
    numlegos = 6;
end

subsetsize = numlegos;

%draws the circle in the middle

% getMouse
%    [x_center - image_width/2,y_center - image_height/2,buttons,focus,valuators,valinfo] = GetMouse([windowPtrOrScreenNumber][, mouseDev])
%    [clicks,x,y,whichButton] = GetClicks([windowPtrOrScreenNumber][, interclickSecs][, mouseDev])

[x,y,buttons] = GetMouse;

%  while any(buttons) % if already down, wait for release
%        [x,y,buttons] = GetMouse;
%  end
%  while ~any(buttons) % wait for press
%        [x,y,buttons] = GetMouse;
%  end
%  while any(buttons) % wait for release
%        [x,y,buttons] = GetMouse;
%  end
random_starter = randi(150);
vector = [-9 -6 -3 3 6 9];
vector = Shuffle(vector);
starting_x = x;
while any(buttons)
   [x,y,buttons] = GetMouse;
    WaitSecs(0.1);
end
local_average = 0;
for i = 1:numlegos
    local_average = local_average + vector(i);
end
local_average = local_average + numlegos * average;
local_average = local_average / numlegos;
display(local_average);
display(average);
degrees = Shuffle(degrees);
while ~any(buttons)
    % draws the six circles
    for i = 1:numlegos
        temp = abs(mod(average+vector(i), 150)) + 1;
        
        Screen('DrawTexture', window, TextureVector(1), [], ...
            [x_center + x_center/2 + radiusofimages * cosd(degrees(i)) - ImageWidth(temp)/2, y_center - radiusofimages * sind(degrees(i)) - ImageWidth(temp)/2, ...
             x_center - x_center/2 + radiusofimages * cosd(degrees(i)) + ImageWidth(temp)/2, y_center - radiusofimages * sind(degrees(i)) + ImageWidth(temp)/2]);
    end
    % draws the seventh circle that the user modifies
    [x,y,buttons] = GetMouse;
    forty = floor(abs(mod(random_starter + x - starting_x, 150)) + 1);
    Screen('DrawTexture', window, TextureVector(1), [], ...
        [ x_center - ImageWidth(forty)/2, y_center - ImageWidth(forty)/2, x_center + ImageWidth(forty)/2, y_center + ImageWidth(forty)/2]);
    Screen('Flip', window);
end
    Screen('Flip', window);
    WaitSecs(0.5);
diff = min(average - forty, 150 - average + forty); 
locdiff = min(local_average - forty, 150 - local_average + forty);
%describe task -> participants: Gender, handedness, age: m, sd -> results
%-> how does the experiment contribute to the ensemble coding thing








