%========================================================
% Alunos: Lukas Lujan Moreira
%         Thiago Patrick Tavares Costa
%========================================================

% Adicionando a pasta de funções
addpath("src\")

% Leitura da imagem original
f = imread('img/rice-shaded.tif');

delT=1E-9;
delT2=1E-12;
delT3=10;
delT4=20;

% Chamando a função de Threshrold
disp("=== Threshrold (Default) ===");
bw = globalThresh(f);

% Chamando a função de Threshrold
disp("=== Threshrold (" + delT + ") ===");
bw1 = globalThresh(f, delT);

% Chamando a função de Threshrold
disp("=== Threshrold (" + delT2 + ") ===");
bw2 = globalThresh(f, delT2);

% Chamando a função de Threshrold
disp("=== Threshrold (" + delT3 + ") ===");
bw3 = globalThresh(f, delT3);

% Chamando a função de Threshrold
disp("=== Threshrold (" + delT4 + ") ===");
bw4 = globalThresh(f, delT4);

% Salvando os resultados: Imagem 
imwrite(bw,fullfile('./results/global_Thresh(Default).png'));
imwrite(bw1,fullfile('./results/global_Thresh(0.0001).png'));
imwrite(bw,fullfile('./results/global_Thresh(Default).tif'));
imwrite(bw1,fullfile('./results/global_Thresh(0.0001).tif'));

% Exibir resultado
figure;
subplot(1,4,1); imshow(f); title('Imagem Original');
subplot(1,4,2); imshow(bw); title('Global Threshold (Default)');
subplot(1,4,3); imshow(bw1); title('Global Threshold delT=1E-9');
%subplot(1,6,4); imshow(bw2); title('Global Threshold delT=1E-12');
subplot(1,4,4); imshow(bw3); title('Global Threshold delT=10');
%subplot(1,6,6); imshow(bw4); title('Global Threshold delT=20');

pause; close all; clear vars;