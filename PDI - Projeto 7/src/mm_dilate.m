%====================================
%Alunos: Lukas Lujan Moreira
%        Thiago Patrick Tavares Costa
%====================================

%   D = mm_dilate(A, B) recebe:
%     - A: imagem binária de entrada (matriz 0/1 ou logical).
%     - B: elemento estruturante binário (matriz 0/1 ou logical).
%   Retorna:
%     - D: imagem dilatada (mesmo tamanho de A), assumindo padding de zeros.
function D = mm_dilate(A, B)

    % Converte para double
    A = double(A);
    B = double(B);

    [m, n] = size(A);
    [p, q] = size(B);

    % Raio do elemento estruturante
    pad_h = floor(p/2);
    pad_w = floor(q/2);

    % Chamando a função imagePad4e para criar A_pad com padding de zeros
    A_pad = imagePad4e(A, pad_h, pad_w);

    % Inicializa a saída com zeros
    D = zeros(m, n);

    % Percorre cada pixel (i,j) de A
    for i = 1:m
        for j = 1:n
            % Região correspondente do "padding"
            reg = A_pad(i : i + p - 1, j : j + q - 1);
            % Se HOUVER pelo menos um 1 em reg na posição onde B == 1,
            % então o pixel (i,j) vira 1; caso contrário, fica 0.
            if any( reg(B == 1) == 1 )
                D(i, j) = 1;
            end
        end
    end

    D = logical(D);
end
