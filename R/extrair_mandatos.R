#' Processar XMLs de Mandatos de Senadores
#'
#' Esta fun\u00e7\u00e3o processa os XMLs dispon\u00edveis na URL do Senado para obter dados dos mandatos de m\u00faltiplos senadores.
#' Para cada c\u00f3digo de senador fornecido, a fun\u00e7\u00e3o faz o download e a an\u00e1lise do XML correspondente,
#' extraindo informa\u00e7\u00f5es sobre os mandatos do senador e combinando-os em um \u00fanico dataframe.
#'
#' @param codigos Um vetor de c\u00f3digos de senadores para os quais os dados de mandatos ser\u00e3o obtidos.
#' @return Um dataframe contendo os dados dos mandatos dos senadores especificados. Cada linha do dataframe
#'         representa um mandato e inclui informa\u00e7\u00f5es como o c\u00f3digo do mandato, a unidade federativa, e as datas
#'         de in\u00edcio e fim das legislaturas.
#' @examples
#' \dontrun{
#' df_mandatos_senadores <- processar_xml_mandatos(c("5322", "1234"))
#' }
#' @import xml2
#' @import dplyr
#' @import purrr
#' @export
processar_xml_mandatos <- function(codigos) {
  # Fun\u00e7\u00e3o para obter e processar o XML de um senador espec\u00edfico
  processar_xml_senador <- function(codigo) {
    url <- paste0("https://legis.senado.leg.br/dadosabertos/senador/", codigo, "/mandatos")

    # Ler o XML da URL
    xml_data <- tryCatch({
      read_xml(url)
    }, error = function(e) {
      message("Erro ao ler o XML para o c\u00f3digo: ", codigo)
      return(NULL)
    })

    if (is.null(xml_data)) {
      return(NULL)
    }

    # Extrair o c\u00f3digo e nome do parlamentar
    codigo_senador <- xml_text(xml_find_first(xml_data, "//Codigo"))
    nome_senador <- xml_text(xml_find_first(xml_data, "//Nome"))

    # Extrair os dados dos mandatos
    mandatos_nodes <- xml_find_all(xml_data, "//Mandato")

    # Fun\u00e7\u00e3o auxiliar para extrair dados de cada mandato
    extrair_dados_mandato <- function(node) {
      list(
        CodigoSenador = codigo_senador,
        NomeSenador = nome_senador,
        CodigoMandato = xml_text(xml_find_first(node, ".//CodigoMandato")),
        UfParlamentar = xml_text(xml_find_first(node, ".//UfParlamentar")),
        NumeroLegislatura1 = xml_text(xml_find_first(node, ".//PrimeiraLegislaturaDoMandato/NumeroLegislatura")),
        DataInicioLegislatura1 = xml_text(xml_find_first(node, ".//PrimeiraLegislaturaDoMandato/DataInicio")),
        DataFimLegislatura1 = xml_text(xml_find_first(node, ".//PrimeiraLegislaturaDoMandato/DataFim")),
        NumeroLegislatura2 = xml_text(xml_find_first(node, ".//SegundaLegislaturaDoMandato/NumeroLegislatura")),
        DataInicioLegislatura2 = xml_text(xml_find_first(node, ".//SegundaLegislaturaDoMandato/DataInicio")),
        DataFimLegislatura2 = xml_text(xml_find_first(node, ".//SegundaLegislaturaDoMandato/DataFim")),
        DescricaoParticipacao = xml_text(xml_find_first(node, ".//DescricaoParticipacao")),
        Suplentes = paste(xml_text(xml_find_all(node, ".//Suplentes/Suplente/NomeParlamentar")), collapse = "; "),
        Exercicios = paste(xml_text(xml_find_all(node, ".//Exercicios/Exercicio/DataInicio")), collapse = "; "),
        CausaAfastamento = paste(xml_text(xml_find_all(node, ".//Exercicios/Exercicio/DescricaoCausaAfastamento")), collapse = "; ")
      )
    }

    # Aplicar a fun\u00e7\u00e3o auxiliar a todos os n\u00f3s de mandato
    mandatos_list <- lapply(mandatos_nodes, extrair_dados_mandato)

    # Criar o dataframe a partir da lista de mandatos
    df_mandatos <- bind_rows(mandatos_list)

    return(df_mandatos)
  }

  # Aplicar a fun\u00e7\u00e3o para cada c\u00f3digo de senador e combinar os resultados
  mandatos_data_list <- map(codigos, processar_xml_senador)

  # Filtrar resultados nulos e combinar em um \u00fanico dataframe
  df_mandatos_all <- bind_rows(mandatos_data_list)

  return(df_mandatos_all)
}
