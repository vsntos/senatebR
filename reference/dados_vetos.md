# Função para extrair os dados de várias URLs

Esta função realiza o scraping de várias páginas HTML contendo
informações sobre vetos do Congresso Nacional e extrai os dados dos
itens vetados.

## Usage

``` r
dados_vetos(urls)
```

## Arguments

- urls:

  Um vetor de URLs das páginas a serem analisadas.

## Value

Um dataframe contendo os dados extraídos de todas as URLs fornecidas. Se
não houver tabela em alguma das páginas, retorna uma mensagem de aviso.

## Examples

``` r
urls <- c("https://www.congressonacional.leg.br/materias/vetos/-/veto/detalhe/16110",
          "https://www.congressonacional.leg.br/materias/vetos/-/veto/detalhe/16049",
          "https://www.congressonacional.leg.br/materias/vetos/-/veto/detalhe/16029")
dados <- dados_vetos(urls)
```
