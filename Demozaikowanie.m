clear;
close all;

% wczytanie oryginalnego obrazu
I = imread('emu.bmp');
subplot(1,2,1)

% pobieranie rozmiaru oryginalnego obrazu
[M, N, L] = size(I);

% wyświetlanie oryginału

imshow(I);


% wypełnianie obrazu zerami
Z  = zeros(M,N,3,'uint8');
mR = zeros(M,N,3,'uint8');
mG = zeros(M,N,3,'uint8');
mB = zeros(M,N,3,'uint8');

% R G
Z(1:2:end,1:2:end,1)= I(1:2:end,1:2:end,1);
Z(1:2:end,2:2:end,2)= I(1:2:end,2:2:end,2);

% G B
Z(2:2:end,1:2:end,2)= I(2:2:end,1:2:end,2);
Z(2:2:end,2:2:end,3)= I(2:2:end,2:2:end,3);

% wyświetlanie obrazu z nałożoną mozaiką

% subplot(2,3,2)
% imshow(Z);

R = [0  0    0   0    0;
     0  0.25 0.5 0.25 0;
     0  0.5  1   0.5  0;
     0  0.25 0.5 0.25 0;
     0  0	 0   0    0];
 
B = [0  0    0   0    0;
     0  0.25 0.5 0.25 0;
     0  0.5  1   0.5  0;
     0  0.25 0.5 0.25 0;
     0  0    0   0    0];
 
G = [0  0    0    0    0;
     0  0    0.25 0    0;
     0  0.25 1    0.25 0;
     0  0    0.25 0    0;
     0  0    0    0    0];
 
mR(: ,:, 1) = imfilter(Z(:, :, 1), R);

% mR(:, :, 1)= Z(:, :, 1);

% subplot(1,3,1)
% 
% imshow(mR); 

mG(:, :, 2) = imfilter(Z(:, :, 2), G);

%  axis ([100 300 200 500])

% mG(:, : ,2)=Z(:, :, 2);

% subplot(1,3,2)
% 
% imshow(mG); 

mB(:, : ,3) = imfilter(Z(:, : ,3), B);

% axis ([100 200 200 500])
% 
% mB(:, :, 3)=Z(:, :, 3);

% subplot(1,3,3)
% 
% imshow(mB); 


% 
subplot(1,2,2)

 Ze = mB + mR + mG;
% K = imabsdiff(Ze,I);
% subplot(2,3,6)
 imshow(Ze)
% axis ([100 300 200 500])