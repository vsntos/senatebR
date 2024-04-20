#' Extrair informações de votações do plenário do Senado Federal por ano
#'
#' Esta função extrai as informações de votações do plenário do Senado Federal para os anos especificados.
#'
#' @param anos Um vetor contendo os anos para os quais se deseja extrair as informações de votações.
#'
#' @return Um dataframe contendo as informações de votações para todos os anos especificados, incluindo a variável 'ano'.
#'
#' @examples
#' anos <- c(2018, 2019, 2020)
#' dados_votacoes <- extrair_votacoes_por_ano(anos)
#' head(dados_votacoes)
extrair_votacoes_por_ano <- function(anos) {
  # Inicializar dataframe vazio para armazenar os dados
  dados_total <- data.frame()

  # Iterar sobre cada ano fornecido
  for (ano in anos) {
    # Construir a URL para acessar os dados de votações do ano especificado
    url <- paste0("https://legis.senado.leg.br/dadosabertos/dados/ListaVotacoes", ano, ".xml")

    # Extrair XML da URL
    xml <- read_xml(url)

    # Extrair os dados de votações
    votacoes <- xml_find_all(xml, ".//Votacao")
    dados <- lapply(votacoes, function(votacao) {
      tibble(
        ano_votacao = ano,
        codigo_sessao = xml_text(xml_find_first(votacao, ".//CodigoSessao")),
        sigla_casa = xml_text(xml_find_first(votacao, ".//SiglaCasa")),
        codigo_sessao_legislativa = xml_text(xml_find_first(votacao, ".//CodigoSessaoLegislativa")),
        tipo_sessao = xml_text(xml_find_first(votacao, ".//TipoSessao")),
        numero_sessao = xml_text(xml_find_first(votacao, ".//NumeroSessao")),
        data_sessao = xml_text(xml_find_first(votacao, ".//DataSessao")),
        hora_inicio = xml_text(xml_find_first(votacao, ".//HoraInicio")),
        codigo_tramitacao = xml_text(xml_find_first(votacao, ".//CodigoTramitacao")),
        codigo_sessao_votacao = xml_text(xml_find_first(votacao, ".//CodigoSessaoVotacao")),
        sequencial_sessao = xml_text(xml_find_first(votacao, ".//SequencialSessao")),
        secreta = xml_text(xml_find_first(votacao, ".//Secreta")),
        descricao_votacao = xml_text(xml_find_first(votacao, ".//DescricaoVotacao")),
        resultado = xml_text(xml_find_first(votacao, ".//Resultado")),
        total_votos_sim = xml_text(xml_find_first(votacao, ".//TotalVotosSim")),
        total_votos_nao = xml_text(xml_find_first(votacao, ".//TotalVotosNao")),
        total_votos_abstencao = xml_text(xml_find_first(votacao, ".//TotalVotosAbstencao")),
        codigo_materia = xml_text(xml_find_first(votacao, ".//CodigoMateria")),
        sigla_materia = xml_text(xml_find_first(votacao, ".//SiglaMateria")),
        numero_materia = xml_text(xml_find_first(votacao, ".//NumeroMateria")),
        descricao_identificacao_materia = xml_text(xml_find_first(votacao, ".//DescricaoIdentificacaoMateria")),
        sigla_casa_materia = xml_text(xml_find_first(votacao, ".//SiglaCasaMateria"))
      )
    })

    # Converter a lista de dataframes em um único dataframe
    dados <- bind_rows(dados)

    # Adicionar os dados do ano atual ao dataframe total
    dados_total <- bind_rows(dados_total, dados)
  }

  return(dados_total)
}
