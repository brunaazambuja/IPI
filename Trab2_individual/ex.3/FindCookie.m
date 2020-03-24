function [I3] = FindCookie(IBin)

se = strel('disk', 60);
I2 = imopen(IBin, se);
% fazendo uma abertura com um elemento maior que o cookie mordido, 
% porém menor que o cookie inteiro
figure; imshow(I2); % imagem com apenas um cookie (não completo)


se = strel('square', 20);
I3 = imdilate(I2, se);
% fazendo a dilatação por um elemento que não intersecte o cookie mordido!

I3 = I3.*IBin;
% fazendo a multiplicação pixel a pixel, temos o cookie inteiro completo
figure; imshow(I3);
% imagem binária apenas com o cookie (completo)

end

