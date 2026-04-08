fixture <- function(name) {
  system.file("tests", "testthat", "fixtures", name, package = "senatebR")
}

# Fallback para rodar os testes diretamente com testthat::test_file()
fixture_path <- function(name) {
  path <- fixture(name)
  if (!nzchar(path)) {
    path <- file.path(
      dirname(dirname(dirname(testthat::test_path()))),
      "tests", "testthat", "fixtures", name
    )
  }
  path
}

# ── extrair_classificacoes_materia() ─────────────────────────────────────────

test_that("extrair_classificacoes_materia retorna data frame com colunas corretas", {
  path <- fixture_path("ListaClassificacoesMateria.xml")
  skip_if_not(file.exists(path), "Fixture nao encontrada")

  result <- extrair_classificacoes_materia(url = path)

  expect_s3_class(result, "data.frame")
  expect_named(result, c("CodigoClasse", "NomeClasse", "CodigoClassePai", "Nivel", "Tree", "Path"))
})

test_that("extrair_classificacoes_materia retorna numero correto de linhas", {
  path <- fixture_path("ListaClassificacoesMateria.xml")
  skip_if_not(file.exists(path), "Fixture nao encontrada")

  result <- extrair_classificacoes_materia(url = path)

  expect_equal(nrow(result), 2L)
  expect_equal(result$CodigoClasse[1], "1")
  expect_equal(result$NomeClasse[1], "Projetos de Lei")
})

# ── extrair_siglas_ativas() ───────────────────────────────────────────────────

test_that("extrair_siglas_ativas retorna data frame com colunas corretas", {
  path <- fixture_path("ListaSiglas.xml")
  skip_if_not(file.exists(path), "Fixture nao encontrada")

  result <- extrair_siglas_ativas(url = path)

  expect_s3_class(result, "data.frame")
  expect_named(result, c("Sigla", "Descricao", "DataInicio", "DataFim"))
})

test_that("extrair_siglas_ativas extrai valores corretamente", {
  path <- fixture_path("ListaSiglas.xml")
  skip_if_not(file.exists(path), "Fixture nao encontrada")

  result <- extrair_siglas_ativas(url = path)

  expect_equal(nrow(result), 2L)
  expect_equal(result$Sigla[1], "PL")
  expect_equal(result$Descricao[2], "Proposta de Emenda \u00e0 Constitui\u00e7\u00e3o")
})

# ── extrair_tipos_comparecimento() ────────────────────────────────────────────

test_that("extrair_tipos_comparecimento retorna data frame com colunas corretas", {
  path <- fixture_path("ListaTiposComparecimento.xml")
  skip_if_not(file.exists(path), "Fixture nao encontrada")

  result <- extrair_tipos_comparecimento(url = path)

  expect_s3_class(result, "data.frame")
  expect_named(result, c("Sigla", "Descricao"))
})

test_that("extrair_tipos_comparecimento extrai todos os registros", {
  path <- fixture_path("ListaTiposComparecimento.xml")
  skip_if_not(file.exists(path), "Fixture nao encontrada")

  result <- extrair_tipos_comparecimento(url = path)

  expect_equal(nrow(result), 3L)
  expect_true("P" %in% result$Sigla)
  expect_true("A" %in% result$Sigla)
})

# ── extrair_tipos_decisao() ───────────────────────────────────────────────────

test_that("extrair_tipos_decisao retorna data frame com colunas corretas", {
  path <- fixture_path("ListaTiposDecisao.xml")
  skip_if_not(file.exists(path), "Fixture nao encontrada")

  result <- extrair_tipos_decisao(url = path)

  expect_s3_class(result, "data.frame")
  expect_named(result, c("Sigla", "Descricao"))
})

test_that("extrair_tipos_decisao extrai valores corretamente", {
  path <- fixture_path("ListaTiposDecisao.xml")
  skip_if_not(file.exists(path), "Fixture nao encontrada")

  result <- extrair_tipos_decisao(url = path)

  expect_equal(nrow(result), 2L)
  expect_equal(result$Sigla[1], "AP")
  expect_equal(result$Descricao[2], "Rejeitado")
})

# ── extrair_situacoes_tramitacao() ────────────────────────────────────────────

test_that("extrair_situacoes_tramitacao retorna data frame com colunas corretas", {
  path <- fixture_path("ListaSituacoes.xml")
  skip_if_not(file.exists(path), "Fixture nao encontrada")

  result <- extrair_situacoes_tramitacao(url = path)

  expect_s3_class(result, "data.frame")
  expect_named(result, c("Codigo", "Sigla", "Descricao", "DataCriacao"))
})

test_that("extrair_situacoes_tramitacao extrai todos os registros", {
  path <- fixture_path("ListaSituacoes.xml")
  skip_if_not(file.exists(path), "Fixture nao encontrada")

  result <- extrair_situacoes_tramitacao(url = path)

  expect_equal(nrow(result), 2L)
  expect_equal(result$Sigla[1], "APRE")
  expect_equal(result$Codigo[2], "2")
})

# ── info_materia_temas() ──────────────────────────────────────────────────────

test_that("info_materia_temas retorna data frame com colunas corretas", {
  path <- fixture_path("ListaAssuntos.xml")
  skip_if_not(file.exists(path), "Fixture nao encontrada")

  result <- info_materia_temas(url = path)

  expect_s3_class(result, "data.frame")
  expect_named(result, c("Codigo", "AssuntoGeral", "AssuntoEspecifico", "DataInicio", "DataFim"))
})

test_that("info_materia_temas extrai valores corretamente", {
  path <- fixture_path("ListaAssuntos.xml")
  skip_if_not(file.exists(path), "Fixture nao encontrada")

  result <- info_materia_temas(url = path)

  expect_equal(nrow(result), 2L)
  expect_equal(result$Codigo[1], "101")
  expect_equal(result$AssuntoGeral[2], "Sa\u00fade")
})
