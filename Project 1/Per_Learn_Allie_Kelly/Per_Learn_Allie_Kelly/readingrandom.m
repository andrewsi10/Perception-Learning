function [TextureVector, picture1, picture2, morph_dist, randLorR] = readingrandom(window)

mask = imread('oval.png');
mask = 255 - mask(:,:,1);

B = 1:147; % number of images
morph_dist = 1:4:24; % morph distant
numtrials = size(morph_dist, 2) * 24;
picture1 = randsample(B, numtrials); % top image random


morph_dist = Shuffle(repmat(morph_dist, 1, numtrials/length(morph_dist))); % shuffled morph distances
picture2 = mod(picture1 + morph_dist, 147) + 1;

leftorright = repmat([1,2], 1, numtrials/2);
randLorR = Shuffle(leftorright);

TextureVector = []; % texture holding
for i = 1:147
    
    if i >= 10
        TRIANGLE = imread([num2str(i) '.png']);
    else
        TRIANGLE = imread([num2str(0) num2str(i) '.png'] );
    end
    
    C = imresize(TRIANGLE, [155 155]);
    mask = imresize(mask, [155 155]);
    
    C(:,:,4) = mask;
    
    TextureVector(i) = Screen('MakeTexture', window, uint8(C));
end

