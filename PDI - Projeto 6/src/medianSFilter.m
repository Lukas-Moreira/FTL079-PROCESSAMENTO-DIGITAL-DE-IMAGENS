%====================================
%Alunos: Lukas Lujan Moreira
%        Thiago Patrick Tavares Costa
%====================================

% A função medianSFilter aplica um filtro de mediana em uma imagem
function g = medianSFilter(f, w)

    % Aqui nós pegamos a metade do tamanho do kernel e caso ele seja
    % um valor quebrado, ele é arredondado para baixo.
    mid = floor(w/2);

    % Chamamos a função imagePad4e para adicionar o padding na imagem
    % com original. O padding selecionado é o de replicação.
    imgaPadding = imagePad4e(f, mid, mid, 'replicate');

    % Descobrimos o tamanho da imagem original
    [r, c] = size(f);

    % Criamos uma imagem com o tamanho da imagem com fundo preto.
    g = im2uint8(zeros(r, c)); 

    % Aqui nós percorremos a imagem original e aplicamos o filtro de
    % mediana.
    for i = 1 : r
        for j = 1 : c
            % Para cada pixel da imagem original, nós pegamos a
            % vizinhança de pixels da imagem com padding e aplicamos a mediana
            % em todos os pixels da vizinhança.
            g(i, j) = median(imgaPadding(i : i + w - 1,j : j + w - 1), 'all');
        end
    end
end
%====================================