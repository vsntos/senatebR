# senatebR: Funções para coleta de dados do Senado Federal Brasileiro

O pacote senatebR oferece acesso programático às informações do Senado
Federal via API oficial e web scraping. As funções cobrem votações,
pronunciamentos, comissões, matérias legislativas, vetos, medidas
provisórias e dados biográficos dos senadores.

## Principais categorias de funções

**Senadores e mandatos:**

- [`obter_dados_senadores_legislatura`](obter_dados_senadores_legislatura.md)
  — lista senadores por legislatura

- [`get_afastados`](get_afastados.md) — senadores afastados

- [`dados_academicos`](dados_academicos.md) — formação acadêmica

- [`processar_xml_mandatos`](processar_xml_mandatos.md) — dados de
  mandato

- [`processar_xml_profissoes`](processar_xml_profissoes.md) — profissões
  declaradas

**Votações:**

- [`extrair_votacoes_por_ano`](extrair_votacoes_por_ano.md) — votações
  por ano

- [`extrair_votacoes_nominais_por_ano`](extrair_votacoes_nominais_por_ano.md)
  — votos nominais por ano

- [`coletar_votacoes_multiplos`](coletar_votacoes_multiplos.md) — votos
  de múltiplos senadores

- [`coletar_orientacao_votacao`](coletar_orientacao_votacao.md) —
  orientação de bancada

**Pronunciamentos e discursos:**

- [`extrair_discursos`](extrair_discursos.md) — discursos no plenário

- [`extrair_pronunciamentos_multi`](extrair_pronunciamentos_multi.md) —
  pronunciamentos de múltiplos senadores

- [`extrair_notas_taquigraficas`](extrair_notas_taquigraficas.md) —
  notas taquigráficas

- [`processar_xml_apartes`](processar_xml_apartes.md) — apartes
  parlamentares

**Comissões:**

- [`dados_comissoes`](dados_comissoes.md) — lista de comissões

- [`obter_dados_comissoes_parlamentares`](obter_dados_comissoes_parlamentares.md)
  — composição via API

- [`extrair_dados_comissao_senador`](extrair_dados_comissao_senador.md)
  — participação por senador

- [`info_dados_reuniao_comissao`](info_dados_reuniao_comissao.md) —
  reuniões de comissão

- [`info_dados_reuniao_nota`](info_dados_reuniao_nota.md) — notas de
  reunião

- [`processar_xml_liderancas`](processar_xml_liderancas.md) — lideranças

**Matérias legislativas:**

- [`materias_legislatura_atual`](materias_legislatura_atual.md) —
  matérias da legislatura atual

- [`info_materia_temas`](info_materia_temas.md) — temas e assuntos

- [`info_atualizacao_materias`](info_atualizacao_materias.md) — últimas
  atualizações

- [`extrair_situacoes_tramitacao`](extrair_situacoes_tramitacao.md) —
  situações de tramitação

- [`extrair_classificacoes_materia`](extrair_classificacoes_materia.md)
  — classificações

- [`coletar_autorias_parlamentares`](coletar_autorias_parlamentares.md)
  — autorias

- [`dados_relatorias_parlamentares`](dados_relatorias_parlamentares.md)
  — relatorias

**Vetos e Medidas Provisórias:**

- [`info_vetos`](info_vetos.md) — lista de vetos

- [`dados_vetos`](dados_vetos.md) — dados detalhados de vetos

- [`extrair_detalhes_vetos`](extrair_detalhes_vetos.md) — detalhes dos
  vetos

- [`coletar_medidas_provisorias_em_tramitacao`](coletar_medidas_provisorias_em_tramitacao.md)
  — MPs em tramitação

- [`coletar_medidas_provisorias_encerradas`](coletar_medidas_provisorias_encerradas.md)
  — MPs encerradas

**Outros:**

- [`info_agenda`](info_agenda.md) — agenda do Congresso

- [`obter_dados_partidos`](obter_dados_partidos.md) — partidos políticos

- [`extrair_siglas_ativas`](extrair_siglas_ativas.md) — siglas
  partidárias ativas

- [`extrair_tipos_comparecimento`](extrair_tipos_comparecimento.md) —
  tipos de comparecimento

- [`extrair_tipos_decisao`](extrair_tipos_decisao.md) — tipos de decisão

## Author

Vinicius Santos <santos.vinicius18@gmail.com>
