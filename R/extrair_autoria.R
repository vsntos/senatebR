#' Coletar Dados de Autoria de Vários Senadores
#'
#' Esta função coleta dados de autoria de matérias para uma lista de senadores a partir da URL fornecida.
#'
#' @param codigos_senadores Vetor de códigos dos senadores para os quais os dados de autoria serão coletados.
#' @return Um dataframe contendo as informações de autoria para todos os senadores fornecidos.
#' @export
#' @import xml2 dplyr
#' @examples
#' # Exemplo de uso com códigos de senadores
#' codigos <- c(4981, 1234)
#' dados <- coletar_dados_autorias(codigos)
#' print(dados)
coletar_dados_autorias <- function(codigos_senadores) {
  # Função auxiliar para baixar e processar XML para um senador
  processar_senador <- function(codigo) {
    url <- paste0("https://legis.senado.leg.br/dadosabertos/senador/", codigo, "/autorias")
    xml <- read_xml(url)

    autorias <- xml %>%
      xml_find_all("//Autoria") %>%
      map_df(~ {
        data.frame(
          CodigoMateria = xml_text(xml_find_first(.x, ".//Codigo")),
          IdentificacaoProcesso = xml_text(xml_find_first(.x, ".//IdentificacaoProcesso")),
          DescricaoIdentificacao = xml_text(xml_find_first(.x, ".//DescricaoIdentificacao")),
          Sigla = xml_text(xml_find_first(.x, ".//Sigla")),
          Numero = xml_text(xml_find_first(.x, ".//Numero")),
          Ano = xml_text(xml_find_first(.x, ".//Ano")),
          Ementa = xml_text(xml_find_first(.x, ".//Ementa")),
          Data = xml_text(xml_find_first(.x, ".//Data")),
          IndicadorAutorPrincipal = xml_text(xml_find_first(.x, ".//IndicadorAutorPrincipal")),
          IndicadorOutrosAutores = xml_text(xml_find_first(.x, ".//IndicadorOutrosAutores"))
        )
      })

    autorias <- autorias %>%
      mutate(
        IndicadorAutorPrincipal = ifelse(IndicadorAutorPrincipal == "Sim", TRUE, FALSE),
        IndicadorOutrosAutores = ifelse(IndicadorOutrosAutores == "Sim", TRUE, FALSE),
        Data = as.Date(Data, format = "%Y-%m-%d"),
        CodigoSenador = codigo
      )

    return(autorias)
  }

  # Coletar dados para todos os senadores fornecidos
  dados_total <- lapply(codigos_senadores, processar_senador) %>%
    bind_rows()

  return(dados_total)
}

df_autoria_senadores <- coletar_dados_autorias(df_senadores_atuais$CodigoParlamentar)
