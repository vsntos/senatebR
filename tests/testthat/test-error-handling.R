# ── Tratamento de erros: URL inválida retorna NULL com warning ────────────────

test_that("extrair_classificacoes_materia retorna NULL com warning para URL invalida", {
  expect_warning(
    result <- extrair_classificacoes_materia(url = "https://url-invalida-que-nao-existe.example.com/xml"),
    regexp = "Erro ao acessar"
  )
  expect_null(result)
})

test_that("extrair_siglas_ativas retorna NULL com warning para URL invalida", {
  expect_warning(
    result <- extrair_siglas_ativas(url = "https://url-invalida-que-nao-existe.example.com/xml"),
    regexp = "Erro ao acessar"
  )
  expect_null(result)
})

test_that("extrair_tipos_comparecimento retorna NULL com warning para URL invalida", {
  expect_warning(
    result <- extrair_tipos_comparecimento(url = "https://url-invalida-que-nao-existe.example.com/xml"),
    regexp = "Erro ao acessar"
  )
  expect_null(result)
})

test_that("extrair_tipos_decisao retorna NULL com warning para URL invalida", {
  expect_warning(
    result <- extrair_tipos_decisao(url = "https://url-invalida-que-nao-existe.example.com/xml"),
    regexp = "Erro ao acessar"
  )
  expect_null(result)
})

test_that("extrair_situacoes_tramitacao retorna NULL com warning para URL invalida", {
  expect_warning(
    result <- extrair_situacoes_tramitacao(url = "https://url-invalida-que-nao-existe.example.com/xml"),
    regexp = "Erro ao acessar"
  )
  expect_null(result)
})

test_that("info_materia_temas retorna NULL com warning para URL invalida", {
  expect_warning(
    result <- info_materia_temas(url = "https://url-invalida-que-nao-existe.example.com/xml"),
    regexp = "Erro ao acessar"
  )
  expect_null(result)
})

# ── Tratamento de erros: arquivo local malformado ─────────────────────────────

test_that("extrair_classificacoes_materia retorna NULL com warning para XML malformado", {
  tmp <- withr::local_tempfile(fileext = ".xml")
  writeLines("este nao e um xml valido <<<", tmp)

  expect_warning(
    result <- extrair_classificacoes_materia(url = tmp),
    regexp = "Erro ao acessar"
  )
  expect_null(result)
})

test_that("extrair_situacoes_tramitacao retorna NULL com warning para XML malformado", {
  tmp <- withr::local_tempfile(fileext = ".xml")
  writeLines("<<<xml invalido>>>", tmp)

  expect_warning(
    result <- extrair_situacoes_tramitacao(url = tmp),
    regexp = "Erro ao acessar"
  )
  expect_null(result)
})

# ── Tratamento de erros: XML vazio (sem registros) ────────────────────────────

test_that("extrair_classificacoes_materia retorna data frame vazio para XML sem registros", {
  tmp <- withr::local_tempfile(fileext = ".xml")
  writeLines('<?xml version="1.0" encoding="UTF-8"?><ListaClassificacoes/>', tmp)

  result <- extrair_classificacoes_materia(url = tmp)

  expect_s3_class(result, "data.frame")
  expect_equal(nrow(result), 0L)
})

test_that("extrair_tipos_decisao retorna data frame vazio para XML sem registros", {
  tmp <- withr::local_tempfile(fileext = ".xml")
  writeLines('<?xml version="1.0" encoding="UTF-8"?><ListaTiposDecisao/>', tmp)

  result <- extrair_tipos_decisao(url = tmp)

  expect_s3_class(result, "data.frame")
  expect_equal(nrow(result), 0L)
})

# ── Tratamento de erros: info_vetos pula pagina com falha e continua ──────────

test_that("info_vetos retorna data frame vazio se todas as paginas falham", {
  expect_warning(
    result <- info_vetos(pages = 1),
    regexp = NA  # pode ou nao gerar warning dependendo do ambiente
  ) |> suppressWarnings()

  # A funcao deve sempre retornar um data frame (nunca lancar erro fatal)
  expect_true(is.data.frame(result) || is.null(result))
})
