[window,rect] = Screen('OpenWindow',0);

window_x = rect(3);
window_y = rect(4);

x_center = window_x/2;
y_center = window_y/2;


function pic_1, pic_2; pic_3  = Disp_image(Window, TextureVector, MorphVector);


    
    pic_1 = random.sample(1:146, 1);
    pic_2 = pic_1;
    pic_3 = random.sample(1:146, 1);
    
    if pic_3 == pic_2 || pic_3 == pic_1 
        pic_3 = random.sample(1:146, 1);
    %Displaying the images 
    end
    for I = 1:10
    
    temp(I) = Screen('MakeTexture', window, uint8());
    TextureVector = Screen('DrawTexture', window, temp(I), [], ...
        [x_center - x_image/4 - x_image/8, y_center - y_image/4 , x_center + x_image/4 + x_image/8, y_center + y_image/4 + y_image/8]);
    
    Screen('TextureVector' , window, temp(I), [], ...
        [x_center, y_center + y_image/4, x_center, y_center + y_image/4]); 
    
    Screen('TextureVector' , window, temp(I), [], ...)
    
    end 
    % the morph vector ?
    %not sure whether pic_2 or pic_3 is going to be the correct picture
    % Morph_dist = 
Morph_dist = picture_2 - picture_1
MorphVector = [Morph_dist]
    
   %Returning the users input, s or k
[keyIsDown, secs, KeyCode] = KbCheck;
  
for trials = 1:10
vector_1 = [1:10];

if vector_1(trials) == 1 && strcmp(response, 's')
    accuracy = 1;


elseif strpcmp(response, 'k') && vector_1(trials) == 1
    accuracy = 0;


elseif strcmp(response, 's') && vector_1(trials) == 0
    accuracy = 0;

elseif strcmp(repsonse, 'k') && vector_1(trials) == 0
        accuracy = 0;
end
        
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
    
     end
