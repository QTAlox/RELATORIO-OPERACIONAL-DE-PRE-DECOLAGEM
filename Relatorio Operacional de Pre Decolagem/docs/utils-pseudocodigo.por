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
        
        SE linha["nivel_energia"] < 30 ENTÃO
            RETORNA "Crítico"
            FIMSE
        
        SE linha["vibracao"] >0.60 ENTÃO
            RETORNA "Crítico"
            FIMSE
        
        SE linha ["pressao_tanque"] < 4.5 ENTÃO
            RETORNA "Atenção"
            FIMSE
        
        SE linha ["temperatura_interna"] < 18 OU LINHA ["temperatura_interna"] > 26 ENTÃO
            RETORNA "Atenção"
            FIMSE
        
        SE linha ["nivel_energia"] < 90 ENTÃO 
            RETORNA "Atenção"
            FIMSE
        
        SE linha ["vibracao"] > 0.40 ENTÃO
            RETORNA "Atenção"
            FIMSE
        
        SE linha ["pressao_tanque"] < 4.4 ENTÃO
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

        SE linha["temperatura_interna"] < 18 ENTÃO
            total <- total + 1
            anomalias[total] <- "Temperatura interna abaixo da faixa ideal"
            FIMSE

        SE linha ["temperatura_interna"] > 26 ENTÃO
            total <- total + 1
            anomalias[total] <- "Temperatura interna acima da faixa ideal"
            FIMSE

        SE linha["integridade_estrutural"] = 0 ENTÃO
            total <- total + 1
            anomalias[total] <- "Falha Estrutural"
            FIMSE
        
        SE linha["nivel_energia"] < 75 ENTÃO
            total <- total + 1
            anomalias[total] <- "Energia crítica"
            FIMSE

        SE linha["vibracao"] > 0.60 ENTÃO
            total <- total + 1
            anomalias[total] <- "Vibração excessiva"
            FIMSE

        SE linha["pressao_tanque"] < 4.0 ENTÃO
            total <- total + 1
            anomalias[total] <- "Pressão crítica nos tanques"
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
                RESULTADO <- RESULTADO + ", " + anomalias[i]
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
    FIMFUNCAO

    FUNCAO motivo_risco(linha)
        VAR motivos: vetor[1..10] de caractere 
        i, total: INTEIRO
        RESULTADO: caractere

        SE linha["integridade_estrutural"] = 0 ENTÃO
            total <- total + 1
            motivos[total] <- "Integridade estrutural comprometida"
            FIMSE
        
        SE linha["nivel_energia"] < 75 ENTÃO
            total <- total + 1
            motivos[total] <- "Energia abaixo do mínimo operacional"
            FIMSE
        
        SE linha["vibracao"] > 0.60 ENTÃO
            total <- total + 1
            motivos[total] <- "Vibração acima do limite aceitável"
            FIMSE
        
        SE linha ["pressao_tanque"] < 4.0 ENTÃO
            total <- total + 1
            motivos[total] <- "Pressão dos tanques abaixo do ideal"
            FIMSE
        
        SE linha ["temperatura_interna"] < 18 OU linha ["temperatura_interna"] > 26 ENTÃO
            total <- total + 1
            motivos[total] <- "Temperatura interna fora da faixa ideal"
            FIMSE

        SE TOTAL = 0 ENTÃO
            RESULTADO <- "Nenhum fator crítico identificado"
            FIMSE
        
        RESULTADO <- "" 

        PARA i de 1 até total FAÇA
            RESULTADO <- RESULTADO + motivos[i] + "; "
            SE i = 1 ENTÃO
                RESULTADO <- motivos[i]
            SENAO 
                RESULTADO <- RESULTADO + ", " + motivos[i]
            FIMSE
            
        RETORNA RESULTADO
    FIMFUNCAO

    FUNCAO calcular_prontidao(linha)
        VAR score = 100

        SE linha["integridade_estrutural"] = 0 ENTÃO
            score <- score - 40
            FIMSE
        
        SE linha["nivel_energia"] < 75 ENTÃO
            score <- score - 25
            FIMSE
        
        SE linha["nivel_energia"] < 90 ENTÃO
            score <- score - 10
            FIMSE
        
        SE linha["vibracao"] > 0.60 ENTÃO
            score <- score - 25
            FIMSE
            SE NAO linha["vibracao"] > 0.40 ENTÃO
                score <- score - 10
                FIMSE
        
        SE linha["pressao_tanque"] < 4.0 ENTÃO
            score <- score - 25
            FIMSE
            SE NAO linha["pressao_tanque"] < 4.4 ENTÃO
                score <- score - 10
                FIMSE
        
        SE linha ["temperatura_interna"] < 18 OU linha["temperatura_interna"] > 26 ENTÃO
            score <- score - 10
            FIMSE
        
        SE (score > 0) ENTÃO
            RETORNA score

             SENAO
                RETORNA 0
             FIMSE

    FUNCAO parecer_final(linha)
        SE score >= 85 ENTÃO
            RETORNA "Sistema apto para operação"
        SE score >= 60 ENTÃO
            RETORNA "Sistema requer revisão antes da operação"
        RETORNA "Sistema não apto para operação"
            
FIM

