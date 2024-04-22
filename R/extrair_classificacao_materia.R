#' Extrair as classificações de matéria de uma URL específica
#'
#' Esta função realiza o scraping de uma página XML contendo informações sobre as classificações de matéria e extrai os dados relevantes.
#'
#' @importFrom xml2 read_xml xml_find_all xml_text xml_find_first
#' @export
#' @examples
#' df_classificacao_materias <- extrair_classificacoes_materia()
extrair_classificacoes_materia <- function(url = "https://legis.senado.leg.br/dadosabertos/dados/ListaClassificacoesMateria.xml") {
  # Faça o download e analise o XML
  doc <- xml2::read_xml(url)

  # Extrair os dados das classes de matéria
  classes <- xml2::xml_find_all(doc, ".//Classe")

  # Inicializar vetores para armazenar os dados
  codigo <- character()
  nome <- character()
  codigo_classe_pai <- character()
  nivel <- character()
  tree <- character()
  path <- character()

  # Loop sobre as classes para extrair os dados
  for (classe in classes) {
    codigo <- c(codigo, xml2::xml_text(xml2::xml_find_first(classe, ".//codigo")))
    nome <- c(nome, xml2::xml_text(xml2::xml_find_first(classe, ".//nome")))
    codigo_classe_pai <- c(codigo_classe_pai, xml2::xml_text(xml2::xml_find_first(classe, ".//codigoClassePai")))
    nivel <- c(nivel, xml2::xml_text(xml2::xml_find_first(classe, ".//nivel")))
    tree <- c(tree, xml2::xml_text(xml2::xml_find_first(classe, ".//tree")))
    path <- c(path, xml2::xml_text(xml2::xml_find_first(classe, ".//path")))
  }

  # Criar um dataframe com os dados
  dados <- data.frame(
    CodigoClasse = codigo,
    NomeClasse = nome,
    CodigoClassePai = codigo_classe_pai,
    Nivel = nivel,
    Tree = tree,
    Path = path,
    stringsAsFactors = FALSE
  )

  return(dados)
}

