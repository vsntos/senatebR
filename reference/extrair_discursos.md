# Extrai Discursos Parlamentares de um ou mais Senadores

Esta função extrai os discursos parlamentares de um ou mais senadores em
um intervalo de datas fornecido a partir da API do Senado.

## Usage

``` r
extrair_discursos(codigo_senador, data_inicio, data_fim)
```

## Arguments

- codigo_senador:

  Um vetor de códigos de senadores. Exemplo: c("5529", "1234").

- data_inicio:

  A data de início do intervalo, no formato "YYYY-MM-DD". Exemplo:
  "2024-01-01".

- data_fim:

  A data de fim do intervalo, no formato "YYYY-MM-DD". Exemplo:
  "2024-06-30".

## Value

Um dataframe com os discursos parlamentares, contendo informações como
código do discurso, data, partido, UF, e resumo.

## Examples

``` r
# Exemplo de uso
discursos_df <- extrair_discursos(
  codigo_senador = c("5529"),
  data_inicio = "2024-01-01",
  data_fim = "2024-06-30"
)
```
