# Extrair as siglas ativas de matérias de uma URL específica

Esta função realiza o scraping de uma página XML contendo informações
sobre as siglas ativas de matérias e extrai os dados relevantes.

## Usage

``` r
extrair_siglas_ativas(
  url = "https://legis.senado.leg.br/dadosabertos/dados/ListaSiglas.xml"
)
```

## Arguments

- url:

  A URL do XML que contém as siglas ativas de matérias.

## Value

Um dataframe contendo as siglas ativas de matérias.

## Examples

``` r
extrair_siglas_ativas()
#>         Sigla
#> 1         ACE
#> 2         ACL
#> 3         ADF
#> 4         ADL
#> 5         ADV
#> 6         AFC
#> 7         AFS
#> 8       AJECN
#> 9         AMA
#> 10        AP.
#> 11        APR
#> 12        ATC
#> 13       ATCN
#> 14        ATD
#> 15        ATM
#> 16        ATN
#> 17        ATS
#> 18        AUT
#> 19        AV.
#> 20        AVE
#> 21        AVN
#> 22        AVS
#> 23        CAR
#> 24        CCC
#> 25        CCN
#> 26        CCS
#> 27        CEN
#> 28        CEP
#> 29        COM
#> 30        CON
#> 31        COP
#> 32        DAI
#> 33        DAS
#> 34        DCR
#> 35        DEN
#> 36        DIV
#> 37        DLG
#> 38        DTQ
#> 39        DVN
#> 40        ECD
#> 41        ECR
#> 42        EDS
#> 43     EMENDA
#> 44        ESC
#> 45        GTJ
#> 46        IAN
#> 47        IED
#> 48        INA
#> 49        INC
#> 50        INQ
#> 51        INS
#> 52        MCN
#> 53        MCR
#> 54        MDF
#> 55        MEM
#> 56        MOS
#> 57       MPCN
#> 58       MPSF
#> 59        MPV
#> 60        MSC
#> 61        MSF
#> 62        MSG
#> 63        OCS
#> 64         OF
#> 65        OF.
#> 66        OFC
#> 67       OFCN
#> 68        OFE
#> 69     OFICIO
#> 70        OFJ
#> 71        OFN
#> 72        OFS
#> 73       OFSF
#> 74      OFTFC
#> 75        P.C
#> 76        P.S
#> 77        PAC
#> 78        PAR
#> 79        PCA
#> 80        PCE
#> 81        PCJ
#> 82        PCS
#> 83        PDA
#> 84        PDC
#> 85        PDF
#> 86        PDG
#> 87        PDH
#> 88        PDL
#> 89        PDN
#> 90        PDR
#> 91        PDS
#> 92        PEC
#> 93        PER
#> 94        PET
#> 95        PFC
#> 96        PFS
#> 97         PL
#> 98        PL.
#> 99        PLC
#> 100     PLCNC
#> 101       PLD
#> 102       PLN
#> 103       PLP
#> 104       PLS
#> 105       PLV
#> 106       POR
#> 107        PR
#> 108       PR.
#> 109       PRA
#> 110       PRC
#> 111       PRF
#> 112      PRFC
#> 113       PRM
#> 114       PRN
#> 115      PROJ
#> 116      PROP
#> 117       PRP
#> 118       PRR
#> 119       PRS
#> 120       PTN
#> 121       QCN
#> 122       QED
#> 123       QSF
#> 124       R.C
#> 125       R.S
#> 126       RAE
#> 127       RAI
#> 128       RAN
#> 129       RAS
#> 130       RCD
#> 131       RCE
#> 132       RCJ
#> 133       RCM
#> 134       RCN
#> 135       RCP
#> 136       RCS
#> 137       RCT
#> 138       RDH
#> 139       RDR
#> 140       REC
#> 141       RED
#> 142      RELA
#> 143     RELA*
#> 144     RELAT
#> 145       REN
#> 146       REP
#> 147       REQ
#> 148       RFF
#> 149       RIC
#> 150       RMA
#> 151       RMC
#> 152       RPD
#> 153       RPF
#> 154       RQA
#> 155       RQC
#> 156       RQD
#> 157       RQE
#> 158       RQF
#> 159       RQI
#> 160       RQJ
#> 161       RQM
#> 162       RQN
#> 163       RQR
#> 164       RQS
#> 165       RRA
#> 166       RRC
#> 167       RRE
#> 168       RSF
#> 169       RSJ
#> 170       RTG
#> 171       RVM
#> 172       SCD
#> 173       SDS
#> 174       SIN
#> 175       SIT
#> 176       SOL
#> 177 SUBEMENDA
#> 178       SUG
#> 179       TEL
#> 180      TELG
#> 181       TLX
#> 182       TVR
#> 183       VET
#> 184     VETDF
#>                                                                                                 Descricao
#> 1                                                                           Aviso da Comissão de Educação
#> 2                                                                                Ato Conjunto Legislativo
#> 3                                                                                Anteprojeto de Lei do DF
#> 4                                                                      Anteprojeto de Decreto Legislativo
#> 5                                                                                             Advertencia
#> 6          Aviso da Comissão de Transparência, Governança, Fiscalização e Controle e Defesa do Consumidor
#> 7                                                                     Afastamento do Exercício do Mandato
#> 8                                                                           Ajuste de emenda orçamentária
#> 9                                  Aviso da Comissão de Meio Ambiente, Defesa do Cons. e Fisc. e Controle
#> 10                                                                                            Anteprojeto
#> 11                                                                     Anteprojeto de Resolução do Senado
#> 12                                                                                       Ato Convocatório
#> 13                                                        Ato do Presidente da Mesa do Congresso Nacional
#> 14                                                                               Ato da Comissão Diretora
#> 15                                                        Ato do Presidente da Mesa do Congresso Nacional
#> 16                                                     Ato Conjunto dos Presidentes do Senado e da Câmara
#> 17                                                                    Ato do Presidente do Senado Federal
#> 18                                                     Escolha de Autoridade para o Conselho da República
#> 19                                                                                                  Aviso
#> 20                                                               Aviso da Comissão de Assuntos Econômicos
#> 21                                                                                             Aviso (CN)
#> 22                                                                                                  Aviso
#> 23                                                                                                  Carta
#> 24                                                             Consulta do Conselho de Comunicação Social
#> 25                                                                         Consulta do Congresso Nacional
#> 26                                                                       Conselho Comunicação Social (SF)
#> 27                                                                                                Censura
#> 28                                                            Conselho de Ética e Decoro Parlamentar (SF)
#> 29                                                                                            Comunicação
#> 30                                                                                          Consulta (SF)
#> 31                                                                          Corregedoria Parlamentar (SF)
#> 32                                                                                Denúncia perante a CCAI
#> 33                                                               Denúncia da Comissão de Assuntos Sociais
#> 34                                                                       Diversos Comissão Representativa
#> 35                                                                                               Denúncia
#> 36                                                                                               Diversos
#> 37                                                                                    Decreto Legislativo
#> 38                                                                                               Destaque
#> 39                                                                                          Diversos (CN)
#> 40                                           Emenda(s) da Câmara dos Deputados a Projeto de Lei do Senado
#> 41                                                                       Emenda Constitucional de Revisão
#> 42                                     Emenda(s) da Câmara dos Deputados a Projeto de Decreto Legislativo
#> 43                                                                               Emenda a Projeto de Lei 
#> 44                                                               Estudo do Conselho de Comunicação Social
#> 45                                                                                      Grupo de Trabalho
#> 46                                                                      Indicação Assembleia Constituinte
#> 47                                                       Indicação do Cons. de Ética e Decoro Parlamentar
#> 48                                                                                Indicação de Autoridade
#> 49                                                                                         Indicação (CD)
#> 50                                                                                         Inquerito (SF)
#> 51                                                                                              Indicação
#> 52                                                                                          Mensagem (CN)
#> 53                                              Mensagem da Comissão Representativa do Congresso Nacional
#> 54                                                                           Mensagem do Distrito Federal
#> 55                                                                                               Memorial
#> 56                                                                                Moção do Senado Federal
#> 57                                                                           Mensagem do Presidente do CN
#> 58                                                                           Mensagem do Presidente do SF
#> 59                                                                                      Medida Provisória
#> 60                                                                                          Mensagem (CD)
#> 61                                                                                          Mensagem (SF)
#> 62                                                                                               Mensagem
#> 63                                                                 Ofício da Comissão de Assuntos Sociais
#> 64                                                                                    Ofício SF (Interno)
#> 65                                                                                       Ofício (Externo)
#> 66                                                                                            Ofício (CD)
#> 67                                                                                Ofício expedido pelo CN
#> 68                                                              Ofício da Comissão de Assuntos Econômicos
#> 69                                                                                                 Ofício
#> 70                                                Ofício da Comissão de Constituição, Justiça e Cidadania
#> 71                                                                                            Ofício (CN)
#> 72                                                                                             Ofício "S"
#> 73                                                                                Ofício expedido pelo SF
#> 74                     Ofício da Comissão de Transparência, Fiscalização, Controle e Defesa do Consumidor
#> 75                                                                                           Parecer (CD)
#> 76                                                                                           Parecer (SF)
#> 77                                                              Parecer do Conselho de Comunicação Social
#> 78                                                                                           Parecer (CN)
#> 79                                                                     Parecer da Assembleia Constituinte
#> 80                                                 Petição do Conselho de Ética e Decoro Parlamentar (SF)
#> 81                                                  Petição Comissão de Constituição, Justiça e Cidadania
#> 82                                                              Parecer do Conselho de Comunicação Social
#> 83                                                                       Projeto de Decisão da Assembleia
#> 84                                                                    Projeto de Decreto Legislativo (CD)
#> 85                                                                                   Projeto de Lei do DF
#> 86                                                                        Proposta Delegação Legisl. (CN)
#> 87                                     Petição da Comissão de Direitos Humanos e Legislação Participativa
#> 88                                                                         Projeto de Decreto Legislativo
#> 89                                                                    Projeto de Decreto Legislativo (CN)
#> 90                                                               Projeto de Decreto Legislativo (CR - CN)
#> 91                                                                    Projeto de Decreto Legislativo (SF)
#> 92                                                                      Proposta de Emenda à Constituição
#> 93                                                                          Proposta de Emenda Revisional
#> 94                                                                                           Petição (SF)
#> 95                                                                Proposta de Fiscalização e Controle(CD)
#> 96                                                                    Proposta de Fiscalização e Controle
#> 97                                                                                         Projeto de Lei
#> 98                                                                     PL-CR (Comissão Representativa-CN)
#> 99                                                                               Projeto de Lei da Câmara
#> 100                                              Projeto de Lei do Congresso - Complementar (1946 - 1970)
#> 101                                                                               Projeto de Lei Delegada
#> 102                                                                  Projeto de Lei do Congresso Nacional
#> 103                                                                           Projeto de Lei Complementar
#> 104                                                                              Projeto de Lei do Senado
#> 105                                                                      Projeto de Lei de Conversão (CN)
#> 106                                                                                              Portaria
#> 107                                                                    PR-CR (Comissão Representativa-CN)
#> 108                                            Projeto Resolução (Conselho de Etica e Decoro Parlamentar)
#> 109                                                       Projeto de Resolução da Assembleia Constituinte
#> 110                                                                             Projeto de Resolução (CD)
#> 111                                                                            Projeto de Resolução do SF
#> 112                                                                     Projeto de Reforma Constitucional
#> 113                                                                                             Premiação
#> 114                                                            Projeto de Resolução do Congresso Nacional
#> 115                                                                                 Projeto (1946 - 1970)
#> 116                                                                                Proposição (1946-1970)
#> 117                                                                         Procuradoria Parlamentar (SF)
#> 118                                                        Projeto de Resolução de Revisão Constitucional
#> 119                                                                        Projeto de Resolução do Senado
#> 120                                                                                          Petição (CN)
#> 121                                                                Questão de Ordem do Congresso Nacional
#> 122                                                                 Questão de Ordem do Conselho de Ética
#> 123                                                                    Questão de Ordem do Senado Federal
#> 124                                                                          Recurso (Congresso Nacional)
#> 125                                                                                          Recurso (SF)
#> 126                                                      Representação da Comissão de Assuntos Econômicos
#> 127                                                Requerimento da Comissão de Atividades de Inteligência
#> 128                                                                      Resolução da Assembleia Nacional
#> 129                                                          Requerimento da Comissão de Assuntos Sociais
#> 130                                                                                        Resolução (CD)
#> 131                                                                  Requerimento da Comissão de Educação
#> 132                                                         Representação Comissão Constituição e Justiça
#> 133                                                                        Requerimento de Comissão Mista
#> 134                                                                       Resolução do Congresso Nacional
#> 135                                                                  Requerimento da Comissão Parlamentar
#> 136                                                        Requerimento do Conselho de Comunicação Social
#> 137                                  Requerimento da Comissão de Ciência, Tec., Inov., Com. e Informática
#> 138                                  Requerimento Comissão de Direitos Humanos e Legislação Participativa
#> 139                                        Requerimento da Comissão de Desenvolvimento Regional e Turismo
#> 140                                                                                          Recurso (CD)
#> 141                                                Requerimento do Conselho de Ética e Decoro Parlamentar
#> 142                                                                                             Relatório
#> 143                                                                                             Relatório
#> 144                                                                                             Relatório
#> 145                                                                                              Renúncia
#> 146                                                                                         Representação
#> 147                                                                                          Requerimento
#> 148                                                             Requerimento da Comissão Senado do Futuro
#> 149                                                                      Requerimento de  Informação (CD)
#> 150                                                             Requerimento da Comissão de Meio Ambiente
#> 151                                                   Comissão Mista Permanente sobre Mudanças Climáticas
#> 152                                                                         Ressalva ao Primeiro PND (CN)
#> 153                                     Requerimento da Comissão para o Aprimoramento do Pacto Federativo
#> 154                                                                      Requerimento Assembleia Nacional
#> 155                                                                                     Requerimento (CD)
#> 156                                                                     Requerimento da Comissão Diretora
#> 157                                                       Requerimento da Comissão de Assuntos Econômicos
#> 158                                                        Requerimento da Comissão de Fiscal. e Controle
#> 159                                                Requerimento da Comissão de Serviços de Infraestrutura
#> 160                                        Requerimento  da Comissão de Constituição, Justiça e Cidadania
#> 161                                                                        Requerimento da Mesa do Senado
#> 162                                                                                     Requerimento (CN)
#> 163                                                               Requerimento da Comissão Representativa
#> 164                                                                                          Requerimento
#> 165                                             Requerimento da Comissão de Agricultura e Reforma Agrária
#> 166                                                        Recomendação do Conselho de Comunicação Social
#> 167                                     Requerimento da Comissão de Relações Exteriores e Defesa Nacional
#> 168                                                                                        Resolução (SF)
#> 169                                                       Requerimento da Subcomissão do Judiciário - CCJ
#> 170 Requerimento da Comissão de Transparência, Governança, Fiscalização e Controle e Defesa do Consumidor
#> 171                                 Requerimento da Comissão Mista de Combate à Violência contra a Mulher
#> 172                                       Substitutivo da Câmara dos Deputados a Projeto de Lei do Senado
#> 173                                 Substitutivo da Câmara dos Deputados a Projeto de Decreto Legislativo
#> 174                                                                                           Sindicância
#> 175                                                                 Solicitação de Informação ao TCU (CD)
#> 176                                       Solenidade de Entrega das Propostas de Reformas Constitucionais
#> 177                                                                                             Subemenda
#> 178                                                                                              Sugestão
#> 179                                                                                                 Telex
#> 180                                                                                             Telegrama
#> 181                                                                                                 Telex
#> 182                            Ato de Concessão e Renovação de Concessão de Emissora de Rádio e Televisão
#> 183                                                                                                  Veto
#> 184                                                                  Veto do Prefeito do Distrito Federal
#>     DataInicio    DataFim
#> 1   2017-01-01 2024-09-18
#> 2   2023-01-01       <NA>
#> 3   1940-01-01 2005-05-24
#> 4   1970-01-01 1990-07-27
#> 5   1946-01-01       <NA>
#> 6   2017-01-01 2024-09-18
#> 7   2008-01-01       <NA>
#> 8   2015-01-01       <NA>
#> 9   2012-02-13 2024-09-18
#> 10  1946-01-01       <NA>
#> 11  1970-01-01 2005-05-24
#> 12  2003-12-15 2024-09-27
#> 13  2016-01-01       <NA>
#> 14  2015-08-18       <NA>
#> 15  2007-11-01 2022-12-21
#> 16  2003-01-01 2022-12-21
#> 17  2005-01-03       <NA>
#> 18  1946-01-01 2024-09-27
#> 19  1900-01-01       <NA>
#> 20  2015-03-18 2024-09-18
#> 21  2000-05-11       <NA>
#> 22  1999-08-11       <NA>
#> 23  1946-01-01 1970-01-01
#> 24  2004-08-04       <NA>
#> 25  2005-01-01       <NA>
#> 26  1946-01-01       <NA>
#> 27  1946-01-01       <NA>
#> 28  1946-01-01       <NA>
#> 29  1946-01-01 1970-01-01
#> 30  1900-01-01       <NA>
#> 31  1970-01-01       <NA>
#> 32  2013-01-01       <NA>
#> 33  1997-11-11 2023-05-23
#> 34  1999-07-26       <NA>
#> 35  1946-01-01       <NA>
#> 36  1946-01-01 2024-09-18
#> 37  1946-01-01       <NA>
#> 38  2020-08-13 2024-06-03
#> 39  1970-01-01 2024-09-18
#> 40  1988-10-05 2018-12-31
#> 41  1946-01-01       <NA>
#> 42  2011-05-11 2018-12-31
#> 43  1946-01-01       <NA>
#> 44  2004-08-04       <NA>
#> 45  2007-01-01       <NA>
#> 46  1946-01-01       <NA>
#> 47  2001-09-13 2005-05-24
#> 48  1970-01-01 2005-05-24
#> 49  1900-01-01 1968-06-21
#> 50  1946-01-01       <NA>
#> 51  1900-01-01       <NA>
#> 52  1900-01-01       <NA>
#> 53  2010-01-21       <NA>
#> 54  1900-01-01 1990-12-12
#> 55  1946-01-01 1970-01-01
#> 56  2001-09-18       <NA>
#> 57  2017-01-01       <NA>
#> 58  2017-01-01       <NA>
#> 59  1900-01-01       <NA>
#> 60  1900-01-01 2024-09-27
#> 61  1900-01-01       <NA>
#> 62  1900-01-01       <NA>
#> 63  2012-04-10 2019-06-27
#> 64  1900-01-01       <NA>
#> 65  1900-01-01       <NA>
#> 66  1900-01-01 1999-01-31
#> 67  2017-01-01       <NA>
#> 68  2002-10-01 2019-06-27
#> 69  2018-05-16 2024-09-18
#> 70  2002-10-01 2019-06-27
#> 71  1970-01-01       <NA>
#> 72  1900-01-01       <NA>
#> 73  2017-01-01       <NA>
#> 74  2017-01-01 2019-06-27
#> 75  1900-01-01 1984-03-16
#> 76  1900-01-01       <NA>
#> 77  1946-01-01       <NA>
#> 78  1900-01-01       <NA>
#> 79  1900-01-01 1999-01-31
#> 80  2006-04-01       <NA>
#> 81  2007-01-01       <NA>
#> 82  2012-09-11       <NA>
#> 83  1946-01-01       <NA>
#> 84  1900-01-01 2018-12-31
#> 85  1900-01-01 1990-11-21
#> 86  1900-01-01 1985-06-11
#> 87  2007-03-26       <NA>
#> 88  2018-08-02       <NA>
#> 89  1900-01-01       <NA>
#> 90  2001-01-16       <NA>
#> 91  1900-01-01 2018-12-31
#> 92  1900-01-01       <NA>
#> 93  1946-01-01       <NA>
#> 94  1940-08-14       <NA>
#> 95  1946-01-01 2024-09-27
#> 96  1900-01-01       <NA>
#> 97  1900-01-01       <NA>
#> 98  1900-01-01 2005-05-24
#> 99  1900-01-01 2018-12-31
#> 100 1946-01-01 1970-01-01
#> 101 1946-01-01       <NA>
#> 102 1900-01-01       <NA>
#> 103 1900-01-01       <NA>
#> 104 1900-01-01 2018-12-31
#> 105 1900-01-01       <NA>
#> 106 2005-08-16 2018-12-21
#> 107 1900-01-01 1992-01-16
#> 108 1946-01-01 2018-12-21
#> 109 1946-01-01 2018-12-21
#> 110 1900-01-01 1999-01-31
#> 111 1946-01-01 2018-12-21
#> 112 1946-01-01 1970-01-01
#> 113 2017-01-01       <NA>
#> 114 1900-01-01       <NA>
#> 115 1946-01-01 1970-01-01
#> 116 1946-01-01 1970-01-01
#> 117 1946-01-01       <NA>
#> 118 1900-01-01 1994-05-26
#> 119 1900-01-01       <NA>
#> 120 2001-12-05       <NA>
#> 121 2000-01-26       <NA>
#> 122 2001-09-24       <NA>
#> 123 2000-01-26       <NA>
#> 124 1900-01-01       <NA>
#> 125 1900-01-01       <NA>
#> 126 2002-03-13 2018-12-21
#> 127 2000-11-21 2018-12-31
#> 128 1946-01-01 2018-12-21
#> 129 2003-03-13 2018-12-31
#> 130 1946-01-01 2018-12-21
#> 131 2001-08-29 2018-12-31
#> 132 2002-05-08 2018-12-21
#> 133 1946-01-01 2018-12-31
#> 134 1900-01-01 1990-04-20
#> 135 1946-01-01 2018-12-31
#> 136 2001-07-11 2018-12-31
#> 137 2007-04-04 2018-12-31
#> 138 2005-03-10 2018-12-31
#> 139 2009-03-30 2018-12-31
#> 140 1946-01-01 2018-12-21
#> 141 2000-12-12 2018-12-31
#> 142 1946-01-01 2018-12-21
#> 143 1946-01-01 1970-01-01
#> 144 1946-01-01 2018-12-21
#> 145 2000-12-14 2018-12-21
#> 146 1900-01-01       <NA>
#> 147 1946-01-01       <NA>
#> 148 2013-10-01 2018-12-31
#> 149 1946-01-01 2018-12-21
#> 150 2005-02-23 2018-12-31
#> 151 2009-04-07 2018-12-31
#> 152 1900-01-01 1972-04-02
#> 153 2016-02-02 2018-12-31
#> 154 1946-01-01 2018-12-21
#> 155 1900-01-01 1999-01-31
#> 156 2016-01-01 2018-12-31
#> 157 2000-10-04 2018-12-31
#> 158 2001-04-18 2005-02-23
#> 159 2000-11-07 2018-12-31
#> 160 1999-12-15 2018-12-31
#> 161 1900-01-01 2018-12-31
#> 162 1900-01-01       <NA>
#> 163 1900-01-01 2018-12-31
#> 164 1900-01-01       <NA>
#> 165 2007-01-01 2018-12-31
#> 166 2004-08-04       <NA>
#> 167 2001-10-03 2018-12-31
#> 168 1900-01-01 1992-12-31
#> 169 2000-09-01 2001-12-31
#> 170 2015-09-22 2018-12-31
#> 171 2015-03-23 2018-12-31
#> 172 1999-02-16 2018-12-31
#> 173 2011-05-11 2018-12-31
#> 174 1900-01-01 2018-12-21
#> 175 1946-01-01 2018-12-21
#> 176 2003-01-01 2018-12-21
#> 177 1946-01-01       <NA>
#> 178 1900-01-01       <NA>
#> 179 1900-01-01 1986-08-13
#> 180 1946-01-01 1970-01-01
#> 181 1946-01-01 2018-12-21
#> 182 1948-01-01       <NA>
#> 183 1901-01-01       <NA>
#> 184 1948-01-01 1960-12-31
```
