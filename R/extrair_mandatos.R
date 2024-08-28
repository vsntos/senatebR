#' Processar XMLs de Mandatos de Senadores
#'
#' Esta função processa os XMLs disponíveis na URL do Senado para obter dados dos mandatos de múltiplos senadores.
#' Para cada código de senador fornecido, a função faz o download e a análise do XML correspondente,
#' extraindo informações sobre os mandatos do senador e combinando-os em um único dataframe.
#'
#' @param codigos Um vetor de códigos de senadores para os quais os dados de mandatos serão obtidos.
#' @return Um dataframe contendo os dados dos mandatos dos senadores especificados. Cada linha do dataframe
#'         representa um mandato e inclui informações como o código do mandato, a unidade federativa, e as datas
#'         de início e fim das legislaturas.
#' @examples
#' \dontrun{
#' df_mandatos_senadores <- processar_xml_mandatos(c("5322", "1234"))
#' }
#' @import xml2
#' @import dplyr
#' @import purrr
#' @export
processar_xml_mandatos <- function(codigos) {
  # Função para obter e processar o XML de um senador específico
  processar_xml_senador <- function(codigo) {
    url <- paste0("https://legis.senado.leg.br/dadosabertos/senador/", codigo, "/mandatos")

    # Ler o XML da URL
    xml_data <- tryCatch({
      read_xml(url)
    }, error = function(e) {
      message("Erro ao ler o XML para o código: ", codigo)
      return(NULL)
    })

    if (is.null(xml_data)) {
      return(NULL)
    }

    # Extrair o código e nome do parlamentar
    codigo_senador <- xml_text(xml_find_first(xml_data, "//Codigo"))
    nome_senador <- xml_text(xml_find_first(xml_data, "//Nome"))

    # Extrair os dados dos mandatos
    mandatos_nodes <- xml_find_all(xml_data, "//Mandato")

    # Função auxiliar para extrair dados de cada mandato
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

    # Aplicar a função auxiliar a todos os nós de mandato
    mandatos_list <- lapply(mandatos_nodes, extrair_dados_mandato)

    # Criar o dataframe a partir da lista de mandatos
    df_mandatos <- bind_rows(mandatos_list)

    return(df_mandatos)
  }

  # Aplicar a função para cada código de senador e combinar os resultados
  mandatos_data_list <- map(codigos, processar_xml_senador)

  # Filtrar resultados nulos e combinar em um único dataframe
  df_mandatos_all <- bind_rows(mandatos_data_list)

  return(df_mandatos_all)
}
