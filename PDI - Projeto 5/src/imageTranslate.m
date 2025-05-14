%====================================
%Alunos: Lukas Lujan Moreira
%        Thiago Patrick Tavares Costa
%====================================

function g = imageTranslate(f, tx, ty)

    [r, c] = size(f);
    g = im2uint8(ones(r, c));
    % matriz de translação
    A = [1, 0, tx; 0, 1, ty; 0, 0, 1];

    for x = 1 : r
        for y = 1 : c
            a = A * [x; y; 1];
            % condição caso a imagem transladada saia do range 
            if a(1) <= r && a(1) > 0 && a(2) <= c && a(2) > 0
                g(x, y) = f(a(1), a(2));
            end
            
        end
    end

end