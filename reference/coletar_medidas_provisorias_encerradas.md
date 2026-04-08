# Coletar Medidas Provisórias Encerradas

Esta função coleta dados sobre medidas provisórias encerradas do site do
Congresso Nacional do Brasil.

## Usage

``` r
coletar_medidas_provisorias_encerradas(numero_ultima_pagina)
```

## Arguments

- numero_ultima_pagina:

  Número da última página a ser coletada.

## Value

Um dataframe contendo informações sobre medidas provisórias encerradas.
O dataframe possui as seguintes colunas:

- Link:

  Link para acessar mais informações sobre a medida provisória.

- MPV:

  Número da medida provisória.

- Título:

  Título da medida provisória.

- Ementa:

  Resumo ou descrição da medida provisória.

- Prazo de 60 dias:

  Data limite para validade da medida provisória.

- Prazo de emendas:

  Data limite para submissão de emendas.

## References

Site do Congresso Nacional do Brasil:
<https://www.congressonacional.leg.br>

## See also

[`coletar_medidas_provisorias_em_tramitacao`](coletar_medidas_provisorias_em_tramitacao.md)
