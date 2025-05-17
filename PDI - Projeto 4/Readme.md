# Processamento de Imagens: Padding

O projeto consiste em criar uma função que adiciona padding em uma imagem.

---

## 👨‍💻 Alunos

- Lukas Lujan Moreira  
- Thiago Patrick Tavares Costa  

---

## 📁 Estrutura do Projeto

  - 📁 img  
    - └── testpattern1024.tif 
  - 📁 results  
    - └── testpattern1024_replicate.tif   
    - └── testpattern1024_zeros.tif    
  - 📁 src  
    - 📄 imagePad4e.m — função que adiciona o padding seja zeros ou replicate  
  - 📄 main.m — Script principal de execução

---

## 🚀 Como Funciona

O código `main.m` realiza os seguintes passos para imagem **testpattern1024.tif** da pasta `img`:

1. **Adiciona a pasta src para carregar a função imagePad4e**

2. **Aquisição da imagem**  
   A imagem é carregada da pasta `img`.

3. **Aplica o padding de zeros por meio da definição padrão**  
   Chama a função `imagePad4e()` passando como argumentos a imagem, quantidade de linhas e quantidade de colunas a serem adicionadas.

4. **Salva e exibe a imagem**  
   - Salva a imagem com o nome `testpattern1024_zeros.tif` na pasta results;
   - Depois exibe a imagem por meio do método imshow.

5. **Aplica o padding de replicate por meio do argumento `replicate`**  
   Chama a função `imagePad4e()` passando como argumentos a imagem, a quantidade de linhas, a quantidade de colunas a serem adicionadas e o tipo de padding a ser usado.

6. **Salva e exibe a imagem**  
   - Salva a imagem com o nome `testpattern1024_replicate.tif` na pasta results;
   - Depois exibe a imagem por meio do método imshow.

---

## 📌 Requisitos

- MATLAB (versão R2022a ou compatível)
- Pasta `src/` com a função de padding
- Pasta `img/` com as imagens originais `.tif`
- Pasta `results/` criada para armazenar os resultados

---
