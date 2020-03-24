% para limpar o terminal e fechar as telas antes de começar
close all;
clc;

I = imread('im1.jpg');
imshow(I);pause;

% vamos receber três parâmetros: uma imagem RGB ou monocromática, um int
% que representa a quantidade de bits que a saída deve ter (1 a 8), 
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

% comparando o resultado obtido com a função pronta do matlab
figure(1), imshow(Saida); %Saída Gerada Pelo Algoritmo
Saidaboa = imresize(I2,fator);
figure(2), imshow(Saidaboa); %Saída Gerada Pela Função do Matlab


% --------------------- implementação das funções
function I2 = AlteraBrilho(im, brilho)

I2 = im/(2^(9-brilho)-1); 
I2 = round(I2);% deixará os valores de brilho da imagem 
% como números inteiros, e não pontos flutuantes

I2 = I2*(2^(9-brilho)-1); % agora multiplicando pelo mesmo valor
% teremos uma imagem onde os níveis de brilho estão redistribuídos em 
% 2^x níveis para qualquer x entre 1 e 8

end


function Saida = AlteraTamanho(Saida,row,col,cor,im,fator)

for x = 1:row
    for y = 1:col
        for z = 1:cor
            i = round(x/fator);
            j = round(y/fator);
            
            % tratando as exceções
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
            
            % para cada pixel da saída, copiamos o valor do pixel original
            % mais próximo deste no valor da saída
            Saida(x,y,z) = im(i,j,z);
        end
    end
end
end

