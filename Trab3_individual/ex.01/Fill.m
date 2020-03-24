function [Saida] = Fill(I)

% primeiramente, vamos preencher espaços desconectados,
% utilizando a função bwareaopen
I = 1 - bwareaopen(I, 70);
figure; imshow(I);

% depois, precisamos eliminar os buracos de dentro das células,
% para isso devemos usar a função imfill, com parâmetro 'holes'
Saida = imfill(I, 'holes');
figure; imshow(Saida);

end
