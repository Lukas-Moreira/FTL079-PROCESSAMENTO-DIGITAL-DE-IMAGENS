# Processamento de Imagens: Redução de Intensidade

Este projeto foi desenvolvido como parte de um exercício prático de processamento digital de imagens. A proposta é reduzir iterativamente a intensidade dos níveis de cinza da imagem `drip-bottle-256.tif`.

---

## 👨‍💻 Alunos

- Lukas Lujan Moreira  
- Thiago Patrick Tavares Costa  

---

## 📁 Estrutura do Projeto
  - 📁 img
    - └── drip-bottle-256.tif # Imagem original 
  - 📁 results
    - └── drip-bottle-128.tif # Saídas geradas durante o processamento
    - └── drip-bottle-64.tif
    - └── ... 
  - 📁 code
    - 📄 main.m # Código principal
---

## 🚀 Como Funciona

O código `main.m` realiza os seguintes passos:

1. **Aquisição da imagem**  
   Carrega a imagem `drip-bottle-256.tif` localizada na pasta `img`.
   Salva uma cópia da imagem na variável `S` para preservar a original.

2. **Processamento iterativo**  
   Realizamos a cada potência de 2, ou seja, de 128 até 2:
   - Uma divisão por 2 para reduzir os níveis de cinza de cada elemento da matriz da imagem.
   - Exibimos então a nova imagem com a intensidade reduzida.
   - E salvamos a imagem processada na pasta `results` com o seu respectivo nome.

---

## 📌 Requisitos

- MATLAB (versão R2022a)
- Pasta `img/` contendo `drip-bottle-256.tif`
- Pasta `results/` para salvar as imagens de saída

---

## 📝 Pontos a se destacar

- A operação `./ 2` realiza a divisão em todos os elementos da matriz.
- O `imshow(S - 1, [])` exibe a imagem com brilho reduzido.
- O `saveas(gcf, ...)` salva a imagem com a nova intensidade na pasta results.

---
