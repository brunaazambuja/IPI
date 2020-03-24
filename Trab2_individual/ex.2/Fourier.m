function [Fpadding] = Fourier(f)

% Pega a altura e a largura da imagem
[h,w] = size(f);

% Preenchimento padding de f e transformada
fpadding = uint8(zeros(2*h,2*w));
fpadding((h/2+1:(h/2)+h),(w/2+1:(w/2)+w)) = f;

Fpadding = fftshift(fft2(fpadding));
Fvisivel = log(fftshift(fft2(fpadding))+0.1);
%fazendo a transformada de fourier aplicando log para podermos enxergar 

figure(2);imshow(Fvisivel, []);pause; 
%tranformada de Fourier usando padding e log

end

