# Extrair dados da agenda do Congresso Nacional, do Senado Federal e Câmara dos Deputados

Esta função extrai dados da agenda do Congresso Nacional para os anos,
meses e dias especificados.

## Usage

``` r
info_agenda(anos, meses, dias)
```

## Arguments

- anos:

  Vetor de anos.

- meses:

  Vetor de meses.

- dias:

  Vetor de dias.

## Value

Um dataframe contendo os dados da agenda do Congresso Nacional.

## Examples

``` r
resultado <- info_agenda(anos = c(2023, 2024), meses = c(1, 2), dias = 10:15)
#> Nenhum evento encontrado para2023-01-11
#> Nenhum evento encontrado para2023-01-12
#> Nenhum evento encontrado para2023-01-13
#> Nenhum evento encontrado para2023-01-14
#> Nenhum evento encontrado para2023-01-15
#> Nenhum evento encontrado para2023-02-10
#> Nenhum evento encontrado para2023-02-11
#> Nenhum evento encontrado para2023-02-12
#> Nenhum evento encontrado para2023-02-13
#> Nenhum evento encontrado para2024-01-10
#> Nenhum evento encontrado para2024-01-11
#> Nenhum evento encontrado para2024-01-12
#> Nenhum evento encontrado para2024-01-13
#> Nenhum evento encontrado para2024-01-14
#> Nenhum evento encontrado para2024-01-15
#> Nenhum evento encontrado para2024-02-10
#> Nenhum evento encontrado para2024-02-11
#> Nenhum evento encontrado para2024-02-12
#> Nenhum evento encontrado para2024-02-13
#> Nenhum evento encontrado para2024-02-14
#> Nenhum evento encontrado para2024-02-15
```
