# Processar XMLs de Mandatos de Senadores

Esta função processa os XMLs disponíveis na URL do Senado para obter
dados dos mandatos de múltiplos senadores. Para cada código de senador
fornecido, a função faz o download e a análise do XML correspondente,
extraindo informações sobre os mandatos do senador e combinando-os em um
único dataframe.

## Usage

``` r
processar_xml_mandatos(codigos)
```

## Arguments

- codigos:

  Um vetor de códigos de senadores para os quais os dados de mandatos
  serão obtidos.

## Value

Um dataframe contendo os dados dos mandatos dos senadores especificados.
Cada linha do dataframe representa um mandato e inclui informações como
o código do mandato, a unidade federativa, e as datas de início e fim
das legislaturas.

## Examples

``` r
if (FALSE) { # \dontrun{
df_mandatos_senadores <- processar_xml_mandatos(c("5322", "1234"))
} # }
```
