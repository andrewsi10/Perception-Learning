function [TextureVector] = readingin(window)
 
 mask = imread('oval.png');
 
 mask = 255 - mask(:,:,1);
 
 for i = 1:147

     
    if i >= 10
     TRIANGLE = imread([num2str(i) '.png']);
    end
    if i < 10
     TRIANGLE = imread([num2str(0) num2str(i) '.png'] );
    end

     C = imresize(TRIANGLE, [275 275]);
     mask = imresize(mask, [275 275]);

     C(:,:,4) = mask;

     TextureVector(i) = Screen('MakeTexture', window, uint8(C));
    

 end
end