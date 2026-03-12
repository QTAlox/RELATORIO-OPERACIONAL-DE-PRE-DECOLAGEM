INICIO

    IMPORTAR pandas
    IMPORTAR numpy
    IMPORTAR matplotlib
    IMPORTAR sklearn
    IMPORTAR jupyter

    FUNCAO classificar_risco(linha)
        SE linha["integridade_estrutural"] = 0 ENTÃO
            RETORNA "Crítico"
            FIMSE
        
        SE linha["modulos_criticos"] = "FALHA" ENTÃO
            RETORNA "Crítico"
            FIMSE
        
        SE linha["nivel_energia"] < 30 ENTÃO
            RETORNA "Crítico"
            FIMSE
        
        SE linha ["pressao_tanque"] < 4.5 ENTÃO
            RETORNA "Atenção"
            FIMSE
        
        RETORNA "Normal"
    FIMFUNCAO

    FUNCAO calcular_autonomia(
        carga_atual, 
        capacidade_total=100,
        consumo_decolagem=20,
        perdas_energeticas=5,
        consumo_medio_operacional=10
    )
        energia_disponivel <- capacidade_total * (carga_atual / 100)
        energia_util <- energia_disponivel - consumo_decolagem - perdas_energeticas

        SE energia_util < 0 ENTÃO
            RETORNA 0

        RETORNA energia_util / consumo_medio_operacional

    FIMFUNCAO

    FUNCAO identificar_anomalia(linha)
        VAR anomalias: vetor[1..10] de caractere 
        i, total: INTEIRO
        RESULTADO: caractere

        SE linha["temperatura_interna"] > 30 ENTÃO
            total <- total + 1
            anomalias[total] <- "Temperatura Interna Alta"
            FIMSE

        SE linha["integridade_estrutural"] = 0 ENTÃO
            total <- total + 1
            anomalias[total] <- "Falha Estrutural"
            FIMSE

        SE linha["pressao_tanque"] < 4.5 ENTÃO
            total <- total + 1
            anomalias[total] <- "Pressão do Tanque Baixa"
            FIMSE

        SE linha["nivel_energia"] < 30 ENTÃO
            total <- total + 1
            anomalias[total] <- "Nível de Energia Baixo"
            FIMSE

        SE linha["modulos_criticos"] = "FALHA" ENTÃO
            total <- total + 1
            anomalias[total] <- "Módulos Críticos com Falha"
            FIMSE
        SE TOTAL = 0 ENTÃO
            RESULTADO <- "Nenhuma Anomalia Detectada"
            FIMSE
        
        RESULTADO <- "" 

        PARA i de 1 até total FAÇA
            RESULTADO <- RESULTADO + anomalias[i] + "; "
            SE i = 1 ENTÃO
                RESULTADO <- anomalias[i]
            SENAO 
                RESULTADO <- RESULTADO + "; " + anomalias[i]
            FIMSE
            
        RETORNA RESULTADO
    FIMFUNCAO

    FUNCAO sugerir_acao(classificacao)
        SE classificacao = "Normal" ENTÃO
            RETORNA "Operaçào dentro dos padrões"
            FIMSE
        SE classificacao = "Atenção" ENTÃO
            RETORNA "Revisasr parâmetros antes da decolagem."
        RETORNA "Decolagem não recomendada até correção das falhas."
            
FIM

