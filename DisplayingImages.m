function pic_1, pic_2; pic_3  = Disp_image(Window, TextureVector, MorphVector);

[window,rect] = Screen('OpenWindow',0);

window_x = rect(3);
window_y = rect(4);

x_center = window_x/2;
y_center = window_y/2;

img_w = 155
img_h = 155



    
    pic_1 = random.sample(1:146, 1);
    pic_2 = pic_1;
    pic_3 = random.sample(1:146, 1);
    
    if pic_3 == pic_2 || pic_3 == pic_1 
        pic_3 = random.sample(1:146, 1);
    %Displaying the images 
    end
    for I = 1:10
    
    temp(I) = Screen('MakeTexture', window, uint8());
    
    Screen('DrawTexture' , window, A(picture1(I)), [], ...
        [x_center, y_center + y_image/4, x_center, y_center + y_image/4]); 
    
    RandLoR = [1 2];
    index_randlor = randsample(RandLor, 1);
        
    if randLorR(I) == 1 
        Screen('DrawTexture', window, A(picture2(I)), [], ...
        [x_center/4 - img_w/2, y_center/4 - img_/2 , x_center/4 + img_w/2, y_center/4 + img_h/2 ]);
        
    end    
    
    if randLorR(I) == 2
        Screen('DrawTexture', window, A(picture2(I)), [], ...
        [x_center/4 + img_w/2, y_center/4 + img_/2 , x_center/4 + img_w/2, y_center/4 + img_h/2 ]);
    
    
    
    end 
    % the morph vector ?
    %not sure whether pic_2 or pic_3 is going to be the correct picture
    % Morph_dist = 
Morph_dist = (picture_2 - picture_1);
MorphVector = Morph_dist
    
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
