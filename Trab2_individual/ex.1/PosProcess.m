function [BW] = PosProcess(BW)

% faremos um fechamento para tirar o ru�do das letras (para que fiquem mais cont�nuas)
se = strel('square', 2);
BW = imclose(BW, se);
figure;
imshow(BW);

BW = 1 - BW;
figure;
imshow(BW);


end

