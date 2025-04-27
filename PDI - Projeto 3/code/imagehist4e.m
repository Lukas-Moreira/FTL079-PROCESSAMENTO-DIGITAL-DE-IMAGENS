%====================================
%Alunos: Lukas Lujan Moreira
%        Thiago Patrick Tavares Costa
%====================================

%% Função imagehist4e 

% Essa função recebe dois argumentos que são a imagem e o modo de operação,
% o modo de operação pode ser 'n' para normalização ou 'u' para não 
% normalização.

function [g, h] = imagehist4e(img, mode)
    
    % Criamos um vetor de zeros que vai da posição 0 a 255, onde 0 - preto 
    % e 255 - branco.
    hist = zeros(1, 256);

    % Aqui pegamos as dimensões da imagem e o número total de pixels da 
    % imagem. O número total de pixels é dado pelo produto do número de 
    % linhas e colunas.
    [r, c] = size(img);
    tam = r * c;
    
    % Aqui nós percorremos a imagem e contamos quantas vezes cada nível de
    % cinza aparece, ou seja, quantos bins existem para cada nível de cinza.
    for i = 1 : r
        for j = 1 : c
            nivelCinza = img(i, j);
            hist(nivelCinza + 1) = hist(nivelCinza + 1) + 1;
        end
    end
    
    % Normalização da distribuição de níveis de cinza da imagem
    
    histNorm = hist / tam;

    % Aqui nós verificamos se o modo de operação é 'n' ou 'u'. 
    % Tomamos como padrão o modo 'n', caso não seja passado outro argumento.
    if nargin < 2
        mode = 'n';
    end

    switch mode
        case 'n'
            %% Normalização do histograma
                
            % Chamamos a função de equalização.
            s = histEqual4e(histNorm);

            % Criamos a imagem para ser equalizada.
            Ieq = im2uint8(zeros(r, c));
            
            % Percorremos cada endereço da Matriz para equalizar a imagem.
            for i = 1 : r
                for j = 1 : c
                    Ieq(i, j) = s(img(i, j) + 1);
                end
            end

            % Retornamos a imagem equalizada
            g = Ieq;
            
            % Aqui nós criamos o histograma da imagem equalizada
            for i = 1 : r
                for j = 1 : c
                    nivelCinza = Ieq(i, j);
                    hist(nivelCinza + 1) = hist(nivelCinza + 1) + 1;
                end
            end

            % Retornamos o histograma equalizado
            h = hist / tam;
                
        case 'u'
            %% Não equalização do histograma
            g = img;
            h = histNorm;
    end
end
