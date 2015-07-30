function TextureVector = makingcircles(window)
 
 TRIANGLE = imread('circle.png');
 factor_size = 1.03;
 for i = 1:75

     
    
  

     TextureVector(i) = Screen('MakeTexture', window, uint8(TRIANGLE));
     TRIANGLE = imresize(TRIANGLE, factor_size); 
    

 end
 factor_size = 0.9708737;
 for j = 76:150

     TextureVector(j) = Screen('MakeTexture', window, uint8(TRIANGLE));
     TRIANGLE = imresize(TRIANGLE, factor_size); 
 end
end