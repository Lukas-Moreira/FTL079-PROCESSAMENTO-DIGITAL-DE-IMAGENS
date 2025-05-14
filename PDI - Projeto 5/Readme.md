# Processamento de Imagens: Equalização de Histograma

O projeto consiste em os conceitos de transformação na imagem, para realizar o `data aumentation` das imagens que são de covid.

---

## 👨‍💻 Alunos

- Lukas Lujan Moreira  
- Thiago Patrick Tavares Costa  

---

## 📁 Estrutura do Projeto

  - 📁 img  
    - └── 📁 covid
    - └── girl.tif
  - 📁 results  
    - └── 📁 img_reflection
        - └── Covid (1)_Reflection_y.png
        - ...
        - └── Covid (50)_Reflection_y.png
    - └── 📁 img_resize
        - └── Covid (1)_resize.png
        - ...
        - └── Covid (50)_resize.png
    - └── 📁 img_translate
        - └── Covid (1)_Translate_0_10.png
        - ...
        - └── Covid (50)_Translate_7_0.png
    - └── 📁 img_zoom
        - └── Covid (1)_Zoom_1.05.png
        - ...
        - └── Covid (50)_Zoom_1.1.png
    - └── girl_resize.tif
  - 📁 src  
    - 📄 bilinearInterp.m  — função que realiza a interpolação bilinear
    - 📄 imageReflection.m — função que realiza a reflexão na imagem
    - 📄 imageResize.m     — função que realiza o redimensionamento na imagem
    - 📄 imageScaling.m    — função que modifica a escala da imagem
    - 📄 imageTranslate.m  — função que move a imagem
    - 📄 imageZoom.m       — função que aplica o zoom na imagem
  - 📄 main.m — Script principal de execução

---

## 📌 Requisitos

- MATLAB (versão R2022a ou compatível)
- Pasta `src/` com as funções de transformação
- Pasta `img/` com as imagens do projeto `.tif`
- Pasta `results/` criada para armazenar os resultados

---
