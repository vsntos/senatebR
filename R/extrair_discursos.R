#' Extrai Discursos Parlamentares de um ou mais Senadores
#'
#' Esta função extrai os discursos parlamentares de um ou mais senadores em um intervalo de datas fornecido a partir da API do Senado.
#'
#' @param codigo_senador Um vetor de códigos de senadores. Exemplo: c("5529", "1234").
#' @param data_inicio A data de início do intervalo, no formato "YYYY-MM-DD". Exemplo: "2024-01-01".
#' @param data_fim A data de fim do intervalo, no formato "YYYY-MM-DD". Exemplo: "2024-06-30".
#'
#' @return Um dataframe com os discursos parlamentares, contendo informações como código do discurso, data, partido, UF, e resumo.
#' @import xml2
#' @import dplyr
#' @export
#'
#' @examples
#' # Exemplo de uso
#' discursos_df <- extrair_discursos(codigo_senador = c("5529"), data_inicio = "2024-01-01", data_fim = "2024-06-30")
extrair_discursos <- function(codigo_senador, data_inicio, data_fim) {

  library(xml2)
  library(dplyr)

  # Função para extrair dados dos discursos
  extract_discursos <- function(xml_data) {
    if (is.null(xml_data)) return(tibble())  # Retorna um tibble vazio se xml_data for NULL

    discursos <- xml_find_all(xml_data, ".//Pronunciamento")

    tibble(
      CodigoPronunciamento = xml_text(xml_find_all(discursos, ".//CodigoPronunciamento")),
      DataPronunciamento = xml_text(xml_find_all(discursos, ".//DataPronunciamento")),
      SiglaPartidoParlamentarNaData = xml_text(xml_find_all(discursos, ".//SiglaPartidoParlamentarNaData")),
      UfParlamentarNaData = xml_text(xml_find_all(discursos, ".//UfParlamentarNaData")),
      SiglaCasaPronunciamento = xml_text(xml_find_all(discursos, ".//SiglaCasaPronunciamento")),
      NomeCasaPronunciamento = xml_text(xml_find_all(discursos, ".//NomeCasaPronunciamento")),
      TextoResumo = xml_text(xml_find_all(discursos, ".//TextoResumo")),
      Indexacao = xml_text(xml_find_all(discursos, ".//Indexacao")),
      UrlTexto = xml_text(xml_find_all(discursos, ".//UrlTexto")),
      UrlTextoBinario = xml_text(xml_find_all(discursos, ".//UrlTextoBinario")),
      DataSessao = xml_text(xml_find_all(discursos, ".//SessaoPlenaria/DataSessao")),
      HoraInicioSessao = xml_text(xml_find_all(discursos, ".//SessaoPlenaria/HoraInicioSessao"))
    )
  }

  # Inicializar um dataframe vazio para combinar os resultados
  discursos_df <- tibble()

  # Loop para cada código de senador
  for (codigo in codigo_senador) {
    # Montar a URL com o código do senador e intervalo de datas
    url <- sprintf("https://legis.senado.leg.br/dadosabertos/senador/%s/discursos?dataInicio=%s&dataFim=%s",
                   codigo, data_inicio, data_fim)

    # Ler o XML da URL
    xml_data <- tryCatch({
      read_xml(url)
    }, error = function(e) {
      warning(sprintf("Erro ao ler dados para o código do senador %s: %s", codigo, e$message))
      return(NULL)
    })

    # Verificar se xml_data não é NULL e extrair dados
    if (!is.null(xml_data)) {
      # Extrair e combinar os dados
      discursos_df <- bind_rows(discursos_df, extract_discursos(xml_data))
    }
  }

  return(discursos_df)
}
