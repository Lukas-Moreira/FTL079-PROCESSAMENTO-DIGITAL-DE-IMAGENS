%====================================
%Alunos: Lukas Lujan Moreira
%        Thiago Patrick Tavares Costa
%====================================

clearvars; close all; clc;

%% --- Aquisição de dados ---

% Carrega a imagem da garrafa e mostra ela sem processamento
I = imread('../img/drip-bottle-256.tif');
imshow(I);

% Aqui nós salvamos uma cópia para não alteramos a imagem original
S = I;

%% Processamento da Imagem

% Começamos com 128 que é referente a (2^7) 
% e vamos até 2 que é referente a (2^1) esse
% processo é bem simples, no decorrer de cada
% iteração nós vamos dividindo por 2, assim obtemos 
% a nova intensidade.

for n = 7 : -1 : 1
    % Realizamos então a divisão por dois para obter a intensidade
    % reduzida, vale lembrar que a operação " ./ 2" faz a divisão em todos
    % os elementos da matriz.
    S = S ./ 2;

    % O figure nesse caso serve para não fecharmos a figura anterior, pois
    % se rodarmos sem ele ele vai ficar fechando as instâncias anteriores
    figure;
    
    % Exibimos então a imagem com brilho reduzido
    imshow(S - 1, []);
   
    % Aqui nós salvamos a imagem com a nova intensidade na pasta results
    saveas(gcf, ['../results/drip-bottle-', num2str(2^n), '.tif']);
end

%% Finalização do processamento

% Basta pressionar a perta "Enter" para fechar todas as abas abertas.
pause;
close('all');