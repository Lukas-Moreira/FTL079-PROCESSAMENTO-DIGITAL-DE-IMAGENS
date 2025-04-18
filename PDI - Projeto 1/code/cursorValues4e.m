%====================================
%Alunos: Lukas Lujan Moreira
%        Thiago Patrick Tavares Costa
%====================================

%% Função cursorValues4e

% Essa função tem o objetivo de retornar o valor da
% densidade e as coordenadas de um pixel selecionado
% através do input do mouse na imagem mostrada.

%% Escrita da função
function [r,c,v] = cursorValues4e(f)
    button = 0;
    
    % Aqui eu faço laço de repetição para pegar o input 
    % do botão esquerdo do mouse.
    while button ~= 1
        imshow(f);
        
        % Exibe a imagem 'f'
        % Depois eu aguardo um clique com o mouse (ginput).
        % Quando o botão esquerdo (button == 1) for pressionado.
        H = gcf;
        [c, r, button] = ginput(1);
    
    end

    % Pega o tamanho da imagem
    Isize = size(f); 

    % Arredondamento do número de linhas obtido via clique
    r = round(r);
    if r > Isize(1,1)
        r = Isize(1,1);
    elseif r < 1
        r = 1;
    end
    
    % Arredondamento do número de colunas obtido via clique
    c = round(c);
    if c > Isize(1,2)
        c = Isize(1,2);
    elseif c < 1
        c = 1;
    end
    
    % Chama a função pixVal4e para verificar qual o valor
    % do pixel nas coordenadas selecionadas.
    v = pixVal4e(f, r, c);
    fprintf('Linhas: %d \nColunas: %d \n', r, c);
    fprintf('Valor do pixel:%d\n', v);
    close(H);
end