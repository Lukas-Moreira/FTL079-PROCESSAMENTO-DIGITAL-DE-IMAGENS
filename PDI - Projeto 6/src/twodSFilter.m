%====================================
%Alunos: Lukas Lujan Moreira
%        Thiago Patrick Tavares Costa
%====================================

% A função twodSFilter aplica um filtro de média em uma imagem
% de entrada f, com um kernel de tamanho w x w.
function g = twodSFilter(f, w)

    % Aqui nós pegamos a metade do tamanho do kernel e caso ele seja
    % um valor quebrado, ele é arredondado para baixo.
    aux = floor(w/2);

    % Chamamos a função imagePad4e para adicionar o padding na imagem
    % com original. O padding selecionado é o de replicação.
    Ipadded = imagePad4e(f, aux, aux, 'replicate');

    % criação do kernel tipo box
    msk = (1/(w*w)) * (ones(w, w));

    % Descobrimos o tamanho da imagem original
    [rows, coluns] = size(f);

    % Criamos uma imagem com o tamanho da imagem com fundo preto.
    g = im2uint8(zeros(rows, coluns));

    % Aqui nós percorremos a imagem original e aplicamos o filtro de
    % mediana.
    for i = 1 : rows
        for j = 1 : coluns
            % Para cada pixel da imagem original, nós pegamos a
            % vizinhança de pixels da imagem com padding e aplicamos a média.
            produto = msk .* double(Ipadded(i : i + w - 1,j : j + w - 1));
            g(i, j) = round(sum(produto, 'all'));
        end
    end
end
%====================================