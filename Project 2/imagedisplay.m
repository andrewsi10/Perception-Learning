% array of degrees from 0 to 300 incrementing by 60 degs each time.
x_center = rect(3)/2;
y_center = rect(4)/2;
image_width = 
image_height = 
radiusofimages = 
degrees = [0:60:300];
for i = 1:6
    Screen('DrawTexture', window, [insert name of picture here], [], ...
        x_center/2 + radiusofimages * cosd(degrees(i)) - image_width/2, y_center/2 - radiusofimages * sind(degrees(i)) - image_height/2, ...
        x_center/2 + radiusofimages * cosd(degrees(i)) + image_width/2, y_center/2 - radiusofimages * sind(degrees(i)) + image_height/2);
end
    Screen('DrawTexture', window, [pictures], [], ... 
        x_center/2 - image_width/2, y_center/2 - image_height/2, x_center/2 + image_width/2, y_center/2 + image_height/2);
