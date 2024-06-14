#' Coletar dados da reunião
#'
#' Esta função coleta dados de uma reunião específica no Senado.
#'
#' @param codigo_reuniao Código da reunião a ser coletada.
#' @return Uma lista de dataframes contendo dados da reunião.
#' @export
#'
#' @examples
#' dados_reuniao <- coletar_dados_reuniao("12603")
coletar_dados_reuniao <- function(codigo_reuniao) {
  # Construa a URL da reunião específica
  url_reuniao <- paste0("https://legis.senado.leg.br/dadosabertos/reuniaocomissao/", codigo_reuniao)

  # Faça a requisição GET
  response <- GET(url_reuniao, add_headers(accept = "application/json"))

  # Verifique se a requisição foi bem-sucedida (código de status na faixa 2xx)
  if (status_code(response) >= 200 && status_code(response) < 300) {
    # Leia os dados JSON da resposta
    json_data <- fromJSON(content(response, "text"))

    # Extraia os dataframes
    df_reuniao_codigo <- json_data$DetalheReuniao$reuniao$codigo %>% as.data.frame() %>% rename(codigo = ".")
    df_reuniao_descricao <- json_data$DetalheReuniao$reuniao$descricao %>% as.data.frame() %>% rename(descricao = ".")
    df_reuniao_titulo <- json_data$DetalheReuniao$reuniao$titulo %>% as.data.frame() %>% rename(titulo = ".")
    df_reuniao_info <- json_data$DetalheReuniao$reuniao$informacao %>% as.data.frame() %>% rename(info = ".")
    df_reuniao_situ <- json_data$DetalheReuniao$reuniao$situacao %>% as.data.frame() %>% rename(situacao = ".")
    df_reuniao_local <- json_data$DetalheReuniao$reuniao$local %>% as.data.frame() %>% rename(local = ".")
    df_reuniao_pauta_simples <- json_data$DetalheReuniao$reuniao$urlUltimaPautaSimplesPublicada %>% as.data.frame() %>% rename(urlUltimaPautaSimplesPublicada = ".")
    df_reuniao_pauta_cheia <- json_data$DetalheReuniao$reuniao$urlUltimaPautaCheiaPublicada %>% as.data.frame() %>% rename(urlUltimaPautaCheiaPublicada = ".")
    df_reuniao_pauta_resultado <- json_data$DetalheReuniao$reuniao$urlUltimoResultadoPublicado %>% as.data.frame() %>% rename(urlUltimoResultadoPublicado = ".")

    df_reuniao_presidente <- json_data$DetalheReuniao$reuniao$presidente %>%
      as.data.frame() %>%
      rename(codigo_presidente = codigo, nome_presidente = nome)

    df_reuniao_colegiado_criador <- json_data$DetalheReuniao$reuniao$colegiadoCriador %>%
      as.data.frame() %>%
      rename(codigo_colegiado = codigo, nome_colegiado = nome)

    df_reuniao_tipo <- json_data$DetalheReuniao$reuniao$tipo %>%
      as.data.frame() %>%
      rename(codigo_tipo = codigo)

    df_reuniao_sessao_legis <- json_data$DetalheReuniao$reuniao$sessaoLegislativa %>%
      as.data.frame() %>%
      rename(codigo_legislatura = codigo)

    df_reuniao_sessao_videos <- json_data$DetalheReuniao$reuniao$videos %>%
      as.data.frame() %>%
      rename(codigo_video = codigo, url_video = url)

    df_reuniao_partes <- json_data$DetalheReuniao$reuniao$partes %>%
      as.data.frame() %>%
      rename(codigo_partes = codigo, nome_parte = nome) %>%
      select(1:7)

    df_reuniao_evento <- json_data$DetalheReuniao$reuniao$partes$evento %>%
      as.data.frame() %>%
      select(!codigo) %>%
      select(1:5)

    consolidado_reuniao <- cbind(df_reuniao_codigo, df_reuniao_descricao, df_reuniao_titulo,
                                 df_reuniao_info, df_reuniao_situ, df_reuniao_local, df_reuniao_pauta_simples,
                                 df_reuniao_pauta_cheia, df_reuniao_pauta_resultado, df_reuniao_presidente,
                                 df_reuniao_colegiado_criador, df_reuniao_tipo, df_reuniao_sessao_legis, df_reuniao_sessao_videos,
                                 df_reuniao_partes, df_reuniao_evento)

    return(consolidado_reuniao)
  } else {
    # Se a requisição falhar, imprima uma mensagem de erro
    stop("Falha na requisição. Código de status: ", status_code(response))
  }
}
