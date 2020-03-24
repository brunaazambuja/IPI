% para limpar o terminal e fechar as telas antes de começar
close all;
clc;

I = imread('morf_test.png');
I = imgaussfilt(I); % pré-processamento
 
% como queremos destacar objetos escuros em fundo claro,
% devemos usar a transformada bottom-hat
%(fechamento de I por SE subtraída a imagem original I)
I = BottomHat(I);

% finalmente, para binarizar a imagem: ----------------
k = graythresh(I);
BW = imbinarize(I, k);

BW = PosProcess(BW); % pós-processamento


