# Obter dados acadêmicos de senadores com base nos códigos parlamentares

Esta função realiza requisições para obter informações acadêmicas de
senadores com base em códigos parlamentares fornecidos.

## Usage

``` r
dados_academicos(codigos)
```

## Arguments

- codigos:

  Vetor de códigos parlamentares.

## Value

Um dataframe com os dados acadêmicos.

## References

Informações sobre os senadores são obtidas da API de dados abertos do
Senado Brasileiro.

## See also

[`obter_dados_senadores_legislatura`](obter_dados_senadores_legislatura.md)

## Examples

``` r
codigos <- c(5672, 5386)
dados <- dados_academicos(codigos)
#> No encoding supplied: defaulting to UTF-8.
#> Warning: Nao ha dados de historico academico disponiveis para o codigo: 5672
#> No encoding supplied: defaulting to UTF-8.
#> Warning: Nao ha dados de historico academico disponiveis para o codigo: 5386
```
