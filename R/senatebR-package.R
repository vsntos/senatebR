#' senatebR: Funções para coleta de dados do Senado Federal Brasileiro
#'
#' O pacote \pkg{senatebR} oferece acesso programático às informações do
#' Senado Federal via API oficial e web scraping. As funções cobrem votações,
#' pronunciamentos, comissões, matérias legislativas, vetos, medidas provisórias
#' e dados biográficos dos senadores.
#'
#' @section Principais categorias de funções:
#'
#' \strong{Senadores e mandatos:}
#' \itemize{
#'   \item \code{\link{obter_dados_senadores_legislatura}} — lista senadores por legislatura
#'   \item \code{\link{get_afastados}} — senadores afastados
#'   \item \code{\link{dados_academicos}} — formação acadêmica
#'   \item \code{\link{processar_xml_mandatos}} — dados de mandato
#'   \item \code{\link{processar_xml_profissoes}} — profissões declaradas
#' }
#'
#' \strong{Votações:}
#' \itemize{
#'   \item \code{\link{extrair_votacoes_por_ano}} — votações por ano
#'   \item \code{\link{extrair_votacoes_nominais_por_ano}} — votos nominais por ano
#'   \item \code{\link{coletar_votacoes_multiplos}} — votos de múltiplos senadores
#'   \item \code{\link{coletar_orientacao_votacao}} — orientação de bancada
#' }
#'
#' \strong{Pronunciamentos e discursos:}
#' \itemize{
#'   \item \code{\link{extrair_discursos}} — discursos no plenário
#'   \item \code{\link{extrair_pronunciamentos_multi}} — pronunciamentos de múltiplos senadores
#'   \item \code{\link{extrair_notas_taquigraficas}} — notas taquigráficas
#'   \item \code{\link{processar_xml_apartes}} — apartes parlamentares
#' }
#'
#' \strong{Comissões:}
#' \itemize{
#'   \item \code{\link{dados_comissoes}} — lista de comissões
#'   \item \code{\link{obter_dados_comissoes_parlamentares}} — composição via API
#'   \item \code{\link{extrair_dados_comissao_senador}} — participação por senador
#'   \item \code{\link{info_dados_reuniao_comissao}} — reuniões de comissão
#'   \item \code{\link{info_dados_reuniao_nota}} — notas de reunião
#'   \item \code{\link{processar_xml_liderancas}} — lideranças
#' }
#'
#' \strong{Matérias legislativas:}
#' \itemize{
#'   \item \code{\link{materias_legislatura_atual}} — matérias da legislatura atual
#'   \item \code{\link{info_materia_temas}} — temas e assuntos
#'   \item \code{\link{info_atualizacao_materias}} — últimas atualizações
#'   \item \code{\link{extrair_situacoes_tramitacao}} — situações de tramitação
#'   \item \code{\link{extrair_classificacoes_materia}} — classificações
#'   \item \code{\link{coletar_autorias_parlamentares}} — autorias
#'   \item \code{\link{dados_relatorias_parlamentares}} — relatorias
#' }
#'
#' \strong{Vetos e Medidas Provisórias:}
#' \itemize{
#'   \item \code{\link{info_vetos}} — lista de vetos
#'   \item \code{\link{dados_vetos}} — dados detalhados de vetos
#'   \item \code{\link{extrair_detalhes_vetos}} — detalhes dos vetos
#'   \item \code{\link{coletar_medidas_provisorias_em_tramitacao}} — MPs em tramitação
#'   \item \code{\link{coletar_medidas_provisorias_encerradas}} — MPs encerradas
#' }
#'
#' \strong{Outros:}
#' \itemize{
#'   \item \code{\link{info_agenda}} — agenda do Congresso
#'   \item \code{\link{obter_dados_partidos}} — partidos políticos
#'   \item \code{\link{extrair_siglas_ativas}} — siglas partidárias ativas
#'   \item \code{\link{extrair_tipos_comparecimento}} — tipos de comparecimento
#'   \item \code{\link{extrair_tipos_decisao}} — tipos de decisão
#' }
#'
#' @author Vinicius Santos \email{santos.vinicius18@@gmail.com}
#'
#' @docType package
#' @name senatebR-package
#' @aliases senatebR
"_PACKAGE"
