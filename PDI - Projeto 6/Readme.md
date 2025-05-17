# Processamento de Imagens: Filtros lineares e não lineares

O projeto consiste em os conceitos de transformação na imagem, para realizar o `Filtros lineares e não lineares` das imagens que são de covid.

---

## 👨‍💻 Alunos

- Lukas Lujan Moreira  
- Thiago Patrick Tavares Costa  

---

## 📁 Estrutura do Projeto

  - 📁 img  
    - └── Fig3.37(a).jpg
    - └── testpattern1024.tif
  - 📁 results  
    - └── 📁 media
        - └── Fig3.37-3x3-media.jpg
        - └── Fig3.37-11x11-media.jpg
        - └── Fig3.37-21x21-media.jpg
    - └── 📁 mediana
        - └── Fig3.37-3x3-mediana.jpg
        - └── Fig3.37-11x11-mediana.jpg
        - └── Fig3.37-21x21-mediana.jpg
  - 📁 src  
    - 📄 imagePad4e.m      — função que adiciona padding a imagem original (replicate ou zeros)
    - 📄 medianSFilter.m   — função que realiza o filtro de média na imagem
    - 📄 twodSFilter.m     — função que realiza o filtro de mediana na imagem
  - 📄 main.m — Script principal de execução

---

## 📌 Requisitos

- MATLAB (versão R2022a ou compatível)
- Pasta `src/` com as funções de transformação
- Pasta `img/` com as imagens do projeto `.tif`
- Pasta `results/` criada para armazenar os resultados

---
