%========================================================
% Alunos: Lukas Lujan Moreira
%         Thiago Patrick Tavares Costa
%========================================================

% DFTFILT - Fun��o que realiza a filtragem no dom�nio da frequ�ncia
% utilizando uma fun��o de transfer�ncia `transferFunction`.
%
% A sa�da `filteredImage` � a imagem resultante da filtragem, com o
% mesmo tamanho da imagem original `inputImage`.
%
% Sintaxe de uso:
%   filteredImage = dftfilt(inputImage, transferFunction)
%   filteredImage = dftfilt(inputImage, transferFunction, outputClass)
%
% Par�metros de entrada:
%   inputImage        - imagem a ser filtrada (real)
%   transferFunction  - matriz H (j� centralizada), do mesmo tamanho ou maior que inputImage
%   outputClass       - (opcional) tipo de classe da sa�da:
%       'original'    - mesma classe da entrada (padr�o)
%       'fltpoint'    - retorna ponto flutuante (single ou double)
%
% Observa��es:
%   - Convertemos automaticamente a imagem para ponto flutuante.
%   - Aplicamos o padding necess�rio para compatibilizar com H.
%   - A filtragem � feita via multiplica��o no dom�nio da frequ�ncia.

function filteredImage = dftfilt(inputImage, transferFunction, outputClass)
    % Conver��o da imagem de entrada para ponto flutuante e salvo fun��o de revers�o
    [inputImageFloat, revertClass] = tofloat(inputImage);

    % Calculo a FFT 2D com padding para que inputImageFloat tenha o mesmo tamanho de H
    F = fft2(inputImageFloat, size(transferFunction,1), size(transferFunction,2));

    % Realizo a filtragem multiplicando pela fun��o de transfer�ncia no dom�nio da frequ�ncia
    G = real(ifft2(transferFunction .* F));

    % Recorto o resultado para o tamanho original da imagem de entrada
    filteredImage = G(1:size(inputImage,1), 1:size(inputImage,2));  % single por padr�o

    % Defino o tipo de sa�da
    if nargin == 2 || strcmp(outputClass, 'original')
        % Converto para a mesma classe da imagem original
        filteredImage = revertClass(filteredImage);
    elseif strcmp(outputClass, 'fltpoint')
        % Mantenho como ponto flutuante (sem convers�o)
        return
    else
        error('Classe de sa�da inv�lida. Use ''original'' ou ''fltpoint''.');
    end
end
