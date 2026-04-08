# Extração de Dados de Reunião

Esta função extrai dados de uma ou mais reuniões com base nos códigos
fornecidos.

## Usage

``` r
info_dados_reuniao_nota(codigo_reuniao)
```

## Arguments

- codigo_reuniao:

  Vetor de códigos de reunião (numérico ou character).

## Value

Um dataframe contendo informações das reuniões e respectivas notas
taquigráficas.

## Examples

``` r
info_dados_reuniao_nota(c(1, 2, 3))
#> Warning: Falha na requisição para o código 1 - Status: 404
#> Warning: Falha na requisição para o código 2 - Status: 404
#> Warning: Falha na requisição para o código 3 - Status: 404
#> data frame with 0 columns and 0 rows
```
