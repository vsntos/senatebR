# Guia de Contribuição — senatebR

Obrigado por considerar contribuir com o **senatebR**! Este documento descreve como reportar problemas, sugerir melhorias e submeter código.

## Reportando problemas

Abra uma *issue* no repositório descrevendo:

1. O que você tentou fazer
2. O que aconteceu (mensagem de erro completa, se houver)
3. O que era esperado
4. Versão do R (`R.version.string`) e versão do pacote (`packageVersion("senatebR")`)

## Sugerindo novas funções

O pacote cobre dados disponíveis na [API do Senado Federal](https://legis.senado.leg.br/dadosabertos/docs). Ao sugerir uma nova função, indique:

- O endpoint da API ou URL de web scraping correspondente
- Quais colunas o data frame de retorno deveria conter
- Um exemplo de uso em código R

## Submetendo código

### Configuração do ambiente

```r
# Instale as dependências de desenvolvimento
install.packages(c("devtools", "testthat", "roxygen2", "withr"))

# Clone e carregue o pacote
devtools::load_all(".")
```

### Fluxo de trabalho

1. Crie um *fork* do repositório
2. Crie um branch com nome descritivo (`git checkout -b feat/nova-funcao`)
3. Implemente a mudança
4. Adicione testes em `tests/testthat/`
5. Atualize a documentação com `devtools::document()`
6. Verifique o pacote com `devtools::check()`
7. Abra um *pull request*

### Padrões de código

**Estrutura de uma nova função:**

```r
#' Título da função
#'
#' Descrição do que a função faz.
#'
#' @param parametro Descrição do parâmetro.
#' @return Um data frame contendo...
#' @examples
#' \dontrun{
#'   resultado <- minha_funcao(parametro = "valor")
#' }
#' @export
minha_funcao <- function(parametro) {
  url <- paste0("https://legis.senado.leg.br/dadosabertos/...", parametro)

  resultado <- tryCatch(
    xml2::read_xml(url),   # ou httr::GET(url)
    error = function(e) {
      warning("Erro ao acessar a URL: ", conditionMessage(e))
      return(NULL)
    }
  )
  if (is.null(resultado)) return(NULL)

  # processamento...
  return(dados)
}
```

**Convenções de tratamento de erros:**

| Situação | Usar |
|---|---|
| Falha de rede / HTTP | `warning()` + `return(NULL)` |
| Dados não encontrados | `message()` (execução continua) |
| Parâmetro de entrada inválido | `stop()` |

**Testes:**
Toda nova função deve ter ao menos um teste em `tests/testthat/`. Funções que consomem API devem usar fixtures XML locais (veja `tests/testthat/fixtures/`) ou `testthat::local_mocked_bindings()` para evitar chamadas de rede nos testes.

### Verificação antes do PR

```r
devtools::document()   # atualiza NAMESPACE e man/
devtools::check()      # R CMD check completo
testthat::test_dir("tests/testthat")  # só os testes
```

## Código de conduta

Este projeto segue o [Contributor Covenant](https://www.contributor-covenant.org/). Seja respeitoso e construtivo nas interações.
