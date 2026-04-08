# Coletar dados de orientações de voto no Senado Federal

Esta função coleta os dados de orientação das votações do Senado Federal
a partir de uma lista de datas de sessão.

## Usage

``` r
coletar_orientacao_votacao(data_sessao)
```

## Arguments

- data_sessao:

  Um vetor contendo as datas das sessões no formato "AAAA-MM-DD".

## Value

Um data frame contendo os dados de votação, incluindo código de votação,
data e hora, partido e voto.

## Examples

``` r
anos <- c(2022, 2023)
dados_votacoes <- extrair_votacoes_por_ano(anos)
dados_votacao <- coletar_orientacao_votacao(head(dados_votacoes$data_sessao))
```
