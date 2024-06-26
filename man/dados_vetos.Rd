% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/dados_vetos.R
\name{dados_vetos}
\alias{dados_vetos}
\title{Função para extrair os dados de várias URLs}
\usage{
dados_vetos(urls)
}
\arguments{
\item{urls}{Um vetor de URLs das páginas a serem analisadas.}
}
\value{
Um dataframe contendo os dados extraídos de todas as URLs fornecidas.
Se não houver tabela em alguma das páginas, retorna uma mensagem de aviso.
}
\description{
Esta função realiza o scraping de várias páginas HTML contendo informações sobre vetos do Congresso Nacional
e extrai os dados dos itens vetados.
}
\examples{
urls <- c("https://www.congressonacional.leg.br/materias/vetos/-/veto/detalhe/16110",
          "https://www.congressonacional.leg.br/materias/vetos/-/veto/detalhe/16049",
          "https://www.congressonacional.leg.br/materias/vetos/-/veto/detalhe/16029")
dados <- dados_vetos(urls)
}
