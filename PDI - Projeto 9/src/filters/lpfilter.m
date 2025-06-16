%========================================================
% Alunos: Lukas Lujan Moreira
%         Thiago Patrick Tavares Costa
%========================================================

% LPFILTER Gera filtro passa baixa no dom�nio da frequ�ncia
%
% Sintaxe:
%   H_lp = lpfilter(filter_type, rows, cols, cutoff_freq)
%   H_lp = lpfilter(filter_type, rows, cols, cutoff_freq, order)
%
% Entradas:
%   filter_type  - tipo do filtro: 'ideal', 'btw', 'gaussian'
%   rows, cols   - tamanho do filtro (altura x largura)
%   cutoff_freq  - frequ�ncia de corte (D0), deve ser > 0
%   order        - ordem do filtro Butterworth (opcional, default = 1)
%
% Sa�da:
%   H_lp         - fun��o de transfer�ncia passa baixa (centralizada)
%   D            - matriz de dist�ncias para visualiza��o/uso adicional
%
% Observa��o:
%   Para visualizar H_lp como imagem ou superf�cie, use fftshift(H_lp).
%   Usa a fun��o auxiliar dftuv para calcular as frequ�ncias.

function [H_lp, D] = lpfilter(filter_type, rows, cols, cutoff_freq, order)
    % Verifica��o de argumentos
    if nargin < 4
        error('S�o necess�rios pelo menos 4 argumentos: filter_type, rows, cols e cutoff_freq.');
    end

    if nargin < 5
        order = 1;  % valor padr�o para filtro Butterworth
    end

    if cutoff_freq <= 0
        error('A frequ�ncia de corte (cutoff_freq) deve ser positiva.');
    end

    filter_type = lower(filter_type);
    if ~ismember(filter_type, {'ideal', 'btw', 'gaussian'})
        error('Tipo de filtro inv�lido. Use: ''ideal'', ''btw'' ou ''gaussian''.');
    end

    % Cria��o das matrizes de frequ�ncia centradas em zero
    [U, V] = dftuv(rows, cols);

    % Dist�ncia euclidiana em cada ponto (em frequ�ncia)
    D = hypot(U, V);

    % Inicializa��o do filtro passa-baixa
    switch filter_type
        case 'ideal'
            H_lp = double(D <= cutoff_freq);

        case 'btw'
            H_lp = 1 ./ (1 + (D ./ cutoff_freq).^(2 * order));

        case 'gaussian'
            H_lp = exp(-(D.^2) / (2 * cutoff_freq^2));

        otherwise
            error('Tipo de filtro n�o reconhecido. Use: ''ideal'', ''btw'' ou ''gaussian''.');
    end

    % Garante tipo single (por compatibilidade com dftfilt)
    H_lp = single(H_lp);
end
