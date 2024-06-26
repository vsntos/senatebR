% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/info_votacoes.R
\name{extrair_votacoes_por_ano}
\alias{extrair_votacoes_por_ano}
\title{Extrair informações de votações do plenário do Senado Federal por ano}
\usage{
extrair_votacoes_por_ano(anos)
}
\arguments{
\item{anos}{Um vetor contendo os anos para os quais se deseja extrair as informações de votações.}
}
\value{
Um dataframe contendo as informações de votações para todos os anos especificados, incluindo a variável 'ano'.
}
\description{
Esta função extrai as informações de votações do plenário do Senado Federal para os anos especificados.
}
\examples{
# Exemplo de uso
anos <- c(2018, 2019, 2020)
dados_votacoes <- extrair_votacoes_por_ano(anos)
head(dados_votacoes)

}
