%========================================================
% Alunos: Lukas Lujan Moreira
%         Thiago Patrick Tavares Costa
%========================================================
clear variables; close all;

% Adiciona todas as subpastas dentro de 'src' automaticamente
addpath(genpath('src'));

% Cria pastas de resultados, se necessário
outputDirs = {'results/parte_a', 'results/parte_b_c', 'results/parte_d'};
for k = 1:length(outputDirs)
    if ~exist(outputDirs{k}, 'dir')
        mkdir(outputDirs{k});
    end
end

%% ================================
% Parte (a) - Filtros Butterworth LPF e HPF
% ================================

f = imread('woman.tif');
f = im2double(f);

F = fft2(f);
imwrite(f, 'results/parte_a/imagem_original.png');
imwrite(mat2gray(fftshift(log(1 + abs(F)))), 'results/parte_a/espectro_log_original.png');

PQ = paddedsize(size(f));
D0 = 0.05 * PQ(2);

Hhp_btw = hpfilter('btw', PQ(1), PQ(2), D0);
imwrite(mat2gray(fftshift(Hhp_btw)), 'results/parte_a/filtro_hpf_2d.png');
g_high = dftfilt(f, Hhp_btw);
imwrite(mat2gray(g_high), 'results/parte_a/imagem_hpf.png');

Hlp_btw = lpfilter('btw', PQ(1), PQ(2), D0);
imwrite(mat2gray(fftshift(Hlp_btw)), 'results/parte_a/filtro_lpf_2d.png');
g_low = dftfilt(f, Hlp_btw);
imwrite(mat2gray(g_low), 'results/parte_a/imagem_lpf.png');

% Salva visualizações 3D como figuras
figure; mesh(double(fftshift(Hhp_btw(1:10:end, 1:10:end))));
title('Filtro HPF 3D');
saveas(gcf, 'results/parte_a/filtro_hpf_3d.png');

figure; mesh(double(fftshift(Hlp_btw(1:10:end, 1:10:end))));
title('Filtro LPF 3D');
saveas(gcf, 'results/parte_a/filtro_lpf_3d.png');

pause; close all;

%% ================================
% Parte (b) e (c) - High Emphasis + equalização
% ================================

f = imread('chestXray.tif');
f_float = tofloat(f);
F = fft2(f_float);

imwrite(f, 'results/parte_b_c/imagem_original.png');
imwrite(mat2gray(fftshift(log(1 + abs(F)))), 'results/parte_b_c/espectro_log_original.png');

PQ = paddedsize(size(f));
D0 = 0.05 * PQ(2);
H = highEnphasisFilter(0.5, 2, 'ideal', false, PQ(1), PQ(2), D0);  % show = false para não abrir as figuras
g = dftfilt(f, H);

realcada = g + f;
imwrite(mat2gray(realcada), 'results/parte_b_c/imagem_high_emphasis.png');

g_eq = histeq(realcada);
imwrite(mat2gray(g_eq), 'results/parte_b_c/imagem_equalizada.png');

g_float = tofloat(g);
F2 = fft2(g_float);
imwrite(mat2gray(fftshift(log(1 + abs(F2)))), 'results/parte_b_c/espectro_pos_high_emphasis.png');

pause; close all;

%% ================================
% Parte (d) - Filtro Rejeita Banda
% ================================

type = 'ideal';
H_br = brFilter(type, 512, 512, 128, 60, 1);

% Salva as visualizações
imwrite(mat2gray(fftshift(H_br)), 'results/parte_d/filtro_br_2d.png');

figure;
mesh(double(fftshift(H_br(1:10:end, 1:10:end))));
title(['Filtro Band Reject - ' type ' (3D)']);
saveas(gcf, 'results/parte_d/filtro_br_3d.png');

pause; close all; clearvars;
