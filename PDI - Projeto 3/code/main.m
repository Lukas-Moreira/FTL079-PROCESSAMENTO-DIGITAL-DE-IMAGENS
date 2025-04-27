%====================================
%Alunos: Lukas Lujan Moreira
%        Thiago Patrick Tavares Costa
%====================================

clearvars; clc;

%% --- Rosa ---

% Primeiro caso: Teste com a rosa para não normalização

% Aquisição da imagem
img = imread('../img/rose1024.tif');

% Aqui chamamos a função imagehist4e para obtermos o histograma da nossa
% imagem não equalizada.
[I, h] = imagehist4e(img, 'u');

% Aqui mostramos a nossa imagem sem fazer qualquer tipo de equalização.
% O figure aqui está para garantir que não seja fechado qualquer outra
% instancia que esteja aberto.
figure;
imshow(I);
title('Imagem sem equalização');

% Aqui mostramos o nosso gráfico de histograma da imagem sem fazer qualquer 
% tipo de equalização.
figure;
bar(h);
title('Histograma sem equalização');
ylabel('Pk');
xlabel('Niveis de cinza');


% Segundo caso: Teste com a rosa para normalização

% Aqui chamamos a função imagehist4e para obtermos o histograma da nossa
% imagem equalizada.
[I2, h] = imagehist4e(img, 'n');

% Salvamos a imagem para fins de documentação do experimento.
imwrite(I2, '../results/rose1024-equalizado.tif');

% Exibimos a nova imagem como resultado.
figure;
imshow(I2);
title('Imagem equalizada');

% Exibimos um gráfico em barras do novo histograma equalizado.
figure;
bar(h);
title('Histograma equalizado');
ylabel('Pk');
xlabel('Niveis de cinza');

%% --- Cavalo ---

% Primeiro caso: Teste com o cavalo para não normalização

% Aquisição da imagem
img1 = imread('../img/hidden-horse.tif');

% Aqui chamamos a função imagehist4e para obtermos o histograma da nossa
% imagem não equalizada.
[I, h] = imagehist4e(img1, 'u');

% Aqui mostramos a nossa imagem sem fazer qualquer tipo de equalização.
figure;
imshow(I);
title('Imagem sem equalização');

% Aqui mostramos o nosso gráfico de histograma da imagem sem fazer qualquer 
% tipo de equalização.
figure;
bar(h);
title('Histograma sem equalização');
ylabel('Pk');
xlabel('Niveis de cinza');


% Segundo caso: Teste com a rosa para normalização

% Aqui chamamos a função imagehist4e para obtermos o histograma da nossa
% imagem equalizada. (sem especificar o modo)!
[I2, h] = imagehist4e(img1);

% Salvamos a imagem para fins de documentação do experimento.
imwrite(I2, '../results/hidden-horse-equalizado.tif');

% Exibimos a nova imagem como resultado.
figure;
imshow(I2);
title('Imagem equalizada');

% Exibimos um gráfico em barras do novo histograma equalizado.
figure;
bar(h);
title('Histograma equalizado');
ylabel('Pk');
xlabel('Niveis de cinza');

%% --- Spillway ---

% Primeiro caso: Teste com o cavalo para não normalização

% Aquisição da imagem
img2 = imread('../img/spillway-dark.tif');

% Aqui chamamos a função imagehist4e para obtermos o histograma da nossa
% imagem não equalizada.
[nI, h] = imagehist4e(img2, 'u');

% Aqui mostramos a nossa imagem sem fazer qualquer tipo de equalização.
figure;
imshow(nI);
title('Imagem sem equalização');

% Aqui mostramos o nosso gráfico de histograma da imagem sem fazer qualquer 
% tipo de equalização.
figure;
bar(h);
title('Histograma sem equalização');
ylabel('Pk');
xlabel('Niveis de cinza');

% Aqui chamamos a função imagehist4e para obtermos o histograma da nossa
% imagem equalizada. (com o modo)!
[n2I, h] = imagehist4e(img2, 'n');

% Salvamos a imagem para fins de documentação do experimento.
imwrite(n2I, '../results/spillway-dark-equalizado.tif');

% Exibimos a nova imagem como resultado.
figure;
imshow(n2I);
title('Imagem equalizada');

% Exibimos um gráfico em barras do novo histograma equalizado.
figure;
bar(h);
title('Histograma equalizado');
ylabel('Pk');
xlabel('Niveis de cinza');

% Fechamos tudo ao apertar "enter"
pause;
close all;