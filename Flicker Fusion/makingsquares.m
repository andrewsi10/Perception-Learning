function [TextureVector, ImageWidth] = makingsquares(window)

blackSquare = imread('Black square.png');
blackSquare = imresize(blackSquare, [136 136]);
whiteSquare = imread('White square.png');
whiteSquare = imresize(whiteSquare, [136 136]);
TextureVector(1) = Screen('MakeTexture', window, uint8(blackSquare));
TextureVector(2) = Screen('MakeTexture', window, uint8(whiteSquare));
ImageWidth = 136;

end