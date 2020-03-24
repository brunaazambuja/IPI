function [filtro] = butterworth(h, w)

I = zeros(38,38);
d = zeros(38,38);

for i = 1:38
    for j = 1:38
        d(i,j) = sqrt((i - 19)^2 + (j - 19)^2); 
        I(i,j) = 1/sqrt(1 + (15/d(i,j))^8);
        % fórmula do filtro de butterworth
    end
end


filtro = ones(2*h, 2*w);
% o filtro deve ter o tamanho da imagem que iremos filtrar (usando padding)

% posicionamos cada pequeno butterworth com o centro nas frequências
% que queremos tirar (que estão causando Moiré)
filtro(70:107, 92:129) = I;
filtro(153:190,92:129) = I;
filtro(63:100,206:243) = I;
filtro(145:182,206:243) = I;
filtro(314:351,97:134) = I;
filtro(396:433,97:134) = I;
filtro(305:342,210:247) = I;
filtro(388:425,210:247) = I;

figure; imshow(filtro, []); % filtros butterworth posicionados 
% com o centro nos pontos das frequências que queremos eliminar

end

