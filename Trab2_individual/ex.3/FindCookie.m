function [I3] = FindCookie(IBin)

se = strel('disk', 60);
I2 = imopen(IBin, se);
% fazendo uma abertura com um elemento maior que o cookie mordido, 
% por�m menor que o cookie inteiro
figure; imshow(I2); % imagem com apenas um cookie (n�o completo)


se = strel('square', 20);
I3 = imdilate(I2, se);
% fazendo a dilata��o por um elemento que n�o intersecte o cookie mordido!

I3 = I3.*IBin;
% fazendo a multiplica��o pixel a pixel, temos o cookie inteiro completo
figure; imshow(I3);
% imagem bin�ria apenas com o cookie (completo)

end

