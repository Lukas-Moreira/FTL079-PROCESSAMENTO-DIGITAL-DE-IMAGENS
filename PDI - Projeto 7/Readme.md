# 📄 Processamento Morfológico Binário de Imagens

Este projeto tem como objetivo aplicar operações de **erosão** e **dilatação morfológica** em uma imagem binarizada, removendo objetos com dimensões menores que 13×13 pixels. O processo é ilustrado com subplots e os resultados são salvos automaticamente em disco.

---

## 👨‍🎓 Alunos

- **Lukas Lujan Moreira**  
- **Thiago Patrick Tavares Costa**

---

## 📁 Estrutura de Pastas

    ├── main.m % Script principal
    ├── src
    │ ├── mm_erode.m    % Função de erosão binária
    │ ├── mm_dilate.m   % Função de dilatação binária
    │ └── imagePad4e.m  % Função auxiliar para padding
    ├── img
    │ └── FigP0918(left) (1).tif % Imagem de entrada
    └── results
        ├── 1_original.png
        ├── 2_binarizada.png
        ├── 3_erosao.png
        └── 4_dilatacao.png

---

## ⚙️ Requisitos

- MATLAB R2022a ou superior
- A imagem de entrada deve estar na pasta `img/`
- Pasta `src/` com as funções auxiliares
- O script cria automaticamente a pasta `results/` para salvar os arquivos

---

## 🚀 Execução

Para rodar o projeto:

1. Certifique-se de que todos os arquivos `.m` e a imagem estejam no diretório correto.
2. Execute o arquivo `main.m` no MATLAB.
3. Um conjunto de 4 subplots será exibido:
   - Imagem original
   - Imagem binarizada
   - Resultado da erosão
   - Resultado da dilatação
4. Os arquivos processados serão salvos na pasta `results/`.
5. O script finaliza após pressionar `Enter`.

---

## 🧠 Explicação das Etapas

1. **Leitura da Imagem**: A imagem é carregada em tons de cinza.
2. **Binarização**: A imagem é convertida automaticamente para preto e branco com `imbinarize`.
3. **Erosão**: Aplicada com um elemento estruturante 13×13 para eliminar objetos pequenos.
4. **Dilatação**: Restaura o tamanho original dos objetos sobreviventes à erosão.
5. **Visualização**: Subplots exibem as etapas do processamento.
6. **Exportação**: Todas as imagens intermediárias são salvas.

---

## 🔧 Funções Auxiliares

- `mm_erode(A, B)`: Aplica erosão morfológica binária à imagem A com o elemento estruturante B.
- `mm_dilate(A, B)`: Aplica dilatação morfológica binária à imagem A com o elemento estruturante B.
- `imagePad4e(f, r, c, padtype)`: Aplica padding à imagem `f`, com replicação opcional de bordas.

---

## 📸 Exemplo de Saída

Após a execução, os arquivos salvos em `results/` incluem:

- `1_original.png`: Imagem em tons de cinza original.
- `2_binarizada.png`: Imagem binária.
- `3_erosao.png`: Resultado da erosão (objetos pequenos eliminados).
- `4_dilatacao.png`: Objetos maiores restaurados.