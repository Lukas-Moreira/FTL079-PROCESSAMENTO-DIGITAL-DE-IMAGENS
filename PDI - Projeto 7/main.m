%========================================================
% Alunos: Lukas Lujan Moreira
%         Thiago Patrick Tavares Costa
%========================================================

clear; clc;

% 1) Adiciona à path onde estão:
addpath("src\");

% 2) Carrega a imagem original em tons de cinza
I_original = imread("./img/FigP0918(left) (1).tif");

% 3) Binariza a imagem (converte para preto e branco - 0 e 1)
I = imbinarize(I_original);

% 4) Define o elemento estruturante (13x13) para eliminar objetos menores
B = ones(13, 13);

% 5) Aplica erosão morfológica para remover componentes pequenos
C = mm_erode(I, B);

% 6) Aplica dilatação para restaurar o tamanho dos objetos sobreviventes
D = mm_dilate(C, B);

% 7) Exibe todas as imagens em subplots
figure;

subplot(2,2,1);
imshow(I_original); title('Imagem Original (tons de cinza)');
xlabel('Antes da binarização');

subplot(2,2,2);
imshow(I); title('Imagem Binarizada');
xlabel('Preto e branco (0 e 1)');

subplot(2,2,3);
imshow(C); title('Após Erosão');
xlabel('Remove objetos menores que 13×13');

subplot(2,2,4);
imshow(D); title('Após Dilatação');
xlabel('Restaura o tamanho dos objetos restantes');

imwrite(I_original, fullfile('./results/1_original.png'));
imwrite(I,          fullfile('./results/2_binarizada.png'));
imwrite(C,          fullfile('./results/3_erosao.png'));
imwrite(D,          fullfile('./results/4_dilatacao.png'));

pause; close all;