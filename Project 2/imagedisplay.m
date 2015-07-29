clear all;

Screen('Preference', 'SkipSyncTests', 1);

[window,rect] = Screen('OpenWindow', 0);

 Screen('BlendFunction', window, GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);

 HideCursor();

 mask = imread('black_new.png');

 mask = 255 - mask(:,:,1);
 
 for i = 1:147

     
    if i >= 10
     TRIANGLE = imread([num2str(i) '.png']);
    end
    if i < 10
     TRIANGLE = imread([num2str(0) num2str(i) '.png'] );
    end

     C = imresize(TRIANGLE, [155 155]);
     mask = imresize(mask, [155 155]);

     C(:,:,4) = mask;

     TextureVector(i) = Screen('MakeTexture', window, uint8(C));
    

 end
 %variables that can be changed
x_center = rect(3)/2;
y_center = rect(4)/2;
image_width = 155;
image_height = 155;
%distance between the centers of the images
radiusofimages = 350;
% array of degrees from 0 to 300 incrementing by 60 degs each time.
degrees = [0:60:300];
% draws the six circles
for i = 1:6
    Screen('DrawTexture', window, TextureVector(1), [], ...
        [x_center + radiusofimages * cosd(degrees(i)) - image_width/2, y_center - radiusofimages * sind(degrees(i)) - image_height/2, ...
        x_center + radiusofimages * cosd(degrees(i)) + image_width/2, y_center - radiusofimages * sind(degrees(i)) + image_height/2]);
end
%draws the circle in the middle
    Screen('DrawTexture', window, TextureVector(33), [], ... 
       [ x_center - image_width/2, y_center - image_height/2, x_center + image_width/2, y_center + image_height/2]);

    Screen('Flip', window);


   Screen('CloseAll');
