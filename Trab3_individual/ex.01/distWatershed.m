function [Saida] = distWatershed(I)

% primeiro, deve-se calcular a distância euclideana do
% complemento (~) da imagem binária, utilizando a função bwdist
I2 = bwdist(~I);

% iremos aplicar uma abertura na img, para melhor segmentação
se = strel('disk', 3);
I2 = imopen(I2, se);

figure; imshow(I2, []);

% depois, fazemos com que todos os pixels com zero, sejam setados como inf
I2 = 1 - I2;
I2(~I) = Inf;
% calculando o watershed, devemos depois voltar os pixels para zero
Saida = watershed(I2);
Saida(~I) = 0;
% e para melhor visualização, vamos criar uma imagem rgb do resultado da
% segmentação
rgb = label2rgb(Saida, 'jet', [0.5 0.5 0.5]);
figure; imshow(rgb, 'InitialMagnification','fit');
imwrite(rgb, 'saida.png', 'png');

end

