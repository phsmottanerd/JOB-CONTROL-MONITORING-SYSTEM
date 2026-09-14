<div align="center">

<img src="https://readme-typing-svg.demolab.com?font=Fira+Code&weight=700&size=28&pause=1000&color=00FF41&center=true&vCenter=true&width=850&lines=PAULO+HENRIQUE+SANTANA+MOTTA" alt="Paulo Henrique Santana Motta">

<img src="https://readme-typing-svg.demolab.com?font=Fira+Code&weight=700&size=40&pause=1000&color=00FF41&center=true&vCenter=true&width=1000&lines=JOB+CONTROL+%26+MONITORING+SYSTEM" alt="JOB CONTROL & MONITORING SYSTEM">

<img src="https://readme-typing-svg.demolab.com?font=Fira+Code&weight=700&size=22&pause=1000&color=00FF41&center=true&vCenter=true&width=950&lines=COBOL+%7C+GNUCOBOL+%7C+MAINFRAME+%7C+JOB+CONTROL+%7C+BATCH+PROCESSING" alt="COBOL | GnuCOBOL | Mainframe | Job Control | Batch Processing">

<br>

<img src="https://img.shields.io/badge/COBOL-GnuCOBOL-00FF41?style=for-the-badge" alt="COBOL GnuCOBOL">
<img src="https://img.shields.io/badge/MAINFRAME-IBM%20Z-00FF41?style=for-the-badge" alt="IBM Z">
<img src="https://img.shields.io/badge/JOB%20CONTROL-BATCH-00FF41?style=for-the-badge" alt="Job Control">
<img src="https://img.shields.io/badge/STATUS-IN%20DEVELOPMENT-00FF41?style=for-the-badge" alt="Status">
<img src="https://img.shields.io/badge/VERSION-1.0.0-00FF41?style=for-the-badge" alt="Version">

</div>

<br>

<div align="center">

<img src="https://readme-typing-svg.demolab.com?font=Fira+Code&weight=700&size=25&pause=1000&color=00FF41&center=true&vCenter=true&width=700&lines=DESTAQUES+PARA+RECRUTADORES" alt="Destaques para recrutadores">

</div>

<div style="color:#00FF41">

### 🟢 Projeto desenvolvido com foco em

* **COBOL e GnuCOBOL**
* **Processamento Batch**
* **Controle e execução de JOBs**
* **Return Codes (RC)**
* **Histórico de execuções**
* **Monitoramento**
* **Arquivos indexados**
* **Conceitos de Job Control**
* **Evolução futura para IBM Z / z/OS**

</div>

---

<div align="center">

<img src="https://readme-typing-svg.demolab.com?font=Fira+Code&weight=700&size=27&pause=1000&color=00FF41&center=true&vCenter=true&width=600&lines=SOBRE+O+PROJETO" alt="Sobre o projeto">

</div>

<div style="color:#00FF41">

O <strong>JOB CONTROL & MONITORING SYSTEM</strong> é um projeto desenvolvido em <strong>COBOL</strong>, utilizando inicialmente <strong>GnuCOBOL em ambiente PC</strong>, com o objetivo de construir uma aplicação baseada em conceitos de <strong>controle de JOBs, processamento batch, execução, Return Codes, histórico e monitoramento</strong>.

O projeto foi concebido como um laboratório prático para desenvolver conceitos relacionados ao universo <strong>Mainframe</strong>, criando uma base funcional que posteriormente poderá evoluir para uma implementação mais próxima das práticas utilizadas em ambientes <strong>IBM Z / z/OS</strong>.

A proposta vai além de um simples cadastro de dados.

O sistema trabalha com o conceito de <strong>JOB</strong>, seu estado de execução, resultado através de <strong>Return Code</strong>, armazenamento do histórico e geração de informações para acompanhamento das execuções.

<strong>Objetivo:</strong> construir progressivamente uma solução de Job Control e Monitoring utilizando COBOL e conceitos relacionados ao processamento corporativo e Mainframe.

</div>

---

<div align="center">

<img src="https://readme-typing-svg.demolab.com?font=Fira+Code&weight=700&size=27&pause=1000&color=00FF41&center=true&vCenter=true&width=600&lines=VIS%C3%83O+DO+SISTEMA" alt="Visão do sistema">

</div>

<div style="color:#00FF41">

```text
                    ┌────────────────────────────────┐
                    │  JOB CONTROL & MONITORING       │
                    │             SYSTEM              │
                    └───────────────┬────────────────┘
                                    │
              ┌─────────────────────┼─────────────────────┐
              │                     │                     │
              ▼                     ▼                     ▼
       ┌─────────────┐       ┌─────────────┐       ┌─────────────┐
       │  CADASTRO   │       │  EXECUÇÃO   │       │  CONSULTA   │
       │    JOB      │       │    JOB      │       │    JOB      │
       └──────┬──────┘       └──────┬──────┘       └──────┬──────┘
              │                     │                     │
              └─────────────────────┼─────────────────────┘
                                    ▼
                         ┌────────────────────┐
                         │    RETURN CODE     │
                         │                    │
                         │   RC = 0000        │
                         │   SUCESSO          │
                         │                    │
                         │   RC ≠ 0000        │
                         │   ERRO             │
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
                         │     RELATÓRIOS     │
                         │   MONITORAMENTO    │
                         └────────────────────┘
```

</div>

---

<div align="center">

<img src="https://readme-typing-svg.demolab.com?font=Fira+Code&weight=700&size=27&pause=1000&color=00FF41&center=true&vCenter=true&width=650&lines=FUNCIONALIDADES" alt="Funcionalidades">

</div>

<div style="color:#00FF41">

| Função                 | Descrição                                    |
| ---------------------- | -------------------------------------------- |
| 🆕 **Cadastro de JOB** | Criação de uma definição de JOB              |
| 🔎 **Consulta de JOB** | Consulta individual através do identificador |
| ▶️ **Execução**        | Controle da execução do JOB                  |
| 🧾 **Return Code**     | Registro do resultado da execução            |
| 📚 **Histórico**       | Armazenamento das execuções realizadas       |
| 📊 **Relatórios**      | Visualização dos JOBs e seus resultados      |
| ✏️ **Alteração**       | Atualização das informações do JOB           |
| 🗑️ **Exclusão**       | Remoção de JOB cadastrado                    |
| 💾 **Persistência**    | Armazenamento através de arquivos indexados  |
| 🕒 **Data e Hora**     | Registro temporal das execuções              |

</div>

---

<div align="center">

<img src="https://readme-typing-svg.demolab.com?font=Fira+Code&weight=700&size=27&pause=1000&color=00FF41&center=true&vCenter=true&width=700&lines=ARQUITETURA+ATUAL" alt="Arquitetura atual">

</div>

<div style="color:#00FF41">

A primeira versão utiliza arquivos indexados para persistência dos dados.

```text
                       JOBCONTROL.CBL
                              │
                              │
                 ┌────────────┴────────────┐
                 │                         │
                 ▼                         ▼
          ┌──────────────┐          ┌────────────────┐
          │   JOBS.DAT   │          │ HISTORICO.DAT  │
          │              │          │                │
          │  JOB-FILE    │          │ HISTORY-FILE   │
          └──────────────┘          └────────────────┘
```

### `JOBS.DAT`

Armazena as informações dos JOBs cadastrados.

```text
JOB-ID
JOB-NAME
JOB-DESCRIPTION
JOB-OWNER
JOB-STATUS
JOB-RC
```

### `HISTORICO.DAT`

Armazena as informações das execuções realizadas.

```text
HIST-ID
HIST-JOB-ID
HIST-JOB-NAME
HIST-DATE
HIST-TIME
HIST-STATUS
HIST-RC
```

</div>

---

<div align="center">

<img src="https://readme-typing-svg.demolab.com?font=Fira+Code&weight=700&size=27&pause=1000&color=00FF41&center=true&vCenter=true&width=650&lines=ESTADOS+DE+EXECU%C3%87%C3%83O" alt="Estados de execução">

</div>

<div style="color:#00FF41">

```text
                    ┌──────────────┐
                    │   PENDENTE   │
                    └──────┬───────┘
                           │
                           ▼
                    ┌──────────────┐
                    │  EXECUTANDO  │
                    └──────┬───────┘
                           │
                    ┌──────┴──────┐
                    │             │
                    ▼             ▼
             ┌────────────┐ ┌────────────┐
             │  SUCESSO   │ │    ERRO    │
             └────────────┘ └────────────┘
```

</div>

---

<div align="center">

<img src="https://readme-typing-svg.demolab.com?font=Fira+Code&weight=700&size=27&pause=1000&color=00FF41&center=true&vCenter=true&width=600&lines=RETURN+CODE+%7C+RC" alt="Return Code">

</div>

<div style="color:#00FF41">

O <strong>Return Code (RC)</strong> representa o resultado da execução de um JOB.

```text
                 RETURN CODE
                      │
          ┌───────────┴───────────┐
          │                       │
        RC = 0000              RC ≠ 0000
          │                       │
          ▼                       ▼
       SUCESSO                    ERRO
```

O valor `0000` representa uma execução concluída com sucesso.

Valores diferentes de `0000` representam uma condição diferente de sucesso, permitindo que o controlador registre e posteriormente interprete o resultado da execução.

O conceito de Return Code prepara o projeto para conceitos associados ao <strong>processamento Batch e Job Control</strong>.

</div>

---

<div align="center">

<img src="https://readme-typing-svg.demolab.com?font=Fira+Code&weight=700&size=27&pause=1000&color=00FF41&center=true&vCenter=true&width=700&lines=FLUXO+DE+EXECU%C3%87%C3%83O" alt="Fluxo de execução">

</div>

<div style="color:#00FF41">

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
                      RELATÓRIO
                           │
                           ▼
                          FIM
```

</div>

---

<div align="center">

<img src="https://readme-typing-svg.demolab.com?font=Fira+Code&weight=700&size=27&pause=1000&color=00FF41&center=true&vCenter=true&width=650&lines=TECNOLOGIAS+UTILIZADAS" alt="Tecnologias utilizadas">

<br><br>

<img src="https://img.shields.io/badge/COBOL-00FF41?style=for-the-badge" alt="COBOL">
<img src="https://img.shields.io/badge/GnuCOBOL-00FF41?style=for-the-badge" alt="GnuCOBOL">
<img src="https://img.shields.io/badge/Indexed%20Files-00FF41?style=for-the-badge" alt="Indexed Files">
<img src="https://img.shields.io/badge/Batch%20Processing-00FF41?style=for-the-badge" alt="Batch Processing">
<img src="https://img.shields.io/badge/IBM%20Z-00FF41?style=for-the-badge" alt="IBM Z">
<img src="https://img.shields.io/badge/z%2FOS-00FF41?style=for-the-badge" alt="z/OS">

</div>

---

<div align="center">

<img src="https://readme-typing-svg.demolab.com?font=Fira+Code&weight=700&size=27&pause=1000&color=00FF41&center=true&vCenter=true&width=650&lines=ESTRUTURA+DO+PROJETO" alt="Estrutura do projeto">

</div>

<div style="color:#00FF41">

```text
JOB-CONTROL-MONITORING-SYSTEM/
│
├── JOBCONTROL.CBL
├── JOBS.DAT
├── HISTORICO.DAT
├── README.md
│
└── docs/
    └── architecture/
```

Os arquivos `.DAT` são gerados durante a execução da aplicação e representam os dados persistidos pelo sistema.

</div>

---

<div align="center">

<img src="https://readme-typing-svg.demolab.com?font=Fira+Code&weight=700&size=27&pause=1000&color=00FF41&center=true&vCenter=true&width=650&lines=COMPILA%C3%87%C3%83O+E+EXECU%C3%87%C3%83O" alt="Compilação e execução">

</div>

<div style="color:#00FF41">

### Compilação

```bash
cobc -x -free JOBCONTROL.CBL -o JOBCONTROL.exe
```

### Execução

```bash
JOBCONTROL.exe
```

</div>

---

<div align="center">

<img src="https://readme-typing-svg.demolab.com?font=Fira+Code&weight=700&size=27&pause=1000&color=00FF41&center=true&vCenter=true&width=550&lines=MENU+PRINCIPAL" alt="Menu principal">

</div>

<div style="color:#00FF41">

```text
┌───────────────────────────────────────────────┐
│       JOB CONTROL & MONITORING SYSTEM         │
├───────────────────────────────────────────────┤
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

</div>

---

<div align="center">

<img src="https://readme-typing-svg.demolab.com?font=Fira+Code&weight=700&size=27&pause=1000&color=00FF41&center=true&vCenter=true&width=600&lines=CONCEITOS+COBOL" alt="Conceitos COBOL">

</div>

<div style="color:#00FF41">

O projeto utiliza conceitos importantes da linguagem COBOL:

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

</div>

---

<div align="center">

<img src="https://readme-typing-svg.demolab.com?font=Fira+Code&weight=700&size=27&pause=1000&color=00FF41&center=true&vCenter=true&width=500&lines=ROADMAP" alt="Roadmap">

</div>

<div style="color:#00FF41">

### 🟢 Fase 1 — Base funcional

* [x] Estrutura principal COBOL
* [x] Menu de operações
* [x] Cadastro de JOB
* [x] Consulta
* [x] Alteração
* [x] Exclusão
* [x] Execução
* [x] Return Code
* [x] Histórico
* [x] Relatórios
* [x] Persistência em arquivos indexados

### 🟢 Fase 2 — Job Control

* [ ] Definição de STEPs
* [ ] JOB com múltiplos STEPs
* [ ] Controle individual de STEP
* [ ] Return Code por STEP
* [ ] Dependências entre etapas
* [ ] Controle de sequência
* [ ] Tratamento de falhas

### 🟢 Fase 3 — Monitoring

* [ ] Monitoramento de JOBs
* [ ] Histórico detalhado
* [ ] Data/hora de início
* [ ] Data/hora de término
* [ ] Tempo de execução
* [ ] Mensagens de execução
* [ ] Registro de falhas
* [ ] Relatórios avançados

### 🟢 Fase 4 — Mainframe

* [ ] Conceitos de processamento Batch
* [ ] JCL
* [ ] JOB / EXEC / DD
* [ ] Return Codes
* [ ] Condições de execução
* [ ] Dataset concepts
* [ ] Adaptação para IBM Z
* [ ] Testes no TK5 / MVS

</div>

---

<div align="center">

<img src="https://readme-typing-svg.demolab.com?font=Fira+Code&weight=700&size=27&pause=1000&color=00FF41&center=true&vCenter=true&width=750&lines=EVOLU%C3%87%C3%83O+PARA+IBM+Z+%2F+z%2FOS" alt="Evolução para IBM Z">

</div>

<div style="color:#00FF41">

```text
                 GNUCOBOL / PC
                       │
                       ▼
          JOB CONTROL & MONITORING
                       │
                       ▼
                COBOL + BATCH
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

A evolução planejada do projeto parte do desenvolvimento em GnuCOBOL no PC e avança para conceitos de <strong>COBOL Mainframe, JCL, MVS e IBM Z / z/OS</strong>.

</div>

---

<div align="center">

<img src="https://readme-typing-svg.demolab.com?font=Fira+Code&weight=700&size=27&pause=1000&color=00FF41&center=true&vCenter=true&width=650&lines=OBJETIVO+T%C3%89CNICO" alt="Objetivo técnico">

</div>

<div style="color:#00FF41">

O objetivo do projeto é desenvolver uma aplicação prática em COBOL orientada a:

```text
COBOL
   │
   ├── JOB CONTROL
   ├── BATCH PROCESSING
   ├── EXECUÇÃO DE JOBs
   ├── RETURN CODES
   ├── HISTÓRICO
   ├── MONITORAMENTO
   ├── JCL
   └── MAINFRAME
```

A primeira implementação em GnuCOBOL funciona como laboratório de desenvolvimento e validação da lógica.

A evolução planejada aproxima progressivamente o projeto dos conceitos encontrados no ecossistema <strong>IBM Z / z/OS</strong>.

</div>

---

<div align="center">

<img src="https://readme-typing-svg.demolab.com?font=Fira+Code&weight=700&size=27&pause=1000&color=00FF41&center=true&vCenter=true&width=700&lines=AMBIENTE+DE+DESENVOLVIMENTO" alt="Ambiente de desenvolvimento">

</div>

<div style="color:#00FF41">

```text
PLATAFORMA ATUAL
────────────────────────────────────

Sistema Operacional : Windows
Linguagem           : COBOL
Compilador          : GnuCOBOL
Persistência        : Indexed Files
Formato             : Free Format COBOL


PLATAFORMA FUTURA
────────────────────────────────────

Mainframe
IBM Z
z/OS
COBOL
JCL
Batch Processing
Job Control
```

</div>

---

<div align="center">

<img src="https://readme-typing-svg.demolab.com?font=Fira+Code&weight=700&size=27&pause=1000&color=00FF41&center=true&vCenter=true&width=500&lines=STATUS+DO+PROJETO" alt="Status do projeto">

<br><br>

<img src="https://img.shields.io/badge/PROJECT-IN%20DEVELOPMENT-00FF41?style=for-the-badge" alt="Project in development">
<img src="https://img.shields.io/badge/COBOL-ACTIVE-00FF41?style=for-the-badge" alt="COBOL active">
<img src="https://img.shields.io/badge/JOB%20CONTROL-ACTIVE-00FF41?style=for-the-badge" alt="Job Control active">
<img src="https://img.shields.io/badge/MAINFRAME-ROADMAP-00FF41?style=for-the-badge" alt="Mainframe roadmap">

</div>

---

<div align="center">

<img src="https://readme-typing-svg.demolab.com?font=Fira+Code&weight=700&size=27&pause=1000&color=00FF41&center=true&vCenter=true&width=500&lines=AUTOR" alt="Autor">

<br><br>

<img src="https://readme-typing-svg.demolab.com?font=Fira+Code&weight=700&size=25&pause=1000&color=00FF41&center=true&vCenter=true&width=750&lines=PAULO+HENRIQUE+SANTANA+MOTTA" alt="Paulo Henrique Santana Motta">

<br><br>

<span style="color:#00FF41">

<strong>COBOL • MAINFRAME • IBM Z • z/OS • JOB CONTROL</strong>

<br><br>

Projeto desenvolvido como parte de uma trilha prática de desenvolvimento voltada ao ecossistema COBOL e Mainframe.

</span>

<br><br>

<img src="https://img.shields.io/badge/COBOL-MAINFRAME-00FF41?style=for-the-badge" alt="COBOL Mainframe">
<img src="https://img.shields.io/badge/IBM%20Z-ROADMAP-00FF41?style=for-the-badge" alt="IBM Z Roadmap">
<img src="https://img.shields.io/badge/JOB%20CONTROL-BATCH-00FF41?style=for-the-badge" alt="Job Control Batch">

<br><br>

<img src="https://readme-typing-svg.demolab.com?font=Fira+Code&weight=700&size=20&pause=1500&color=00FF41&center=true&vCenter=true&width=800&lines=FROM+COBOL+DEVELOPMENT+TO+MAINFRAME+JOB+CONTROL" alt="From COBOL development to Mainframe Job Control">

</div>





<img width="1427" height="833" alt="OPNE 1" src="https://github.com/user-attachments/assets/90ef64c3-3fa1-44d0-986d-505dd2537b49" />

<img width="1433" height="844" alt="OPEN 30" src="https://github.com/user-attachments/assets/968caeba-d835-4634-87d0-a2cde7dcd924" />
<img width="1446" height="860" alt="OPEN 24" src="https://github.com/user-attachments/assets/ffea9d9d-37b2-4f74-a7d3-c39a73c91dde" />
<img width="1433" height="849" alt="OPEN 22" src="https://github.com/user-attachments/assets/d1a33be9-9353-44e3-bf54-c1f6bbfee7da" />
<img width="1440" height="846" alt="OPEN 20" src="https://github.com/user-attachments/assets/01b2a9af-2014-41df-831e-7d9266f28d90" />
<img width="1440" height="846" alt="OPEN 20" src="https://github.com/user-attachments/assets/46f88f8f-16e6-4c3c-a65f-a4ae02dd9729" />
<img width="1412" height="858" alt="OPNE 11" src="https://github.com/user-attachments/assets/08e1d7da-a47f-4153-9e9b-77aec897d33c" />
<img width="1430" height="851" alt="OPEN 10" src="https://github.com/user-attachments/assets/deb3b625-7ad4-43bb-af41-5015cf2ee73f" />
<img width="1434" height="829" alt="OPEN13" src="https://github.com/user-attachments/assets/16601039-aeb0-4c24-aa73-1e4de4ef8b1a" />
<img width="1427" height="840" alt="OPEN 12" src="https://github.com/user-attachments/assets/5d53dbfa-bcf5-43fe-99b0-83022ee9f2f7" />
<img width="1430" height="851" alt="OPEN 10" src="https://github.com/user-attachments/assets/a9f4da7d-ac7a-4b15-bdfb-f906d120bfe4" />
<img width="1431" height="851" alt="OEPN 8" src="https://github.com/user-attachments/assets/6cb92841-4a48-46bb-a844-00b01fdc9524" />
<img width="1435" height="851" alt="OPEN4" src="https://github.com/user-attachments/assets/afcc338a-0aa3-4be9-95d8-8c2465ff511d" />
<img width="1448" height="862" alt="OPEN2" src="https://github.com/user-attachments/assets/658f013e-a30e-4da1-b5b9-367dc2109c50" />

























