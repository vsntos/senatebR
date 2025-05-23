% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/extrair_mandatos.R
\name{processar_xml_mandatos}
\alias{processar_xml_mandatos}
\title{Processar XMLs de Mandatos de Senadores}
\usage{
processar_xml_mandatos(codigos)
}
\arguments{
\item{codigos}{Um vetor de c\u00f3digos de senadores para os quais os dados de mandatos ser\u00e3o obtidos.}
}
\value{
Um dataframe contendo os dados dos mandatos dos senadores especificados. Cada linha do dataframe
        representa um mandato e inclui informa\u00e7\u00f5es como o c\u00f3digo do mandato, a unidade federativa, e as datas
        de in\u00edcio e fim das legislaturas.
}
\description{
Esta fun\u00e7\u00e3o processa os XMLs dispon\u00edveis na URL do Senado para obter dados dos mandatos de m\u00faltiplos senadores.
Para cada c\u00f3digo de senador fornecido, a fun\u00e7\u00e3o faz o download e a an\u00e1lise do XML correspondente,
extraindo informa\u00e7\u00f5es sobre os mandatos do senador e combinando-os em um \u00fanico dataframe.
}
\examples{
\dontrun{
df_mandatos_senadores <- processar_xml_mandatos(c("5322", "1234"))
}
}
