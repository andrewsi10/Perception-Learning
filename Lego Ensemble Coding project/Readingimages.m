function [TextureVector ImageWidth] = readingin(window)
 ImageWidth(1) = 275;
 mask = imread('emmet left mask.png');
 
 mask = 255 - mask(:,:,1);
 
 TRIANGLE = imread(['emmet left.png']);
 C = imresize(TRIANGLE, [275 275]);
 mask = imresize(mask, [275 275]);
 C(:,:,4) = mask;
 TextureVector(1) = Screen('MakeTexture', window, uint8(C));
 
 mask = imread('emmet right mask.png');
 
 mask = 255 - mask(:,:,1);
 
 TRIANGLE = imread(['emmet right.png']);
 C = imresize(TRIANGLE, [275 275]);
 mask = imresize(mask, [275 275]);
 C(:,:,4) = mask;
 TextureVector(2) = Screen('MakeTexture', window, uint8(C));
 
 mask = imread('lego brick mask.png');
 
 mask = 255 - mask(:,:,1);
 TRIANGLE = imread(['lego brick.png']);
 
 C = imresize(TRIANGLE, [275 275]);
 mask = imresize(mask, [275 275]);
 C(:,:,4) = mask;
 TextureVector(3) = Screen('MakeTexture', window, uint8(C));
 for i = 1:150
     ImageWidth(i+1) = ImageWidth(i) - 1;
 end
 
end