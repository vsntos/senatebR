# Changelog

## senatebR 0.1.0

Primeira versão do pacote. Inclui 36 funções para coleta de dados do
Senado Federal via API pública e web scraping.

### Senadores e mandatos

- [`obter_dados_senadores_legislatura()`](../reference/obter_dados_senadores_legislatura.md)
  — lista senadores por legislatura
- [`get_afastados()`](../reference/get_afastados.md) — senadores
  afastados
- [`dados_academicos()`](../reference/dados_academicos.md) — formação
  acadêmica dos senadores
- [`processar_xml_mandatos()`](../reference/processar_xml_mandatos.md) —
  dados de mandato via XML
- [`processar_xml_profissoes()`](../reference/processar_xml_profissoes.md)
  — profissões declaradas via XML
- [`processar_xml_liderancas()`](../reference/processar_xml_liderancas.md)
  — lideranças parlamentares via XML
- [`processar_xml_apartes()`](../reference/processar_xml_apartes.md) —
  apartes parlamentares via XML

### Votações

- [`extrair_votacoes_por_ano()`](../reference/extrair_votacoes_por_ano.md)
  — votações do plenário por ano
- [`extrair_votacoes_nominais_por_ano()`](../reference/extrair_votacoes_nominais_por_ano.md)
  — votos nominais detalhados por ano
- [`coletar_votacoes_multiplos()`](../reference/coletar_votacoes_multiplos.md)
  — votos de múltiplos senadores em múltiplos anos
- [`coletar_orientacao_votacao()`](../reference/coletar_orientacao_votacao.md)
  — orientação de bancada por sessão

### Pronunciamentos e discursos

- [`extrair_discursos()`](../reference/extrair_discursos.md) — discursos
  no plenário por senador
- [`extrair_pronunciamentos_multi()`](../reference/extrair_pronunciamentos_multi.md)
  — pronunciamentos de múltiplos senadores por intervalo de ano
- [`extrair_notas_taquigraficas()`](../reference/extrair_notas_taquigraficas.md)
  — notas taquigráficas de reuniões

### Comissões

- [`dados_comissoes()`](../reference/dados_comissoes.md) — lista básica
  de comissões permanentes (web scraping)
- [`obter_dados_comissoes_parlamentares()`](../reference/obter_dados_comissoes_parlamentares.md)
  — composição de comissões via API
- [`extrair_dados_comissao_senador()`](../reference/extrair_dados_comissao_senador.md)
  — participação de um senador por comissão
- [`info_dados_reuniao_comissao()`](../reference/info_dados_reuniao_comissao.md)
  — reuniões de comissão por período
- [`info_dados_reuniao_nota()`](../reference/info_dados_reuniao_nota.md)
  — notas de reuniões de comissão

### Matérias legislativas

- [`materias_legislatura_atual()`](../reference/materias_legislatura_atual.md)
  — matérias em tramitação na legislatura atual
- [`info_materia_temas()`](../reference/info_materia_temas.md) — temas e
  assuntos legislativos
- [`info_atualizacao_materias()`](../reference/info_atualizacao_materias.md)
  — últimas atualizações de matérias
- [`extrair_situacoes_tramitacao()`](../reference/extrair_situacoes_tramitacao.md)
  — situações de tramitação disponíveis
- [`extrair_classificacoes_materia()`](../reference/extrair_classificacoes_materia.md)
  — classificações de matéria
- [`coletar_autorias_parlamentares()`](../reference/coletar_autorias_parlamentares.md)
  — autorias de matérias por parlamentar
- [`dados_relatorias_parlamentares()`](../reference/dados_relatorias_parlamentares.md)
  — relatorias de matérias por parlamentar

### Vetos e Medidas Provisórias

- [`info_vetos()`](../reference/info_vetos.md) — lista de vetos
  encerrados (web scraping)
- [`dados_vetos()`](../reference/dados_vetos.md) — partes vetadas por
  URL de veto
- [`extrair_detalhes_vetos()`](../reference/extrair_detalhes_vetos.md) —
  detalhes de vetos por URL
- [`coletar_medidas_provisorias_em_tramitacao()`](../reference/coletar_medidas_provisorias_em_tramitacao.md)
  — MPs em tramitação
- [`coletar_medidas_provisorias_encerradas()`](../reference/coletar_medidas_provisorias_encerradas.md)
  — MPs encerradas por número de páginas

### Referências e metadados

- [`info_agenda()`](../reference/info_agenda.md) — agenda do Congresso
  Nacional
- [`obter_dados_partidos()`](../reference/obter_dados_partidos.md) —
  partidos políticos registrados
- [`extrair_siglas_ativas()`](../reference/extrair_siglas_ativas.md) —
  siglas de matérias ativas
- [`extrair_tipos_comparecimento()`](../reference/extrair_tipos_comparecimento.md)
  — tipos de comparecimento em votação
- [`extrair_tipos_decisao()`](../reference/extrair_tipos_decisao.md) —
  tipos de decisão de matéria
