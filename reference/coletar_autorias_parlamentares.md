# Coleta de Dados de Parlamentares no Senado

Esta função coleta dados de parlamentares no Senado Federal usando a API
de dados abertos. Ela permite que você colete informações sobre as
comissões associadas a um ou mais parlamentares.

## Usage

``` r
coletar_autorias_parlamentares(cod_parlamentares)
```

## Arguments

- cod_parlamentares:

  Um vetor de strings contendo os códigos dos parlamentares para os
  quais os dados devem ser coletados.

## Value

Um data frame contendo as informações das comissões associadas a cada
parlamentar, incluindo:

- `CodigoParlamentar`: Código do parlamentar.

- `Sigla`: Sigla da comissão.

- `Comissao`: Nome completo da comissão.

- `Nome`: Nome do parlamentar.

- `Codigo`: Código do parlamentar.

- `SiglaPartido`: Sigla do partido ao qual o parlamentar pertence.

- `URL`: URL do perfil do parlamentar no site do Senado.

- `Foto`: URL da foto oficial do parlamentar.

- `Uf`: Unidade Federativa (UF) do parlamentar.

- `Quantidade`: Quantidade de matérias atribuídas ao parlamentar na
  comissão.

## Examples

``` r
# Coletar dados de múltiplos parlamentares
codigos_parlamentares <- c("5672", "1234", "5678")
dados_resultantes <- coletar_autorias_parlamentares(codigos_parlamentares)
print(dados_resultantes)
#>    CodigoParlamentar Sigla
#> 1               5672   CAE
#> 2               5672   CAS
#> 3               5672   CCJ
#> 4               5672   CDH
#> 5               5672  CDIR
#> 6               5672    CE
#> 7               5672   CRA
#> 8               5672  PLEN
#> 9               1234  <NA>
#> 10              5678  <NA>
#>                                                   Comissao      Nome Codigo
#> 1                          Comissão de Assuntos Econômicos Alan Rick   5672
#> 2                             Comissão de Assuntos Sociais Alan Rick   5672
#> 3            Comissão de Constituição, Justiça e Cidadania Alan Rick   5672
#> 4  Comissão de Direitos Humanos e Legislação Participativa Alan Rick   5672
#> 5                      Comissão Diretora do Senado Federal Alan Rick   5672
#> 6                           Comissão de Educação e Cultura Alan Rick   5672
#> 7                Comissão de Agricultura e Reforma Agrária Alan Rick   5672
#> 8                               Plenário do Senado Federal Alan Rick   5672
#> 9                                                     <NA>      <NA>   <NA>
#> 10                                                    <NA>      <NA>   <NA>
#>    SiglaPartido                                                            URL
#> 1  REPUBLICANOS http://www25.senado.leg.br/web/senadores/senador/-/perfil/5672
#> 2  REPUBLICANOS http://www25.senado.leg.br/web/senadores/senador/-/perfil/5672
#> 3  REPUBLICANOS http://www25.senado.leg.br/web/senadores/senador/-/perfil/5672
#> 4  REPUBLICANOS http://www25.senado.leg.br/web/senadores/senador/-/perfil/5672
#> 5  REPUBLICANOS http://www25.senado.leg.br/web/senadores/senador/-/perfil/5672
#> 6  REPUBLICANOS http://www25.senado.leg.br/web/senadores/senador/-/perfil/5672
#> 7  REPUBLICANOS http://www25.senado.leg.br/web/senadores/senador/-/perfil/5672
#> 8  REPUBLICANOS http://www25.senado.leg.br/web/senadores/senador/-/perfil/5672
#> 9          <NA>                                                           <NA>
#> 10         <NA>                                                           <NA>
#>                                                                     Foto   Uf
#> 1  http://www.senado.leg.br/senadores/img/fotos-oficiais/senador5672.jpg   AC
#> 2  http://www.senado.leg.br/senadores/img/fotos-oficiais/senador5672.jpg   AC
#> 3  http://www.senado.leg.br/senadores/img/fotos-oficiais/senador5672.jpg   AC
#> 4  http://www.senado.leg.br/senadores/img/fotos-oficiais/senador5672.jpg   AC
#> 5  http://www.senado.leg.br/senadores/img/fotos-oficiais/senador5672.jpg   AC
#> 6  http://www.senado.leg.br/senadores/img/fotos-oficiais/senador5672.jpg   AC
#> 7  http://www.senado.leg.br/senadores/img/fotos-oficiais/senador5672.jpg   AC
#> 8  http://www.senado.leg.br/senadores/img/fotos-oficiais/senador5672.jpg   AC
#> 9                                                                   <NA> <NA>
#> 10                                                                  <NA> <NA>
#>    Quantidade
#> 1          10
#> 2           6
#> 3           4
#> 4           2
#> 5           2
#> 6           2
#> 7           5
#> 8           7
#> 9        <NA>
#> 10       <NA>
```
