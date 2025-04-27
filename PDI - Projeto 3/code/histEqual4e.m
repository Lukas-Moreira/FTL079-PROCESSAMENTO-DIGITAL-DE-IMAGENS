%====================================
%Alunos: Lukas Lujan Moreira
%        Thiago Patrick Tavares Costa
%====================================

%% Função hisEqual4e
function g = histEqual4e(f)
    
    % Criamos um vetor de zeros que vai da posição 0 a 255, onde 0 - preto 
    % e 255 - branco.
    s = zeros(1, 256);
    
    % Aqui nós realizamos a equalização do histograma, essa função calcula 
    % uma distribuição acumulada CDF e salva no indice do novo histograma.
    for i = 1 : 256
        s(i) = round(255 * sum(f(1:i)));
    end

    % Retorna o histograma equalizado.
    g = s;
end

% Obs: a curva dessa função é sempre crescente já que a soma não diminui,
% logo ela faz uma expansão na escala, em aula vimos algo parecido com a 
% função re-scaling.