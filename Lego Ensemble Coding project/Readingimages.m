function TextureVector = readingin(window)
 
 mask = imread('lego brick.png');
 
 mask = 255 - mask(:,:,1);
 
 TRIANGLE = imread(['emmet left.png']);
 C = imresize(TRIANGLE, [275 275]);
 mask = imresize(mask, [275 275]);
 C(:,:,4) = mask;
 TextureVector(1) = Screen('MakeTexture', window, uint8(C));
 
 TRIANGLE = imread(['emmet right.png']);
 C = imresize(TRIANGLE, [275 275]);
 mask = imresize(mask, [275 275]);
 C(:,:,4) = mask;
 TextureVector(2) = Screen('MakeTexture', window, uint8(C));
 
 TRIANGLE = imread(['lego brick.png']);
 C = imresize(TRIANGLE, [275 275]);
 mask = imresize(mask, [275 275]);
 C(:,:,4) = mask;
 TextureVector(3) = Screen('MakeTexture', window, uint8(C));
 
end