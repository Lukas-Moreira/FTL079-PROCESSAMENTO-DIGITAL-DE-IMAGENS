# Processamento de Imagens: Equalização de Histograma

Este projeto foi desenvolvido como parte de um exercício prático da disciplina de processamento digital de imagens. O objetivo é aplicar a **equalização de histograma** para melhorar o contraste de imagens em tons de cinza.

---

## 👨‍💻 Alunos

- Lukas Lujan Moreira  
- Thiago Patrick Tavares Costa  

---

## 📁 Estrutura do Projeto

  - 📁 img  
    - └── rose1024.tif  
    - └── hidden-horse.tif  
    - └── spillway-dark.tif  
  - 📁 results  
    - └── rose1024-equalizado.tif  
    - └── hidden-horse-equalizado.tif  
    - └── spillway-dark-equalizado.tif  
  - 📁 code  
    - 📄 main.m — Script principal de execução  
    - 📄 imagehist4e.m — Geração de histograma e aplicação da equalização  
    - 📄 histEqual4e.m — Equalização da distribuição acumulada (CDF)

---

## 🚀 Como Funciona

O código `main.m` realiza os seguintes passos para **cada imagem** da pasta `img`:

1. **Aquisição da imagem**  
   As imagens são carregadas da pasta `img` e processadas tanto sem quanto com equalização.

2. **Cálculo do histograma**  
   A função `imagehist4e()` calcula o histograma da imagem e normaliza os valores.

3. **Equalização (opcional)**  
   Quando o modo `'n'` é passado como argumento, a função `histEqual4e()` é chamada para aplicar a equalização com base na função de distribuição acumulada.

4. **Visualização e salvamento**  
   As imagens resultantes (sem e com equalização) e seus respectivos histogramas são exibidos em janelas separadas e, no caso das imagens equalizadas, salvos na pasta `results`.

---

## 📌 Requisitos

- MATLAB (versão R2022a ou compatível)
- Pasta `img/` com as imagens originais `.tif`
- Pasta `results/` criada para armazenar os resultados

---

## 📝 Pontos a se destacar

- A função `histEqual4e.m` produz uma curva sempre crescente, expandindo os níveis de cinza — semelhante a uma operação de **re-scaling** apresentada em aula.
- A função `imagehist4e.m` suporta dois modos:
  - `'u'`: apenas cálculo do histograma, sem equalização
  - `'n'`: aplica a equalização
- O histograma equalizado possui distribuição mais uniforme, o que melhora o contraste da imagem final.

---
