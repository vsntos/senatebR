# Extrair dados de reuniões de comissões do Senado

Esta função extrai dados de reuniões de comissões do Senado Federal com
base nos códigos das comissões e no intervalo de datas fornecido.

## Usage

``` r
info_dados_reuniao_comissao(codcol, data_inicio, data_fim)
```

## Arguments

- codcol:

  Vetor contendo os códigos das comissões

- data_inicio:

  Data de início no formato "YYYY-MM-DD"

- data_fim:

  Data de fim no formato "YYYY-MM-DD"

## Value

Um DataFrame com os dados das reuniões das comissões

## Examples

``` r
codcol <- c(54, 38, 2614, 34)
data_inicio <- "2023-01-01"
data_fim <- "2023-12-01"
df_reunioes <- info_dados_reuniao_comissao(codcol, data_inicio, data_fim)
```
