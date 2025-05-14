%====================================
%Alunos: Lukas Lujan Moreira
%        Thiago Patrick Tavares Costa
%====================================

% Adicionando a pasta src ao caminho,
% onde estão as funções que implementam as transformações.
addpath('src/')

% Lendo a imagem da menina
% e aplicando a transformação de redimensionamento.
img = imread('./img/girl.tiff');
g = imageResize(img, 224, 224);

% Salvando a imagem da menina redimendisionada na pasta.
imwrite(g, './results/girl_resize.tiff');


% Aqui nós fazemos a leitura das imagens percorrendo cada uma delas
% e aplicando as transformações de redimensionamento, translação, reflexão e zoom.
for i = 1 : 50
      
      % Lendo a imagem
      caminho = ['./img/covid/Covid (',num2str(i),').png'];
      I = imread(caminho);
      % Convertendo a imagem para escala de cinza
      nI = rgb2gray(I);
      
      % Aplicando transformação de redimensionamento
      g = imageResize(nI, 224, 224);
      nome = ['./results/img_resize/covid (', num2str(i), ')_resize.png'];
      imwrite(g, nome);
      
      % Aplicando transformação de translação
      T = imageTranslate(g, 0, 10);
      nome = ['./results/img_translate/covid (', num2str(i), ')_Translate_0_10.png'];
      imwrite(T, nome);
      
      % Aplicando transformação de translação
      T = imageTranslate(g, 7, 0);
      nome = ['./results/img_translate/covid (', num2str(i), ')_Translate_7_0.png'];
      imwrite(T, nome);
      
      % Aplicando transformação de reflexão
      R = imageReflection(g, 'y');
      nome = ['./results/img_reflection/covid (', num2str(i), ')_Reflection_y.png'];
      imwrite(R, nome);
  
      % Aplicando transformação de zoom
      Z = imageZoom(g, 1.1, 1.1);
      nome = ['./results/img_zoom/covid (', num2str(i), ')_Zoom_1.1.png'];
      imwrite(Z, nome);
     
      % Aplicando transformação de zoom
      Z = imageZoom(g, 1.05, 1.05);
      nome = ['./results/img_zoom/covid (', num2str(i), ')_Zoom_1.05.png'];
      imwrite(Z, nome);
      
end
