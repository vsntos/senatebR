% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/info_materias_assuntos.R
\name{info_materia_temas}
\alias{info_materia_temas}
\title{Lista de Assuntos}
\usage{
info_materia_temas(
  url = "https://legis.senado.leg.br/dadosabertos/dados/ListaAssuntos.xml"
)
}
\arguments{
\item{url}{URL da API a ser consultada
Esta fun\u00e7\u00e3o realiza o scraping de um XML contendo informa\u00e7\u00f5es sobre assuntos legislativos do Senado Federal do Brasil.}
}
\value{
Um dataframe contendo os detalhes dos assuntos legislativos.
O dataframe possui as seguintes colunas:
\describe{
  \item{Codigo}{C\u00f3digo do assunto.}
  \item{AssuntoGeral}{Assunto geral ao qual o assunto pertence.}
  \item{AssuntoEspecifico}{Assunto espec\u00edfico.}
  \item{DataInicio}{Data de in\u00edcio da validade do assunto.}
  \item{DataFim}{Data de t\u00e9rmino da validade do assunto, se aplic\u00e1vel.}
}
}
\description{
Lista de Assuntos
}
\examples{
df_assuntos <- info_materia_temas()

}
