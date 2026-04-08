# Extrair informações de votações do plenário do Senado Federal por ano

Esta função extrai as informações de votações do plenário do Senado
Federal para os anos especificados.

## Usage

``` r
extrair_votacoes_por_ano(anos)
```

## Arguments

- anos:

  Um vetor contendo os anos para os quais se deseja extrair as
  informações de votações.

## Value

Um dataframe contendo as informações de votações para todos os anos
especificados, incluindo a variável 'ano'.

## Examples

``` r
# Exemplo de uso
anos <- c(2018, 2019, 2020)
dados_votacoes <- extrair_votacoes_por_ano(anos)
head(dados_votacoes)
#>   ano_votacao codigo_sessao sigla_casa codigo_sessao_legislativa tipo_sessao
#> 1        2018         57813         SF                       856         DOR
#> 2        2018         58104         SF                       856         DOR
#> 3        2018         58104         SF                       856         DOR
#> 4        2018         59137         SF                       856         DEX
#> 5        2018         59308         SF                       856         DOR
#> 6        2018         59594         SF                       856         DOR
#>   numero_sessao data_sessao hora_inicio codigo_tramitacao codigo_sessao_votacao
#> 1             2  2018-02-06       14:00              <NA>                  5827
#> 2             3  2018-02-07       14:00              <NA>                  5828
#> 3             3  2018-02-07       14:00              <NA>                  5829
#> 4            10  2018-02-20       18:00              <NA>                  5830
#> 5            11  2018-02-21       14:00              <NA>                  5831
#> 6            15  2018-02-27       14:00              <NA>                  5832
#>   sequencial_sessao secreta
#> 1                 1       S
#> 2                 1       N
#> 3                 2       N
#> 4                 1       N
#> 5                 1       N
#> 6                 1       S
#>                                                                                                                                                                                                                                                                                          descricao_votacao
#> 1                                                                                        Votação referente à indicação da Senhora Paula Farani de Azevedo Silveira para exercer o cargo de Conselheira do Conselho Administrativo de Defesa Econômica - CADE do Ministério da Justiça e Segurança Pública.
#> 2 Votação que institui obrigatoriedade da instalação, em 180 dias, de bloqueadores de sinais de telecomunicação para telefones celulares e estabelece a aplicação dos recursos do FUNPEN na instalação, custeio e manutenção do bloqueio de sinais de telecomunicação, em estabelecimentos penitenciários.
#> 3      Votação que altera a Lei Complementar nº 123, de 2016, que institui o Estatuto Nacional da Microempresa e da Empresa de Pequeno Porte e altera legislação correlata, para restringir a aplicação do regime de substituição tributária do Imposto sobre Circulação de Mercadorias e Serviços (ICMS).
#> 4                                                                                                            Votação que aprova o Decreto nº 9.288, de 16 de fevereiro, que decreta intervenção federal no Estado do Rio de Janeiro com o objetivo de pôr termo ao grave comprometimento da ordem pública.
#> 5                                                                                                                                                          Votação que altera o art. 205 da Lei nº 5.172, de 1996, para simplificar as exigências relativas à verificação de regularidade do contribuinte.
#> 6                                           Votação referente à indicação do Sr. Alexandre Luiz Ramos, para exercer o cargo de MInistro do Tribunal Superior do Trabalho, na vaga reservada a juízes de carreira da magistratura trabalhista, decorrente da aposentadoria do Ministro João Oreste Dalazen.
#>   resultado total_votos_sim total_votos_nao total_votos_abstencao
#> 1         A              58               8                     1
#> 2      <NA>            <NA>            <NA>                  <NA>
#> 3      <NA>            <NA>            <NA>                  <NA>
#> 4      <NA>            <NA>            <NA>                  <NA>
#> 5      <NA>            <NA>            <NA>                  <NA>
#> 6         A              53              11                     1
#>   codigo_materia sigla_materia numero_materia descricao_identificacao_materia
#> 1         131900           MSF             76                     MSF 76/2017
#> 2         132167           PLS             32                     PLS 32/2018
#> 3         131776           PLS            476                    PLS 476/2017
#> 4         132243           PDS              4                      PDS 4/2018
#> 5         131777           PLS            477                    PLS 477/2017
#> 6         132107           MSF              3                      MSF 3/2018
#>   sigla_casa_materia
#> 1                 SF
#> 2                 SF
#> 3                 SF
#> 4                 SF
#> 5                 SF
#> 6                 SF
```
