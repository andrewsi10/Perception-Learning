function [TextureVector ImageWidth] = makingcircles(window)
  
 mask = imread('black_new.png');
 
 mask = 255 - mask(:,:,1);
 mask = imresize(mask, [272 272]);

 TRIANGLE = imread('circle.png');
 TRIANGLE(:, :, 4) = mask;
 factor_size = 0.98;
 ImageWidth(1) = 272;
 for i = 1:75
     TextureVector(i) = Screen('MakeTexture', window, uint8(TRIANGLE));
     TRIANGLE = imresize(TRIANGLE, factor_size); 
     ImageWidth(i + 1) = ImageWidth(i) * factor_size;
 end
 
 for j = 76:150

     TextureVector(j) = Screen('MakeTexture', window, uint8(TRIANGLE));
     TRIANGLE = imresize(TRIANGLE, 1.0/factor_size); 
     ImageWidth(j + 1) = ImageWidth(j) / factor_size;
 end
end