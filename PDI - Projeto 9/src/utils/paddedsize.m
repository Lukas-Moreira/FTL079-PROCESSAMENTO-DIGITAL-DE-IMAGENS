%========================================================
% Alunos: Lukas Lujan Moreira
%         Thiago Patrick Tavares Costa
%========================================================

% PADDEDSIZE: Função para calcular o de padding para filtragem com FFT
% Sintaxes:
%   PQ = paddedsize(AB)
%       -> Retorna PQ = 2 * AB (dobro do tamanho original)
%
%   PQ = paddedsize(AB, 'PWR2')
%       -> Retorna PQ = [P P], onde P = 2^nextpow2(2 * max(AB))
%
%   PQ = paddedsize(AB, CD)
%       -> Retorna PQ = 2 * ceil((AB + CD - 1)/2)
%
%   PQ = paddedsize(AB, CD, 'PWR2')
%       -> Retorna PQ = [P P], onde P = 2^nextpow2(2 * max([AB CD]))

function PQ = paddedsize(AB, CD, PARAM)
    % Verifica número de argumentos
    narginchk(1, 3);

    if nargin == 1
        % Caso simples: dobra o tamanho
        PQ = 2 * AB;

    elseif nargin == 2 && ~ischar(CD)
        % Caso com duas dimensões: padding baseado em convolução
        PQ = AB + CD - 1;
        PQ = 2 * ceil(PQ / 2);  % arredonda para múltiplos pares

    elseif nargin == 2 && ischar(CD) && strcmpi(CD, 'PWR2')
        % Caso com potência de 2: baseado apenas em AB
        m = max(AB(:));
        P = 2^nextpow2(2 * m);
        PQ = [P, P];

    elseif nargin == 3 && ischar(PARAM) && strcmpi(PARAM, 'PWR2')
        % Caso com AB, CD e 'PWR2'
        m = max([AB(:); CD(:)]);  % max dos dois vetores
        P = 2^nextpow2(2 * m);
        PQ = [P, P];

    else
        error('Uso inválido da função paddedsize. Verifique os argumentos.');
    end
end
