# Processa XML de Apartes de Senadores

Esta função acessa a URL da API do Senado para cada código de
parlamentar fornecido, extrai e processa os dados dos apartes associados
a cada parlamentar. Retorna um dataframe com informações sobre os
apartes, incluindo dados do parlamentar e detalhes dos apartes.

## Usage

``` r
processar_xml_apartes(codigos)
```

## Arguments

- codigos:

  Um vetor de códigos de parlamentares para os quais os dados de apartes
  serão extraídos.

## Value

Um dataframe contendo os dados dos apartes, com as seguintes colunas:

- CodigoParlamentar:

  Código do parlamentar

- NomeParlamentar:

  Nome do parlamentar

- CodigoPronunciamento:

  Código do pronunciamento

- TipoUsoPalavra:

  Tipo de uso da palavra

- DataPronunciamento:

  Data do pronunciamento

- SiglaPartidoParlamentarNaData:

  Sigla do partido do parlamentar na data

- UfParlamentarNaData:

  UF do parlamentar na data

- SiglaCasaPronunciamento:

  Sigla da casa do pronunciamento

- NomeCasaPronunciamento:

  Nome da casa do pronunciamento

- TextoResumo:

  Resumo do texto do pronunciamento

- Indexacao:

  Indexação do pronunciamento

- UrlTexto:

  URL do texto do pronunciamento

- UrlTextoBinario:

  URL do texto binário do pronunciamento

- CodigoSessao:

  Código da sessão plenária

- NomeCasaSessao:

  Nome da casa da sessão

- DataSessao:

  Data da sessão

- HoraInicioSessao:

  Hora de início da sessão

- OradorCodigo:

  Código do orador

- OradorNome:

  Nome do orador

- PublicacaoData:

  Data da publicação

- PublicacaoUrl:

  URL da publicação

## Examples

``` r
if (FALSE) { # \dontrun{
# Exemplo de uso com códigos fictícios
codigos <- c("4763", "1234")
df_apartes <- processar_xml_apartes(codigos)
} # }
```
