
      *================================================================*
      * Author:      Paulo Henrique Santana Motta
      * Date:        14/09/2026
      * Purpose:     JOB CONTROL & MONITORING SYSTEM
      * Technology:  GnuCOBOL
      *================================================================*

       IDENTIFICATION DIVISION.

       PROGRAM-ID. JOBCONTROL.

       ENVIRONMENT DIVISION.

       INPUT-OUTPUT SECTION.

       FILE-CONTROL.

           SELECT JOB-FILE
               ASSIGN TO "JOBS.DAT"
               ORGANIZATION IS INDEXED
               ACCESS MODE IS DYNAMIC
               RECORD KEY IS JOB-ID
               FILE STATUS IS WS-JOB-STATUS.

           SELECT HISTORY-FILE
               ASSIGN TO "HISTORICO.DAT"
               ORGANIZATION IS INDEXED
               ACCESS MODE IS DYNAMIC
               RECORD KEY IS HIST-ID
               FILE STATUS IS WS-HIST-STATUS.

       DATA DIVISION.

       FILE SECTION.

       FD JOB-FILE.

       01 JOB-RECORD.
           05 JOB-ID              PIC 9(5).
           05 JOB-NAME            PIC X(30).
           05 JOB-DESCRIPTION     PIC X(50).
           05 JOB-OWNER           PIC X(30).
           05 JOB-STATUS          PIC X(10).
           05 JOB-RC              PIC 9(4).

       FD HISTORY-FILE.

       01 HISTORY-RECORD.
           05 HIST-ID             PIC 9(6).
           05 HIST-JOB-ID         PIC 9(5).
           05 HIST-JOB-NAME       PIC X(30).
           05 HIST-DATE           PIC X(10).
           05 HIST-TIME           PIC X(8).
           05 HIST-STATUS         PIC X(10).
           05 HIST-RC             PIC 9(4).

       WORKING-STORAGE SECTION.

      *----------------------------------------------------------------*
      * CONTROLE DO SISTEMA
      *----------------------------------------------------------------*

       01 WS-OPTION               PIC 9 VALUE 0.

       01 WS-SYSTEM-OK            PIC 9 VALUE 0.

       01 WS-FOUND                PIC 9(5) VALUE 0.

       01 WS-CONTINUE             PIC X VALUE SPACE.

      *----------------------------------------------------------------*
      * FILE STATUS
      *----------------------------------------------------------------*

       01 WS-JOB-STATUS           PIC XX VALUE SPACES.

       01 WS-HIST-STATUS          PIC XX VALUE SPACES.

      *----------------------------------------------------------------*
      * ENTRADAS
      *----------------------------------------------------------------*

       01 WS-JOB-ID-IN            PIC 9(5) VALUE 0.

       01 WS-RC-IN                PIC 9(4) VALUE 0.

      *----------------------------------------------------------------*
      * CONTROLE DO HISTORICO
      *----------------------------------------------------------------*

       01 WS-NEXT-HIST-ID         PIC 9(6) VALUE 1.

      *----------------------------------------------------------------*
      * DATA E HORA
      *----------------------------------------------------------------*

       01 WS-CURRENT-DATE         PIC X(21).

       01 WS-DATE-TEXT            PIC X(10).

       01 WS-TIME-TEXT            PIC X(8).

      *================================================================*
      * PROCEDURE DIVISION
      *================================================================*

       PROCEDURE DIVISION.

       MAIN-PROCEDURE.

           PERFORM INITIALIZE-SYSTEM

           IF WS-SYSTEM-OK = 1

               PERFORM UNTIL WS-OPTION = 9

                   PERFORM DISPLAY-MAIN-MENU

                   ACCEPT WS-OPTION

                   EVALUATE WS-OPTION

                       WHEN 1
                           PERFORM REGISTER-JOB

                       WHEN 2
                           PERFORM CONSULT-JOB

                       WHEN 3
                           PERFORM EXECUTE-JOB

                       WHEN 4
                           PERFORM SHOW-HISTORY

                       WHEN 5
                           PERFORM SHOW-REPORT

                       WHEN 6
                           PERFORM UPDATE-JOB

                       WHEN 7
                           PERFORM DELETE-JOB

                       WHEN 9
                           DISPLAY " "
                           DISPLAY "Encerrando o sistema..."
                           DISPLAY " "

                       WHEN OTHER
                           DISPLAY " "
                           DISPLAY "ERRO: Opcao invalida."
                           DISPLAY " "
                           PERFORM PAUSE-SCREEN

                   END-EVALUATE

               END-PERFORM

               PERFORM CLOSE-FILES

           END-IF.

           STOP RUN.


      *================================================================*
      * INICIALIZACAO DO SISTEMA
      *================================================================*

       INITIALIZE-SYSTEM.

           MOVE 0 TO WS-SYSTEM-OK

      *----------------------------------------------------------------*
      * ABRE JOBS.DAT
      *----------------------------------------------------------------*

           OPEN I-O JOB-FILE

           IF WS-JOB-STATUS = "35"

               OPEN OUTPUT JOB-FILE

               IF WS-JOB-STATUS = "00"

                   CLOSE JOB-FILE

                   OPEN I-O JOB-FILE

               END-IF

           END-IF

           IF WS-JOB-STATUS NOT = "00"

               DISPLAY " "
               DISPLAY "ERRO AO ABRIR JOBS.DAT."
               DISPLAY "FILE STATUS: " WS-JOB-STATUS
               DISPLAY " "

               EXIT PARAGRAPH

           END-IF

      *----------------------------------------------------------------*
      * ABRE HISTORICO.DAT
      *----------------------------------------------------------------*

           OPEN I-O HISTORY-FILE

           IF WS-HIST-STATUS = "35"

               OPEN OUTPUT HISTORY-FILE

               IF WS-HIST-STATUS = "00"

                   CLOSE HISTORY-FILE

                   OPEN I-O HISTORY-FILE

               END-IF

           END-IF

           IF WS-HIST-STATUS NOT = "00"

               DISPLAY " "
               DISPLAY "ERRO AO ABRIR HISTORICO.DAT."
               DISPLAY "FILE STATUS: " WS-HIST-STATUS
               DISPLAY " "

               CLOSE JOB-FILE

               EXIT PARAGRAPH

           END-IF

           MOVE 1 TO WS-SYSTEM-OK.


      *================================================================*
      * MENU PRINCIPAL
      *================================================================*

       DISPLAY-MAIN-MENU.

           DISPLAY " "
           DISPLAY "==============================================="
           DISPLAY "*       JOB CONTROL & MONITORING SYSTEM       *"
           DISPLAY "==============================================="
           DISPLAY "*                                             *"
           DISPLAY "*              MENU PRINCIPAL                 *"
           DISPLAY "*                                             *"
           DISPLAY "*  1 - CADASTRO DE JOB                        *"
           DISPLAY "*  2 - CONSULTA DE JOB                        *"
           DISPLAY "*  3 - EXECUCAO DE JOB                        *"
           DISPLAY "*  4 - HISTORICO DE EXECUCOES                 *"
           DISPLAY "*  5 - RELATORIOS                             *"
           DISPLAY "*  6 - ALTERAR JOB                            *"
           DISPLAY "*  7 - EXCLUIR JOB                            *"
           DISPLAY "*                                             *"
           DISPLAY "*  9 - SAIR                                   *"
           DISPLAY "*                                             *"
           DISPLAY "==============================================="
           DISPLAY " "
           DISPLAY "Informe a opcao: " WITH NO ADVANCING.


      *================================================================*
      * CADASTRO DE JOB
      *================================================================*

           REGISTER-JOB.

           DISPLAY " "
           DISPLAY "==============================================="
           DISPLAY "              CADASTRO DE JOB"
           DISPLAY "==============================================="
           DISPLAY " "

           DISPLAY "ID DO JOB (5 DIGITOS): "
               WITH NO ADVANCING

           ACCEPT WS-JOB-ID-IN

           IF WS-JOB-ID-IN = 0

               DISPLAY " "
               DISPLAY "ERRO: ID 00000 nao permitido."
               DISPLAY " "

               PERFORM PAUSE-SCREEN

               EXIT PARAGRAPH

           END-IF

           MOVE WS-JOB-ID-IN TO JOB-ID

           READ JOB-FILE

           IF WS-JOB-STATUS = "00"

               DISPLAY " "
               DISPLAY "ERRO: JOB JA CADASTRADO."
               DISPLAY " "

               PERFORM PAUSE-SCREEN

               EXIT PARAGRAPH

           END-IF

           MOVE SPACES TO JOB-NAME
           MOVE SPACES TO JOB-DESCRIPTION
           MOVE SPACES TO JOB-OWNER
           MOVE "PENDENTE" TO JOB-STATUS
           MOVE 0 TO JOB-RC

           DISPLAY "NOME DO JOB: "
               WITH NO ADVANCING

           ACCEPT JOB-NAME

           DISPLAY "DESCRICAO: "
               WITH NO ADVANCING

           ACCEPT JOB-DESCRIPTION

           DISPLAY "RESPONSAVEL: "
               WITH NO ADVANCING

           ACCEPT JOB-OWNER

           WRITE JOB-RECORD

           IF WS-JOB-STATUS = "00"

               DISPLAY " "
               DISPLAY "JOB CADASTRADO COM SUCESSO."
               DISPLAY "ID: " JOB-ID
               DISPLAY "STATUS: " JOB-STATUS

           ELSE

               DISPLAY " "
               DISPLAY "ERRO AO CADASTRAR JOB."
               DISPLAY "FILE STATUS: " WS-JOB-STATUS

           END-IF

           DISPLAY " "

           PERFORM PAUSE-SCREEN.


      *================================================================*
      * CONSULTA DE JOB
      *================================================================*

           CONSULT-JOB.

           DISPLAY " "
           DISPLAY "==============================================="
           DISPLAY "               CONSULTA DE JOB"
           DISPLAY "==============================================="
           DISPLAY " "

           DISPLAY "ID DO JOB: "
               WITH NO ADVANCING

           ACCEPT WS-JOB-ID-IN

           MOVE WS-JOB-ID-IN TO JOB-ID

           READ JOB-FILE

           IF WS-JOB-STATUS = "00"

               DISPLAY " "
               DISPLAY "ID          : " JOB-ID
               DISPLAY "NOME        : " JOB-NAME
               DISPLAY "DESCRICAO   : " JOB-DESCRIPTION
               DISPLAY "RESPONSAVEL : " JOB-OWNER
               DISPLAY "STATUS      : " JOB-STATUS
               DISPLAY "RETURN CODE : " JOB-RC

           ELSE

               DISPLAY " "
               DISPLAY "JOB NAO ENCONTRADO."
               DISPLAY "FILE STATUS: " WS-JOB-STATUS

           END-IF

           DISPLAY " "

           PERFORM PAUSE-SCREEN.


      *================================================================*
      * EXECUCAO DE JOB
      *================================================================*

           EXECUTE-JOB.

           DISPLAY " "
           DISPLAY "==============================================="
           DISPLAY "                EXECUCAO DE JOB"
           DISPLAY "==============================================="
           DISPLAY " "

           DISPLAY "ID DO JOB: "
               WITH NO ADVANCING

           ACCEPT WS-JOB-ID-IN

           MOVE WS-JOB-ID-IN TO JOB-ID

           READ JOB-FILE

           IF WS-JOB-STATUS NOT = "00"

               DISPLAY " "
               DISPLAY "JOB NAO ENCONTRADO."
               DISPLAY "FILE STATUS: " WS-JOB-STATUS

           ELSE

               DISPLAY " "
               DISPLAY "JOB ENCONTRADO."
               DISPLAY "NOME: " JOB-NAME
               DISPLAY " "

               MOVE "EXECUTANDO" TO JOB-STATUS

               REWRITE JOB-RECORD

               IF WS-JOB-STATUS NOT = "00"

                   DISPLAY " "
                   DISPLAY "ERRO AO ATUALIZAR JOB."
                   DISPLAY "FILE STATUS: " WS-JOB-STATUS

               ELSE

                   DISPLAY "JOB EM EXECUCAO..."
                   DISPLAY " "
                   DISPLAY "Processamento concluido."
                   DISPLAY " "

                   DISPLAY "Informe o RETURN CODE."
                   DISPLAY "0 = SUCESSO"
                   DISPLAY "Diferente de 0 = ERRO"
                   DISPLAY "RC: "
                       WITH NO ADVANCING

                   ACCEPT WS-RC-IN

                   MOVE WS-RC-IN TO JOB-RC

                   IF WS-RC-IN = 0

                       MOVE "SUCESSO" TO JOB-STATUS

                   ELSE

                       MOVE "ERRO" TO JOB-STATUS

                   END-IF

                   REWRITE JOB-RECORD

                   IF WS-JOB-STATUS = "00"

                       PERFORM CREATE-HISTORY

                       DISPLAY " "
                       DISPLAY "JOB FINALIZADO."
                       DISPLAY "STATUS: " JOB-STATUS
                       DISPLAY "RETURN CODE: " JOB-RC

                   ELSE

                       DISPLAY " "
                       DISPLAY "ERRO AO FINALIZAR JOB."
                       DISPLAY "FILE STATUS: " WS-JOB-STATUS

                   END-IF

               END-IF

           END-IF

           DISPLAY " "

           PERFORM PAUSE-SCREEN.


      *================================================================*
      * CRIA HISTORICO
      *================================================================*

           CREATE-HISTORY.

           PERFORM GET-NEXT-HISTORY-ID

           MOVE WS-NEXT-HIST-ID TO HIST-ID

           MOVE JOB-ID TO HIST-JOB-ID

           MOVE JOB-NAME TO HIST-JOB-NAME

           MOVE FUNCTION CURRENT-DATE
               TO WS-CURRENT-DATE

      *----------------------------------------------------------------*
      * DATA: YYYY-MM-DD
      *----------------------------------------------------------------*

           MOVE WS-CURRENT-DATE(1:4)
               TO WS-DATE-TEXT(1:4)

           MOVE "-"
               TO WS-DATE-TEXT(5:1)

           MOVE WS-CURRENT-DATE(5:2)
               TO WS-DATE-TEXT(6:2)

           MOVE "-"
               TO WS-DATE-TEXT(8:1)

           MOVE WS-CURRENT-DATE(7:2)
               TO WS-DATE-TEXT(9:2)

      *----------------------------------------------------------------*
      * HORA: HH:MM:SS
      *----------------------------------------------------------------*

           MOVE WS-CURRENT-DATE(9:2)
               TO WS-TIME-TEXT(1:2)

           MOVE ":"
               TO WS-TIME-TEXT(3:1)

           MOVE WS-CURRENT-DATE(11:2)
               TO WS-TIME-TEXT(4:2)

           MOVE ":"
               TO WS-TIME-TEXT(6:1)

           MOVE WS-CURRENT-DATE(13:2)
               TO WS-TIME-TEXT(7:2)

           MOVE WS-DATE-TEXT TO HIST-DATE

           MOVE WS-TIME-TEXT TO HIST-TIME

           MOVE JOB-STATUS TO HIST-STATUS

           MOVE JOB-RC TO HIST-RC

           WRITE HISTORY-RECORD

           IF WS-HIST-STATUS NOT = "00"

           DISPLAY " "
           DISPLAY "ERRO AO GRAVAR HISTORICO."
           DISPLAY "FILE STATUS: " WS-HIST-STATUS

           END-IF.


      *================================================================*
      * OBTEM PROXIMO ID DO HISTORICO
      *================================================================*

           GET-NEXT-HISTORY-ID.

           MOVE 0 TO WS-NEXT-HIST-ID

           MOVE 0 TO HIST-ID

           START HISTORY-FILE
               KEY IS GREATER THAN HIST-ID

               INVALID KEY

                   MOVE 1 TO WS-NEXT-HIST-ID

               NOT INVALID KEY

                   PERFORM UNTIL WS-HIST-STATUS NOT = "00"

                       READ HISTORY-FILE NEXT RECORD

                       IF WS-HIST-STATUS = "00"

                           MOVE HIST-ID
                               TO WS-NEXT-HIST-ID

                       END-IF

                   END-PERFORM

                   ADD 1 TO WS-NEXT-HIST-ID

           END-START.


      *================================================================*
      * HISTORICO DE EXECUCOES
      *================================================================*

           SHOW-HISTORY.

           DISPLAY " "
           DISPLAY "==============================================="
           DISPLAY "             HISTORICO DE EXECUCOES"
           DISPLAY "==============================================="
           DISPLAY " "

           MOVE 0 TO WS-FOUND

           MOVE 0 TO HIST-ID

           START HISTORY-FILE
               KEY IS GREATER THAN HIST-ID

               INVALID KEY

                   CONTINUE

               NOT INVALID KEY

                   PERFORM UNTIL WS-HIST-STATUS NOT = "00"

                       READ HISTORY-FILE NEXT RECORD

                       IF WS-HIST-STATUS = "00"

                           ADD 1 TO WS-FOUND

                           DISPLAY " "
                           DISPLAY "HIST ID : " HIST-ID
                           DISPLAY "JOB ID  : " HIST-JOB-ID
                           DISPLAY "NOME    : " HIST-JOB-NAME
                           DISPLAY "DATA    : " HIST-DATE
                           DISPLAY "HORA    : " HIST-TIME
                           DISPLAY "STATUS  : " HIST-STATUS
                           DISPLAY "RC      : " HIST-RC
           DISPLAY "-----------------------------------------------"

                       END-IF

                   END-PERFORM

           END-START

           IF WS-FOUND = 0

           DISPLAY "Nenhuma execucao registrada."

           END-IF

           DISPLAY " "

           PERFORM PAUSE-SCREEN.


      *================================================================*
      * RELATORIO
      *================================================================*

           SHOW-REPORT.

           DISPLAY " "
           DISPLAY "==============================================="
           DISPLAY "                  RELATORIO"
           DISPLAY "==============================================="
           DISPLAY " "

           MOVE 0 TO WS-FOUND

           MOVE 0 TO JOB-ID

           START JOB-FILE
               KEY IS GREATER THAN JOB-ID

               INVALID KEY

                   CONTINUE

               NOT INVALID KEY

                   PERFORM UNTIL WS-JOB-STATUS NOT = "00"

                       READ JOB-FILE NEXT RECORD

                       IF WS-JOB-STATUS = "00"

                           ADD 1 TO WS-FOUND

            DISPLAY " "
            DISPLAY "JOB    : " JOB-ID
            DISPLAY "NOME   : " JOB-NAME
            DISPLAY "STATUS : " JOB-STATUS
            DISPLAY "RC     : " JOB-RC
            DISPLAY "-----------------------------------------------"

                       END-IF

                   END-PERFORM

           END-START

           IF WS-FOUND = 0

               DISPLAY "Nenhum JOB cadastrado."

           END-IF

           DISPLAY " "

           PERFORM PAUSE-SCREEN.


      *================================================================*
      * ALTERACAO DE JOB
      *================================================================*

       UPDATE-JOB.

           DISPLAY " "
           DISPLAY "==============================================="
           DISPLAY "                 ALTERAR JOB"
           DISPLAY "==============================================="
           DISPLAY " "

           DISPLAY "ID DO JOB: "
               WITH NO ADVANCING

           ACCEPT WS-JOB-ID-IN

           MOVE WS-JOB-ID-IN TO JOB-ID

           READ JOB-FILE

           IF WS-JOB-STATUS NOT = "00"

               DISPLAY " "
               DISPLAY "JOB NAO ENCONTRADO."
               DISPLAY "FILE STATUS: " WS-JOB-STATUS

           ELSE

               DISPLAY " "
               DISPLAY "NOME ATUAL: " JOB-NAME

               DISPLAY "NOVO NOME: "
                   WITH NO ADVANCING

               ACCEPT JOB-NAME

               DISPLAY " "
               DISPLAY "DESCRICAO ATUAL: " JOB-DESCRIPTION

               DISPLAY "NOVA DESCRICAO: "
                   WITH NO ADVANCING

               ACCEPT JOB-DESCRIPTION

               DISPLAY " "
               DISPLAY "RESPONSAVEL ATUAL: " JOB-OWNER

               DISPLAY "NOVO RESPONSAVEL: "
                   WITH NO ADVANCING

               ACCEPT JOB-OWNER

               REWRITE JOB-RECORD

               IF WS-JOB-STATUS = "00"

                   DISPLAY " "
                   DISPLAY "JOB ALTERADO COM SUCESSO."

               ELSE

                   DISPLAY " "
                   DISPLAY "ERRO AO ALTERAR JOB."
                   DISPLAY "FILE STATUS: " WS-JOB-STATUS

               END-IF

           END-IF

           DISPLAY " "

           PERFORM PAUSE-SCREEN.


      *================================================================*
      * EXCLUSAO DE JOB
      *================================================================*

           DELETE-JOB.

           DISPLAY " "
           DISPLAY "==============================================="
           DISPLAY "                  EXCLUIR JOB"
           DISPLAY "==============================================="
           DISPLAY " "

           DISPLAY "ID DO JOB: "
               WITH NO ADVANCING

           ACCEPT WS-JOB-ID-IN

           MOVE WS-JOB-ID-IN TO JOB-ID

           READ JOB-FILE

           IF WS-JOB-STATUS NOT = "00"

               DISPLAY " "
               DISPLAY "JOB NAO ENCONTRADO."
               DISPLAY "FILE STATUS: " WS-JOB-STATUS

           ELSE

               DISPLAY " "
               DISPLAY "JOB: " JOB-NAME
               DISPLAY " "

               DISPLAY "Confirmar exclusao? S/N: "
                   WITH NO ADVANCING

               ACCEPT WS-CONTINUE

               IF WS-CONTINUE = "S"
                   OR WS-CONTINUE = "s"

                   DELETE JOB-FILE RECORD

                   IF WS-JOB-STATUS = "00"

                       DISPLAY " "
                       DISPLAY "JOB EXCLUIDO COM SUCESSO."

                   ELSE

                       DISPLAY " "
                       DISPLAY "ERRO AO EXCLUIR JOB."
                       DISPLAY "FILE STATUS: " WS-JOB-STATUS

                   END-IF

               ELSE

                   DISPLAY " "
                   DISPLAY "Exclusao cancelada."

               END-IF

           END-IF

           DISPLAY " "

           PERFORM PAUSE-SCREEN.


      *================================================================*
      * PAUSA
      *================================================================*

       PAUSE-SCREEN.

           DISPLAY " "
           DISPLAY "Pressione ENTER para continuar..."
           ACCEPT WS-CONTINUE.


      *================================================================*
      * FECHAMENTO
      *================================================================*

       CLOSE-FILES.

           CLOSE JOB-FILE
                 HISTORY-FILE.


      *================================================================*
      * FIM
      *================================================================*

       END PROGRAM JOBCONTROL.
```
