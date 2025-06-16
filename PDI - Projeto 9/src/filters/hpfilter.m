%========================================================
% Alunos: Lukas Lujan Moreira
%         Thiago Patrick Tavares Costa
%========================================================


% HPFILTER Gera filtro passa alta no domínio da frequência
%
% Sintaxe:
%   H_hp = hpfilter(filter_type, rows, cols, cutoff_freq)
%   H_hp = hpfilter(filter_type, rows, cols, cutoff_freq, order)
%
% Entradas:
%   filter_type  - 'ideal', 'btw' ou 'gaussian'
%   rows, cols   - dimensões do filtro (altura e largura)
%   cutoff_freq  - frequência de corte (>0)
%   order        - (opcional) ordem para filtro Butterworth (default = 1)
%
% Saída:
%   H_hp         - função de transferência passa alta (centralizada)
%
% Obs:
%   Calcula H_hp = 1 - H_lp usando a função lpfilter.
%   Para visualizar corretamente: use fftshift(H_hp).

function H_hp = hpfilter(filter_type, rows, cols, cutoff_freq, order)
    % Valor padrão da ordem do filtro
    if nargin < 5
        order = 1;
    end

    % Verificações de entrada
    if cutoff_freq <= 0
        error('A frequência de corte (cutoff_freq) deve ser positiva.');
    end

    filter_type = lower(filter_type);
    if ~ismember(filter_type, {'ideal', 'btw', 'gaussian'})
        error('Tipo de filtro inválido. Use: ''ideal'', ''btw'' ou ''gaussian''.');
    end

    % Gera filtro passa-baixa correspondente
    H_lp = lpfilter(filter_type, rows, cols, cutoff_freq, order);

    % Gera o filtro passa-alta: inverso do passa-baixa
    H_hp = 1 - H_lp;

    % Converte para tipo single para compatibilidade com dftfilt
    H_hp = single(H_hp);
end