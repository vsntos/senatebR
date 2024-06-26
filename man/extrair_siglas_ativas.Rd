% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/extrair_siglas_ativas.R
\name{extrair_siglas_ativas}
\alias{extrair_siglas_ativas}
\title{Extrair as siglas ativas de matérias de uma URL específica}
\usage{
extrair_siglas_ativas(
  url = "https://legis.senado.leg.br/dadosabertos/dados/ListaSiglas.xml"
)
}
\arguments{
\item{url}{A URL do XML que contém as siglas ativas de matérias.}
}
\value{
Um dataframe contendo as siglas ativas de matérias.
}
\description{
Esta função realiza o scraping de uma página XML contendo informações sobre as siglas ativas de matérias e extrai os dados relevantes.
}
\examples{
extrair_siglas_ativas()
}
