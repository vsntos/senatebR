# senatebR 0.1.0

Primeira versão do pacote. Inclui 36 funções para coleta de dados do Senado Federal
via API pública e web scraping.

## Senadores e mandatos

* `obter_dados_senadores_legislatura()` — lista senadores por legislatura
* `get_afastados()` — senadores afastados
* `dados_academicos()` — formação acadêmica dos senadores
* `processar_xml_mandatos()` — dados de mandato via XML
* `processar_xml_profissoes()` — profissões declaradas via XML
* `processar_xml_liderancas()` — lideranças parlamentares via XML
* `processar_xml_apartes()` — apartes parlamentares via XML

## Votações

* `extrair_votacoes_por_ano()` — votações do plenário por ano
* `extrair_votacoes_nominais_por_ano()` — votos nominais detalhados por ano
* `coletar_votacoes_multiplos()` — votos de múltiplos senadores em múltiplos anos
* `coletar_orientacao_votacao()` — orientação de bancada por sessão

## Pronunciamentos e discursos

* `extrair_discursos()` — discursos no plenário por senador
* `extrair_pronunciamentos_multi()` — pronunciamentos de múltiplos senadores por intervalo de ano
* `extrair_notas_taquigraficas()` — notas taquigráficas de reuniões

## Comissões

* `dados_comissoes()` — lista básica de comissões permanentes (web scraping)
* `obter_dados_comissoes_parlamentares()` — composição de comissões via API
* `extrair_dados_comissao_senador()` — participação de um senador por comissão
* `info_dados_reuniao_comissao()` — reuniões de comissão por período
* `info_dados_reuniao_nota()` — notas de reuniões de comissão

## Matérias legislativas

* `materias_legislatura_atual()` — matérias em tramitação na legislatura atual
* `info_materia_temas()` — temas e assuntos legislativos
* `info_atualizacao_materias()` — últimas atualizações de matérias
* `extrair_situacoes_tramitacao()` — situações de tramitação disponíveis
* `extrair_classificacoes_materia()` — classificações de matéria
* `coletar_autorias_parlamentares()` — autorias de matérias por parlamentar
* `dados_relatorias_parlamentares()` — relatorias de matérias por parlamentar

## Vetos e Medidas Provisórias

* `info_vetos()` — lista de vetos encerrados (web scraping)
* `dados_vetos()` — partes vetadas por URL de veto
* `extrair_detalhes_vetos()` — detalhes de vetos por URL
* `coletar_medidas_provisorias_em_tramitacao()` — MPs em tramitação
* `coletar_medidas_provisorias_encerradas()` — MPs encerradas por número de páginas

## Referências e metadados

* `info_agenda()` — agenda do Congresso Nacional
* `obter_dados_partidos()` — partidos políticos registrados
* `extrair_siglas_ativas()` — siglas de matérias ativas
* `extrair_tipos_comparecimento()` — tipos de comparecimento em votação
* `extrair_tipos_decisao()` — tipos de decisão de matéria
