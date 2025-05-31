%====================================
%Alunos: Lukas Lujan Moreira
%        Thiago Patrick Tavares Costa
%====================================

% A função imagePad4e cria uma imagem com padding de zeros ou de replicas
% de acordo com o modo selecionado.
function g = imagePad4e(f, r, c, padtype)
    
    [rows, cols] = size(f);       % Obtém o tamanho da imagem original       
    
    nR = rows + 2*r;              % Número de linhas após o padding
    nC = cols + 2*c;              % Número de colunas após o padding

    g = zeros(nR, nC, class(f));  % Padding inicial com zeros

    % Insere a imagem original no centro da imagem com padding
    g(r+1:end-r, c+1:end-c) = f;

    if nargin == 4 && strcmp(padtype, "replicate")
        % Linhas superiores e inferiores replicadas
        g(1:r, c+1:end-c) = repmat(f(1,:), r, 1);           % top
        g(end-r+1:end, c+1:end-c) = repmat(f(end,:), r, 1); % bottom

        % Colunas esquerda e direita replicadas
        g(:, 1:c) = repmat(g(:, c+1), 1, c);              % left
        g(:, end-c+1:end) = repmat(g(:, end-c), 1, c);    % right
    end
end