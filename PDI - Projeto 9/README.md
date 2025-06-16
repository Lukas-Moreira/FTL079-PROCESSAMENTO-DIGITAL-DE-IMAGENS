# 📄 Projeto 9 - Processamento Digital de Imagens (PDI) com Fourier

Este projeto tem como objetivo aplicar filtros no domínio da frequência utilizando a **Transformada de Fourier**, abordando diferentes técnicas de filtragem para realce e rejeição de componentes de frequência em imagens.

---

## 👨‍🎓 Alunos

- **Lukas Lujan Moreira**  
- **Thiago Patrick Tavares Costa**

---

## 📁 Estrutura de Pastas

    ├── main.m                 % Script principal com todas as etapas
    ├── README.md              % Este arquivo de documentação
    ├── img/
    │   ├── woman.tif          % Imagem utilizada na Parte (a)
    │   └── chestXray.tif      % Imagem utilizada na Parte (b) e (c)
    ├── src/
    │   ├── filters/           % Filtros HPF, LPF, High Emphasis e Band Reject
    │   ├── fftutils/          % Utilitários para DFT (dftfilt, dftuv, etc.)
    │   └── utils/             % Funções auxiliares (tofloat, paddedsize, etc.)
    └── results/
        ├── parte_a/
        │   ├── imagem_original.png
        │   ├── espectro_log_original.png
        │   ├── filtro_hpf_2d.png
        │   ├── filtro_hpf_3d.png
        │   ├── imagem_hpf.png
        │   ├── filtro_lpf_2d.png
        │   ├── filtro_lpf_3d.png
        │   └── imagem_lpf.png
        ├── parte_b_c/
        │   ├── imagem_original.png
        │   ├── espectro_log_original.png
        │   ├── imagem_high_emphasis.png
        │   ├── imagem_equalizada.png
        │   └── espectro_pos_high_emphasis.png
        └── parte_d/
            ├── filtro_br_2d.png
            └── filtro_br_3d.png

---

## ⚙️ Requisitos

- MATLAB R2022a ou superior
- A pasta `img/` deve conter as imagens `woman.tif` e `chestXray.tif`
- A pasta `src/` deve conter os filtros e utilitários implementados
- O script cria automaticamente a pasta `results/` com subpastas para cada parte

---

## 🚀 Execução

1. Certifique-se de que todas as pastas e arquivos estão corretamente organizados.
2. Execute o script `main.m` no MATLAB.
3. O código:
   - Processa cada imagem conforme as etapas do projeto
   - Exibe as imagens e espectros em janelas separadas
   - Salva todos os resultados na pasta `results/`
4. O script pausa entre as partes com `pause`. Pressione `Enter` para continuar.

---

## 🧠 Etapas do Projeto

### Parte (a) – Filtros Butterworth
- Aplica filtros **passa-baixa** e **passa-alta** de Butterworth.
- Visualiza espectro, filtros 2D/3D e imagens filtradas.

### Parte (b) e (c) – High Emphasis + Equalização
- Aplica o filtro de alta ênfase (`High Emphasis`) com realce de alta frequência.
- Realiza **equalização de histograma** para realçar o contraste.
- Compara espectros antes e depois da filtragem.

### Parte (d) – Filtro Band-Reject
- Implementa um **filtro de rejeição de banda** nos tipos `ideal`, `btw` e `gaussian`.
- Visualiza o filtro em 2D e 3D.

---

## 🔧 Funções Auxiliares

- `hpfilter(type, M, N, D0, n)`: Filtro passa-alta (ideal, Butterworth ou Gaussiano)
- `lpfilter(type, M, N, D0, n)`: Filtro passa-baixa
- `highEnphasisFilter(a, b, type, show, M, N, D0, n)`: Filtro de alta ênfase
- `brFilter(type, M, N, D0, W, n)`: Filtro de rejeição de banda
- `dftfilt(f, H)`: Aplicação da filtragem no domínio da frequência
- `dftuv(M, N)`: Geração de coordenadas de frequência (u,v)
- `tofloat(f)`: Conversão da imagem para ponto flutuante
- `paddedsize(size)`: Cálculo do padding ideal para FFT

---

## 📸 Exemplo de Saída

Após a execução do `main.m`, os seguintes arquivos são salvos em `results/`:

- `imagem_original.png`: imagem de entrada
- `espectro_log_original.png`: espectro da imagem em log
- `filtro_*.png`: máscaras dos filtros usados (2D/3D)
- `imagem_*.png`: imagens processadas com cada filtro
- `imagem_equalizada.png`: imagem final após realce + equalização

---

## 🧾 Licença

Este projeto é acadêmico e foi desenvolvido como parte da disciplina de **Processamento Digital de Imagens**.

