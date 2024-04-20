#' Lista de Matérias Atualizadas
#'
#' Esta função realiza o scraping de um XML contendo informações sobre matérias legislativas atualizadas recentemente no Senado Federal do Brasil.
#' Os dados extraídos incluem código da matéria, sigla e nome da casa legislativa, tipo e descrição do subtipo da matéria, número e ano da matéria, descrição do objetivo do processo,
#' descrição da matéria, indicador de tramitação, identificação do processo, ementa da matéria, indexação da matéria, indicador complementar, datas de apresentação e leitura da matéria,
#' classificações da matéria (se disponível), e informações sobre atualizações recentes da matéria.
#'
#' @param url URL do XML contendo os dados das matérias atualizadas. Por padrão, é usado o URL fornecido pelo Senado Federal.
#'
#' @return Um dataframe contendo os detalhes das matérias legislativas atualizadas recentemente.
#'
#' @examples
#' df_materias_atualizacao = info_atualizacao_materias()
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

  # Determinar o comprimento máximo dos vetores
  max_length <- max(length(codigo), length(sigla_casa), length(nome_casa), length(tipo_subtipo), length(numero), length(ano), length(objetivo_processo),
                    length(descricao_materia), length(indicador_tramitando), length(processo), length(ementa), length(indexacao),
                    length(indicador_complementar), length(data_apresentacao), length(data_leitura), length(data_ultima_atualizacao))

  # Preencher vetores com valores NA para ter o mesmo comprimento
  codigo <- rep_len(codigo, max_length)
  sigla_casa <- rep_len(sigla_casa, max_length)
  nome_casa <- rep_len(nome_casa, max_length)
  tipo_subtipo <- rep_len(tipo_subtipo, max_length)
  numero <- rep_len(numero, max_length)
  ano <- rep_len(ano, max_length)
  objetivo_processo <- rep_len(objetivo_processo, max_length)
  descricao_materia <- rep_len(descricao_materia, max_length)
  indicador_tramitando <- rep_len(indicador_tramitando, max_length)
  processo <- rep_len(processo, max_length)
  ementa <- rep_len(ementa, max_length)
  indexacao <- rep_len(indexacao, max_length)
  indicador_complementar <- rep_len(indicador_complementar, max_length)
  data_apresentacao <- rep_len(data_apresentacao, max_length)
  data_leitura <- rep_len(data_leitura, max_length)
  data_ultima_atualizacao <- rep_len(data_ultima_atualizacao, max_length)

  # Crie um dataframe com os dados
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




