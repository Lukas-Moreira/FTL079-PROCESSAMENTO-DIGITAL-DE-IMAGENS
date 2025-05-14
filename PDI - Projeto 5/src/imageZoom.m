%====================================
%Alunos: Lukas Lujan Moreira
%        Thiago Patrick Tavares Costa
%====================================

function g = imageZoom(f, cx, cy)

    [r, c] = size(f);

    nr = round(cx * r);
    nc = round(cy * c);

    b = im2uint8(ones(nr,nc));

    A = [cx, 0, 0; 0, cy, 0; 0, 0, 1];
    % transformação com mapeamento inverso
    invA = inv(A);

    for xl = 1 : nr
        for yl = 1 : nc
            a = invA * [xl; yl; 1];
            x = a(1);
            y = a(2);

            %interpolação bilinear
            if (x > 0 && x <= r) && (y > 0 && y <= c)
                b(xl, yl) = bilinearInterp(f, x, y);
            end
        end
    end
    mx = round(nr / 2);             
    my = round(nc / 2);             

    mx = mx - round(r / 2);         
    my = my - round(c / 2);

    g = b(mx:mx + r, my: my + c);


end


