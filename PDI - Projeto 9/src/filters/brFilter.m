%========================================================
% Alunos: Lukas Lujan Moreira
%         Thiago Patrick Tavares Costa
%========================================================

% BRFILTER - Criamos um filtro de rejeição de banda (Band Reject Filter)
%
% Descrição:
%   Filtro que rejeita uma faixa de frequências ao redor de D0,
%   com largura W. Pode ser do tipo:
%     - 'ideal'     → rejeição abrupta
%     - 'btw'       → rejeição suave (Butterworth)
%     - 'gaussian'  → rejeição suave gaussiana
%
% Sintaxe:
%   H = brFilter(type, M, N, D0, W)
%   H = brFilter(type, M, N, D0, W, n)
%
% Entradas:
%   type  - tipo de filtro: 'ideal', 'btw', 'gaussian'
%   M     - número de linhas da matriz do filtro
%   N     - número de colunas da matriz do filtro
%   D0    - frequência central da banda rejeitada
%   W     - largura da banda rejeitada
%   n     - ordem (para filtro Butterworth, opcional, default = 1)
%
% Saída:
%   H     - matriz H do filtro no domínio da frequência (centralizado)

function H = brFilter(type, M, N, D0, W, n)

    % Valor padrão para n
    if nargin < 6
        n = 1;
    end

    % Criamos a malha de coordenadas (U, V)
    [U, V] = meshgrid(1:N, 1:M);

    % Calculamos a distância radial até o centro
    D = sqrt((U - N/2).^2 + (V - M/2).^2);

    % Selecionamos o tipo de filtro
    switch lower(type)
        case 'ideal'
            H = ones(M, N);
            H(D >= (D0 - W/2) & D <= (D0 + W/2)) = 0;

        case 'btw'
            H = 1 ./ (1 + ((D .* W) ./ (D.^2 - D0^2)).^(2 * n));

        case 'gaussian'
            H = 1 - exp(-((D.^2 - D0^2).^2) ./ (D.^2 .* W));

        otherwise
            error('Tipo de filtro inválido. Use: ''ideal'', ''btw'' ou ''gaussian''.');
    end

    % Visualizações opcionais
    figure;
    mesh(H);
    title(['Filtro Band Reject - ' type ' (3D)']);

    figure;
    imshow(H, []);
    title(['Filtro Band Reject - ' type ' (2D)']);
end
