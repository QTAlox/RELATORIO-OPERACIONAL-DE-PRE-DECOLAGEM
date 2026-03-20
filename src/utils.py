def classificar_risco(linha):
    if linha["integridade_estrutural"] == 0:
        return "Crítico"
    if linha["nivel_energia"] < 75:
        return "Crítico"
    if linha["vibracao"] > 0.60:
        return "Crítico"
    if linha["pressao_tanque"] < 4.0:
        return "Crítico"
    if linha["temperatura_interna"] < 18 or linha["temperatura_interna"] > 26:
        return "Atenção"
    if linha["nivel_energia"] < 90:
        return "Atenção"
    if linha["vibracao"] > 0.40:
        return "Atenção"
    if linha["pressao_tanque"] < 4.4:
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

    if linha["temperatura_interna"] < 18:
        anomalias.append("Temperatura interna abaixo da faixa ideal")

    if linha["temperatura_interna"] > 26:
        anomalias.append("Temperatura interna acima da faixa ideal")

    if linha["integridade_estrutural"] == 0:
        anomalias.append("Falha estrutural")

    if linha["nivel_energia"] < 75:
        anomalias.append("Energia crítica")

    if linha["vibracao"] > 0.60:
        anomalias.append("Vibração excessiva")

    if linha["pressao_tanque"] < 4.0:
        anomalias.append("Pressão crítica nos tanques")

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

    if linha["nivel_energia"] < 75:
        motivos.append("Energia abaixo do mínimo operacional")

    if linha["vibracao"] > 0.60:
        motivos.append("Vibração acima do limite aceitável")

    if linha["pressao_tanque"] < 4.0:
        motivos.append("Pressão dos tanques abaixo do ideal")

    if linha["temperatura_interna"] < 18 or linha["temperatura_interna"] > 26:
        motivos.append("Temperatura interna fora da faixa ideal")

    if not motivos:
        return "Nenhum fator crítico identificado"

    return ", ".join(motivos)


def calcular_prontidao(linha):
    score = 100

    if linha["integridade_estrutural"] == 0:
        score -= 40

    if linha["nivel_energia"] < 75:
        score -= 25
    elif linha["nivel_energia"] < 90:
        score -= 10

    if linha["vibracao"] > 0.60:
        score -= 25
    elif linha["vibracao"] > 0.40:
        score -= 10

    if linha["pressao_tanque"] < 4.0:
        score -= 25
    elif linha["pressao_tanque"] < 4.4:
        score -= 10

    if linha["temperatura_interna"] < 18 or linha["temperatura_interna"] > 26:
        score -= 10

    return max(score, 0)


def parecer_final(score):
    if score >= 85:
        return "Sistema apto para operação"
    if score >= 60:
        return "Sistema requer revisão antes da operação"
    return "Sistema não apto para decolagem"