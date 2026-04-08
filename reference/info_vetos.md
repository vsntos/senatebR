# Extrair detalhes de vetos a partir da URL específica contendo informações sobre vetos

Esta função realiza scraping de uma página contendo informações sobre
vetos e extrai detalhes como número do veto, link associado, ementa,
data de sobresta, matéria vetada e norma gerada.

## Usage

``` r
info_vetos(pages = 1)
```

## Arguments

- pages:

  O número de páginas a serem processadas. Padrão é 1.

## Value

Um dataframe contendo os detalhes dos vetos.

## Examples

``` r
# Exemplo de uso
dados_vetos <- info_vetos(pages = 3)
```
