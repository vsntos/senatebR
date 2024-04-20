
#agenda

# Definir os anos, meses e dias desejados

anos <- 2023
meses <- 1:3
dias <- 1:12  # Ajuste o intervalo conforme necessário

# Raspar os dados da agenda para as datas especificadas
df_agenda <- info_agenda(anos, meses, dias)


# coletar dados dos senadores

# Exemplo de uso com as legislaturas 47 e 56

df_parlamentares <- obter_dados_senadores_legislatura(47, 57)

# Coletar dados básicos das comissões

# estabelecendo os links para a raspagem de dados

url_comissoes_permanentes <- "https://legis.senado.leg.br/comissoes/"
url_comissoes_temporaria <- "https://legis.senado.leg.br/comissoes/pesquisa_comissao?casa=sf,cn&tipo=tmp,cpi,mpv,vet,sub&sit=func,aguard"

# baixando os dados básicos

df_comissoes_permanentes = coletar_dados_basicos(url_comissoes_permanentes) %>%
                      mutate(tipo = "permanente")

df_comissoes_temporarias = coletar_dados_basicos(url_comissoes_temporaria) %>%
        mutate(tipo = "temporaria")

df_comissoes_info = rbind(df_comissoes_permanentes, df_comissoes_temporarias)

# Exemplo de uso da função relatorias para dois parlamentares com códigos 6331 e 1234 nos anos de 2022 e 2023

library(jsonlite)

df_relatorias <- obter_relatorias_parlamentares(codigos_parlamentares = c(6331, 5012), anos = c(2022, 2023))

glimpse(df_relatorias)

df_relatorias <- obter_relatorias_parlamentares(codigos_parlamentares = df_parlamentares$IdentificacaoParlamentar.CodigoParlamentar, anos = c(2021:2024))

df_relatorias_sub = df_relatorias %>%
  select(-Materia, -Comissao)

mat = df_relatorias$Materia %>%
  rename(codigo_materia = Codigo) %>%
  rename(sigla_materia = Sigla)

comi = df_relatorias$Comissao %>%
          rename(codigo_comissao = Codigo) %>%
          rename(sigla_comissao = Sigla) %>%
          rename(nome_comissao = Nome)

df_relatorias_conso = cbind(df_relatorias_sub, mat, comi)

parci = df_parlamentares %>%
            select(IdentificacaoParlamentar.CodigoParlamentar, IdentificacaoParlamentar.SiglaPartidoParlamentar)

df_relatorias_conso = df_relatorias_conso %>%
                          left_join(parci,by = join_by( CodigoParlamentar ==IdentificacaoParlamentar.CodigoParlamentar))

write_csv(df_relatorias_conso, "df_relatorias_conso.csv")

t = df_relatorias_conso %>%
        group_by(sigla_comissao, Ano, Nome, CodigoParlamentar) %>%
        summarise(n = n())

table(df_relatorias_cre$sigla_materia)


library(ggplot2)

df_relatorias_conso %>%
  filter(sigla_comissao %in% c("CAE", "CAS", "CCJ", "CDH", "CE", "CSP")) %>%
  ggplot() +
  aes(
    x = IdentificacaoParlamentar.SiglaPartidoParlamentar,
    fill = sigla_materia
  ) +
  geom_bar(position = "stack") +  # Use position = "stack" para barras empilhadas
  scale_fill_brewer(palette = "Set3") +
  labs(
    x = "Sigla do Partido",
    y = "Contagem de Matérias",
    fill = "Sigla da Matéria"
  ) +
  theme_minimal() +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1)
  ) +
  facet_wrap(vars(sigla_comissao), scales = "free")

# dados academicos

codigos_senadores = df_parlamentares$IdentificacaoParlamentar.CodigoParlamentar
dados_academicos <- obter_dados_academicos(codigos_senadores)

# partidos

url_partidos <- "https://legis.senado.leg.br/dadosabertos/senador/partidos"
df_partidos <- obter_dados_partidos(url_partidos)

# dados senadores e comissao

codigos_senadores <- df_parlamentares$IdentificacaoParlamentar.CodigoParlamentar
df_comissoes_parlamentares <- obter_dados_comissoes_parlamentares(codigos_senadores)

write_csv2(df_comissoes_parlamentares, "df_comissoes_parlamentares.csv")

# Exemplo de uso reunioes

ano1 <- c(2020:2023)
ano2 <- c(2012:2016)
ano3 <- c(2016:2019)

mes <- c(01, 02, 03, 04, 05, 06, 07, 08, 09, 10, 11, 12)

df_reunioes <- get_reunioes(ano = rep(ano1, each = length(mes)), mes = rep(mes, length(ano1)))

df_reunioes_cre2 <- get_reunioes(ano = rep(ano2, each = length(mes)), mes = rep(mes, length(ano2))) %>%
  filter(colegiadoCriador.sigla == "CRE")

df_reunioes_cre3 <- get_reunioes(ano = rep(ano3, each = length(mes)), mes = rep(mes, length(ano3))) %>%
  filter(colegiadoCriador.sigla == "CRE")

df_reunioes_cre_conso = rbind(df_reunioes_cre, df_reunioes_cre2)

glimpse(df_reunioes_cre)

write_csv(df_reunioes_cre_conso, "df_reunioes_cre.csv")

table(df_reunioes_cre$colegiadoCriador.sigla)

# Notas taquigráficas

teste = head(df_reunioes_cre)

teste$Conteudo <- sapply(teste$codigo, extrair_notas_taquigraficas)



