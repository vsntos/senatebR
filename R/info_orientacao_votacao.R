#' Coletar dados de votação do Senado Federal
#'
#' Esta função coleta os dados de votação do Senado Federal a partir de uma lista de datas de sessão.
#'
#' @param data_sessao Um vetor contendo as datas das sessões no formato "AAAA-MM-DD".
#' @return Um data frame contendo os dados de votação, incluindo código de votação, data e hora, partido e voto.
#' @examples
#' anos <- c(2018, 2019, 2020)
#' dados_votacoes <- extrair_votacoes_por_ano(anos)
#' dados_votacao <- coletar_orientacao_votacao(head(dados_votacoes$data_sessao))
#' @importFrom xml2 read_xml xml_text xml_find_all
#' @importFrom dplyr bind_rows
#' @export
coletar_orientacao_votacao <- function(data_sessao) {
  # Inicializar uma lista para armazenar os resultados
  resultados <- list()

  # Percorrer cada data de sessão
  for (sessao in data_sessao) {
    # Formatar a data da sessão no formato AAAAMMDD
    data_sessao_formatada <- format(as.Date(sessao), "%Y%m%d")

    # Criar a URL com base na data formatada
    url <- paste0("https://legis.senado.leg.br/dadosabertos/plenario/votacao/orientacaoBancada/", data_sessao_formatada)

    # Verificar se a URL está correta
    cat("URL:", url, "\n")

    # Ler o XML da URL
    xml_data <- read_xml(url)

    # Verificar se o XML contém dados
    if (length(xml_text(xml_data)) == 0) {
      cat("XML vazio:", url, "\n")
      next
    }

    # Extrair os códigos de votação
    codigos_votacao <- xml_text(xml_find_all(xml_data, ".//codigoVotacaoSve"))

    # Verificar se foram encontrados códigos de votação
    if (length(codigos_votacao) == 0) {
      cat("Nenhum código de votação encontrado:", url, "\n")
      next
    }

    # Percorrer cada código de votação
    for (codigo_votacao in codigos_votacao) {
      # Verificar se há orientações de liderança disponíveis
      orientacoes_nodes <- xml_find_all(xml_data, paste0(".//codigoVotacaoSve[text() = '", codigo_votacao, "']/following-sibling::orientacoesLideranca"))

      if (length(orientacoes_nodes) > 0) {
        # Extrair os dados das orientações de liderança
        orientacoes <- data.frame(
          codigo_votacao = rep(codigo_votacao, length(orientacoes_nodes)),
          data_hora = xml_text(xml_find_all(orientacoes_nodes, ".//dataHora")),
          partido = xml_text(xml_find_all(orientacoes_nodes, ".//partido")),
          voto = xml_text(xml_find_all(orientacoes_nodes, ".//voto")),
          stringsAsFactors = FALSE
        )

        # Adicionar as orientações ao resultado
        resultados[[length(resultados) + 1]] <- orientacoes
      } else {
        # Caso não haja orientações de liderança, marcar como votação secreta
        resultados[[length(resultados) + 1]] <- data.frame(
          codigo_votacao = codigo_votacao,
          data_hora = NA,
          partido = NA,
          voto = "Votação secreta",
          stringsAsFactors = FALSE
        )
      }
    }
  }

  # Combinar todos os resultados em um único data frame
  dados_votacao <- bind_rows(resultados)

  return(dados_votacao)
}



