% para limpar o terminal e fechar as telas antes de come�ar
close all;
clc;

% Primeiro iremos abrir uma imagem do solo de Marte colorida
MRGB = imread('Mars.bmp');
imshow(MRGB);pause;

% Ap�s aberta, a imagem ser� transformada de RGB para sua
% forma em n�veis de cinza

[row, col, ~] = size(MRGB);
MGray = RGBtoGray(MRGB,row,col);
imshow(MGray);pause;

% Agora, vamos fazer a equaliza��o do histograma, utilizando a 
% fun��o 'histeq'

Mheq = histeq(MGray);
figure(1), imshow(Mheq);

% Agora, vamos marcar os pontos de sa�da e de chegada como:
% sa�da: MHeq(260,415) chegada: MHeq(815,1000)
Mheq(260,415) = 255;
x = 260;
y = 415;

% Devemos calcular a dist�ncia euclidiana dos 8 pixels
% vizinhos, e guardas as tr�s menores como poss�veis candidatos

% Criaremos duas matrizes, uma de dist�ncias dos oito vizinhos mais 
% pr�ximos do pixel atual, e uma de menores dist�ncias, que conter�
% os pixels de menor dist�ncia, suas coordenadas e valor de brilho
distancias = zeros(8,4);
menores = zeros(3,4);

Mheq = MelhorCaminho(Mheq,x,y,distancias,menores);
figure(2), imshow(Mheq);


% --------------------- implementa��o das fun��es
function MGray = RGBtoGray(MRGB,row,col)

MGray = zeros(row, col, 'uint8');
red = MRGB(:,:,1);
green = MRGB(:,:,2);
blue = MRGB(:,:,3);

for i = 1:row
    for j = 1:col
        MGray(i,j) = red(i,j)*0.2989 + green(i,j)*0.5870 + blue(i,j)*0.1140;
    end
end

end


function Mheq = MelhorCaminho(Mheq,x,y,distancias,menores)

while 1
    
    % Preencheremos cada posi��o da matriz distancias com cada vizinho do
    % pixel atual, tratando em cada caso, suas exce��es para que n�o exceda
    % do tamanho da imagem em nenhum eixo. No caso em que excede, deixamos
    % sua distancias euclidiana como infinita, para que ele n�o entre nos
    % c�lculos de menores
    
    if x > 1 && y > 1
        distancias(1,1) = sqrt((x-1-815)^2 + (y-1-1000)^2);
        distancias(1,2) = x-1;
        distancias(1,3) = y-1;
        distancias(1,4) = Mheq(x-1, y-1);
    else
        distancias(1,1) = Inf;
    end
    
    if y > 1
        distancias(2,1) = sqrt((x-815)^2 + (y-1-1000)^2);
        distancias(2,2) = x;
        distancias(2,3) = y-1;
        distancias(2,4) = Mheq(x, y-1);
    else
        distancias(2,1) = Inf;
    end
    if x < 1035 && y > 1
        distancias(3,1) = sqrt((x+1-815)^2 + (y-1-1000)^2);
        distancias(3,2) = x+1;
        distancias(3,3) = y-1;
        distancias(3,4) = Mheq(x+1, y-1);
    else
        distancias(3,1) = Inf;
    end
    if x > 1
        distancias(4,1) = sqrt((x-1-815)^2 + (y-1000)^2);
        distancias(4,2) = x-1;
        distancias(4,3) = y;
        distancias(4,4) = Mheq(x-1, y);
    else
        distancias(4,1) = Inf;
    end
    if x < 1035
        distancias(5,1) = sqrt((x+1-815)^2 + (y-1000)^2);
        distancias(5,2) = x+1;
        distancias(5,3) = y;
        distancias(5,4) = Mheq(x+1, y);
    else
        distancias(5,1) = Inf;
    end
    if x > 1 && y < 1035
        distancias(6,1) = sqrt((x-1-815)^2 + (y+1-1000)^2);
        distancias(6,2) = x-1;
        distancias(6,3) = y+1;
        distancias(6,4) = Mheq(x-1, y+1);
    else
        distancias(6,1) = Inf;
    end
    if y < 1035
        distancias(7,1) = sqrt((x-815)^2 + (y+1-1000)^2);
        distancias(7,2) = x;
        distancias(7,3) = y+1;
        distancias(7,4) = Mheq(x, y+1);
    else
        distancias(7,1) = Inf;
    end
    if x < 1035 && y < 1035
        distancias(8,1) = sqrt((x+1-815)^2 + (y+1-1000)^2);
        distancias(8,2) = x+1;
        distancias(8,3) = y+1;
        distancias(8,4) = Mheq(x+1, y+1);
    else
        distancias(8,1) = Inf;
    end
    
    % Feito isso, preencheremos a matriz de menores com as tr�s menores
    % dist�ncias, suas coordenadas e seus respectivos valores
    
    menores(:,1) = double(mink(distancias(:,1), 3));
    for i = 1:8
        for j = 1:3
            if distancias(i,1) == menores(j,1)
                menores(j,:) = distancias(i,:);
            end
        end
    end
    
    % Agora pegaremos o pixel dentre os de tr�s menores dist�ncias, com o
    % menor valor de brilho
    for i = 1:3
        if menores(i, 4) == min(menores(:,4))
            x = menores(i, 2);
            y = menores(i, 3);
        end
    end
    
    Mheq(x, y) = 255;
    if x == 815 && y == 1000
        break;
    end
end

end
