%========================================================
% Alunos: Lukas Lujan Moreira
%         Thiago Patrick Tavares Costa
%========================================================

% DFTUV - Calculamos as matrizes de frequência U e V (meshgrid)
%
% Descrição:
%   Esta função retorna as matrizes de frequência U e V centralizadas, que 
%   são utilizadas em filtragem no domínio da frequência, como nas funções 
%   dftfilt, lpfilter e hpfilter.
%
% Sintaxe:
%   [uFreq, vFreq] = dftuv(numRows, numCols)
%
% Entradas:
%   numRows  - número de linhas da matriz (M)
%   numCols  - número de colunas da matriz (N)
%
% Saídas:
%   uFreq    - matriz de frequências horizontais (MxN)
%   vFreq    - matriz de frequências verticais (MxN)
%
% Observação:
%   As saídas estão centralizadas com origem no centro da matriz.
%   Os vetores de frequência são do tipo `single` para compatibilidade
%   com operações de filtragem em ponto flutuante.

function [uFreq, vFreq] = dftuv(numRows, numCols)
    % Definimos os vetores de frequência nas direções u e v
    u = single(0:(numRows - 1));
    v = single(0:(numCols - 1));

    % Centralizamos os índices de u: elementos acima de M/2 são deslocados
    u(u > numRows / 2) = u(u > numRows / 2) - numRows;

    % Centralizamos os índices de v: mesma lógica
    v(v > numCols / 2) = v(v > numCols / 2) - numCols;

    % Criamos os grids de coordenadas de frequência (vertical e horizontal)
    [vFreq, uFreq] = meshgrid(v, u);
end
