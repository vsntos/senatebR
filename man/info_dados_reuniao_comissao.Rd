% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/info_reunioes.R
\name{info_dados_reuniao_comissao}
\alias{info_dados_reuniao_comissao}
\title{Extrair dados de reuniões de comissões do Senado}
\usage{
info_dados_reuniao_comissao(codcol, data_inicio, data_fim)
}
\arguments{
\item{codcol}{Vetor contendo os códigos das comissões}

\item{data_inicio}{Data de início no formato "YYYY-MM-DD"}

\item{data_fim}{Data de fim no formato "YYYY-MM-DD"}
}
\value{
Um DataFrame com os dados das reuniões das comissões
}
\description{
Esta função extrai dados de reuniões de comissões do Senado Federal
com base nos códigos das comissões e no intervalo de datas fornecido.
}
\examples{
codcol <- c(54, 38, 2614, 34)
data_inicio <- "2023-01-01"
data_fim <- "2023-12-01"
df_reunioes <- info_dados_reuniao_comissao(codcol, data_inicio, data_fim)

}
