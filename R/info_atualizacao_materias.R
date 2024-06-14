#' Lista de Matérias Atualizadas
#'
#' Esta função realiza o scraping de informações sobre matérias legislativas atualizadas recentemente no Senado Federal do Brasil.
#'
#' @return Um dataframe contendo os detalhes das matérias legislativas atualizadas recentemente.
#' @examples
#' df_materias_atualizacao <- info_atualizacao_materias()
#'
#' @importFrom xml2 read_xml xml_find_all xml_text
#' @export
info_atualizacao_materias <- function(url = "https://legis.senado.leg.br/dadosabertos/materia/atualizadas") {
  tryCatch({
    # Faça o download e analise o XML
    doc <- xml2::read_xml(url)

    # Extraia os dados das matérias
    materias <- xml2::xml_find_all(doc, ".//Materia")

    # Inicialize uma lista para armazenar os dados das matérias
    dados <- list()

    # Loop sobre as matérias para extrair os dados
    for (materia in materias) {
      dados[[length(dados) + 1]] <- list(
        CodigoMateria = xml2::xml_text(xml2::xml_find_first(materia, ".//CodigoMateria")),
        SiglaCasaIdentificacaoMateria = xml2::xml_text(xml2::xml_find_first(materia, ".//SiglaCasaIdentificacaoMateria")),
        NomeCasaIdentificacaoMateria = xml2::xml_text(xml2::xml_find_first(materia, ".//NomeCasaIdentificacaoMateria")),
        TipoSubtipoMateria = paste(xml2::xml_text(xml2::xml_find_first(materia, ".//SiglaSubtipoMateria")), xml2::xml_text(xml2::xml_find_first(materia, ".//DescricaoSubtipoMateria")), sep = " - "),
        NumeroMateria = xml2::xml_text(xml2::xml_find_first(materia, ".//NumeroMateria")),
        AnoMateria = xml2::xml_text(xml2::xml_find_first(materia, ".//AnoMateria")),
        DescricaoObjetivoProcesso = xml2::xml_text(xml2::xml_find_first(materia, ".//DescricaoObjetivoProcesso")),
        DescricaoIdentificacaoMateria = xml2::xml_text(xml2::xml_find_first(materia, ".//DescricaoIdentificacaoMateria")),
        IndicadorTramitando = xml2::xml_text(xml2::xml_find_first(materia, ".//IndicadorTramitando")),
        IdentificacaoProcesso = xml2::xml_text(xml2::xml_find_first(materia, ".//IdentificacaoProcesso")),
        EmentaMateria = xml2::xml_text(xml2::xml_find_first(materia, ".//EmentaMateria")),
        IndexacaoMateria = xml2::xml_text(xml2::xml_find_first(materia, ".//IndexacaoMateria")),
        IndicadorComplementar = xml2::xml_text(xml2::xml_find_first(materia, ".//IndicadorComplementar")),
        DataApresentacao = xml2::xml_text(xml2::xml_find_first(materia, ".//DataApresentacao")),
        DataLeitura = xml2::xml_text(xml2::xml_find_first(materia, ".//DataLeitura")),
        DataUltimaAtualizacao = xml2::xml_text(xml2::xml_find_first(materia, ".//DataUltimaAtualizacao"))
      )
    }

    # Converter a lista em um dataframe
    df_materias <- purrr::map_dfr(dados, as.data.frame, stringsAsFactors = FALSE)

    return(df_materias)
  }, error = function(e) {
    warning(paste("Erro ao tentar extrair dados das matérias atualizadas:", conditionMessage(e)))
    return(NULL)
  })
}



