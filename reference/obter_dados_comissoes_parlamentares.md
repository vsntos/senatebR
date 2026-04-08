# Obter dados das comissões de parlamentares

Esta função obtém dados das comissões de parlamentares com base em seus
códigos.

## Usage

``` r
obter_dados_comissoes_parlamentares(codigos_parlamentares)
```

## Arguments

- codigos_parlamentares:

  Vetor contendo os códigos dos parlamentares.

## Value

Um dataframe contendo os dados das comissões que parlamentares são ou
foram membros.

## Examples

``` r
codigos_senadores <- c(5386, 5012)
df_comissoes_parlamentares <- obter_dados_comissoes_parlamentares(codigos_senadores)
#> No encoding supplied: defaulting to UTF-8.
#> No encoding supplied: defaulting to UTF-8.
```
