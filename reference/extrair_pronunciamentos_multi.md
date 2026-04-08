# Extrai dados de pronunciamentos de múltiplos parlamentares em diferentes anos

Esta função extrai dados de pronunciamentos de múltiplos parlamentares
para os anos fornecidos. Os dados são extraídos da página do Senado
Federal do Brasil.

## Usage

``` r
extrair_pronunciamentos_multi(codigos_parlamentares, anos)
```

## Arguments

- codigos_parlamentares:

  Um vetor de códigos dos parlamentares (números inteiros).

- anos:

  Um vetor de anos (números inteiros) para os quais os pronunciamentos
  serão extraídos.

## Value

Um dataframe contendo os dados de pronunciamentos de múltiplos
parlamentares. Se nenhum dado estiver disponível, retorna NULL.

## Details

A função acessa as páginas do Senado para coletar informações sobre
pronunciamentos, incluindo data, tipo, casa, partido/UF, resumo e links
dos pronunciamentos. A função percorre várias páginas para cada
parlamentar e ano, com um limite máximo de 100 páginas.

## Examples

``` r
if (FALSE) { # \dontrun{
  codigos <- c(5672, 5386)
  anos <- c(2023, 2024)
  dados_multi <- extrair_pronunciamentos_multi(codigos_parlamentares = codigos, anos = anos)
} # }
```
