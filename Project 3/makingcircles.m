function TextureVector = makingcircles(window)
 
 mask = imread('oval.png');
 
 mask = 255 - mask(:,:,1);
 TRIANGLE = imread('circle.png');
 factor_size = 1.03;
 for i = 1:75

     
    
     
     mask = imresize(mask, [272 272]);

     TRIANGLE(:,:,4) = mask;

     TextureVector(i) = Screen('MakeTexture', window, uint8(TRIANGLE));
     TRIANGLE = imresize(TRIANGLE, factor_size); 
    

 end
 for j = 76:150
     mask = imresize(mask, [272 272]);

     TRIANGLE(:,:,4) = mask;

     TextureVector(i) = Screen('MakeTexture', window, uint8(TRIANGLE));
     TRIANGLE = imresize(TRIANGLE, 1/factor_size); 
 end
end