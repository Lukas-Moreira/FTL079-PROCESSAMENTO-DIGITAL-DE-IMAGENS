%====================================
%Alunos: Lukas Lujan Moreira
%        Thiago Patrick Tavares Costa
%====================================

%   Função mm_erode recebe:
%     - A: imagem binária de entrada.
%     - B: elemento estruturante binário.
%   Retorna:
%     - E: imagem erodida (mesmo tamanho de A).
function E = mm_erode(A, B)

    % Converte para double
    A = double(A);
    B = double(B);

    [m, n] = size(A);
    [p, q] = size(B);

    % Raio do elemento estruturante
    pad_h = floor(p/2);
    pad_w = floor(q/2);

    % Chama a função imagePad4e para adicionar padding's a imagem
    A_pad = imagePad4e(A, pad_h, pad_w);

    % Inicializa a saída com zeros
    E = zeros(m, n);

    % Percorre cada pixel (i,j) de A
    for i = 1:m
        for j = 1:n
            % Região correspondente do "padding"
            reg = A_pad(i : i + p - 1, j : j + q - 1);
            % Se TODAS as posições onde B == 1 também forem 1 em reg,
            % mantém 1; caso contrário, permanece 0.
            if all( reg(B == 1) == 1 )
                E(i, j) = 1;
            end
        end
    end

    % Converte de volta para logical
    E = logical(E);
end
