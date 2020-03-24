function [Ibothat] = BottomHat(I)

se = strel('disk', 5);
Ibothat = imbothat(I, se);
figure; imshow(Ibothat); % bottom hat da figura


Ifundo = imclose(I, se); % imagem com apenas o fundo
figure; imshow(Ifundo);
Ibothat2 = Ifundo - I;
figure; imshow(Ibothat2); % fundo menos imagem original


end

