%====================================
%Alunos: Lukas Lujan Moreira
%        Thiago Patrick Tavares Costa
%====================================

% Adicionando o caminho para a pasta src
% para que as funções sejam reconhecidas.
addpath('src');

%% Aquisição da imagem original
I = imread('./img/Fig3.37(a).jpg');

% Mostrando a imagem original
figure; imshow(I); title('imagem original');

%% Filtros de média

% Aplicando filtro de média com kernel 3x3
f = twodSFilter(I, 3);

% Salvando a imagem com filtro aplicado
imwrite(f, './results/media/Fig3.37-3x3-media.jpg');

% Mostrando a imagem com filtro aplicado
figure; imshow(f); title('Filtro de média com kernel 3x3');

% Aplicando filtro de média com kernel 11x11
f = twodSFilter(I, 11);

% Salvando a imagem com filtro aplicado
imwrite(f, './results/media/Fig3.37-11x11-media.jpg');

% Mostrando a imagem com filtro aplicado
figure; imshow(f); title('Filtro de média com kernel 11x11');

% Aplicando filtro de média com kernel 21x21
f = twodSFilter(I, 21);

% Salvando a imagem com filtro aplicado
imwrite(f, './results/media/Fig3.37-21x21-media.jpg');

% Mostrando a imagem com filtro aplicado
figure; imshow(f); title('Filtro de média com kernel 21x21 box');

%% Filtros de mediana

% Aplicando filtro de mediana com kernel 3x3
f = medianSFilter(I, 3);

% Salvando a imagem com filtro aplicado
imwrite(f, './results/mediana/Fig3.37-3x3-mediana.jpg');

% Mostrando a imagem com filtro aplicado
figure; imshow(f); title('Filtro de mediana com kernel 3x3');

% Aplicando filtro de mediana com kernel 3x3
f = medianSFilter(I, 11);

% Salvando a imagem com filtro aplicado
imwrite(f, './results/mediana/Fig3.37-11x11-mediana.jpg');

% Mostrando a imagem com filtro aplicado
figure; imshow(f); title('Filtro de mediana com kernel 11x11');

% Aplicando filtro de mediana com kernel 3x3
f = medianSFilter(I, 21);

% Salvando a imagem com filtro aplicado
imwrite(f, './results/mediana/Fig3.37-21x21-mediana.jpg');

% Mostrando a imagem com filtro aplicado
figure; imshow(f); title('Filtro de mediana com kernel 21x21');

%====================================
pause; close('all');
%====================================