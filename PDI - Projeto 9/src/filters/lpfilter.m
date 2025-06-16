%========================================================
% Alunos: Lukas Lujan Moreira
%         Thiago Patrick Tavares Costa
%========================================================

% LPFILTER Gera filtro passa baixa no domínio da frequência
%
% Sintaxe:
%   H_lp = lpfilter(filter_type, rows, cols, cutoff_freq)
%   H_lp = lpfilter(filter_type, rows, cols, cutoff_freq, order)
%
% Entradas:
%   filter_type  - tipo do filtro: 'ideal', 'btw', 'gaussian'
%   rows, cols   - tamanho do filtro (altura x largura)
%   cutoff_freq  - frequência de corte (D0), deve ser > 0
%   order        - ordem do filtro Butterworth (opcional, default = 1)
%
% Saída:
%   H_lp         - função de transferência passa baixa (centralizada)
%   D            - matriz de distâncias para visualização/uso adicional
%
% Observação:
%   Para visualizar H_lp como imagem ou superfície, use fftshift(H_lp).
%   Usa a função auxiliar dftuv para calcular as frequências.

function [H_lp, D] = lpfilter(filter_type, rows, cols, cutoff_freq, order)
    % Verificação de argumentos
    if nargin < 4
        error('São necessários pelo menos 4 argumentos: filter_type, rows, cols e cutoff_freq.');
    end

    if nargin < 5
        order = 1;  % valor padrão para filtro Butterworth
    end

    if cutoff_freq <= 0
        error('A frequência de corte (cutoff_freq) deve ser positiva.');
    end

    filter_type = lower(filter_type);
    if ~ismember(filter_type, {'ideal', 'btw', 'gaussian'})
        error('Tipo de filtro inválido. Use: ''ideal'', ''btw'' ou ''gaussian''.');
    end

    % Criação das matrizes de frequência centradas em zero
    [U, V] = dftuv(rows, cols);

    % Distância euclidiana em cada ponto (em frequência)
    D = hypot(U, V);

    % Inicialização do filtro passa-baixa
    switch filter_type
        case 'ideal'
            H_lp = double(D <= cutoff_freq);

        case 'btw'
            H_lp = 1 ./ (1 + (D ./ cutoff_freq).^(2 * order));

        case 'gaussian'
            H_lp = exp(-(D.^2) / (2 * cutoff_freq^2));

        otherwise
            error('Tipo de filtro não reconhecido. Use: ''ideal'', ''btw'' ou ''gaussian''.');
    end

    % Garante tipo single (por compatibilidade com dftfilt)
    H_lp = single(H_lp);
end
