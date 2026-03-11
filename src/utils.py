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