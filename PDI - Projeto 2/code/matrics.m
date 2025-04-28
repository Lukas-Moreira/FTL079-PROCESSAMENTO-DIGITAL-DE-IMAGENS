%====================================
% Alunos: Lukas Lujan Moreira
%         Thiago Patrick Tavares Costa
%====================================
clearvars; close all; clc;

I = imread('../img/drip-bottle-256.tif');   % original (uint8)
S = I;                                      % cópia para quantizar

levels = 2.^(7:-1:1);                       % 128 … 2
N       = numel(levels);

% Pré-aloca tabela de resultados
T = table('Size',[N 4], ...
          'VariableTypes',{'double','double','double','double'}, ...
          'VariableNames',{'Levels','MSE','PSNR','SSIM'});

for k = 1:N
    S = bitshift(S,-1);                     % mesma divisão por 2
    
    % — Métricas — --------------------------------------------------------
    mse_val  = immse(S,I);                  % erro quadrático médio
    psnr_val = psnr (S,I);                  % razão sinal-ruído pico
    ssim_val = ssim (S,I);                  % similaridade estrutural
    
    T{k,:} = [levels(k) mse_val psnr_val ssim_val];
    
end

% Exibe e grava a tabela
disp(T);
writetable(T,'../results/metrics.csv');

