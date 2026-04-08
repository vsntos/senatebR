## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  eval = FALSE
)

## -----------------------------------------------------------------------------
# library(senatebR)

## -----------------------------------------------------------------------------
# df_senadores <- obter_dados_senadores_legislatura(47, 56)
# dplyr::glimpse(df_senadores)

## -----------------------------------------------------------------------------
# # MPs em tramitação
# mpv_tramitacao <- coletar_medidas_provisorias_em_tramitacao()
# dplyr::glimpse(mpv_tramitacao)
# 
# # MPs encerradas (todas as páginas)
# mpv_encerradas <- coletar_medidas_provisorias_encerradas(364)
# dplyr::glimpse(mpv_encerradas)

## -----------------------------------------------------------------------------
# dados_vetos <- info_vetos(pages = 20)
# dplyr::glimpse(dados_vetos)

## -----------------------------------------------------------------------------
# df_56 <- obter_dados_senadores_legislatura(56, 56)
# 
# codigos <- df_56$IdentificacaoParlamentar.CodigoParlamentar
# 
# dados_multi <- extrair_pronunciamentos_multi(
#   codigos_parlamentares = codigos,
#   anos = c(2020:2024)
# )

## -----------------------------------------------------------------------------
# dados_multi <- dados_multi |>
#   tidyr::separate(Partido_UF, into = c("Partido", "UF"), sep = "/")

## -----------------------------------------------------------------------------
# library(ggplot2)
# 
# pronunciamentos_por_ano <- dplyr::count(dados_multi, Ano)
# 
# ggplot(pronunciamentos_por_ano, aes(x = factor(Ano), y = n, fill = factor(Ano))) +
#   geom_bar(stat = "identity", show.legend = FALSE) +
#   geom_text(aes(label = n), vjust = -0.5, size = 3) +
#   scale_fill_brewer(palette = "Set3") +
#   theme_minimal() +
#   labs(
#     title = "Distribuição de Pronunciamentos por Ano",
#     x = "Ano",
#     y = "Número de Pronunciamentos"
#   )

## -----------------------------------------------------------------------------
# tipos <- dplyr::count(dados_multi, Tipo_Pronunciamento) |>
#   dplyr::arrange(n)
# 
# ggplot(tipos, aes(x = reorder(Tipo_Pronunciamento, n), y = n)) +
#   geom_bar(stat = "identity", fill = "skyblue") +
#   coord_flip() +
#   theme_minimal() +
#   labs(
#     title = "Frequência de Tipos de Pronunciamento",
#     x = "Tipo",
#     y = "Número de Pronunciamentos"
#   )

