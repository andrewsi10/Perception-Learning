function [TextureVector ImageWidth] = makingcircles(window)
 
 TRIANGLE = imread('circle.png');
 factor_size = 0.98;
 ImageWidth(1) = 272;
 for i = 1:75
     TextureVector(i) = Screen('MakeTexture', window, uint8(TRIANGLE));
     TRIANGLE = imresize(TRIANGLE, factor_size); 
     ImageWidth(i + 1) = ImageWidth(i) * factor_size;
 end
 factor_size = 0.9708737;
 for j = 76:150

     TextureVector(j) = Screen('MakeTexture', window, uint8(TRIANGLE));
     TRIANGLE = imresize(TRIANGLE, factor_size); 
     ImageWidth(j + 1) = ImageWidth(j) * factor_size;
 end
end