# Lista de Assuntos

Lista de Assuntos

## Usage

``` r
info_materia_temas(
  url = "https://legis.senado.leg.br/dadosabertos/dados/ListaAssuntos.xml"
)
```

## Arguments

- url:

  URL da API a ser consultada Esta função realiza o scraping de um XML
  contendo informações sobre assuntos legislativos do Senado Federal do
  Brasil.

## Value

Um dataframe contendo os detalhes dos assuntos legislativos. O dataframe
possui as seguintes colunas:

- Codigo:

  Código do assunto.

- AssuntoGeral:

  Assunto geral ao qual o assunto pertence.

- AssuntoEspecifico:

  Assunto específico.

- DataInicio:

  Data de início da validade do assunto.

- DataFim:

  Data de término da validade do assunto, se aplicável.

## Examples

``` r
df_assuntos <- info_materia_temas()
```
