# Lista de Matérias Atualizadas

Lista de Matérias Atualizadas

## Usage

``` r
info_atualizacao_materias(
  url = "https://legis.senado.leg.br/dadosabertos/materia/atualizadas"
)
```

## Arguments

- url:

  URL da API a ser consultada. Esta função realiza o scraping de
  informações sobre matérias legislativas atualizadas recentemente no
  Senado Federal do Brasil.

## Value

Um dataframe contendo os detalhes das matérias legislativas atualizadas
recentemente.

## Examples

``` r
df_materias_atualizacao <- info_atualizacao_materias()
```
