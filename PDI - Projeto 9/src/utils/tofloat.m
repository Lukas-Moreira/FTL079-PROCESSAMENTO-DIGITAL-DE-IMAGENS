%========================================================
% Alunos: Lukas Lujan Moreira
%         Thiago Patrick Tavares Costa
%========================================================

% TOFLOAT - Função de conversão da imagem para ponto flutuante
%
% Descrição:
%   Esta função converte uma imagem de entrada para o tipo ponto flutuante
%   (single ou double) e retorna uma função auxiliar para reverter a conversão,
%   preservando a classe original da imagem.
%
% Sintaxe:
%   [imageOut, revertFunc] = tofloat(imageIn)
%
% Entradas:
%   imageIn   - imagem de entrada de qualquer classe suportada
%
% Saídas:
%   imageOut     - imagem convertida para ponto flutuante (single ou double)
%   revertFunc   - função que reverte a imagem para a classe original
%
% Observação:
%   Utilizamos uma tabela com funções de conversão baseadas na classe
%   original da imagem. Essa abordagem evita `if-else` longos e melhora a clareza.

function [imageOut, revertFunc] = tofloat(imageIn)

    % Função identidade (caso a imagem já seja ponto flutuante)
    identity = @(x) x;
    
    % Função de conversão padrão para ponto flutuante
    toSingle = @im2single;

    % Tabela: {classe de entrada, função para converter para float, função para reverter}
    conversionTable = {
        'uint8',   toSingle, @im2uint8;
        'uint16',  toSingle, @im2uint16;
        'int16',   toSingle, @im2int16;
        'logical', toSingle, @logical;
        'double',  identity, identity;
        'single',  identity, identity
    };

    % Encontramos o índice da classe da imagem de entrada na tabela
    inputClass = class(imageIn);
    classIdx = find(strcmp(inputClass, conversionTable(:,1)));

    % Verificamos se a classe é suportada
    if isempty(classIdx)
        error('Classe de imagem não suportada para conversão.');
    end

    % Aplicamos a função de conversão
    imageOut = conversionTable{classIdx, 2}(imageIn);

    % Guardamos a função de reversão
    revertFunc = conversionTable{classIdx, 3};
end