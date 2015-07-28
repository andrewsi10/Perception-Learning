function [accuracy]  = DisplayingImages(window, TextureVector, picture1, picture2, randLorR, rect)

window_x = rect(3);
window_y = rect(4);

x_center = window_x/2;
y_center = window_y/2;

img_w = 400;
img_h = 400;

%drawing top picture
Screen('DrawTexture', window, TextureVector(picture1), [], ...
    [x_center - img_w/2, window_y*0.25 - img_h/2 , x_center + img_w/2, window_y*0.25 + img_h/2 ]);

if randLorR == 1 % correct on left
    left = picture1;
    right = picture2;
else % correct on right
    left = picture2;
    right = picture1;
end

%drawing bottom left pictures
Screen('DrawTexture', window, TextureVector(left), [], ...
    [window_x*0.25 - img_w/2, window_y*0.75 - img_h/2 , window_x*0.25 + img_w/2, window_y*0.75 + img_h/2 ]);

% drawing botton right picture
Screen('DrawTexture', window, TextureVector(right), [], ...
    [window_x*0.75 - img_w/2, window_y*0.75 - img_h/2, window_x*.75 + img_w/2, window_y*0.75 + img_h/2 ]);

Screen('Flip', window);
WaitSecs(1);

Screen('Flip', window);
WaitSecs(1);

% %% Getting Response
[keyIsDown, secs, KeyCode] = KbCheck;
while 1
    [keyIsDown, secs, KeyCode] = KbCheck;
    if KeyCode(KbName('s'))
        response = 's' ;
        break
    end
    if KeyCode(KbName('k'))
        response = 'k' ;
        break
    end
end

if  strcmp(response, 's') && randLorR == 1
    accuracy = 1;
elseif strcmp(response, 'k') && randLorR == 1
    accuracy = 0;   
elseif strcmp(response, 's') && randLorR == 2
    accuracy = 0;
elseif strcmp(response, 'k') && randLorR == 2
    accuracy = 1;
end

