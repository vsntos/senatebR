# Obter dados dos senadores por legislatura

Esta função realiza requisições HTTP para obter informações dos
senadores com base nas legislaturas fornecidas.

## Usage

``` r
obter_dados_senadores_legislatura(legislatura_inicio, legislatura_fim)
```

## Arguments

- legislatura_inicio:

  Número da legislatura de início.

- legislatura_fim:

  Número da legislatura de fim.

## Value

Um dataframe com os dados dos senadores.

## References

Informações sobre os senadores são obtidas da API de dados abertos do
Senado Brasileiro.

## Examples

``` r
df_senadores_legislatura <- obter_dados_senadores_legislatura(47, 56)
#> No encoding supplied: defaulting to UTF-8.
```
