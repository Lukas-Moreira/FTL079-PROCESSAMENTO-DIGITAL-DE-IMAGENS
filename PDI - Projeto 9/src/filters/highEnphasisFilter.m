%========================================================
% Alunos: Lukas Lujan Moreira
%         Thiago Patrick Tavares Costa
%========================================================

% HIGHEMPHASISFILTER - Criamos um filtro de alta ênfase no domínio da frequência.
%
% Descrição:
%   A filtragem de alta ênfase combina um realce linear com um filtro passa-alta:
%       H_HE = a + b * H_HP
%   onde H_HP é a função de transferência do filtro passa-alta do tipo escolhido.
%   Os parâmetros a e b controlam o realce.
%
% Sintaxe:
%   H = highEnphasisFilter(a, b, type, show, M, N, D0)
%   H = highEnphasisFilter(a, b, type, show, M, N, D0, n)
%
% Entradas:
%   a      - componente de deslocamento (offset)
%   b      - fator de multiplicação para o filtro passa-alta
%   type   - tipo de filtro: 'ideal', 'btw' (Butterworth), ou 'gaussian'
%   show   - booleano; se verdadeiro, mostramos os gráficos 2D e 3D do filtro
%   M, N   - dimensões do filtro (altura e largura)
%   D0     - frequência de corte
%   n      - ordem do filtro Butterworth (opcional; default = 1)
%
% Saída:
%   H      - matriz da função de transferência de alta ênfase (MxN)
%
% Observação:
%   Para visualização correta das imagens de filtro, usamos fftshift(H) fora da função.
%   O filtro é criado já centralizado, compatível com uso em dftfilt.

function H = highEnphasisFilter(a, b, type, show, M, N, D0, n)
    % Definimos valor padrão da ordem n se não for fornecido
    if nargin < 8
        n = 1;
    end

    % Geramos a malha de coordenadas centrada
    [U, V] = meshgrid(1:N, 1:M);
    D = sqrt((U - N/2).^2 + (V - M/2).^2);

    % Criamos o filtro passa-alta H_HP do tipo solicitado
    switch lower(type)
        case 'ideal'
            H_hp = double(D > D0);  % passa-alta ideal: 1 fora da banda
        case 'btw'
            H_hp = 1 ./ (1 + (D0 ./ D).^(2*n));  % Butterworth
        case 'gaussian'
            H_hp = 1 - exp(-(D.^2) / (2 * D0^2));  % Gaussiano
        otherwise
            error('Tipo de filtro inválido. Use ''ideal'', ''btw'' ou ''gaussian''.');
    end

    % Construímos o filtro de alta ênfase a partir do passa-alta
    H = a + b * H_hp;

    % Visualização opcional dos filtros
    if show
        figure; mesh(H);
        title(['Filtro High Emphasis - ' type ' (3D)']);

        figure; imshow(H, []);
        title(['Filtro High Emphasis - ' type ' (2D)']);
    end
end

