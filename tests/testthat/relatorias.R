#' Teste para a função obter_relatorias_parlamentares
#' @import testthat
test_that("obter_relatorias_parlamentares retorna um dataframe", {
  # Executar a função com argumentos de exemplo
  df_relatorias <- obter_relatorias_parlamentares(codigos_parlamentares = c(6331, 1234), anos = c(2022, 2023))

  # Verificar se o resultado é um dataframe
  expect_is(df_relatorias, "data.frame")

  # Verificar se o dataframe tem colunas esperadas
  expect_true("Nome" %in% colnames(df_relatorias))
  expect_true("CodigoParlamentar" %in% colnames(df_relatorias))
})
