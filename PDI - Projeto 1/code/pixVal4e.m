%====================================
%Alunos: Lukas Lujan Moreira
%        Thiago Patrick Tavares Costa
%====================================

%% Função pixVal4e

% O objetivo retornar o valor do pixel
% as coordenadas passadas.
function v = pixVal4e(f, r, c)
    [M, N] = size(f);

    % Verifica se as coordenadas são válidas
    if r<=M && c<=N
        v = f(r, c);
    else 
        fprintf('Erro: fora dos limites da imagem')
    end
    
end