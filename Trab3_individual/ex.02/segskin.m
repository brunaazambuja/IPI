function [] = segskin(I, I2)

figure; imshow(I);

% chamar a função imsegkmeans com parâmetro 2 - segmentará nossa 
% imagem em duas regiões

se = strel('square', 15);
L = imclose(imsegkmeans(I, 2), se); % fechamento para retirar as descontinuidades
B = labeloverlay(I2, L);
figure; imshow(B), title('Pele segmentada');

end

