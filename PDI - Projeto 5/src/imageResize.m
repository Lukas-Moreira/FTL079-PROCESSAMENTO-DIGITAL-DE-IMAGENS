%====================================
%Alunos: Lukas Lujan Moreira
%        Thiago Patrick Tavares Costa
%====================================

% Código para redimensionar a imagem
function g = imageResize(f, numrows, numcols)

    [r, c] = size(f);               % obtendo o tamanho da imagem

    % Aqui verificamos se a imagem tem mais linhas que colunas
    if r > c
        % caso a altura seja maior que a largura
        % calcula-se o fator de redução ou expansão 
        % para manter a imagem original sem perder 
        % seu aspecto dentro das novas dimensões
        cx = numrows / r;
        cy = cx;
        
        cols = round(cy * c);
        tx = 0;
        ty = (numcols - cols) / 2;
        
    else
        % caso a largura seja maior que a altura
        % calcula-se o fator de redução ou expansão 
        % para manter a imagem original sem perder 
        % seu aspecto dentro das novas dimensões
        cy = numcols / c;
        cx = cy;
        rows = round(cx * r);
        ty = 0;
        tx = (numrows - rows) / 2;
        
    end
    % cria a nova imagem em branco no qual irá 
    % ser rearranjada a imagem original com seu 
    % aspecto
    g = im2uint8(ones(numrows,numcols));
    % matriz de trasnformação de escala
    As = [cx, 0, 0; 0, cy, 0; 0, 0, 1];
    % matriz de transformação de translação
    At = [1, 0, tx; 0, 1, ty; 0, 0, 1];
    % juntando as duas operações na seguinte ordem:
    % translação e em seguida reescala
    A = At * As;
    % matriz inversa para mapeamento de pixels de 
    % entrada pela saída
    invA = inv(A);

    for xl = 1 : numrows
        for yl = 1 : numcols
            %transformações
            a = invA * [xl; yl; 1];
            x = a(1);
            y = a(2);

            % interpolação bilinear com retorno da
            % intensidade do pixel pelo mapeamento inverso
            if (x > 0 && x <= r) && (y > 0 && y <= c)
                g(xl, yl) = bilinearInterp(f, x, y);
            end
        end
    end

end