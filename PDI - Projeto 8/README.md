# 📄 Segmentação por Limiarização Global (Thresholding)

Este projeto aplica uma técnica de **limiarização global iterativa** para segmentar a imagem `rice-shaded.tif`. O método divide a imagem em dois grupos de pixels com base em um limiar que é ajustado iterativamente até a convergência.

Também testamos o efeito da tolerância (`delT`) sobre o resultado da segmentação.

---

## 👨‍🎓 Alunos

- **Lukas Lujan Moreira**  
- **Thiago Patrick Tavares Costa**

---

## 📁 Estrutura de Pastas

    ├── main.m # Script principal de execução
    ├── src/
    │ └── globalThresh.m # Função de limiarização global iterativa
    ├── img/
    │ └── rice-shaded.tif # Imagem de entrada com iluminação desigual
    └── results/
    ├── global_Thresh(Default).png
    ├── global_Thresh(Default).tif
    ├── global_Thresh(0.0001).png
    └── global_Thresh(0.0001).tif
---

## ⚙️ Requisitos

- MATLAB R2022a ou superior
- A imagem `rice-shaded.tif` deve estar na pasta `img/`
- A função `globalThresh.m` deve estar dentro da pasta `src/`
- A pasta `results/` será criada automaticamente, se necessário

---

## 🚀 Execução

1. Certifique-se de que a estrutura de pastas e os arquivos estejam corretos.
2. Execute o script `main.m` no MATLAB.
3. O script irá:
   - Ler a imagem `rice-shaded.tif`
   - Aplicar a limiarização global com diferentes valores de `delT`
   - Exibir os resultados em subplots
   - Salvar os arquivos de saída em `results/`

---

## 🧠 Etapas da Segmentação

1. **Leitura da Imagem**  
   A imagem original é lida da pasta `img/` e convertida para `double`.

2. **Limiarização Global com `globalThresh`**  
   O algoritmo itera entre dois grupos de pixels (acima e abaixo do limiar atual) até que a diferença entre o novo e o antigo limiar seja menor que `delT`.

3. **Testes com diferentes valores de `delT`**  
   São avaliados casos com `Default` (`0.01`), `1e-9`, `10`, etc., para mostrar como a tolerância influencia na convergência.

4. **Salvamento dos Resultados**  
   As imagens binarizadas são salvas tanto em `.png` quanto `.tif` na pasta `results/`.

5. **Visualização com `subplot`**  
   Um painel visual mostra a imagem original e os resultados com diferentes limiares.

---

## 🔧 Função Auxiliar

- `globalThresh(f, delT)`  
  Realiza a limiarização global iterativa:
  - Normaliza a imagem para a faixa `[0, 1]`
  - Inicia o limiar como a média da imagem
  - Separa pixels em dois grupos: acima e abaixo do limiar
  - Itera até convergência (diferença < `delT`)
  - Retorna imagem binária

---

## 📸 Exemplos de Saída

Imagens geradas após execução:

- `global_Thresh(Default).png`: Segmentação com `delT = 0.01` (padrão)
- `global_Thresh(0.0001).tif`: Segmentação mais precisa com `delT = 1e-9`

---

## 🧾 Licença

Este projeto foi desenvolvido como parte da disciplina de **Processamento Digital de Imagens**, com foco em segmentação por limiarização global automática.