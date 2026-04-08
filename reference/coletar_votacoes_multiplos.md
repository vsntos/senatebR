# Coleta dados de votações de múltiplos senadores em múltiplos anos

Coleta dados de votações de múltiplos senadores em múltiplos anos

## Usage

``` r
coletar_votacoes_multiplos(codigos_senadores, anos)
```

## Arguments

- codigos_senadores:

  Vetor de códigos de senadores.

- anos:

  Vetor de anos para a coleta de votações.

## Value

Um data frame com as votações de todos os senadores e anos
especificados.

## Examples

``` r
codigos_senadores <- c("5386", "1234", "5678")
anos <- c(2023, 2024)
coletar_votacoes_multiplos(codigos_senadores, anos)
#> # A tibble: 238 × 43
#>    codigo_senador   ano votacoes_CodigoSessaoVotacao votacoes_Sequencial
#>    <chr>          <dbl> <chr>                        <chr>              
#>  1 5386            2023 6760                         1                  
#>  2 5386            2023 6709                         1                  
#>  3 5386            2023 6784                         1                  
#>  4 5386            2023 6786                         3                  
#>  5 5386            2023 6788                         5                  
#>  6 5386            2023 6794                         11                 
#>  7 5386            2023 6813                         13                 
#>  8 5386            2023 6808                         8                  
#>  9 5386            2023 6810                         10                 
#> 10 5386            2023 6811                         11                 
#> # ℹ 228 more rows
#> # ℹ 39 more variables: votacoes_IndicadorVotacaoSecreta <chr>,
#> #   votacoes_DescricaoVotacao <chr>, votacoes_DescricaoResultado <chr>,
#> #   votacoes_SiglaDescricaoVoto <chr>, votacoes_TotalVotosSim <chr>,
#> #   votacoes_TotalVotosNao <chr>, votacoes_TotalVotosAbstencao <chr>,
#> #   votacoes_DescricaoVoto <chr>, votacoes_SessaoPlenaria.CodigoSessao <chr>,
#> #   votacoes_SessaoPlenaria.SiglaCasaSessao <chr>, …
```
