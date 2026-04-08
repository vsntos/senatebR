# Extrai o conteúdo de uma página de notas taquigráficas.

Esta função acessa uma página de notas taquigráficas do Senado Federal e
extrai o conteúdo da mesma.

## Usage

``` r
extrair_notas_taquigraficas(codigos_reuniao)
```

## Arguments

- codigos_reuniao:

  Vetor de códigos das reuniões para acessar as páginas de notas.

## Value

Um dataframe contendo os códigos de reunião e os respectivos conteúdos
das páginas de notas, ou NULL se ocorrer um erro.

## Examples

``` r
codigos <- c(12071, 12072, 12073)
df_conteudos <- extrair_notas_taquigraficas(codigos)

```
