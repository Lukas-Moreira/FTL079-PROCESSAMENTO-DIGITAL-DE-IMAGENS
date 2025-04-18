%====================================
%Alunos: Lukas Lujan Moreira
%        Thiago Patrick Tavares Costa
%====================================

clearvars; close all; clc;
%% --- Aquisição de dados ---

%Lendo a imagem em formato jpg
img = '../img/girl.jpg';
imagem = imread(img);
gray = rgb2gray(imagem);

%%   --- Processamento ---

% Pega as dimensões da imagem
[R, C] = size(gray);

% Exibe o valor do pixel na origem da imagem
fprintf('Valor do pixel na origem da imagem: ');
disp(pixVal4e(imagem, 1, 1));

% Exibe o valor do pixel no meio da imagem
fprintf('Valor do pixel no meio da imagem: ');
disp(pixVal4e(imagem, round(R/2), round(C/2)));

% Chama a função cursorValues4e a fim de encontrar o valor do pixel 
% por seleção via mouse. 
fprintf('Resultados da função cursorValues4e:\n'); 
cursorValues4e(imagem);
fprintf('\n');

% Exibindo as dimensões da imagem
fprintf('Tamanho da image: %dx%d\n\n', R, C);

% Capturando o nivel de cinza da imagem
imageMean = mean(imagem, 'all');
fprintf('Nível médio de cinza da imagem: %f\n\n', imageMean);

% Profundidade da imagem
bitdepth = imfinfo(img).BitDepth;
fprintf('Profundidade de bits da imagem: %d\n', bitdepth);

%% Salvando a imagem convertida em .tif

imwrite(imagem, '../results/newtiffimage.tif');