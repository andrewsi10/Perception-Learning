function 
clear all;

Screen('Preference', 'SkipSyncTests', 1);

[window,rect] = Screen('OpenWindow', 0);

 Screen('BlendFunction', window, GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);

 HideCursor();

 mask = imread('black_new.png');

 mask = 255 - mask(:,:,1);
 A = [];
 B = 1:147;
 numtrials = 30;
 picture1 = randsample(B, numtrials);
 inc_amount = 4;
 cnt = 0;
 morph_dist = [];
 for i = 1:inc_amount:145
     cnt = cnt + 1;
     morph_dist(cnt) = i;
 end
 Morph_Vector = [];
 oneortwo = [1, 2];
 largerorsmaller = [];
 picture2  = [];
 for i = 1:numtrials
 Morph_Vector(i) = randsample(morph_dist, 1);
 largerorsmaller(i) = randsample(oneortwo, 1);
 if largerorsmaller(i) == 1
     picture2(i) = mod(picture1(i) - Morph_Vector(i), 147) + 1;
 end 
 if largerorsmaller(i) == 2
     picture2(i) = mod(picture1(i) + Morph_Vector(i), 147) + 1;
 end
 end
 
 picture3 = picture2 - picture1;
 leftorright = repmat([1,2], 1, numtrials/2);
 randLorR = Shuffle(leftorright);
 for i = 1:100

     
    if i >= 10
     TRIANGLE = imread([num2str(i) '.png']);
    end
    if i < 10
     TRIANGLE = imread([num2str(0) num2str(i) '.png'] );
    end

     C = imresize(TRIANGLE, [155 155]);

     C(:,:,4) = mask;

     A(i) = Screen('MakeTexture', window, uint8(C));


    

 end
 
 Screen('CloseAll');