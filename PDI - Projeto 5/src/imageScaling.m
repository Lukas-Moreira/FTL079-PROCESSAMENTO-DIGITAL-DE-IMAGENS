%====================================
%Alunos: Lukas Lujan Moreira
%        Thiago Patrick Tavares Costa
%====================================

function g = imageScaling(f, cx, cy)

    %Tranformação de coordenadas
    %Mapeamento inverso => (x,y)=inv(A)*(x',y')

    [m,n] = size(f);                        % obtendo o tamanho da imagem
    mm = round(cx*m);                       % calculando o tamanho em linhas
    nn = round(cy*n);                       % calculando o tamanho em colunas

    g = im2uint8(ones(mm,nn));              % criando uma imagem branca de tamanho mm x nn

    A = [cx 0 0; 0 cy 0; 0 0 1];            % matriz de transformação de escala
    invA = inv(A);                          % matriz inversa para mapeamento de pixels de entrada pela saída

    % Percorerendo a imagem de entrada
    % e aplicando a transformação de escala e depois aplicando a interpolação bilinear
    for xl=1:mm
        for yl=1:nn
            a = invA*[xl;yl;1];
            x = a(1);
            y = a(2);

            %Interpolação de intensidade
            if (x>0 && x<=m) && (y>0 && y<=n)
                g(xl,yl) = bilinearInterp(f, x, y);
            end
        end
    end
end