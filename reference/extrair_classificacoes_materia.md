# Extrair as classificações de matéria de uma URL específica

Esta função realiza o scraping de uma página XML contendo informações
sobre as classificações de matéria e extrai os dados relevantes.

## Usage

``` r
extrair_classificacoes_materia(
  url = "https://legis.senado.leg.br/dadosabertos/dados/ListaClassificacoesMateria.xml"
)
```

## Arguments

- url:

  A URL do XML que contém as classificações de matéria.

## Value

Um dataframe contendo as classificações de matéria.

## Examples

``` r
df_classificacao_materias <- extrair_classificacoes_materia()
```
