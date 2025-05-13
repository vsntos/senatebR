#' Extra\u00e7\u00e3o de Dados de Reuni\u00e3o
#'
#' Esta fun\u00e7\u00e3o extrai dados de uma ou mais reuni\u00f5es com base nos c\u00f3digos fornecidos.
#'
#' @param codigo_reuniao Vetor de c\u00f3digos de reuni\u00e3o (num\u00e9rico ou character).
#'
#' @return Um dataframe contendo informa\u00e7\u00f5es das reuni\u00f5es e respectivas notas taquigr\u00e1ficas.
#'
#' @examples
#' info_dados_reuniao_nota(c(1, 2, 3))
#'
#' @import httr
#' @import xml2
#' @import dplyr
#' @export
info_dados_reuniao_nota <- function(codigo_reuniao) {
  stopifnot(is.vector(codigo_reuniao))

  df_final <- data.frame(stringsAsFactors = FALSE)

  for (codigo in codigo_reuniao) {
    url_nota_taquigrafica <- paste0("https://legis.senado.leg.br/dadosabertos/taquigrafia/notas/reuniao/", codigo)

    response_xml <- httr::GET(url_nota_taquigrafica)

    if (httr::status_code(response_xml) >= 200 && httr::status_code(response_xml) < 300) {
      xml_file <- xml2::read_xml(httr::content(response_xml, "text", encoding = "UTF-8"))

      dados_reuniao <- xml2::xml_find_first(xml_file, ".//dadosReuniao")

      if (!is.null(dados_reuniao)) {
        dados_reuniao_df <- data.frame(
          nomesComissoes = xml2::xml_text(xml2::xml_find_first(dados_reuniao, ".//nomesComissoes")),
          numeroCom = xml2::xml_text(xml2::xml_find_first(dados_reuniao, ".//numeroCom")),
          siglasComissoes = xml2::xml_text(xml2::xml_find_first(dados_reuniao, ".//siglasComissoes")),
          data = xml2::xml_text(xml2::xml_find_first(xml_file, ".//data")),
          numero = xml2::xml_text(xml2::xml_find_first(xml_file, ".//numero")),
          stringsAsFactors = FALSE
        )

        dados_xml <- xml2::xml_find_all(xml_file, ".//quartos") %>%
          purrr::map_df(~ {
            data.frame(
              codigo = xml2::xml_text(xml2::xml_find_first(.x, ".//codigo")),
              dataInicio = xml2::xml_text(xml2::xml_find_first(.x, ".//dataInicio")),
              dataFim = xml2::xml_text(xml2::xml_find_first(.x, ".//dataFim")),
              sequencia = xml2::xml_text(xml2::xml_find_first(.x, ".//sequencia")),
              etapa = xml2::xml_text(xml2::xml_find_first(.x, ".//etapa")),
              texto = xml2::xml_text(xml2::xml_find_first(.x, ".//texto")),
              linkAudio = xml2::xml_text(xml2::xml_find_first(.x, ".//linkAudio")),
              stringsAsFactors = FALSE
            )
          })

        df_final <- dplyr::bind_rows(df_final, dplyr::bind_cols(dados_reuniao_df, dados_xml))
      } else {
        warning(paste("Dados de reuni\u00e3o n\u00e3o encontrados para o c\u00f3digo", codigo))
      }
    } else {
      warning(paste("Falha na requisi\u00e7\u00e3o para o c\u00f3digo", codigo, "- Status:", httr::status_code(response_xml)))
    }
  }

  return(df_final)
}
