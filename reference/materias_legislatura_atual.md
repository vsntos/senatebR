# Lista de Matérias da Legislatura Atual

Esta função realiza o scraping de um XML contendo informações sobre
matérias legislativas da legislatura atual do Senado Federal do Brasil.
Os dados extraídos incluem o código da matéria, sigla e nome da casa
legislativa, subtipo da matéria, número e ano, descrição, indicação de
tramitação e identificação do processo.

## Usage

``` r
materias_legislatura_atual()
```

## Value

Um dataframe contendo os detalhes das matérias legislativas. O dataframe
possui as seguintes colunas:

- CodigoMateria:

  Código da matéria.

- SiglaCasaIdentificacaoMateria:

  Sigla da casa legislativa identificadora da matéria.

- NomeCasaIdentificacaoMateria:

  Nome da casa legislativa identificadora da matéria.

- SiglaSubtipoMateria:

  Sigla do subtipo da matéria.

- NumeroMateria:

  Número da matéria.

- AnoMateria:

  Ano da matéria.

- DescricaoIdentificacaoMateria:

  Descrição da identificação da matéria.

- IndicadorTramitando:

  Indicador de tramitação da matéria.

- IdentificacaoProcesso:

  Identificação do processo da matéria.

## Examples

``` r
df_materias <- materias_legislatura_atual()
```
