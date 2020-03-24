% para limpar o terminal e fechar as telas antes de come�ar
close all;
clc;

I = imread('morf_test.png');
I = imgaussfilt(I); % pr�-processamento
 
% como queremos destacar objetos escuros em fundo claro,
% devemos usar a transformada bottom-hat
%(fechamento de I por SE subtra�da a imagem original I)
I = BottomHat(I);

% finalmente, para binarizar a imagem: ----------------
k = graythresh(I);
BW = imbinarize(I, k);

BW = PosProcess(BW); % p�s-processamento


