# Extrair os tipos de comparecimento em votação de uma URL específica

Esta função realiza o scraping de uma página XML contendo informações
sobre os tipos de comparecimento em votação e extrai os dados
relevantes.

## Usage

``` r
extrair_tipos_comparecimento(
  url = "https://legis.senado.leg.br/dadosabertos/dados/ListaTiposComparecimento.xml"
)
```

## Arguments

- url:

  A URL do XML que contém os tipos de comparecimento em votação.

## Value

Um dataframe contendo os tipos de comparecimento em votação.

## Examples

``` r
df_tipos_comparecimento <- extrair_tipos_comparecimento()
```
