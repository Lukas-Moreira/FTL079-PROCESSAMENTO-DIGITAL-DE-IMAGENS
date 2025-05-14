%====================================
%Alunos: Lukas Lujan Moreira
%        Thiago Patrick Tavares Costa
%====================================

% Essa função realiza a reflexão de uma imagem
% em relação ao eixo x ou y, dependendo do parâmetro mode.
function g = imageReflection(f, mode)

    [row, col] = size(f);                               % Obtendo o tamanho da imagem
    g = im2uint8(ones(row, col));                       % Criando uma imagem branca

    % Escolhendo a matriz de reflexão
    if mode == 'x'
        A = [-1, 0, 0; 0, 1, 0; 0, 0, 1];           % reflexão em relação ao eixo x
    else
        A = [1, 0, 0; 0, -1, 0; 0, 0, 1];           % reflexão em relação ao eixo y
    end

    % Multiplicação da matriz de reflexão
    for x = 1 : row
        for y = 1 : col
            
            aux = A * [x; y; 1];
            
            % coordenadas refletidas
            if aux(1) < 0 
                aux(1) = aux(1) + row + 1; 
            end
            
            if aux(2) < 0
                aux(2) = aux(2) + col + 1; 
            end
            
            % imagem de retorno recebendo as coordenadas refletidas
            g(x, y) = f(aux(1), aux(2));
        end
    end
end