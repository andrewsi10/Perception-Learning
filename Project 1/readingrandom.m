function [TextureVector, picture1, picture2, randLorR] = readingrandom(window);

 mask = imread('oval.png');

 mask = 255 - mask(:,:,1);
 TextureVector = [];
 B = 1:147;
 numtrials = 130;
 picture1 = randsample(B, numtrials);
 inc_amount = 2;
 cnt = 0;
 morph_dist = [];
 for i = 0:inc_amount:8  
     cnt = cnt + 1;
     morph_dist(cnt) = i;
 end
 morph_dist = repmat(morph_dist, 1, 26);
 morph_dist = Shuffle(morph_dist);
 %oneortwo = [1, 2];
 %largerorsmaller = [];
 picture2  = [];
 for i = 1:numtrials

%  largerorsmaller(i) = randsample(oneortwo, 1);
%  if largerorsmaller(i) == 1
%      picture2(i) = mod(picture1(i) - morph_dist(i), 147) + 1;
%  end 
%  if largerorsmaller(i) == 2
%      picture2(i) = mod(picture1(i) + morph_dist(i), 147) + 1;
%  end
 picture2(i) = mod(picture1(i) + morph_dist(i), 147) + 1;
 end
 leftorright = repmat([1,2], 1, numtrials/2);
 randLorR = Shuffle(leftorright);
 for i = 1:147

     
    if i >= 10
     TRIANGLE = imread([num2str(i) '.png']);
    end
    if i < 10
     TRIANGLE = imread([num2str(0) num2str(i) '.png'] );
    end

     C = imresize(TRIANGLE, [155 155]);
     mask = imresize(mask, [155 155]);

     C(:,:,4) = mask;

     TextureVector(i) = Screen('MakeTexture', window, uint8(C));
    

 end
 
 Screen('CloseAll');
 
end