# Processa XML de Lideranças de Senadores

Esta função acessa a URL da API do Senado para cada código de
parlamentar fornecido, extrai e processa os dados de lideranças
associados a cada parlamentar. Retorna um dataframe com informações
sobre as lideranças, incluindo dados do parlamentar e detalhes das
lideranças.

## Usage

``` r
processar_xml_liderancas(codigos)
```

## Arguments

- codigos:

  Um vetor de códigos de parlamentares para os quais os dados de
  lideranças serão extraídos.

## Value

Um dataframe contendo os dados das lideranças, com as seguintes colunas:

- CodigoParlamentar:

  Código do parlamentar

- NomeParlamentar:

  Nome do parlamentar

- UnidadeLideranca:

  Unidade da liderança

- CodigoPartido:

  Código do partido

- SiglaPartido:

  Sigla do partido

- NomePartido:

  Nome do partido

- SiglaCasaLideranca:

  Sigla da casa de liderança

- NomeCasaLideranca:

  Nome da casa de liderança

- DescricaoTipoLideranca:

  Descrição do tipo de liderança

- DataDesignacao:

  Data de designação

- DataFim:

  Data de término

- CodigoBloco:

  Código do bloco

- SiglaBloco:

  Sigla do bloco

- NomeBloco:

  Nome do bloco

- ApelidoBloco:

  Apelido do bloco

- NumeroOrdemViceLideranca:

  Número de ordem da vice-liderança

## Examples

``` r
if (FALSE) { # \dontrun{
# Exemplo de uso com códigos fictícios
codigos <- c("123456", "654321")
df_liderancas <- processar_xml_liderancas(codigos)
} # }
```
