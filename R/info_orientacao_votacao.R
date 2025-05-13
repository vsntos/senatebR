#' Coletar dados de orienta\u00e7\u00f5es de voto no Senado Federal
#'
#' Esta fun\u00e7\u00e3o coleta os dados de orienta\u00e7\u00e3o das vota\u00e7\u00f5es do Senado Federal a partir de uma lista de datas de sess\u00e3o.
#'
#' @param data_sessao Um vetor contendo as datas das sess\u00f5es no formato "AAAA-MM-DD".
#' @return Um data frame contendo os dados de vota\u00e7\u00e3o, incluindo c\u00f3digo de vota\u00e7\u00e3o, data e hora, partido e voto.
#' @examples
#' anos <- c(2022, 2023)
#' dados_votacoes <- extrair_votacoes_por_ano(anos)
#' dados_votacao <- coletar_orientacao_votacao(head(dados_votacoes$data_sessao))
#' @importFrom xml2 read_xml xml_text xml_find_all
#' @importFrom dplyr bind_rows
#' @export
coletar_orientacao_votacao <- function(data_sessao) {
  # Inicializar uma lista para armazenar os resultados
  resultados <- list()

  # Percorrer cada data de sess\u00e3o
  for (sessao in data_sessao) {
    tryCatch({
      # Formatar a data da sess\u00e3o no formato AAAAMMDD
      data_sessao_formatada <- format(as.Date(sessao), "%Y%m%d")

      # Criar a URL com base na data formatada
      url <- paste0("https://legis.senado.leg.br/dadosabertos/plenario/votacao/orientacaoBancada/", data_sessao_formatada)

      # Ler o XML da URL
      xml_data <- read_xml(url)

      # Extrair os c\u00f3digos de vota\u00e7\u00e3o
      codigos_votacao <- xml_text(xml_find_all(xml_data, ".//codigoVotacaoSve"))

      # Verificar se foram encontrados c\u00f3digos de vota\u00e7\u00e3o
      if (length(codigos_votacao) == 0) {
        cat("Nenhum c\u00f3digo de vota\u00e7\u00e3o encontrado para a sess\u00e3o em", sessao, "\n")
        next
      }

      # Percorrer cada c\u00f3digo de vota\u00e7\u00e3o
      for (codigo_votacao in codigos_votacao) {
        # Verificar se h\u00e1 orienta\u00e7\u00f5es de lideran\u00e7a dispon\u00edveis
        orientacoes_nodes <- xml_find_all(xml_data, paste0(".//codigoVotacaoSve[text() = '", codigo_votacao, "']/following-sibling::orientacoesLideranca"))

        if (length(orientacoes_nodes) > 0) {
          # Extrair os dados das orienta\u00e7\u00f5es de lideran\u00e7a
          orientacoes <- data.frame(
            codigo_votacao = rep(codigo_votacao, length(orientacoes_nodes)),
            data_hora = xml_text(xml_find_all(orientacoes_nodes, ".//dataHora")),
            partido = xml_text(xml_find_all(orientacoes_nodes, ".//partido")),
            voto = xml_text(xml_find_all(orientacoes_nodes, ".//voto")),
            stringsAsFactors = FALSE
          )

          # Adicionar as orienta\u00e7\u00f5es ao resultado
          resultados[[length(resultados) + 1]] <- orientacoes
        } else {
          # Caso n\u00e3o haja orienta\u00e7\u00f5es de lideran\u00e7a, marcar como vota\u00e7\u00e3o secreta
          resultados[[length(resultados) + 1]] <- data.frame(
            codigo_votacao = codigo_votacao,
            data_hora = NA,
            partido = NA,
            voto = "Vota\u00e7\u00e3o secreta",
            stringsAsFactors = FALSE
          )
        }
      }
    }, error = function(e) {
      cat("Erro ao processar a sess\u00e3o em", sessao, ":", conditionMessage(e), "\n")
    })
  }

  # Combinar todos os resultados em um \u00fanico data frame
  dados_votacao <- bind_rows(resultados)

  return(dados_votacao)
}




