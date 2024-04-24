#' Lista de Matérias Atualizadas
#'
#' Esta função realiza o scraping de informações sobre matérias legislativas atualizadas recentemente no Senado Federal do Brasil.
#'
#' @return Um dataframe contendo os detalhes das matérias legislativas atualizadas recentemente.
#'
#' @examples
#' df_materias_atualizacao <- info_atualizacao_materias()
#'
#' @importFrom xml2 read_xml xml_find_all xml_text
#' @export
info_atualizacao_materias <- function(url = "https://legis.senado.leg.br/dadosabertos/materia/atualizadas") {
  # Faça o download e analise o XML
  doc <- xml2::read_xml(url)

  # Extraia os dados das matérias
  materias <- xml2::xml_find_all(doc, ".//Materia")

  # Inicialize vetores para armazenar os dados
  codigo <- character()
  sigla_casa <- character()
  nome_casa <- character()
  tipo_subtipo <- character()
  descricao_subtipo <- character()
  numero <- character()
  ano <- character()
  objetivo_processo <- character()
  descricao_materia <- character()
  indicador_tramitando <- character()
  processo <- character()
  ementa <- character()
  indexacao <- character()
  indicador_complementar <- character()
  data_apresentacao <- character()
  data_leitura <- character()
  data_ultima_atualizacao <- character()

  # Loop sobre as matérias para extrair os dados
  for (materia in materias) {
    codigo <- c(codigo, xml2::xml_text(xml2::xml_find_first(materia, ".//CodigoMateria")))
    sigla_casa <- c(sigla_casa, xml2::xml_text(xml2::xml_find_first(materia, ".//SiglaCasaIdentificacaoMateria")))
    nome_casa <- c(nome_casa, xml2::xml_text(xml2::xml_find_first(materia, ".//NomeCasaIdentificacaoMateria")))
    tipo_subtipo <- c(tipo_subtipo, paste(xml2::xml_text(xml2::xml_find_first(materia, ".//SiglaSubtipoMateria")), xml2::xml_text(xml2::xml_find_first(materia, ".//DescricaoSubtipoMateria")), sep = " - "))
    numero <- c(numero, xml2::xml_text(xml2::xml_find_first(materia, ".//NumeroMateria")))
    ano <- c(ano, xml2::xml_text(xml2::xml_find_first(materia, ".//AnoMateria")))
    objetivo_processo <- c(objetivo_processo, xml2::xml_text(xml2::xml_find_first(materia, ".//DescricaoObjetivoProcesso")))
    descricao_materia <- c(descricao_materia, xml2::xml_text(xml2::xml_find_first(materia, ".//DescricaoIdentificacaoMateria")))
    indicador_tramitando <- c(indicador_tramitando, xml2::xml_text(xml2::xml_find_first(materia, ".//IndicadorTramitando")))
    processo <- c(processo, xml2::xml_text(xml2::xml_find_first(materia, ".//IdentificacaoProcesso")))
    ementa <- c(ementa, xml2::xml_text(xml2::xml_find_first(materia, ".//EmentaMateria")))
    indexacao <- c(indexacao, xml2::xml_text(xml2::xml_find_first(materia, ".//IndexacaoMateria")))
    indicador_complementar <- c(indicador_complementar, xml2::xml_text(xml2::xml_find_first(materia, ".//IndicadorComplementar")))
    data_apresentacao <- c(data_apresentacao, xml2::xml_text(xml2::xml_find_first(materia, ".//DataApresentacao")))
    data_leitura <- c(data_leitura, xml2::xml_text(xml2::xml_find_first(materia, ".//DataLeitura")))
    data_ultima_atualizacao <- c(data_ultima_atualizacao, xml2::xml_text(xml2::xml_find_first(materia, ".//DataUltimaAtualizacao")))
  }

  # Criar um dataframe com os dados
  dados <- data.frame(
    CodigoMateria = codigo,
    SiglaCasaIdentificacaoMateria = sigla_casa,
    NomeCasaIdentificacaoMateria = nome_casa,
    TipoSubtipoMateria = tipo_subtipo,
    NumeroMateria = numero,
    AnoMateria = ano,
    DescricaoObjetivoProcesso = objetivo_processo,
    DescricaoIdentificacaoMateria = descricao_materia,
    IndicadorTramitando = indicador_tramitando,
    IdentificacaoProcesso = processo,
    EmentaMateria = ementa,
    IndexacaoMateria = indexacao,
    IndicadorComplementar = indicador_complementar,
    DataApresentacao = data_apresentacao,
    DataLeitura = data_leitura,
    DataUltimaAtualizacao = data_ultima_atualizacao,
    stringsAsFactors = FALSE
  )

  return(dados)
}


