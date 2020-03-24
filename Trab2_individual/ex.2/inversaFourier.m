function [g] = inversaFourier(G, h, w)

g = ifft2(ifftshift(G));

g = g(h/2+1:h/2+h,w/2+1:w/2+w); % desfazendo o padding

figure;imshow(abs(g), []);

end

