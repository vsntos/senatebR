#' Extrair informações de votações do plenário do Senado Federal por ano
#'
#' Esta função extrai as informações de votações do plenário do Senado Federal para os anos especificados.
#'
#' @param anos Um vetor contendo os anos para os quais se deseja extrair as informações de votações.
#'
#' @return Um dataframe contendo as informações de votações para todos os anos especificados, incluindo a variável 'ano'.
#'
#' @examples
#' # Exemplo de uso
#' anos <- c(2018, 2019, 2020)
#' dados_votacoes <- extrair_votacoes_por_ano(anos)
#' head(dados_votacoes)
#'
#' @importFrom xml2 read_xml xml_find_all xml_text xml_find_first
#' @importFrom dplyr bind_rows
#'
#' @export
extrair_votacoes_por_ano <- function(anos) {
  requireNamespace("xml2", quietly = TRUE)
  requireNamespace("dplyr", quietly = TRUE)

  # Inicializar dataframe vazio para armazenar os dados
  dados_total <- data.frame()

  # Iterar sobre cada ano fornecido
  for (ano in anos) {
    tryCatch({
      # Construir a URL para acessar os dados de votações do ano especificado
      url <- paste0("https://legis.senado.leg.br/dadosabertos/dados/ListaVotacoes", ano, ".xml")

      # Extrair XML da URL
      xml <- xml2::read_xml(url)

      # Extrair os dados de votações
      votacoes <- xml2::xml_find_all(xml, ".//Votacao")
      dados <- lapply(votacoes, function(votacao) {
        data.frame(
          ano_votacao = ano,
          codigo_sessao = xml2::xml_text(xml2::xml_find_first(votacao, ".//CodigoSessao")),
          sigla_casa = xml2::xml_text(xml2::xml_find_first(votacao, ".//SiglaCasa")),
          codigo_sessao_legislativa = xml2::xml_text(xml2::xml_find_first(votacao, ".//CodigoSessaoLegislativa")),
          tipo_sessao = xml2::xml_text(xml2::xml_find_first(votacao, ".//TipoSessao")),
          numero_sessao = xml2::xml_text(xml2::xml_find_first(votacao, ".//NumeroSessao")),
          data_sessao = xml2::xml_text(xml2::xml_find_first(votacao, ".//DataSessao")),
          hora_inicio = xml2::xml_text(xml2::xml_find_first(votacao, ".//HoraInicio")),
          codigo_tramitacao = xml2::xml_text(xml2::xml_find_first(votacao, ".//CodigoTramitacao")),
          codigo_sessao_votacao = xml2::xml_text(xml2::xml_find_first(votacao, ".//CodigoSessaoVotacao")),
          sequencial_sessao = xml2::xml_text(xml2::xml_find_first(votacao, ".//SequencialSessao")),
          secreta = xml2::xml_text(xml2::xml_find_first(votacao, ".//Secreta")),
          descricao_votacao = xml2::xml_text(xml2::xml_find_first(votacao, ".//DescricaoVotacao")),
          resultado = xml2::xml_text(xml2::xml_find_first(votacao, ".//Resultado")),
          total_votos_sim = xml2::xml_text(xml2::xml_find_first(votacao, ".//TotalVotosSim")),
          total_votos_nao = xml2::xml_text(xml2::xml_find_first(votacao, ".//TotalVotosNao")),
          total_votos_abstencao = xml2::xml_text(xml2::xml_find_first(votacao, ".//TotalVotosAbstencao")),
          codigo_materia = xml2::xml_text(xml2::xml_find_first(votacao, ".//CodigoMateria")),
          sigla_materia = xml2::xml_text(xml2::xml_find_first(votacao, ".//SiglaMateria")),
          numero_materia = xml2::xml_text(xml2::xml_find_first(votacao, ".//NumeroMateria")),
          descricao_identificacao_materia = xml2::xml_text(xml2::xml_find_first(votacao, ".//DescricaoIdentificacaoMateria")),
          sigla_casa_materia = xml2::xml_text(xml2::xml_find_first(votacao, ".//SiglaCasaMateria"))
        )
      })

      # Converter a lista de dataframes em um único dataframe
      dados <- dplyr::bind_rows(dados)

      # Adicionar os dados do ano atual ao dataframe total
      dados_total <- dplyr::bind_rows(dados_total, dados)
    }, error = function(e) {
      cat("Erro ao processar o ano", ano, ": ", conditionMessage(e), "\n")
    })
  }

  return(dados_total)
}




