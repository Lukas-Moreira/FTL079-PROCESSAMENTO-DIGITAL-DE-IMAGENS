%====================================
%Alunos: Lukas Lujan Moreira
%        Thiago Patrick Tavares Costa
%====================================

% Essa função que realiza a interpolação 
% bilinear de uma imagem f.
function p = bilinearInterp(f, x, y)

    xi  = floor(x);                                           % Arrendondando a coordenada x para baixo
    yi  = floor(y);                                           % Arrendondando a coordenada y para baixo

    if xi <= 0
        xi = 1;                                               % Obtendo o limite inferior da coordenada x
    end
    if yi <= 0
        yi = 1;                                               % Obtendo o limite inferior da coordenada y
    end
    
    [m, n] = size(f);                                         % Aqui obtemos o tamanho da imagem

    if xi+1 > m
        xi = m - 1;                                           % Arrendondando a coordenada x para cima
    end
    if yi+1 > n
        yi = n - 1;                                           % Arrendondando a coordenada y para cima
    end

    xi1 = xi + 1;                                             % Coordenada x arredondada para cima
    yi1 = yi + 1;                                             % Coordenada y arredondada para cima

    A = [1 xi yi xi*yi;
         1 xi1 yi xi1*yi;
         1 xi yi1 xi*yi1;
         1 xi1 yi1 xi1*yi1];                                  % Matriz de interpolação bilinear

    B = double([f(xi,yi); f(xi1,yi); f(xi,yi1); f(xi1,yi1)]); % Intensidades dos pixels vizinhos

    X = linsolve(A, B);                                       % Resolvemos o sistema de equações lineares

    p = X(1) + X(2)*x + X(3)*y + X(4)*x*y;                    % Intensidade interpolada

end