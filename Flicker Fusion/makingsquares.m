function [TextureVector, ImageWidth] = makingsquares(window)

blackSquare = imread('Black square.png');
blackSquare = imresize(blackSquare, [272 272]);
whiteSquare = imread('White square.png');
whiteSquare = imresize(whiteSquare, [272 272]);
TextureVector(1) = Screen('MakeTexture', window, uint8(blackSquare));
TextureVector(2) = Screen('MakeTexture', window, uint8(whiteSquare));
ImageWidth = [272 272];

end