% para limpar o terminal e fechar as telas antes de come�ar
close all;
clc;

I = imread('im1.jpg');
imshow(I);pause;

% vamos receber tr�s par�metros: uma imagem RGB ou monocrom�tica, um int
% que representa a quantidade de bits que a sa�da deve ter (1 a 8), 
% e um float que representa o fator de redimensionamento da imagem.
brilho = 5;
fator = 0.5;
I2 = AlteraBrilho(I, brilho);
imshow(I2); pause;

% ---------------- agora para o redimensionamento da imagem:
[row, col, cor] = size(I2);
row = floor(row*fator);
col = floor(col*fator);

Saida = uint8(zeros(row, col, cor));

Saida = AlteraTamanho(Saida,row,col,cor,I2,fator);

% comparando o resultado obtido com a fun��o pronta do matlab
figure(1), imshow(Saida); %Sa�da Gerada Pelo Algoritmo
Saidaboa = imresize(I2,fator);
figure(2), imshow(Saidaboa); %Sa�da Gerada Pela Fun��o do Matlab


% --------------------- implementa��o das fun��es
function I2 = AlteraBrilho(im, brilho)

I2 = im/(2^(9-brilho)-1); 
I2 = round(I2);% deixar� os valores de brilho da imagem 
% como n�meros inteiros, e n�o pontos flutuantes

I2 = I2*(2^(9-brilho)-1); % agora multiplicando pelo mesmo valor
% teremos uma imagem onde os n�veis de brilho est�o redistribu�dos em 
% 2^x n�veis para qualquer x entre 1 e 8

end


function Saida = AlteraTamanho(Saida,row,col,cor,im,fator)

for x = 1:row
    for y = 1:col
        for z = 1:cor
            i = round(x/fator);
            j = round(y/fator);
            
            % tratando as exce��es
            if i > row/fator
                i = floor(row/fator);
            end
            if j > col/fator
                j = floor(col/fator);
            end
            if i == 0
                i = 1;
            end
            if j == 0
                j = 1;
            end
            
            % para cada pixel da sa�da, copiamos o valor do pixel original
            % mais pr�ximo deste no valor da sa�da
            Saida(x,y,z) = im(i,j,z);
        end
    end
end
end

