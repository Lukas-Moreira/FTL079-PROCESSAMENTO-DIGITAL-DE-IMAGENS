%========================================================
% Alunos: Lukas Lujan Moreira
%         Thiago Patrick Tavares Costa
%========================================================

% DFTUV - Calculamos as matrizes de frequ�ncia U e V (meshgrid)
%
% Descri��o:
%   Esta fun��o retorna as matrizes de frequ�ncia U e V centralizadas, que 
%   s�o utilizadas em filtragem no dom�nio da frequ�ncia, como nas fun��es 
%   dftfilt, lpfilter e hpfilter.
%
% Sintaxe:
%   [uFreq, vFreq] = dftuv(numRows, numCols)
%
% Entradas:
%   numRows  - n�mero de linhas da matriz (M)
%   numCols  - n�mero de colunas da matriz (N)
%
% Sa�das:
%   uFreq    - matriz de frequ�ncias horizontais (MxN)
%   vFreq    - matriz de frequ�ncias verticais (MxN)
%
% Observa��o:
%   As sa�das est�o centralizadas com origem no centro da matriz.
%   Os vetores de frequ�ncia s�o do tipo `single` para compatibilidade
%   com opera��es de filtragem em ponto flutuante.

function [uFreq, vFreq] = dftuv(numRows, numCols)
    % Definimos os vetores de frequ�ncia nas dire��es u e v
    u = single(0:(numRows - 1));
    v = single(0:(numCols - 1));

    % Centralizamos os �ndices de u: elementos acima de M/2 s�o deslocados
    u(u > numRows / 2) = u(u > numRows / 2) - numRows;

    % Centralizamos os �ndices de v: mesma l�gica
    v(v > numCols / 2) = v(v > numCols / 2) - numCols;

    % Criamos os grids de coordenadas de frequ�ncia (vertical e horizontal)
    [vFreq, uFreq] = meshgrid(v, u);
end
