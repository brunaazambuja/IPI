function [Saida] = Fill(I)

% primeiramente, vamos preencher espa�os desconectados,
% utilizando a fun��o bwareaopen
I = 1 - bwareaopen(I, 70);
figure; imshow(I);

% depois, precisamos eliminar os buracos de dentro das c�lulas,
% para isso devemos usar a fun��o imfill, com par�metro 'holes'
Saida = imfill(I, 'holes');
figure; imshow(Saida);

end
