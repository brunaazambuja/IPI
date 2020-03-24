function [BW] = PosProcess(BW)

% faremos um fechamento para tirar o ruído das letras (para que fiquem mais contínuas)
se = strel('square', 2);
BW = imclose(BW, se);
figure;
imshow(BW);

BW = 1 - BW;
figure;
imshow(BW);


end

