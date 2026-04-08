# Extrair os tipos de decisão de uma URL específica

Esta função realiza o scraping sobre os tipos de decisão e extrai os
dados relevantes.

## Usage

``` r
extrair_tipos_decisao(
  url = "https://legis.senado.leg.br/dadosabertos/dados/ListaTiposDecisao.xml"
)
```

## Arguments

- url:

  A URL do XML que contém os tipos de decisão.

## Value

Um dataframe contendo os tipos de decisão.

## Examples

``` r
df_tipos_decisao <- extrair_tipos_decisao()
```
