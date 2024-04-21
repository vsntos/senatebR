#' Extração de Dados de Reunião
#'
#' Esta função extrai dados de uma reunião com base no código fornecido.
#'
#' @param codigo_reuniao Vetor de códigos de reunião.
#'
#' @return Um dataframe contendo informações da reunião.
#'
#' @examples
#' # Exemplo de uso
#' codigo_reuniao <- df_reunioes$codigo
#' df_final <- info_dados_reuniao(codigo_reuniao)
#' print(df_final)
#'
#' @import httr
#' @import xml2
#' @import dplyr
#'
#' @export
info_dados_reuniao <- function(codigo_reuniao) {
  # Inicialize um dataframe vazio para armazenar os resultados
  df_final <- data.frame(stringsAsFactors = FALSE)

  # Itere sobre cada código de reunião
  for (codigo in codigo_reuniao) {
    # URL do XML
    url_nota_taquigrafica <- paste0("https://legis.senado.leg.br/dadosabertos/taquigrafia/notas/reuniao/", codigo)

    # Faça a requisição GET
    response_xml <- httr::GET(url_nota_taquigrafica)

    # Verifique se a requisição foi bem-sucedida (código de status na faixa 2xx)
    if (httr::status_code(response_xml) >= 200 && httr::status_code(response_xml) < 300) {
      # Lendo o XML
      xml_file <- xml2::read_xml(httr::content(response_xml, "text"))

      # Verifique se o XML foi lido corretamente
      if (length(xml_file) == 0) {
        warning(paste("Erro ao ler o XML para o código", codigo, ". O conteúdo está vazio ou o XML não está no formato esperado."))
      } else {
        # Extraindo as informações
        dados_reuniao <- xml2::xml_find_first(xml_file, ".//dadosReuniao")

        # Extraindo elementos e atributos individualmente
        nomesComissoes <- xml2::xml_text(xml2::xml_find_first(dados_reuniao, ".//nomesComissoes"))
        numeroCom <- xml2::xml_text(xml2::xml_find_first(dados_reuniao, ".//numeroCom"))
        siglasComissoes <- xml2::xml_text(xml2::xml_find_first(dados_reuniao, ".//siglasComissoes"))
        data <- xml2::xml_text(xml2::xml_find_first(xml_file, ".//data"))
        numero <- xml2::xml_text(xml2::xml_find_first(xml_file, ".//numero"))

        dados_reuniao_df <- data.frame(
          nomesComissoes = nomesComissoes,
          numeroCom = numeroCom,
          siglasComissoes = siglasComissoes,
          data = data,
          numero = numero,
          stringsAsFactors = FALSE
        )

        # Extraindo informações da seção "quartos" como antes
        dados_xml <- xml2::xml_find_all(xml_file, ".//quartos") %>%
          purrr::map_df(~{
            # Adicionando verificações para lidar com nós vazios
            codigo <- xml2::xml_text(xml2::xml_find_first(.x, ".//codigo"))
            dataInicio <- xml2::xml_text(xml2::xml_find_first(.x, ".//dataInicio"))
            dataFim <- xml2::xml_text(xml2::xml_find_first(.x, ".//dataFim"))
            sequencia <- xml2::xml_text(xml2::xml_find_first(.x, ".//sequencia"))
            etapa <- xml2::xml_text(xml2::xml_find_first(.x, ".//etapa"))
            texto <- xml2::xml_text(xml2::xml_find_first(.x, ".//texto"))
            linkAudio <- xml2::xml_text(xml2::xml_find_first(.x, ".//linkAudio"))

            data.frame(
              codigo = codigo,
              dataInicio = dataInicio,
              dataFim = dataFim,
              sequencia = sequencia,
              etapa = etapa,
              texto = texto,
              linkAudio = linkAudio,
              stringsAsFactors = FALSE
            )
          })

        # Mesclando os dataframes
        df_final <- dplyr::bind_rows(df_final, dados_reuniao_df, dados_xml)
      }
    } else {
      # Se a requisição falhar, imprima uma mensagem de erro
      warning(paste("Falha na requisição para o código", codigo, ". Código de status:", httr::status_code(response_xml)))
    }
  }

  # Retornando o dataframe final
  return(df_final)
}
