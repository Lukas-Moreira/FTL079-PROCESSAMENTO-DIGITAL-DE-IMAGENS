%========================================================
% Alunos: Lukas Lujan Moreira
%         Thiago Patrick Tavares Costa
%========================================================

function g = globalThresh(f, delT)
    % Implementação de limiarização global iterativa.
    % f: imagem de entrada
    % delT: tolerância para convergência (padrão 0.01)

    % Se o parâmetro delT não for fornecido, define valor padrão 0.01
    if nargin < 2
        delT = 0.01;
    end

    % Converte a imagem para tipo double para cálculos numéricos precisos
    f = double(f);

    % Normaliza os valores da imagem para a faixa [0,1]
    fmin = min(f(:));
    fmax = max(f(:));
    f = (f - fmin) / (fmax - fmin);

    % Inicializa o limiar T com a média dos níveis de cinza da imagem
    T = mean(f(:));
    % Inicializa a diferença como infinito para entrar no loop
    dif = Inf;

    % Loop iterativo até que a diferença entre limiares seja menor que delT
    while dif > delT
        % Separa a imagem em dois grupos:
        % G1: pixels com intensidade maior que o limiar atual T
        % G2: pixels com intensidade menor ou igual a T
        G1 = f(f > T);
        G2 = f(f <= T);

        % Verifica se algum grupo está vazio (caso raro)
        if isempty(G1) || isempty(G2)
            break;
        end

        % Calcula a média de cada grupo
        m1 = mean(G1);
        m2 = mean(G2);

        % Calcula o novo limiar como a média das médias dos grupos
        Tnew = (m1 + m2) / 2;

        % Atualiza a diferença entre o limiar novo e o anterior
        dif = abs(Tnew - T);

        % Atualiza T para a próxima iteração
        T = Tnew;
        disp("Iteração: "+dif);
    end
    disp(" ");

    % Após a convergência, aplica a binarização com o limiar final
    g = zeros(size(f));     % Inicializa a imagem de saída binária
    g(f > T) = 1;           % Pixels maiores que o limiar recebem valor 1 (branco)
    % Os demais permanecem 0 (preto)
end