function [] = segskin(I, I2)

figure; imshow(I);

% chamar a fun��o imsegkmeans com par�metro 2 - segmentar� nossa 
% imagem em duas regi�es

se = strel('square', 15);
L = imclose(imsegkmeans(I, 2), se); % fechamento para retirar as descontinuidades
B = labeloverlay(I2, L);
figure; imshow(B), title('Pele segmentada');

end

