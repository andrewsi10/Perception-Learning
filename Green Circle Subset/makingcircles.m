function [TextureVector ImageWidth] = makingcircles(window)
  
 mask = imread('black_new.png');
 
 mask = 255 - mask(:,:,1);
 mask = imresize(mask, [272 272]);

 TRIANGLE = imread('circle.png');
 TRIANGLE = imresize(TRIANGLE, [272 272]);
 TRIANGLE(:, :, 4) = mask;

 factor_size = 3;
 ImageWidth(1) = 272;
 for i = 1:75
     TextureVector(i) = Screen('MakeTexture', window, uint8(TRIANGLE));
     TRIANGLE = imresize(TRIANGLE, [ImageWidth(i) ImageWidth(i)]); 
     ImageWidth(i + 1) = ImageWidth(i) - factor_size;
 end
 
 for j = 76:150

     TextureVector(j) = Screen('MakeTexture', window, uint8(TRIANGLE));
     TRIANGLE = imresize(TRIANGLE, [ImageWidth(j) ImageWidth(j)]); 
     ImageWidth(j + 1) = ImageWidth(j) + factor_size;
  
 end
 
end