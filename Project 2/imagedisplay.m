
function diff = imagedisplay(window, rect);


 %variables that can be changed
x_center = rect(3)/2;
y_center = rect(4)/2;
image_width = 275;
image_height = 275;
average = randi(147);
%distance between the centers of the images
radiusofimages = 300;
% array of degrees from 0 to 300 incrementing by 60 degs each time.
degrees = [0:60:300];

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
random_starter = randi(147);
vector = [-9 -6 -3 3 6 9];
starting_x = x;
 while ~any(buttons)
     % draws the six circles
 for i = 1:6
    Screen('DrawTexture', window, TextureVector(mod(average+vector(i), 147) + 1), [], ...
        [x_center + radiusofimages * cosd(degrees(i)) - image_width/2, y_center - radiusofimages * sind(degrees(i)) - image_height/2, ...
        x_center + radiusofimages * cosd(degrees(i)) + image_width/2, y_center - radiusofimages * sind(degrees(i)) + image_height/2]);
 end
 
     [x,y,buttons] = GetMouse;
     index = floor(abs(mod(random_starter + x - starting_x, 147)) + 1);
      Screen('DrawTexture', window, TextureVector(index), [], ... 
       [ x_center - image_width/2, y_center - image_height/2, x_center + image_width/2, y_center + image_height/2]);
   Screen('Flip', window);
 end
 diff = average - index;

end
 

   
   
   

