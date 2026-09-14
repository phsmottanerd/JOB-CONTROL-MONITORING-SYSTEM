# 🟢 JOB CONTROL & MONITORING SYSTEM

<p align="center">

<img src="https://img.shields.io/badge/COBOL-GnuCOBOL-008000?style=for-the-badge&logo=gnu&logoColor=white" alt="COBOL">

<img src="https://img.shields.io/badge/Mainframe-IBM%20Z-006699?style=for-the-badge&logo=ibm&logoColor=white" alt="IBM Z">

<img src="https://img.shields.io/badge/Status-In%20Development-00A86B?style=for-the-badge" alt="Status">

<img src="https://img.shields.io/badge/Version-1.0.0-228B22?style=for-the-badge" alt="Version">

</p>

<p align="center">

<strong>Um sistema de controle, execução e monitoramento de JOBs desenvolvido em COBOL.</strong>

</p>

---

## 🟢 Sobre o projeto

O **JOB CONTROL & MONITORING SYSTEM** é um projeto desenvolvido em **COBOL**, inicialmente utilizando **GnuCOBOL em ambiente PC**, com foco na construção de uma aplicação inspirada nos conceitos de **processamento batch, controle de JOBs, Return Codes, histórico de execução e monitoramento** presentes em ambientes corporativos e Mainframe.

O projeto foi concebido como uma etapa prática de desenvolvimento para posteriormente evoluir sua arquitetura e seus conceitos para um ambiente **IBM Z / z/OS**, aproximando a implementação das práticas utilizadas em operações de sistemas corporativos e processamento batch.

> **Objetivo principal:** construir uma base funcional de Job Control e Monitoring utilizando COBOL, desenvolvendo gradualmente conceitos que fazem parte do universo Mainframe.

---

## 🟩 Visão do sistema

```text
                 ┌──────────────────────────────┐
                 │  JOB CONTROL & MONITORING    │
                 │           SYSTEM             │
                 └──────────────┬───────────────┘
                                │
              ┌─────────────────┼─────────────────┐
              │                 │                 │
              ▼                 ▼                 ▼
        ┌───────────┐     ┌───────────┐     ┌───────────┐
        │ Cadastro  │     │ Execução  │     │ Consulta  │
        │   JOB     │     │   JOB     │     │   JOB     │
        └─────┬─────┘     └─────┬─────┘     └─────┬─────┘
              │                 │                 │
              └─────────────────┼─────────────────┘
                                ▼
                     ┌────────────────────┐
                     │   RETURN CODE      │
                     │   0 = SUCESSO      │
                     │   ≠ 0 = ERRO       │
                     └──────────┬─────────┘
                                │
                                ▼
                     ┌────────────────────┐
                     │     HISTÓRICO      │
                     │    DE EXECUÇÕES    │
                     └──────────┬─────────┘
                                │
                                ▼
                     ┌────────────────────┐
                     │    RELATÓRIOS      │
                     │   MONITORAMENTO     │
                     └────────────────────┘
```

---

## 🟢 Principais funcionalidades

| Função                 | Descrição                                |
| ---------------------- | ---------------------------------------- |
| 🆕 **Cadastro de JOB** | Criação de uma definição de JOB          |
| 🔎 **Consulta**        | Consulta individual por identificador    |
| ▶️ **Execução**        | Simulação/controlador da execução do JOB |
| 🧾 **Return Code**     | Registro do resultado da execução        |
| 📚 **Histórico**       | Armazenamento das execuções realizadas   |
| 📊 **Relatórios**      | Visualização dos JOBs cadastrados        |
| ✏️ **Alteração**       | Atualização das informações do JOB       |
| 🗑️ **Exclusão**       | Remoção de JOB cadastrado                |
| 💾 **Persistência**    | Dados armazenados em arquivos indexados  |
| 🕒 **Data/Hora**       | Registro temporal das execuções          |

---

# 🟢 Arquitetura atual

A primeira versão utiliza arquivos indexados para persistência dos dados.

```text
                    APPLICATION
                         │
                         ▼
              ┌─────────────────────┐
              │     JOBCONTROL      │
              │       COBOL         │
              └──────────┬──────────┘
                         │
             ┌───────────┴───────────┐
             │                       │
             ▼                       ▼
      ┌──────────────┐       ┌────────────────┐
      │   JOBS.DAT   │       │ HISTORICO.DAT  │
      │              │       │                │
      │ JOB-FILE     │       │ HISTORY-FILE   │
      └──────────────┘       └────────────────┘
```

### 📁 Arquivos

**`JOBS.DAT`**

Armazena os dados dos JOBs:

```text
JOB-ID
JOB-NAME
JOB-DESCRIPTION
JOB-OWNER
JOB-STATUS
JOB-RC
```

**`HISTORICO.DAT`**

Armazena o histórico das execuções:

```text
HIST-ID
HIST-JOB-ID
HIST-JOB-NAME
HIST-DATE
HIST-TIME
HIST-STATUS
HIST-RC
```

---

# 🟩 Estados de execução

O sistema trabalha inicialmente com estados básicos de processamento:

```text
┌────────────┐
│  PENDENTE  │
└──────┬─────┘
       │
       ▼
┌────────────┐
│ EXECUTANDO │
└──────┬─────┘
       │
       ├───────────────┐
       │               │
       ▼               ▼
┌────────────┐   ┌────────────┐
│  SUCESSO   │   │    ERRO    │
└────────────┘   └────────────┘
```

### Return Code

O conceito de **Return Code (RC)** é fundamental para o projeto.

```text
RC = 0000
      │
      └── Execução concluída com sucesso
```

Valores diferentes de `0000` representam uma execução que terminou com condição de erro ou outra condição que deverá ser interpretada pelo controlador.

A utilização de Return Codes prepara o projeto para conceitos mais próximos do processamento **batch/Mainframe**.

---

# 🟢 Tecnologias

<p align="center">

<img src="https://img.shields.io/badge/COBOL-Programming%20Language-008000?style=for-the-badge" alt="COBOL">

<img src="https://img.shields.io/badge/GnuCOBOL-Compiler-228B22?style=for-the-badge" alt="GnuCOBOL">

<img src="https://img.shields.io/badge/Indexed%20Files-Data%20Persistence-006400?style=for-the-badge" alt="Indexed Files">

<img src="https://img.shields.io/badge/IBM%20Z-Future%20Target-006699?style=for-the-badge&logo=ibm&logoColor=white" alt="IBM Z">

<img src="https://img.shields.io/badge/z%2FOS-Future%20Target-006699?style=for-the-badge" alt="z/OS">

</p>

---

# 🟢 Estrutura do projeto

```text
JOB-CONTROL-MONITORING-SYSTEM/
│
├── JOBCONTROL.CBL
│
├── JOBCONTROL.exe
│
├── JOBS.DAT
│
├── HISTORICO.DAT
│
├── README.md
│
└── docs/
    └── architecture/
```

> Os arquivos `.DAT` são arquivos de dados gerados durante a execução da aplicação e podem ser tratados separadamente dos arquivos-fonte no controle de versão.

---

# 🟩 Compilação

Com o **GnuCOBOL** instalado:

```bash
cobc -x -free JOBCONTROL.CBL -o JOBCONTROL.exe
```

Após a compilação:

```bash
JOBCONTROL.exe
```

---

# 🟢 Menu principal

A aplicação atualmente disponibiliza:

```text
┌───────────────────────────────────────────────┐
│       JOB CONTROL & MONITORING SYSTEM         │
├───────────────────────────────────────────────┤
│                                               │
│              MENU PRINCIPAL                   │
│                                               │
│  1 - CADASTRO DE JOB                          │
│  2 - CONSULTA DE JOB                          │
│  3 - EXECUÇÃO DE JOB                          │
│  4 - HISTÓRICO DE EXECUÇÕES                   │
│  5 - RELATÓRIOS                               │
│  6 - ALTERAR JOB                              │
│  7 - EXCLUIR JOB                              │
│                                               │
│  9 - SAIR                                     │
│                                               │
└───────────────────────────────────────────────┘
```

---

# 🟢 Fluxo de uma execução

```text
                 INÍCIO
                    │
                    ▼
              IDENTIFICAR JOB
                    │
                    ▼
              VALIDAR JOB
                    │
                    ▼
              EXECUTAR JOB
                    │
                    ▼
              OBTER RETURN CODE
                    │
             ┌──────┴──────┐
             │             │
           RC = 0        RC ≠ 0
             │             │
             ▼             ▼
          SUCESSO         ERRO
             │             │
             └──────┬──────┘
                    ▼
            REGISTRAR HISTÓRICO
                    │
                    ▼
              DISPONIBILIZAR
                RELATÓRIO
                    │
                    ▼
                   FIM
```

---

# 🟩 Conceitos COBOL utilizados

Este projeto utiliza conceitos importantes da linguagem COBOL:

* `IDENTIFICATION DIVISION`
* `ENVIRONMENT DIVISION`
* `DATA DIVISION`
* `FILE SECTION`
* `WORKING-STORAGE SECTION`
* `PROCEDURE DIVISION`
* `FILE-CONTROL`
* `ORGANIZATION IS INDEXED`
* `ACCESS MODE IS DYNAMIC`
* `RECORD KEY`
* `READ`
* `WRITE`
* `REWRITE`
* `DELETE`
* `START`
* `READ NEXT RECORD`
* `PERFORM`
* `EVALUATE`
* `IF / ELSE`
* `FUNCTION CURRENT-DATE`
* `FILE STATUS`

---

# 🟢 Roadmap

O projeto será desenvolvido de forma incremental.

### ✅ Fase 1 — Base funcional

* [x] Estrutura principal COBOL
* [x] Menu de operações
* [x] Cadastro de JOB
* [x] Consulta
* [x] Alteração
* [x] Exclusão
* [x] Execução simulada
* [x] Return Code
* [x] Histórico
* [x] Relatórios
* [x] Persistência em arquivos indexados

### 🔄 Fase 2 — Job Control

* [ ] Definição de etapas do JOB
* [ ] JOB com múltiplos STEPs
* [ ] Controle individual de STEP
* [ ] Return Code por STEP
* [ ] Dependências entre etapas
* [ ] Controle de sequência
* [ ] Tratamento de falhas

### 🔄 Fase 3 — Monitoring

* [ ] Monitoramento de JOB em execução
* [ ] Histórico detalhado
* [ ] Data/hora de início
* [ ] Data/hora de término
* [ ] Tempo de execução
* [ ] Mensagens de execução
* [ ] Registro de falhas
* [ ] Relatórios mais avançados

### 🔄 Fase 4 — Conceitos Mainframe

* [ ] Modelagem inspirada em processamento batch
* [ ] Conceitos de JCL
* [ ] JOB / EXEC / DD
* [ ] Return Codes
* [ ] Condições de execução
* [ ] Dataset concepts
* [ ] Adaptação para ambiente IBM Z
* [ ] Testes no TK5 / MVS

### 🚀 Fase futura

```text
GnuCOBOL / PC
       │
       ▼
JOB CONTROL & MONITORING SYSTEM
       │
       ▼
COBOL + conceitos de Batch
       │
       ▼
JCL
       │
       ▼
MVS / zOS
       │
       ▼
IBM Z
```

---

# 🟢 Objetivo técnico

O objetivo deste projeto não é simplesmente criar um sistema de cadastro.

A proposta é utilizar o desenvolvimento em COBOL para construir, de forma progressiva, uma aplicação orientada aos conceitos de **Job Control, processamento batch, execução, Return Codes, histórico e monitoramento**.

A versão para PC funciona como laboratório de desenvolvimento e validação da lógica.

Posteriormente, os conceitos serão estudados e adaptados para um ambiente **Mainframe**, aproximando a implementação de tecnologias e práticas encontradas no ecossistema **IBM Z / z/OS**.

---

# 🟩 Por que COBOL?

COBOL continua sendo uma tecnologia extremamente relevante em ambientes corporativos que dependem de processamento de grandes volumes de dados, sistemas transacionais e aplicações críticas.

Este projeto utiliza COBOL como ferramenta prática para estudar:

```text
COBOL
  │
  ├── Processamento de arquivos
  ├── Processamento batch
  ├── Controle de execução
  ├── Return Codes
  ├── Persistência
  ├── Histórico
  ├── Monitoramento
  └── Conceitos Mainframe
```

---

# 🟢 Ambiente de desenvolvimento

**Plataforma atual**

```text
Sistema Operacional : Windows
Linguagem           : COBOL
Compilador          : GnuCOBOL
Persistência        : Indexed Files
Formato             : Free Format COBOL
```

**Plataforma futura**

```text
Mainframe
   │
   ├── IBM Z
   ├── z/OS
   ├── COBOL
   ├── JCL
   ├── Batch Processing
   └── Job Control
```

---

# 🟩 Autor

## Paulo Henrique Santana Motta

Projeto desenvolvido como parte de uma trilha prática de estudos e desenvolvimento voltada ao ecossistema **COBOL, Mainframe, IBM Z e z/OS**.

```text
JOB CONTROL & MONITORING SYSTEM

COBOL
   +
Job Control
   +
Batch Processing
   +
Monitoring
   +
Mainframe
```

---

# 🟢 Status

<p align="center">

<img src="https://img.shields.io/badge/PROJECT-IN%20DEVELOPMENT-008000?style=for-the-badge" alt="Project status">

<img src="https://img.shields.io/badge/COBOL-ACTIVE-228B22?style=for-the-badge" alt="COBOL">

<img src="https://img.shields.io/badge/MAINFRAME-ROADMAP-006699?style=for-the-badge" alt="Mainframe">

</p>

---

<p align="center">

<strong>🟢 JOB CONTROL & MONITORING SYSTEM</strong>

<br>

<em>From COBOL development to Mainframe Job Control.</em>

<br><br>

<strong>Paulo Henrique Santana Motta</strong>

</p>
```

### Uma observação importante sobre os títulos animados

Eu **não coloquei uma falsa animação CSS** no README, porque o GitHub normalmente sanitiza esse tipo de código. Para fazer aquele efeito de **“aparece → some → aparece”** de verdade, o caminho profissional é colocar uma **imagem/GIF ou SVG animado gerado especificamente para o projeto** no topo do README.

E aí dá para fazer algo muito mais bonito: **“JOB CONTROL & MONITORING SYSTEM” aparecendo em verde de terminal/Mainframe, com efeito de digitação, cursor piscando e estética IBM Z/COBOL**. Isso ficaria muito mais forte no GitHub. 🟢💻
