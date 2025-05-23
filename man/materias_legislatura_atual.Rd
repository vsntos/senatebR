% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/info_materia_legislatura_atual.R
\name{materias_legislatura_atual}
\alias{materias_legislatura_atual}
\title{Lista de Mat\u00e9rias da Legislatura Atual}
\usage{
materias_legislatura_atual()
}
\value{
Um dataframe contendo os detalhes das mat\u00e9rias legislativas.
O dataframe possui as seguintes colunas:
\describe{
  \item{CodigoMateria}{C\u00f3digo da mat\u00e9ria.}
  \item{SiglaCasaIdentificacaoMateria}{Sigla da casa legislativa identificadora da mat\u00e9ria.}
  \item{NomeCasaIdentificacaoMateria}{Nome da casa legislativa identificadora da mat\u00e9ria.}
  \item{SiglaSubtipoMateria}{Sigla do subtipo da mat\u00e9ria.}
  \item{NumeroMateria}{N\u00famero da mat\u00e9ria.}
  \item{AnoMateria}{Ano da mat\u00e9ria.}
  \item{DescricaoIdentificacaoMateria}{Descri\u00e7\u00e3o da identifica\u00e7\u00e3o da mat\u00e9ria.}
  \item{IndicadorTramitando}{Indicador de tramita\u00e7\u00e3o da mat\u00e9ria.}
  \item{IdentificacaoProcesso}{Identifica\u00e7\u00e3o do processo da mat\u00e9ria.}
}
}
\description{
Esta fun\u00e7\u00e3o realiza o scraping de um XML contendo informa\u00e7\u00f5es sobre mat\u00e9rias legislativas da legislatura atual do Senado Federal do Brasil.
Os dados extra\u00eddos incluem o c\u00f3digo da mat\u00e9ria, sigla e nome da casa legislativa, subtipo da mat\u00e9ria, n\u00famero e ano, descri\u00e7\u00e3o, indica\u00e7\u00e3o de tramita\u00e7\u00e3o e identifica\u00e7\u00e3o do processo.
}
\examples{
df_materias <- materias_legislatura_atual()
}
