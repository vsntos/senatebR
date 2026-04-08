# Obter relatorias de parlamentares

Esta função obtém as relatorias de parlamentares com base nos códigos e
anos fornecidos.

## Usage

``` r
dados_relatorias_parlamentares(codigos_parlamentares, anos)
```

## Arguments

- codigos_parlamentares:

  Vetor de códigos de parlamentares.

- anos:

  Vetor de anos.

## Value

Um dataframe consolidado com todas as relatorias dos parlamentares
escolhidos

## Examples

``` r
# Exemplo de uso
df_relatorias <- dados_relatorias_parlamentares(c(5386, 5012), anos = c(2022, 2023))
#> No encoding supplied: defaulting to UTF-8.
#> No encoding supplied: defaulting to UTF-8.
#> No encoding supplied: defaulting to UTF-8.
#> No encoding supplied: defaulting to UTF-8.
```
