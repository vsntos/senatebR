# Extrair as situações da tramitação

Esta função realiza o scraping de uma página XML contendo informações
sobre as situações da tramitação das matérias e extrai os dados
relevantes.

## Usage

``` r
extrair_situacoes_tramitacao(
  url = "https://legis.senado.leg.br/dadosabertos/dados/ListaSituacoes.xml"
)
```

## Arguments

- url:

  URL do arquivo XML que contém as informações das situações da
  tramitação. Padrão é
  "https://legis.senado.leg.br/dadosabertos/dados/ListaSituacoes.xml".

## Value

Um dataframe contendo as situações da tramitação.

## Examples

``` r
# Extrair as situações da tramitação a partir da URL padrão
df_materias_tramitacao <- extrair_situacoes_tramitacao()
```
