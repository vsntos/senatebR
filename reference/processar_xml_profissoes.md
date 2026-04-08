# Processa XML de Profissões de Senadores

Esta função acessa a URL da API do Senado para cada código de
parlamentar fornecido, extrai e processa os dados de profissões
associados a cada parlamentar. Retorna um dataframe com informações
sobre as profissões, incluindo dados do parlamentar e detalhes das
profissões.

## Usage

``` r
processar_xml_profissoes(codigos)
```

## Arguments

- codigos:

  Um vetor de códigos de parlamentares para os quais os dados de
  profissões serão extraídos.

## Value

Um dataframe contendo os dados das profissões, com as seguintes colunas:

- CodigoParlamentar:

  Código do parlamentar

- NomeParlamentar:

  Nome do parlamentar

- NomeProfissao:

  Nome da profissão

- IndicadorAtividadePrincipal:

  Indicador se a profissão é a atividade principal

## Examples

``` r
if (FALSE) { # \dontrun{
# Exemplo de uso com códigos fictícios
codigos <- c("4981", "1234")
df_profissoes <- processar_xml_profissoes(codigos)
} # }
```
