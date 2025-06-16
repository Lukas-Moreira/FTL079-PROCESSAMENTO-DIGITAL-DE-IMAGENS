%========================================================
% Alunos: Lukas Lujan Moreira
%         Thiago Patrick Tavares Costa
%========================================================

% DFTFILT - Função que realiza a filtragem no domínio da frequência
% utilizando uma função de transferência `transferFunction`.
%
% A saída `filteredImage` é a imagem resultante da filtragem, com o
% mesmo tamanho da imagem original `inputImage`.
%
% Sintaxe de uso:
%   filteredImage = dftfilt(inputImage, transferFunction)
%   filteredImage = dftfilt(inputImage, transferFunction, outputClass)
%
% Parâmetros de entrada:
%   inputImage        - imagem a ser filtrada (real)
%   transferFunction  - matriz H (já centralizada), do mesmo tamanho ou maior que inputImage
%   outputClass       - (opcional) tipo de classe da saída:
%       'original'    - mesma classe da entrada (padrão)
%       'fltpoint'    - retorna ponto flutuante (single ou double)
%
% Observações:
%   - Convertemos automaticamente a imagem para ponto flutuante.
%   - Aplicamos o padding necessário para compatibilizar com H.
%   - A filtragem é feita via multiplicação no domínio da frequência.

function filteredImage = dftfilt(inputImage, transferFunction, outputClass)
    % Converção da imagem de entrada para ponto flutuante e salvo função de reversão
    [inputImageFloat, revertClass] = tofloat(inputImage);

    % Calculo a FFT 2D com padding para que inputImageFloat tenha o mesmo tamanho de H
    F = fft2(inputImageFloat, size(transferFunction,1), size(transferFunction,2));

    % Realizo a filtragem multiplicando pela função de transferência no domínio da frequência
    G = real(ifft2(transferFunction .* F));

    % Recorto o resultado para o tamanho original da imagem de entrada
    filteredImage = G(1:size(inputImage,1), 1:size(inputImage,2));  % single por padrão

    % Defino o tipo de saída
    if nargin == 2 || strcmp(outputClass, 'original')
        % Converto para a mesma classe da imagem original
        filteredImage = revertClass(filteredImage);
    elseif strcmp(outputClass, 'fltpoint')
        % Mantenho como ponto flutuante (sem conversão)
        return
    else
        error('Classe de saída inválida. Use ''original'' ou ''fltpoint''.');
    end
end
