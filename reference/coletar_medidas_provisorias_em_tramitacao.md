# Coletar Medidas Provisórias em Tramitação

Esta função coleta dados sobre medidas provisórias em tramitação do site
do Congresso Nacional do Brasil.

## Usage

``` r
coletar_medidas_provisorias_em_tramitacao()
```

## Value

Um dataframe contendo informações sobre medidas provisórias em
tramitação. O dataframe possui as seguintes colunas:

- Link:

  Link para acessar mais informações sobre a medida provisória.

- Matéria:

  Título da medida provisória.

- Ementa:

  Resumo ou descrição da medida provisória.

- Prazo:

  Prazo de vigência da medida provisória, especificando os prazos de 60
  e 120 dias.

- Status:

  Status da medida provisória, indicando se está em tramitação.
