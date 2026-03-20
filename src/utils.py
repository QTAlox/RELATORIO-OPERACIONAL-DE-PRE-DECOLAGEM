def classificar_risco(linha):
    if linha["integridade_estrutural"] == 0:
        return "Crítico"
    if linha["modulos_criticos"] == "FALHA":
        return "Crítico"
    if linha["nivel_energia"] < 30:
        return "Crítico"
    if linha["pressao_tanque"] < 4.5:
        return "Atenção"
    if linha["modulos_criticos"] == "ALERTA":
        return "Atenção"
    return "Normal"


def calcular_autonomia(
    carga_atual,
    capacidade_total=100,
    consumo_decolagem=20,
    perdas_energeticas=5,
    consumo_medio_operacional=10
):
    energia_disponivel = capacidade_total * (carga_atual / 100)
    energia_util = energia_disponivel - consumo_decolagem - perdas_energeticas

    if energia_util < 0:
        return 0

    return energia_util / consumo_medio_operacional


def identificar_anomalia(linha):
    anomalias = []

    if linha["temperatura_interna"] > 30:
        anomalias.append("Temperatura interna alta")

    if linha["integridade_estrutural"] == 0:
        anomalias.append("Falha estrutural")

    if linha["pressao_tanque"] < 4.5:
        anomalias.append("Pressão baixa")

    if linha["nivel_energia"] < 30:
        anomalias.append("Energia crítica")

    if linha["modulos_criticos"] == "FALHA":
        anomalias.append("Falha em módulo crítico")

    if not anomalias:
        return "Nenhuma"

    return ", ".join(anomalias)


def sugerir_acao(classificacao):
    if classificacao == "Normal":
        return "Operação dentro dos padrões."
    if classificacao == "Atenção":
        return "Revisar parâmetros antes da decolagem."
    return "Decolagem não recomendada até correção das falhas."


def motivo_risco(linha):
    motivos = []

    if linha["integridade_estrutural"] == 0:
        motivos.append("Integridade estrutural comprometida")

    if linha["modulos_criticos"] == "FALHA":
        motivos.append("Falha em módulo crítico")

    if linha["nivel_energia"] < 30:
        motivos.append("Energia abaixo do mínimo")

    if linha["pressao_tanque"] < 4.5:
        motivos.append("Pressão do tanque abaixo do ideal")

    if not motivos:
        return "Nenhum fator crítico identificado"
    
    return ", ".join(motivos)


def calcular_prontidao(linha):
    score = 100

    if linha["integridade_estrutural"] == 0:
        score -= 40

    if linha["modulos_criticos"] == "ALERTA":
        score -= 15

    if linha["modulos_criticos"] == "FALHA":
        score -= 30

    if linha["nivel_energia"] < 30:
        score -= 25
    elif linha["nivel_energia"] < 50:
        score -= 10

    if linha["pressao_tanque"] < 4.5:
        score -= 20

    if linha["temperatura_interna"] > 30:
        score -= 10

    return max(score, 0)


def parecer_final(score):
    if score >= 85:
        return "Sistema apto para operação"
    if score >= 60:
        return "Sistema requer revisão antes da operação"
    return "Sistema não apto para decolagem"
        