function [rightorwrong frequency ] = imagedisplay(window, rect, TextureVector, ImageWidth)


%variables that can be changed
x_center = rect(3)/2;
y_center = rect(4)/2;
image_width = ImageWidth(1);
image_height = ImageWidth(1);
average = randi(150);
%distance between the centers of the images
radiusofimages = 400;
% array of degrees from 0 to 300 incrementing by 60 degs each time.
degrees = [0:60:300];

poss_freq = [5:5:10];
frequency = randsample(poss_freq, 1);
%draws the circle in the middle

% getMouse
%    [x_center - image_width/2,y_center - image_height/2,buttons,focus,valuators,valinfo] = GetMouse([windowPtrOrScreenNumber][, mouseDev])
%    [clicks,x,y,whichButton] = GetClicks([windowPtrOrScreenNumber][, interclickSecs][, mouseDev])

[keyIsDown, secs, KeyCode] = KbCheck();

%  while any(buttons) % if already down, wait for release
%        [x,y,buttons] = GetMouse;
%  end
%  while ~any(buttons) % wait for press
%        [x,y,buttons] = GetMouse;
%  end
%  while any(buttons) % wait for release
%        [x,y,buttons] = GetMouse;
%  end
numcircles = 6;
while keyIsDown
    [keyIsDown, secs, KeyCode] = KbCheck();
    WaitSecs(0.1);
end
numofFlickers = 20;
weird = randi(6);
h = randi(2);
oneorzero = [0 1];
for j = 1:numofFlickers
    % draws the six circles
    for i = 1:numcircles
        if i ~= weird
            
            
            Screen('DrawTexture', window, TextureVector(mod(j + oneorzero(h),2) + 1), [], ...
                [x_center + radiusofimages * cosd(degrees(i)) - ImageWidth/2, y_center - radiusofimages * sind(degrees(i)) - ImageWidth/2, ...
                x_center + radiusofimages * cosd(degrees(i)) + ImageWidth/2, y_center - radiusofimages * sind(degrees(i)) + ImageWidth/2]);
            
        else
            
            Screen('DrawTexture', window, TextureVector(mod(j + oneorzero(mod(h, 2) + 1),2) + 1), [], ...
                [x_center + radiusofimages * cosd(degrees(i)) - ImageWidth/2, y_center - radiusofimages * sind(degrees(i)) - ImageWidth/2, ...
                x_center + radiusofimages * cosd(degrees(i)) + ImageWidth/2, y_center - radiusofimages * sind(degrees(i)) + ImageWidth/2]);
        end
        
    end
    Screen('Flip', window);
    WaitSecs(1/frequency);
end
Screen('Flip', window);
while 1
    [keyIsDown, secs, KeyCode] = KbCheck();
    if KeyCode(KbName('d'))
        response = '1' ;
        break;
    end
    
    if KeyCode(KbName('e'))
        response = '2' ;
        break;
    end
    if KeyCode(KbName('w'))
        response = '3';
        break;
    end
    
    if KeyCode(KbName('a'))
        response = '4';
        break;
    end
    if KeyCode(KbName('z'))
        response = '5';
        break;
    end
    if KeyCode(KbName('x'))
        response = '6';
        break;
    end
end

if str2num(response) == weird
    rightorwrong = 1;
else
    rightorwrong = 0;
end

WaitSecs(0.5);
%describe task -> participants: Gender, handedness, age: m, sd -> results
%-> how does the experiment contribute to the ensemble coding thing






