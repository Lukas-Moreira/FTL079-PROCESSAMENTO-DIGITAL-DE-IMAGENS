%====================================
%Alunos: Lukas Lujan Moreira
%        Thiago Patrick Tavares Costa
%====================================

% Adicionando o caminho da pasta src
% para acessar as função de padding.
addpath('./src');

% Aquisição da imagem original
I = imread('./img/testpattern1024.tif');
figure; imshow(I);
title('imagem original');

% Aplicando padding de zeros na imagem
g = imagePad4e(I, 100, 100);
imwrite(g, './results/testpattern1024_zeros.tif');
figure; imshow(g);
title('Pad-zeros');

% Aplicando padding de replicação na imagem
g = imagePad4e(I, 100, 100, 'replicate');
imwrite(g, './results/testpattern1024_replicate.tif');
figure; imshow(g);
title('Pad-replicate');

pause;
close all;
%====================================