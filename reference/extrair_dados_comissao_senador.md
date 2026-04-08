# Extrai dados das comissões de um senador

Esta função extrai os dados das comissões de um senador com base no seu
código parlamentar.

## Usage

``` r
extrair_dados_comissao_senador(codigo_senador)
```

## Arguments

- codigo_senador:

  O código do senador.

## Value

Um data frame contendo os dados das comissões do senador.

## Examples

``` r
codigo_senador <- "5008"
extrair_dados_comissao_senador(codigo_senador)
#>     CodigoParlamentar
#> 1                5008
#> 2                5008
#> 3                5008
#> 4                5008
#> 5                5008
#> 6                5008
#> 7                5008
#> 8                5008
#> 9                5008
#> 10               5008
#> 11               5008
#> 12               5008
#> 13               5008
#> 14               5008
#> 15               5008
#> 16               5008
#> 17               5008
#> 18               5008
#> 19               5008
#> 20               5008
#> 21               5008
#> 22               5008
#> 23               5008
#> 24               5008
#> 25               5008
#> 26               5008
#> 27               5008
#> 28               5008
#> 29               5008
#> 30               5008
#> 31               5008
#> 32               5008
#> 33               5008
#> 34               5008
#> 35               5008
#> 36               5008
#> 37               5008
#> 38               5008
#> 39               5008
#> 40               5008
#> 41               5008
#> 42               5008
#> 43               5008
#> 44               5008
#> 45               5008
#> 46               5008
#> 47               5008
#> 48               5008
#> 49               5008
#> 50               5008
#> 51               5008
#> 52               5008
#> 53               5008
#> 54               5008
#> 55               5008
#> 56               5008
#> 57               5008
#> 58               5008
#> 59               5008
#> 60               5008
#> 61               5008
#> 62               5008
#> 63               5008
#> 64               5008
#> 65               5008
#> 66               5008
#> 67               5008
#> 68               5008
#> 69               5008
#> 70               5008
#> 71               5008
#> 72               5008
#> 73               5008
#> 74               5008
#> 75               5008
#> 76               5008
#> 77               5008
#> 78               5008
#> 79               5008
#> 80               5008
#> 81               5008
#> 82               5008
#> 83               5008
#> 84               5008
#> 85               5008
#> 86               5008
#> 87               5008
#> 88               5008
#> 89               5008
#> 90               5008
#> 91               5008
#> 92               5008
#> 93               5008
#> 94               5008
#> 95               5008
#> 96               5008
#> 97               5008
#> 98               5008
#> 99               5008
#> 100              5008
#> 101              5008
#> 102              5008
#> 103              5008
#> 104              5008
#> 105              5008
#> 106              5008
#> 107              5008
#> 108              5008
#> 109              5008
#> 110              5008
#> 111              5008
#> 112              5008
#> 113              5008
#> 114              5008
#> 115              5008
#> 116              5008
#> 117              5008
#> 118              5008
#> 119              5008
#> 120              5008
#> 121              5008
#> 122              5008
#> 123              5008
#> 124              5008
#> 125              5008
#> 126              5008
#> 127              5008
#> 128              5008
#> 129              5008
#> 130              5008
#> 131              5008
#> 132              5008
#> 133              5008
#> 134              5008
#> 135              5008
#> 136              5008
#> 137              5008
#> 138              5008
#> 139              5008
#> 140              5008
#> 141              5008
#> 142              5008
#> 143              5008
#> 144              5008
#> 145              5008
#> 146              5008
#> 147              5008
#> 148              5008
#> 149              5008
#> 150              5008
#> 151              5008
#> 152              5008
#> 153              5008
#> 154              5008
#> 155              5008
#> 156              5008
#> 157              5008
#> 158              5008
#> 159              5008
#> 160              5008
#> 161              5008
#> 162              5008
#> 163              5008
#> 164              5008
#> 165              5008
#> 166              5008
#> 167              5008
#> 168              5008
#> 169              5008
#> 170              5008
#> 171              5008
#> 172              5008
#> 173              5008
#> 174              5008
#> 175              5008
#> 176              5008
#> 177              5008
#> 178              5008
#> 179              5008
#> 180              5008
#> 181              5008
#> 182              5008
#> 183              5008
#> 184              5008
#> 185              5008
#> 186              5008
#> 187              5008
#> 188              5008
#> 189              5008
#> 190              5008
#> 191              5008
#> 192              5008
#> 193              5008
#> 194              5008
#> 195              5008
#> 196              5008
#> 197              5008
#> 198              5008
#> 199              5008
#> 200              5008
#> 201              5008
#> 202              5008
#> 203              5008
#> 204              5008
#> 205              5008
#> 206              5008
#> 207              5008
#> 208              5008
#> 209              5008
#> 210              5008
#> 211              5008
#> 212              5008
#> 213              5008
#> 214              5008
#> 215              5008
#> 216              5008
#> 217              5008
#> 218              5008
#> 219              5008
#> 220              5008
#> 221              5008
#> 222              5008
#> 223              5008
#> 224              5008
#> 225              5008
#> 226              5008
#> 227              5008
#> 228              5008
#> 229              5008
#> 230              5008
#> 231              5008
#> 232              5008
#> 233              5008
#> 234              5008
#> 235              5008
#> 236              5008
#> 237              5008
#> 238              5008
#> 239              5008
#> 240              5008
#> 241              5008
#> 242              5008
#> 243              5008
#> 244              5008
#> 245              5008
#> 246              5008
#> 247              5008
#> 248              5008
#> 249              5008
#> 250              5008
#> 251              5008
#> 252              5008
#> 253              5008
#> 254              5008
#> 255              5008
#> 256              5008
#> 257              5008
#> 258              5008
#> 259              5008
#> 260              5008
#> 261              5008
#> 262              5008
#> 263              5008
#> 264              5008
#> 265              5008
#> 266              5008
#> 267              5008
#> 268              5008
#> 269              5008
#> 270              5008
#> 271              5008
#> 272              5008
#> 273              5008
#> 274              5008
#> 275              5008
#> 276              5008
#> 277              5008
#> 278              5008
#> 279              5008
#> 280              5008
#> 281              5008
#> 282              5008
#> 283              5008
#> 284              5008
#> 285              5008
#> 286              5008
#> 287              5008
#> 288              5008
#> 289              5008
#> 290              5008
#> 291              5008
#> 292              5008
#> 293              5008
#> 294              5008
#> 295              5008
#> 296              5008
#> 297              5008
#> 298              5008
#> 299              5008
#> 300              5008
#> 301              5008
#> 302              5008
#> 303              5008
#> 304              5008
#> 305              5008
#> 306              5008
#> 307              5008
#> 308              5008
#> 309              5008
#> 310              5008
#> 311              5008
#> 312              5008
#> 313              5008
#> 314              5008
#> 315              5008
#> 316              5008
#> 317              5008
#> 318              5008
#> 319              5008
#> 320              5008
#> 321              5008
#> 322              5008
#> 323              5008
#> 324              5008
#> 325              5008
#> 326              5008
#> 327              5008
#> 328              5008
#> 329              5008
#> 330              5008
#> 331              5008
#> 332              5008
#> 333              5008
#> 334              5008
#> 335              5008
#> 336              5008
#> 337              5008
#> 338              5008
#> 339              5008
#> 340              5008
#> 341              5008
#> 342              5008
#> 343              5008
#> 344              5008
#> 345              5008
#> 346              5008
#> 347              5008
#> 348              5008
#> 349              5008
#> 350              5008
#> 351              5008
#> 352              5008
#> 353              5008
#> 354              5008
#> 355              5008
#> 356              5008
#> 357              5008
#> 358              5008
#> 359              5008
#> 360              5008
#> 361              5008
#> 362              5008
#> 363              5008
#> 364              5008
#> 365              5008
#> 366              5008
#> 367              5008
#> 368              5008
#> 369              5008
#> 370              5008
#> 371              5008
#> 372              5008
#> 373              5008
#> 374              5008
#> 375              5008
#> 376              5008
#> 377              5008
#> 378              5008
#> 379              5008
#> 380              5008
#> 381              5008
#> 382              5008
#> 383              5008
#> 384              5008
#> 385              5008
#> 386              5008
#> 387              5008
#> 388              5008
#> 389              5008
#> 390              5008
#> 391              5008
#> 392              5008
#> 393              5008
#> 394              5008
#> 395              5008
#> 396              5008
#> 397              5008
#> 398              5008
#> 399              5008
#> 400              5008
#> 401              5008
#> 402              5008
#> 403              5008
#> 404              5008
#> 405              5008
#> 406              5008
#> 407              5008
#> 408              5008
#> 409              5008
#> 410              5008
#> 411              5008
#> 412              5008
#> 413              5008
#> 414              5008
#> 415              5008
#> 416              5008
#> 417              5008
#> 418              5008
#> 419              5008
#> 420              5008
#> 421              5008
#> 422              5008
#> 423              5008
#> 424              5008
#> 425              5008
#> 426              5008
#> 427              5008
#> 428              5008
#> 429              5008
#> 430              5008
#> 431              5008
#> 432              5008
#> 433              5008
#> 434              5008
#> 435              5008
#> 436              5008
#> 437              5008
#> 438              5008
#> 439              5008
#> 440              5008
#> 441              5008
#> 442              5008
#> 443              5008
#> 444              5008
#> 445              5008
#> 446              5008
#> 447              5008
#> 448              5008
#> 449              5008
#> 450              5008
#> 451              5008
#> 452              5008
#> 453              5008
#> 454              5008
#> 455              5008
#> 456              5008
#> 457              5008
#> 458              5008
#> 459              5008
#> 460              5008
#> 461              5008
#> 462              5008
#> 463              5008
#> 464              5008
#> 465              5008
#> 466              5008
#> 467              5008
#> 468              5008
#> 469              5008
#> 470              5008
#> 471              5008
#> 472              5008
#> 473              5008
#> 474              5008
#> 475              5008
#>                                                                                                                                    Comissoes
#> 1                                                                                                      CAE - Comissão de Assuntos Econômicos
#> 2                                                                                                      CAE - Comissão de Assuntos Econômicos
#> 3                                                                                                      CAE - Comissão de Assuntos Econômicos
#> 4                                                                                                      CAE - Comissão de Assuntos Econômicos
#> 5                                                                                                      CAE - Comissão de Assuntos Econômicos
#> 6                                                                                                      CAE - Comissão de Assuntos Econômicos
#> 7                                                                                                         CAS - Comissão de Assuntos Sociais
#> 8                                                            CASSAUDE - Subcomissão Permanente de Promoção, Acompanhamento e Defesa da Saúde
#> 9                                                                                                         CAS - Comissão de Assuntos Sociais
#> 10                                                                                                        CAS - Comissão de Assuntos Sociais
#> 11                                                                                                        CAS - Comissão de Assuntos Sociais
#> 12                                                                                                        CAS - Comissão de Assuntos Sociais
#> 13                                                                                                        CAS - Comissão de Assuntos Sociais
#> 14                                                                                                        CAS - Comissão de Assuntos Sociais
#> 15                                                                          CCAI - Comissão Mista de Controle das Atividades de Inteligência
#> 16                                                                                          CCDD - Comissão de Comunicação e Direito Digital
#> 17                                                                                       CCJ - Comissão de Constituição, Justiça e Cidadania
#> 18                                                                                       CCJ - Comissão de Constituição, Justiça e Cidadania
#> 19                                                                                       CCJ - Comissão de Constituição, Justiça e Cidadania
#> 20                                                                                       CCJ - Comissão de Constituição, Justiça e Cidadania
#> 21                                                                                       CCJ - Comissão de Constituição, Justiça e Cidadania
#> 22                                                                                       CCJ - Comissão de Constituição, Justiça e Cidadania
#> 23                                                                                       CCJ - Comissão de Constituição, Justiça e Cidadania
#> 24                                                                                       CCJ - Comissão de Constituição, Justiça e Cidadania
#> 25                                                                                       CCJ - Comissão de Constituição, Justiça e Cidadania
#> 26                                                                                       CCJ - Comissão de Constituição, Justiça e Cidadania
#> 27                                                                                       CCJ - Comissão de Constituição, Justiça e Cidadania
#> 28                                                                                       CCJ - Comissão de Constituição, Justiça e Cidadania
#> 29                                                                             CCT - Comissão de Ciência, Tecnologia, Inovação e Informática
#> 30                                                                                                    CDD - Comissão de Defesa da Democracia
#> 31                                                                                                    CDD - Comissão de Defesa da Democracia
#> 32                                                                             CDH - Comissão de Direitos Humanos e Legislação Participativa
#> 33                                                                             CDH - Comissão de Direitos Humanos e Legislação Participativa
#> 34                                                                             CDH - Comissão de Direitos Humanos e Legislação Participativa
#> 35                                                                             CDH - Comissão de Direitos Humanos e Legislação Participativa
#> 36                                                                             CDH - Comissão de Direitos Humanos e Legislação Participativa
#> 37                                                                             CDH - Comissão de Direitos Humanos e Legislação Participativa
#> 38                                                                             CDH - Comissão de Direitos Humanos e Legislação Participativa
#> 39                                                                             CDH - Comissão de Direitos Humanos e Legislação Participativa
#> 40                                                                          CDHC - Conselho da Comenda de Direitos Humanos Dom Hélder Câmara
#> 41                                                                                      CDR - Comissão de Desenvolvimento Regional e Turismo
#> 42                                                                                      CDR - Comissão de Desenvolvimento Regional e Turismo
#> 43                                                                                      CDR - Comissão de Desenvolvimento Regional e Turismo
#> 44                                                                                      CDR - Comissão de Desenvolvimento Regional e Turismo
#> 45                                                                                                       CE - Comissão de Educação e Cultura
#> 46                                                                                                       CE - Comissão de Educação e Cultura
#> 47                                          CEEEFCB - Subcomissão Permanente sobre Esporte, Educação Física e Formação de Categorias de Base
#> 48                                                                                                       CE - Comissão de Educação e Cultura
#> 49                                                                                                       CE - Comissão de Educação e Cultura
#> 50                                                                                      CEDN - Comissão Especial do Desenvolvimento Nacional
#> 51                                                                                             CEDP - Conselho de Ética e Decoro Parlamentar
#> 52                                                                                           CEI2016 - Comissão Especial do Impeachment 2016
#> 53                                                                                      CEOI - Comissão Especial das Obras Inacabadas - 2016
#> 54                                                                                                                CEsp - Comissão de Esporte
#> 55                                                                                                                CEsp - Comissão de Esporte
#> 56                                                                                               CI - Comissão de Serviços de Infraestrutura
#> 57                                                                                               CI - Comissão de Serviços de Infraestrutura
#> 58                                                                                               CI - Comissão de Serviços de Infraestrutura
#> 59                                                                                                           CMA - Comissão de Meio Ambiente
#> 60                                                                                                           CMA - Comissão de Meio Ambiente
#> 61                                                    CMAOBRAS - Subcomissão Temporária de Acompanhamento e Fiscalização de Obras Inacabadas
#> 62                                                                                                           CMA - Comissão de Meio Ambiente
#> 63                                                                                  CMDG - Comenda Missionários Daniel Berg e Gunnar Vingren
#> 64                                                                        CME Lei Kandir - Comissão Mista Especial sobre a Lei Kandir - 2017
#> 65                                                                                CMMC - Comissão Mista Permanente sobre Mudanças Climáticas
#> 66                                                                                CMMC - Comissão Mista Permanente sobre Mudanças Climáticas
#> 67                                                                                                                        CMMPV - modelo MPV
#> 68                                                                                                                        CMMPV - modelo MPV
#> 69                                                                    CMMPV 1154/2023 - Comissão Mista da Medida Provisória n° 1154, de 2023
#> 70                                                                    CMMPV 1155/2023 - Comissão Mista da Medida Provisória n° 1155, de 2023
#> 71                                                                    CMMPV 1156/2023 - Comissão Mista da Medida Provisória n° 1156, de 2023
#> 72                                                                    CMMPV 1157/2023 - Comissão Mista da Medida Provisória n° 1157, de 2023
#> 73                                                                    CMMPV 1158/2023 - Comissão Mista da Medida Provisória n° 1158, de 2023
#> 74                                                                    CMMPV 1159/2023 - Comissão Mista da Medida Provisória n° 1159, de 2023
#> 75                                                                    CMMPV 1160/2023 - Comissão Mista da Medida Provisória n° 1160, de 2023
#> 76                                                                    CMMPV 1160/2023 - Comissão Mista da Medida Provisória n° 1160, de 2023
#> 77                                                                    CMMPV 1161/2023 - Comissão Mista da Medida Provisória n° 1161, de 2023
#> 78                                                                    CMMPV 1162/2023 - Comissão Mista da Medida Provisória n° 1162, de 2023
#> 79                                                                    CMMPV 1163/2023 - Comissão Mista da Medida Provisória n° 1163, de 2023
#> 80                                                                    CMMPV 1164/2023 - Comissão Mista da Medida Provisória n° 1164, de 2023
#> 81                                                                    CMMPV 1165/2023 - Comissão Mista da Medida Provisória n° 1165, de 2023
#> 82                                                                    CMMPV 1165/2023 - Comissão Mista da Medida Provisória n° 1165, de 2023
#> 83                                                                    CMMPV 1166/2023 - Comissão Mista da Medida Provisória n° 1166, de 2023
#> 84                                                                    CMMPV 1172/2023 - Comissão Mista da Medida Provisória n° 1172, de 2023
#> 85                                                                    CMMPV 1175/2023 - Comissão Mista da Medida Provisória n° 1175, de 2023
#> 86                                                                    CMMPV 1179/2023 - Comissão Mista da Medida Provisória n° 1179, de 2023
#> 87                                                                    CMMPV 1186/2023 - Comissão Mista da Medida Provisória n° 1186, de 2023
#> 88                                                                    CMMPV 1202/2023 - Comissão Mista da Medida Provisória n° 1202, de 2023
#> 89                                                                    CMMPV 1291/2025 - Comissão Mista da Medida Provisória n° 1291, de 2025
#> 90                                                                    CMMPV 1301/2025 - Comissão Mista da Medida Provisória n° 1301, de 2025
#> 91                                                                    CMMPV 1303/2025 - Comissão Mista da Medida Provisória n° 1303, de 2025
#> 92                                                                    CMMPV 1308/2025 - Comissão Mista da Medida Provisória n° 1308, de 2025
#> 93                                                                    CMMPV 1314/2025 - Comissão Mista da Medida Provisória n° 1314, de 2025
#> 94                                                                    CMMPV 1322/2025 - Comissão Mista da Medida Provisória n° 1322, de 2025
#> 95                                                                    CMMPV 1323/2025 - Comissão Mista da Medida Provisória n° 1323, de 2025
#> 96                                                                    CMMPV 1323/2025 - Comissão Mista da Medida Provisória n° 1323, de 2025
#> 97                                                                    CMMPV 1328/2025 - Comissão Mista da Medida Provisória n° 1328, de 2025
#> 98                                                                    CMMPV 1332/2025 - Comissão Mista da Medida Provisória n° 1332, de 2025
#> 99                                                                    CMMPV 1335/2026 - Comissão Mista da Medida Provisória n° 1335, de 2026
#> 100                                                                     CMMPV 586/2012 - Comissão Mista da Medida Provisória nº 586, de 2012
#> 101                                                                     CMMPV 586/2012 - Comissão Mista da Medida Provisória nº 586, de 2012
#> 102                                                                     CMMPV 587/2012 - Comissão Mista da Medida Provisória nº 587, de 2012
#> 103                                                                     CMMPV 590/2012 - Comissão Mista da Medida Provisória nº 590, de 2012
#> 104                                                                     CMMPV 593/2012 - Comissão Mista da Medida Provisória nº 593, de 2012
#> 105                                                                     CMMPV 594/2012 - Comissão Mista da Medida Provisória nº 594, de 2012
#> 106                                                                     CMMPV 595/2012 - Comissão Mista da Medida Provisória nº 595, de 2012
#> 107                                                                     CMMPV 601/2012 - Comissão Mista da Medida Provisória nº 601, de 2012
#> 108                                                                     CMMPV 603/2013 - Comissão Mista da Medida Provisória nº 603, de 2013
#> 109                                                                     CMMPV 606/2013 - Comissão Mista da Medida Provisória nº 606, de 2013
#> 110                                                                     CMMPV 609/2013 - Comissão Mista da Medida Provisória nº 609, de 2013
#> 111                                                                     CMMPV 610/2013 - Comissão Mista da Medida Provisória nº 610, de 2013
#> 112                                                                     CMMPV 615/2013 - Comissão Mista da Medida Provisória nº 615, de 2013
#> 113                                                                     CMMPV 617/2013 - Comissão Mista da Medida Provisória nº 617, de 2013
#> 114                                                                     CMMPV 618/2013 - Comissão Mista da Medida Provisória nº 618, de 2013
#> 115                                                                     CMMPV 621/2013 - Comissão Mista da Medida Provisória nº 621, de 2013
#> 116                                                                     CMMPV 623/2013 - Comissão Mista da Medida Provisória nº 623, de 2013
#> 117                                                                     CMMPV 629/2013 - Comissão Mista da Medida Provisória nº 629, de 2013
#> 118                                                                     CMMPV 630/2013 - Comissão Mista da Medida Provisória nº 630, de 2013
#> 119                                                                     CMMPV 631/2013 - Comissão Mista da Medida Provisória nº 631, de 2013
#> 120                                                                     CMMPV 632/2013 - Comissão Mista da Medida Provisória nº 632, de 2013
#> 121                                                                     CMMPV 633/2013 - Comissão Mista da Medida Provisória nº 633, de 2013
#> 122                                                                     CMMPV 633/2013 - Comissão Mista da Medida Provisória nº 633, de 2013
#> 123                                                                     CMMPV 634/2013 - Comissão Mista da Medida Provisória nº 634, de 2013
#> 124                                                                     CMMPV 635/2013 - Comissão Mista da Medida Provisória nº 635, de 2013
#> 125                                                                     CMMPV 636/2013 - Comissão Mista da Medida Provisória nº 636, de 2013
#> 126                                                                     CMMPV 638/2014 - Comissão Mista da Medida Provisória nº 638, de 2014
#> 127                                                                     CMMPV 639/2014 - Comissão Mista da Medida Provisória nº 639, de 2014
#> 128                                                                     CMMPV 639/2014 - Comissão Mista da Medida Provisória nº 639, de 2014
#> 129                                                                     CMMPV 640/2014 - Comissão Mista da Medida Provisória nº 640, de 2014
#> 130                                                                     CMMPV 640/2014 - Comissão Mista da Medida Provisória nº 640, de 2014
#> 131                                                                     CMMPV 640/2014 - Comissão Mista da Medida Provisória nº 640, de 2014
#> 132                                                                     CMMPV 641/2014 - Comissão Mista da Medida Provisória nº 641, de 2014
#> 133                                                                     CMMPV 641/2014 - Comissão Mista da Medida Provisória nº 641, de 2014
#> 134                                                                     CMMPV 643/2014 - Comissão Mista da Medida Provisória nº 643, de 2014
#> 135                                                                     CMMPV 644/2014 - Comissão Mista da Medida Provisória nº 644, de 2014
#> 136                                                                     CMMPV 645/2014 - Comissão Mista da Medida Provisória nº 645, de 2014
#> 137                                                                     CMMPV 646/2014 - Comissão Mista da Medida Provisória nº 646, de 2014
#> 138                                                                     CMMPV 647/2014 - Comissão Mista da Medida Provisória nº 647, de 2014
#> 139                                                                     CMMPV 647/2014 - Comissão Mista da Medida Provisória nº 647, de 2014
#> 140                                                                     CMMPV 648/2014 - Comissão Mista da Medida Provisoria nº 648, de 2014
#> 141                                                                     CMMPV 649/2014 - Comissão Mista da Medida Provisória nº 649, de 2014
#> 142                                                                     CMMPV 650/2014 - Comissao Mista da Medida Provisoria nº 650, de 2014
#> 143                                                                     CMMPV 651/2014 - Comissão Mista da Medida Provisória n° 651, de 2014
#> 144                                                                     CMMPV 652/2014 - Comissão Mista da Medida Provisória nº 652, de 2014
#> 145                                                                     CMMPV 652/2014 - Comissão Mista da Medida Provisória nº 652, de 2014
#> 146                                                                     CMMPV 653/2014 - Comissão Mista da Medida Provisória n° 653, de 2014
#> 147                                                                     CMMPV 653/2014 - Comissão Mista da Medida Provisória n° 653, de 2014
#> 148                                                                     CMMPV 656/2014 - Comissão Mista da Medida Provisória nº 656, de 2014
#> 149                                                                     CMMPV 657/2014 - Comissão Mista da Medida Provisória nº 657, de 2014
#> 150                                                                     CMMPV 658/2014 - Comissão Mista da Medida Provisória n° 658, de 2014
#> 151                                                                     CMMPV 658/2014 - Comissão Mista da Medida Provisória n° 658, de 2014
#> 152                                                                     CMMPV 660/2014 - Comissão Mista da Medida Provisória nº 660, de 2014
#> 153                                                                     CMMPV 660/2014 - Comissão Mista da Medida Provisória nº 660, de 2014
#> 154                                                                     CMMPV 660/2014 - Comissão Mista da Medida Provisória nº 660, de 2014
#> 155                                                                     CMMPV 661/2014 - Comissão Mista da Medida Provisória n° 661, de 2014
#> 156                                                                     CMMPV 663/2014 - Comissao Mista da Medida Provisoria nº 663, de 2014
#> 157                                                                     CMMPV 664/2014 - Comissao Mista da Medida Provisoria nº 664, de 2014
#> 158                                                                     CMMPV 664/2014 - Comissao Mista da Medida Provisoria nº 664, de 2014
#> 159                                                                     CMMPV 665/2014 - Comissao Mista da Medida Provisoria nº 665, de 2014
#> 160                                                                     CMMPV 665/2014 - Comissao Mista da Medida Provisoria nº 665, de 2014
#> 161                                                                     CMMPV 668/2015 - Comissao Mista da Medida Provisoria nº 668, de 2015
#> 162                                                                     CMMPV 670/2015 - Comissão Mista da Medida Provisória n° 670, de 2015
#> 163                                                                     CMMPV 670/2015 - Comissão Mista da Medida Provisória n° 670, de 2015
#> 164                                                                     CMMPV 671/2015 - Comissão Mista da Medida Provisória n° 671, de 2015
#> 165                                                                     CMMPV 671/2015 - Comissão Mista da Medida Provisória n° 671, de 2015
#> 166                                                                     CMMPV 672/2015 - Comissão Mista da Medida Provisória n° 672, de 2015
#> 167                                                                     CMMPV 673/2015 - Comissão Mista da Medida Provisória nº 673, de 2015
#> 168                                                                     CMMPV 673/2015 - Comissão Mista da Medida Provisória nº 673, de 2015
#> 169                                                                     CMMPV 675/2015 - Comissão Mista da Medida Provisória n° 675, de 2015
#> 170                                                                     CMMPV 675/2015 - Comissão Mista da Medida Provisória n° 675, de 2015
#> 171                                                                     CMMPV 676/2015 - Comissão Mista da Medida Provisória nº 676, de 2015
#> 172                                                                     CMMPV 676/2015 - Comissão Mista da Medida Provisória nº 676, de 2015
#> 173                                                                     CMMPV 677/2015 - Comissão Mista da Medida Provisória nº 677, de 2015
#> 174                                                                     CMMPV 677/2015 - Comissão Mista da Medida Provisória nº 677, de 2015
#> 175                                                                     CMMPV 678/2015 - Comissão Mista da Medida Provisória nº 678, de 2015
#> 176                                                                     CMMPV 678/2015 - Comissão Mista da Medida Provisória nº 678, de 2015
#> 177                                                                     CMMPV 679/2015 - Comissão Mista da Medida Provisória nº 679, de 2015
#> 178                                                                     CMMPV 679/2015 - Comissão Mista da Medida Provisória nº 679, de 2015
#> 179                                                                     CMMPV 680/2015 - Comissão Mista da Medida Provisória nº 680, de 2015
#> 180                                                                     CMMPV 681/2015 - Comissao Mista da Medida Provisoria nº 681, de 2015
#> 181                                                                     CMMPV 682/2015 - Comissao Mista da Medida Provisoria nº 682, de 2015
#> 182                                                                     CMMPV 683/2015 - Comissao Mista da Medida Provisoria nº 683, de 2015
#> 183                                                                     CMMPV 683/2015 - Comissao Mista da Medida Provisoria nº 683, de 2015
#> 184                                                                     CMMPV 684/2015 - Comissao Mista da Medida Provisoria nº 684, de 2015
#> 185                                                                     CMMPV 684/2015 - Comissao Mista da Medida Provisoria nº 684, de 2015
#> 186                                                                     CMMPV 685/2015 - Comissão Mista da Medida Provisória nº 685, de 2015
#> 187                                                                  CMMPV 687/2015 - ComissÃ£o Mista da Medida ProvisÃ³ria nÂº 687, de 2015
#> 188                                                                     CMMPV 687/2015 - Comissão Mista da Medida Provisória nº 687, de 2015
#> 189                                                                     CMMPV 687/2015 - Comissão Mista da Medida Provisória nº 687, de 2015
#> 190                                                                     CMMPV 688/2015 - Comissao Mista da Medida Provisoria nº 688, de 2015
#> 191                                                                     CMMPV 689/2015 - Comissão Mista da Medida Provisória nº 689, de 2015
#> 192                                                                     CMMPV 689/2015 - Comissão Mista da Medida Provisória nº 689, de 2015
#> 193                                                                     CMMPV 690/2015 - Comissão Mista da Medida Provisória nº 690, de 2015
#> 194                                                                     CMMPV 690/2015 - Comissão Mista da Medida Provisória nº 690, de 2015
#> 195                                                                     CMMPV 691/2015 - Comissão Mista da Medida Provisória nº 691, de 2015
#> 196                                                                     CMMPV 691/2015 - Comissão Mista da Medida Provisória nº 691, de 2015
#> 197                                                                     CMMPV 692/2015 - Comissão Mista da Medida Provisória nº 692, de 2015
#> 198                                                                     CMMPV 692/2015 - Comissão Mista da Medida Provisória nº 692, de 2015
#> 199                                                                     CMMPV 693/2015 - Comissão Mista da Medida Provisória nº 693, de 2015
#> 200                                                                     CMMPV 693/2015 - Comissão Mista da Medida Provisória nº 693, de 2015
#> 201                                                                     CMMPV 694/2015 - Comissão Mista da Medida Provisória nº 694, de 2015
#> 202                                                                     CMMPV 694/2015 - Comissão Mista da Medida Provisória nº 694, de 2015
#> 203                                                                     CMMPV 695/2015 - Comissão Mista da Medida Provisória nº 695, de 2015
#> 204                                                                     CMMPV 695/2015 - Comissão Mista da Medida Provisória nº 695, de 2015
#> 205                                                                     CMMPV 696/2015 - Comissão Mista da Medida Provisória nº 696, de 2015
#> 206                                                                     CMMPV 696/2015 - Comissão Mista da Medida Provisória nº 696, de 2015
#> 207                                                                     CMMPV 698/2015 - Comissão Mista da Medida Provisória nº 698, de 2015
#> 208                                                                     CMMPV 699/2015 - Comissão Mista da Medida Provisória nº 699, de 2015
#> 209                                                                     CMMPV 700/2015 - Comissão Mista da Medida Provisória nº 700, de 2015
#> 210                                                                     CMMPV 701/2015 - Comissão Mista da Medida Provisória nº 701, de 2015
#> 211                                                                     CMMPV 703/2015 - Comissão Mista da Medida Provisória nº 703, de 2015
#> 212                                                                     CMMPV 703/2015 - Comissão Mista da Medida Provisória nº 703, de 2015
#> 213                                                                     CMMPV 703/2015 - Comissão Mista da Medida Provisória nº 703, de 2015
#> 214                                                                     CMMPV 704/2015 - Comissão Mista da Medida Provisória nº 704, de 2015
#> 215                                                                     CMMPV 705/2015 - Comissão Mista da Medida Provisória nº 705, de 2015
#> 216                                                                     CMMPV 705/2015 - Comissão Mista da Medida Provisória nº 705, de 2015
#> 217                                                                     CMMPV 706/2015 - Comissão Mista da Medida Provisória nº 706, de 2015
#> 218                                                                     CMMPV 706/2015 - Comissão Mista da Medida Provisória nº 706, de 2015
#> 219                                                                     CMMPV 707/2015 - Comissão Mista da Medida Provisória nº 707, de 2015
#> 220                                                                     CMMPV 708/2015 - Comissão Mista da Medida Provisória nº 708, de 2015
#> 221                                                                     CMMPV 712/2016 - Comissão Mista da Medida Provisória nº 712, de 2016
#> 222                                                                     CMMPV 713/2016 - Comissão Mista da Medida Provisória nº 713, de 2016
#> 223                                                                     CMMPV 713/2016 - Comissão Mista da Medida Provisória nº 713, de 2016
#> 224                                                                     CMMPV 714/2016 - Comissão Mista da Medida Provisória nº 714, de 2016
#> 225                                                                     CMMPV 714/2016 - Comissão Mista da Medida Provisória nº 714, de 2016
#> 226                                                                     CMMPV 717/2016 - Comissão Mista da Medida Provisória nº 717, de 2016
#> 227                                                                     CMMPV 717/2016 - Comissão Mista da Medida Provisória nº 717, de 2016
#> 228                                                                     CMMPV 718/2016 - Comissão Mista da Medida Provisória nº 718, de 2016
#> 229                                                                     CMMPV 718/2016 - Comissão Mista da Medida Provisória nº 718, de 2016
#> 230                                                                     CMMPV 719/2016 - Comissão Mista da Medida Provisória nº 719, de 2016
#> 231                                                                     CMMPV 720/2016 - Comissão Mista da Medida Provisória nº 720, de 2016
#> 232                                                                     CMMPV 720/2016 - Comissão Mista da Medida Provisória nº 720, de 2016
#> 233                                                                     CMMPV 723/2016 - Comissão Mista da Medida Provisória nº 723, de 2016
#> 234                                                                     CMMPV 723/2016 - Comissão Mista da Medida Provisória nº 723, de 2016
#> 235                                                                     CMMPV 726/2016 - Comissão Mista da Medida Provisória nº 726, de 2016
#> 236                                                                     CMMPV 727/2016 - Comissão Mista da Medida Provisória nº 727, de 2016
#> 237                                                                     CMMPV 728/2016 - Comissão Mista da Medida Provisória nº 728, de 2016
#> 238                                                                    CMMPV 731/2016 - Comissão Mista da Medida Provi­sória nº 731, de 2016
#> 239                                                                    CMMPV 732/2016 - Comissão Mista da Medida Provi­sória nº 732, de 2016
#> 240                                                                     CMMPV 733/2016 - Comissão Mista da Medida Provisória n° 733, de 2016
#> 241                                                                     CMMPV 734/2016 - Comissão Mista da Medida Provisória nº 734, de 2016
#> 242                                                                     CMMPV 737/2016 - Comissão Mista da Medida Provisória nº 737, de 2016
#> 243                                                                     CMMPV 739/2016 - Comissão Mista da Medida Provisória nº 739, de 2016
#> 244                                                                     CMMPV 744/2016 - Comissão Mista da Medida Provisória nº 744, de 2016
#> 245                                                                    CMMPV 745/2016 - Comissão Mista da Medida Provisória nº 745, de 2016.
#> 246                                                                    CMMPV 746/2016 - Comissão Mista da Medida Provisória nº 746, de 2016.
#> 247                                                                     CMMPV 747/2016 - Comissão Mista da Medida Provisória nº 747, de 2016
#> 248                                                                     CMMPV 748/2016 - Comissão Mista da Medida Provisória nº 748, de 2016
#> 249                                                                     CMMPV 749/2016 - Comissão Mista da Medida Provisória nº 749, de 2016
#> 250                                                                     CMMPV 751/2016 - Comissão Mista da Medida Provisória nº 751, de 2016
#> 251                                                                     CMMPV 752/2016 - Comissão Mista da Medida Provisória nº 752, de 2016
#> 252                                                                     CMMPV 753/2016 - Comissão Mista da Medida Provisória nº 753, de 2016
#> 253                                                                     CMMPV 754/2016 - Comissão Mista da Medida Provisória nº 754, de 2016
#> 254                                                                     CMMPV 755/2016 - Comissão Mista da Medida Provisória nº 755, de 2016
#> 255                                                                     CMMPV 756/2016 - Comissão Mista da Medida Provisória nº 756, de 2016
#> 256                                                                     CMMPV 757/2016 - Comissão Mista da Medida Provisória nº 757, de 2016
#> 257                                                                     CMMPV 758/2016 - Comissão Mista da Medida Provisória nº 758, de 2016
#> 258                                                                     CMMPV 759/2016 - Comissão Mista da Medida Provisória nº 759, de 2016
#> 259                                                                     CMMPV 759/2016 - Comissão Mista da Medida Provisória nº 759, de 2016
#> 260                                                                     CMMPV 760/2016 - Comissão Mista da Medida Provisória nº 760, de 2016
#> 261                                                                     CMMPV 760/2016 - Comissão Mista da Medida Provisória nº 760, de 2016
#> 262                                                                     CMMPV 761/2016 - Comissão Mista da Medida Provisória nº 761, de 2016
#> 263                                                                     CMMPV 761/2016 - Comissão Mista da Medida Provisória nº 761, de 2016
#> 264                                                                     CMMPV 762/2016 - Comissão Mista da Medida Provisória nº 762, de 2016
#> 265                                                                     CMMPV 762/2016 - Comissão Mista da Medida Provisória nº 762, de 2016
#> 266                                                                    CMMPV 763/2016 - Comissão Mista da Medida Provisória nº 763, de 2016.
#> 267                                                                    CMMPV 763/2016 - Comissão Mista da Medida Provisória nº 763, de 2016.
#> 268                                                                     CMMPV 764/2016 - Comissão Mista da Medida Provisória nº 764, de 2016
#> 269                                                                     CMMPV 764/2016 - Comissão Mista da Medida Provisória nº 764, de 2016
#> 270                                                                     CMMPV 765/2016 - Comissão Mista da Medida Provisória nº 765, de 2016
#> 271                                                                     CMMPV 765/2016 - Comissão Mista da Medida Provisória nº 765, de 2016
#> 272                                                                     CMMPV 766/2017 - Comissão Mista da Medida Provisória nº 766, de 2017
#> 273                                                                     CMMPV 766/2017 - Comissão Mista da Medida Provisória nº 766, de 2017
#> 274                                                                     CMMPV 767/2017 - Comissão Mista da Medida Provisória nº 767, de 2017
#> 275                                                                     CMMPV 767/2017 - Comissão Mista da Medida Provisória nº 767, de 2017
#> 276                                                                     CMMPV 768/2017 - Comissão Mista da Medida Provisória nº 768, de 2017
#> 277                                                                     CMMPV 770/2017 - Comissão Mista da Medida Provisória nº 770, de 2017
#> 278                                                                     CMMPV 771/2017 - Comissão Mista da Medida Provisória nº 771, de 2017
#> 279                                                                     CMMPV 772/2017 - Comissão Mista da Medida Provisória nº 772, de 2017
#> 280                                                                     CMMPV 788/2017 - Comissão Mista da Medida Provisória nº 788, de 2017
#> 281                                                                     CMMPV 791/2017 - Comissão Mista da Medida Provisória nº 791, de 2017
#> 282                                                                     CMMPV 796/2017 - Comissão Mista da Medida Provisória nº 796, de 2017
#> 283                                                                     CMMPV 805/2017 - Comissão Mista da Medida Provisória nº 805, de 2017
#> 284                                                                     CMMPV 809/2017 - Comissão Mista da Medida Provisória nº 809, de 2017
#> 285                                                                     CMMPV 811/2017 - Comissão Mista da Medida Provisória nº 811, de 2017
#> 286                                                                     CMMPV 814/2017 - Comissão Mista da Medida Provisória nº 814, de 2017
#> 287                                                                     CMMPV 816/2017 - Comissão Mista da Medida Provisória nº 816, de 2017
#> 288                                                                     CMMPV 818/2018 - Comissão Mista da Medida Provisória nº 818, de 2018
#> 289                                                                     CMMPV 819/2018 - Comissão Mista da Medida Provisória nº 819, de 2018
#> 290                                                                     CMMPV 827/2018 - Comissão Mista da Medida Provisória nº 827, de 2018
#> 291                                                                      CMMPV 844/2018 - Comissão Mista da Medida Provisória nº 844 de 2018
#> 292                                                                    CMMPV 854/2018 - Comissão Mista da Medida Provisória nº 854, de 2018.
#> 293                                                                    CMMPV 855/2018 - Comissão Mista da Medida Provisória nº 855, de 2018.
#> 294                                                                    CMMPV 855/2018 - Comissão Mista da Medida Provisória nº 855, de 2018.
#> 295                                                                     CMMPV 856/2018 - Comissão Mista da Medida Provisória nº 856, de 2018
#> 296                                                                    CMMPV 858/2018 - Comissão Mista da Medida Provisória nº 858, de 2018.
#> 297                                                                    CMMPV 859/2018 - Comissão Mista da Medida Provisória nº 859, de 2018.
#> 298                                                                    CMMPV 860/2018 - Comissão Mista da Medida Provisória nº 860, de 2018.
#> 299                                                                    CMMPV 861/2018 - Comissão Mista da Medida Provisória nº 861, de 2018.
#> 300                                                                    CMMPV 861/2018 - Comissão Mista da Medida Provisória nº 861, de 2018.
#> 301                                                                    CMMPV 862/2018 - Comissão Mista da Medida Provisória nº 862, de 2018.
#> 302                                                                    CMMPV 863/2018 - Comissão Mista da Medida Provisória nº 863, de 2018.
#> 303                                                                    CMMPV 864/2018 - Comissão Mista da Medida Provisória nº 864, de 2018.
#> 304                                                                    CMMPV 866/2018 - Comissão Mista da Medida Provisória nº 866, de 2018.
#> 305                                                                    CMMPV 867/2018 - Comissão Mista da Medida Provisória nº 867, de 2018.
#> 306                                                                    CMMPV 868/2018 - Comissão Mista da Medida Provisória nº 868, de 2018.
#> 307                                                                    CMMPV 868/2018 - Comissão Mista da Medida Provisória nº 868, de 2018.
#> 308                                                                    CMMPV 869/2018 - Comissão Mista da Medida Provisória nº 869, de 2018.
#> 309                                                                    CMMPV 870/2019 - Comissão Mista da Medida Provisória nº 870, de 2019.
#> 310                                                                    CMMPV 871/2019 - Comissão Mista da Medida Provisória nº 871, de 2019.
#> 311                                                                    CMMPV 872/2019 - Comissão Mista da Medida Provisória nº 872, de 2019.
#> 312                                                                    CMMPV 873/2019 - Comissão Mista da Medida Provisória nº 873, de 2019.
#> 313                                                                    CMMPV 875/2019 - Comissão Mista da Medida Provisória nº 875, de 2019.
#> 314                                                                    CMMPV 876/2019 - Comissão Mista da Medida Provisória nº 876, de 2019.
#> 315                                                                    CMMPV 877/2019 - Comissão Mista da Medida Provisória nº 877, de 2019.
#> 316                                                                    CMMPV 878/2019 - Comissão Mista da Medida Provisória nº 878, de 2019.
#> 317                                                                     CMMPV 879/2019 - Comissão Mista da Medida Provisória n° 879, de 2019
#> 318                                                                     CMMPV 881/2019 - Comissão Mista da Medida Provisória nº 881, de 2019
#> 319                                                                     CMMPV 882/2019 - Comissão Mista da Medida Provisória n° 882, de 2019
#> 320                                                                     CMMPV 883/2019 - Comissão Mista da Medida Provisória n° 883, de 2019
#> 321                                                                     CMMPV 884/2019 - Comissão Mista da Medida Provisória n° 884, de 2019
#> 322                                                                     CMMPV 885/2019 - Comissão Mista da Medida Provisória n° 885, de 2019
#> 323                                                                     CMMPV 886/2019 - Comissão Mista da Medida Provisória n° 886, de 2019
#> 324                                                                     CMMPV 887/2019 - Comissão Mista da Medida Provisória n° 887, de 2019
#> 325                                                                     CMMPV 888/2019 - Comissão Mista da Medida Provisória n° 888, de 2019
#> 326                                                                     CMMPV 889/2019 - Comissão Mista da Medida Provisória n° 889, de 2019
#> 327                                                                     CMMPV 890/2019 - Comissão Mista da Medida Provisória n° 890, de 2019
#> 328                                                                     CMMPV 890/2019 - Comissão Mista da Medida Provisória n° 890, de 2019
#> 329                                                                      CMMPV 891/2019 - Comissão Mista da Medida Provisória n° 891 de 2019
#> 330                                                                     CMMPV 892/2019 - Comissão Mista da Medida Provisória n° 892, de 2019
#> 331                                                                     CMMPV 893/2019 - Comissão Mista da Medida Provisória n° 893, de 2019
#> 332                                                                     CMMPV 894/2019 - Comissão Mista da Medida Provisória n° 894, de 2019
#> 333                                                                     CMMPV 895/2019 - Comissão Mista da Medida Provisória n° 895, de 2019
#> 334                                                                     CMMPV 896/2019 - Comissão Mista da Medida Provisória n° 896, de 2019
#> 335                                                                     CMMPV 897/2019 - Comissão Mista da Medida Provisória n° 897, de 2019
#> 336                                                                     CMMPV 898/2019 - Comissão Mista da Medida Provisória n° 898, de 2019
#> 337                                                                     CMMPV 899/2019 - Comissão Mista da Medida Provisória n° 899, de 2019
#> 338                                                                     CMMPV 900/2019 - Comissão Mista da Medida Provisória n° 900, de 2019
#> 339                                                                     CMMPV 901/2019 - Comissão Mista da Medida Provisória n° 901, de 2019
#> 340                                                                      CMMPV 902/2019 - Comissão Mista da Medida Provisória nº 902 de 2019
#> 341                                                                     CMMPV 903/2019 - Comissão Mista da Medida Provisória n° 903, de 2019
#> 342                                                                     CMMPV 904/2019 - Comissão Mista da Medida Provisória n° 904, de 2019
#> 343                                                                     CMMPV 904/2019 - Comissão Mista da Medida Provisória n° 904, de 2019
#> 344                                                                     CMMPV 905/2019 - Comissão Mista da Medida Provisória n° 905, de 2019
#> 345                                                                     CMMPV 906/2019 - Comissão Mista da Medida Provisória n° 906, de 2019
#> 346                                                                     CMMPV 907/2019 - Comissão Mista da Medida Provisória n° 907, de 2019
#> 347                                                                     CMMPV 908/2019 - Comissão Mista da Medida Provisória n° 908, de 2019
#> 348                                                                     CMMPV 908/2019 - Comissão Mista da Medida Provisória n° 908, de 2019
#> 349                                                                     CMMPV 909/2019 - Comissão Mista da Medida Provisória n° 909, de 2019
#> 350                                                                     CMMPV 910/2019 - Comissão Mista da Medida Provisória n° 910, de 2019
#> 351                                                                     CMMPV 913/2019 - Comissão Mista da Medida Provisória n° 913, de 2019
#> 352                                                                     CMMPV 914/2019 - Comissão Mista da Medida Provisória n° 914, de 2019
#> 353                                                                     CMMPV 917/2019 - Comissão Mista da Medida Provisória n° 917, de 2019
#> 354                                                                     CMMPV 918/2020 - Comissão Mista da Medida Provisória n° 918, de 2020
#> 355                                                                       CMO - Comissão Mista de Planos, Orçamentos Públicos e Fiscalização
#> 356                                                                       CMO - Comissão Mista de Planos, Orçamentos Públicos e Fiscalização
#> 357                                                                       CMO - Comissão Mista de Planos, Orçamentos Públicos e Fiscalização
#> 358                                                                                           COCN - Conselho da Ordem do Congresso Nacional
#> 359                                                                               CPCMS - Representação Brasileira no Parlamento do Mercosul
#> 360                                                                               CPCMS - Representação Brasileira no Parlamento do Mercosul
#> 361                                                                               CPCMS - Representação Brasileira no Parlamento do Mercosul
#> 362                                                                                             CPIADJ - CPI do Assassinato de Jovens - 2015
#> 363                                                                                                                   CPIBETS - CPI das BETS
#> 364                                                                                                             CPICARF - CPI do CARF - 2015
#> 365                                                                                                       CPICRIME - CPI do Crime Organizado
#> 366                                                                                                          CPIDFDQ - CPI do Futebol - 2015
#> 367                                                                                                          CPIDFDQ - CPI do Futebol - 2015
#> 368                                                                                                        CPIDPRO - CPI das Próteses - 2015
#> 369                                                                                              CPIFundos - CPI dos Fundos de Pensão - 2015
#> 370                                                                                              CPIFundos - CPI dos Fundos de Pensão - 2015
#> 371                                                                                                       CPIMT - CPI dos Maus-tratos - 2017
#> 372                                                                                                            CPIPANDEMIA - CPI da Pandemia
#> 373                                                                                                       CPI-PETRO - CPI - PETROBRAS - 2014
#> 374                                                                                             CPIVDHS - Violação do Direito Humano à Saúde
#> 375                                                                   CPMI - Fake News - Comissão Parlamentar Mista de Inquérito - Fake News
#> 376                                                                     CPMI - INSS - Comissão Parlamentar Mista de Inquérito do INSS - 2025
#> 377                                                                     CPMI - INSS - Comissão Parlamentar Mista de Inquérito do INSS - 2025
#> 378                                                                     CPMI - INSS - Comissão Parlamentar Mista de Inquérito do INSS - 2025
#> 379                                                                     CPMI - INSS - Comissão Parlamentar Mista de Inquérito do INSS - 2025
#> 380                                                                     CPMI - INSS - Comissão Parlamentar Mista de Inquérito do INSS - 2025
#> 381                                                                     CPMI - INSS - Comissão Parlamentar Mista de Inquérito do INSS - 2025
#> 382                                                                     CPMI - INSS - Comissão Parlamentar Mista de Inquérito do INSS - 2025
#> 383                                                                     CPMI - INSS - Comissão Parlamentar Mista de Inquérito do INSS - 2025
#> 384                                                                     CPMI - INSS - Comissão Parlamentar Mista de Inquérito do INSS - 2025
#> 385                                                                                                         CPMIMETRÔ - CPMI do Metrô - 2014
#> 386                                                                                                     CPMI-PETRO - CPMI - PETROBRAS - 2014
#> 387                                                                                        CPMIVCM - CPMI - Violência contra a Mulher - 2012
#> 388                                                                                              CPMIVEGAS - CPMI - Vegas (Cachoeira) - 2012
#> 389                                                                                          CRA - Comissão de Agricultura e Reforma Agrária
#> 390                                                                                          CRA - Comissão de Agricultura e Reforma Agrária
#> 391                                                                                     CRCN - Comissão Representativa do Congresso Nacional
#> 392                                                                                  CRE - Comissão de Relações Exteriores e Defesa Nacional
#> 393                                                                                  CRE - Comissão de Relações Exteriores e Defesa Nacional
#> 394                                                                                  CRE - Comissão de Relações Exteriores e Defesa Nacional
#> 395                                                                                  CRE - Comissão de Relações Exteriores e Defesa Nacional
#> 396                                                                                  CRE - Comissão de Relações Exteriores e Defesa Nacional
#> 397                                                                                  CRE - Comissão de Relações Exteriores e Defesa Nacional
#> 398                                                                                  CRE - Comissão de Relações Exteriores e Defesa Nacional
#> 399                                                                                  CRE - Comissão de Relações Exteriores e Defesa Nacional
#> 400                                                                                                          CSF - Comissão Senado do Futuro
#> 401                                                                                                          CSF - Comissão Senado do Futuro
#> 402                                                                                                      CSP - Comissão de Segurança Pública
#> 403    CTBHSF - Comissão Temporária para Acompanhamento das Obras da Transposição e Revitalização da Bacia Hidrográfica do Rio São Francisco
#> 404                                                                                         CTCPC - CT - Reforma do Código de Processo Civil
#> 405 CTENORTE - Comissão Temporária Externa para investigar, "in loco", as causas do aumento da criminalidade e de atentados na região Norte.
#> 406                CTEOLEO - Comissão Temporária Externa para acompanhar as ações de enfrentamento às manchas de óleo no litoral brasileiro.
#> 407                           CTERIOSFR - Comissão Externa para acompanhar os Programas de Transposição e Revitalização do Rio São Francisco
#> 408                              CTEYANOMAMI - Comissão Temporária Externa para acompanhar a situação dos Yanomami e a saída dos garimpeiros
#> 409                                             CTFC - Comissão de Transparência, Governança, Fiscalização e Controle e Defesa do Consumidor
#> 410                                             CTFC - Comissão de Transparência, Governança, Fiscalização e Controle e Defesa do Consumidor
#> 411                                             CTFC - Comissão de Transparência, Governança, Fiscalização e Controle e Defesa do Consumidor
#> 412                                             CTFC - Comissão de Transparência, Governança, Fiscalização e Controle e Defesa do Consumidor
#> 413                                             CTFC - Comissão de Transparência, Governança, Fiscalização e Controle e Defesa do Consumidor
#> 414                                                               CTIA - Comissão Temporária Interna sobre Inteligência Artificial no Brasil
#> 415                                        CTI200CONFEQ - Comissão Temporária Interna em Comemoração aos 200 anos da Confederação do Equador
#> 416                                                                CTPAR - Comissão Externa para investigar empresas brasileiras no Paraguai
#> 417                                                                            CTPLS - Comissão Especial para Análise do PLS nº 131, de 2015
#> 418                                                                            CTPLS - Comissão Especial para Análise do PLS nº 131, de 2015
#> 419                                                                         CTPLS131 - Comissão Especial para Análise do PLS nº 131, de 2015
#> 420                                                                         CTPLS131 - Comissão Especial para Análise do PLS nº 131, de 2015
#> 421                                                                        CTREFORMA - Comissão da Reforma Política do Senado Federal - 2015
#> 422                                                                        CTREFORMA - Comissão da Reforma Política do Senado Federal - 2015
#> 423                                                                                                           CTRP - REFORMA POLÍTICA - 2011
#> 424                                                     CTS - CT- Destinada a propor soluções ao Financiamento do Sistema de Saúde do Brasil
#> 425                               CTSEGPUBL - CT - Destinada a debater e propor soluções para o financiamento da Segurança Pública no Brasil
#> 426                                                                   FPAMM - Frente Parlamentar de Apoio ao Microcrédito e às Microfinanças
#> 427                                                                              FPBSJA - Frente Parlamentar por um Brasil sem Jogos de Azar
#> 428                                                                                      FPC - Frente Parlamentar Católica Apostólica Romana
#> 429                                                  FPCONTROLE - Frente Parlamentar pelo Controle de Armas e Munições, pela Paz e Pela Vida
#> 430                                                                                                FPCULTURA - Frente Parlamentar da Cultura
#> 431                                                             FPEpTec - Frente Parlamentar em Favor da Educação Profissional e Tecnológica
#> 432                                               FPINVESTEBRASIL - Frente Parlamentar em Apoio aos Investimentos Estrangeiros para o Brasil
#> 433                                               FPINVESTEBRASIL - Frente Parlamentar em Apoio aos Investimentos Estrangeiros para o Brasil
#> 434                                                               FPJOVEM - Frente Parlamentar em Defesa das Políticas Públicas de Juventude
#> 435                                                               FPJOVEM - Frente Parlamentar em Defesa das Políticas Públicas de Juventude
#> 436                                                                                             FPMA - Frente Parlamentar Mista Antirracismo
#> 437                                                                                             FPMA - Frente Parlamentar Mista Antirracismo
#> 438                                                                             FPOPC - Frente Parlamentar Observatório da Pandemia Covid-19
#> 439                                                                                FPRNE - Frente Parlamentar de Recursos Naturais e Energia
#> 440                                                                                FPRNE - Frente Parlamentar de Recursos Naturais e Energia
#> 441                                                             FPSENN - Frente Parlamentar dos Senadores dos Estados do Norte e do Nordeste
#> 442                                                                     GPARABIASAUDITA - Grupo Parlamentar Brasil - Reino da Arábia Saudita
#> 443                                                                     GPARABIASAUDITA - Grupo Parlamentar Brasil - Reino da Arábia Saudita
#> 444                                                                                       GPARGENTINA - Grupo Parlamentar Brasil - Argentina
#> 445                                                                                       GPARGENTINA - Grupo Parlamentar Brasil - Argentina
#> 446                                                                                       GPARGENTINA - Grupo Parlamentar Brasil - Argentina
#> 447                                                                                       GPARGENTINA - Grupo Parlamentar Brasil - Argentina
#> 448                                                                                     GPAZERBAIJÃO - Grupo Parlamentar Brasil - Azerbaijão
#> 449                                                                                     GPAZERBAIJÃO - Grupo Parlamentar Brasil - Azerbaijão
#> 450                                                                                     GPAZERBAIJÃO - Grupo Parlamentar Brasil - Azerbaijão
#> 451                                                                            GP-BRICS-SF - Grupo Parlamentar de Relacionamento com o BRICS
#> 452                                                                                               GPCHINA - Grupo Parlamentar Brasil - China
#> 453                                                                                               GPCHINA - Grupo Parlamentar Brasil - China
#> 454                                                                                               GPCHINA - Grupo Parlamentar Brasil - China
#> 455                                                                                       GPDINAMARCA - Grupo Parlamentar Brasil - Dinamarca
#> 456                                                                                           GPESPANHA - Grupo Parlamentar Brasil - Espanha
#> 457                                                                                           GPIRLANDA - Grupo Parlamentar Brasil - Irlanda
#> 458                                                                                             GPISRAEL - Grupo Parlamentar Brasil - Israel
#> 459                                                                                         GPMARROCOS - Grupo Parlamentar Brasil - Marrocos
#> 460                                                                                         GPMARROCOS - Grupo Parlamentar Brasil - Marrocos
#> 461                                                                                           GPNORUEGA - Grupo Parlamentar Brasil - Noruega
#> 462                                                                                     GPPARABES - Grupo Parlamentar Brasil - Países Árabes
#> 463                                                                               GPRCOREIA - Grupo Parlamentar Brasil - República da Coreia
#> 464                                                                               GPRCOREIA - Grupo Parlamentar Brasil - República da Coreia
#> 465                                                         GPRPDCOREIA - Grupo Parlamentar Brasil - República Popular Democrática da Coreia
#> 466                                                                                             GPSÉRVIA - Grupo Parlamentar Brasil - Sérvia
#> 467                                                                                       GPSINGAPURA - Grupo Parlamentar Brasil - Singapura
#> 468                                                                                       GPVENEZUELA - Grupo Parlamentar Brasil - Venezuela
#> 469                                                                                       GPVENEZUELA - Grupo Parlamentar Brasil - Venezuela
#> 470                                                                                RBPM - Representação Brasileira no Parlamento do Mercosul
#> 471                                                                                RBPM - Representação Brasileira no Parlamento do Mercosul
#> 472                                                                                                VET 17/2014 - Veto Parcial nº 17, de 2014
#> 473                                                                                                    VET 2/2015 - Veto Total nº 2, de 2015
#> 474                                                                                                  VET 3/2014 - Veto Parcial nº 3, de 2014
#> 475                                                                                                VET 35/2014 - Veto Parcial nº 35, de 2014
#>     DataInicio    DataFim     Tipo
#> 1   22/02/2011 11/02/2014  Titular
#> 2   11/02/2014 30/01/2015 Suplente
#> 3   25/02/2015 01/06/2016 Suplente
#> 4   01/06/2016 10/02/2017  Titular
#> 5   09/03/2017 21/12/2018  Titular
#> 6   07/03/2023 01/02/2025 Suplente
#> 7   22/02/2011 30/01/2015  Titular
#> 8   23/03/2011 21/03/2013  Titular
#> 9   25/02/2015 10/02/2017  Titular
#> 10  09/03/2017 21/12/2018  Titular
#> 11  13/02/2019 19/02/2021  Titular
#> 12  07/03/2023 01/02/2025  Titular
#> 13  18/02/2025 03/12/2025  Titular
#> 14  08/12/2025          -  Titular
#> 15  14/03/2017 01/02/2019  Titular
#> 16  29/08/2023 01/02/2025 Suplente
#> 17  22/02/2011 15/11/2011 Suplente
#> 18  16/11/2011 30/01/2015 Suplente
#> 19  25/02/2015 08/02/2017  Titular
#> 20  08/02/2017 15/02/2017 Suplente
#> 21  07/03/2017 19/04/2017 Suplente
#> 22  19/04/2017 21/12/2018 Suplente
#> 23  13/02/2019 19/02/2021  Titular
#> 24  19/02/2021 31/01/2023 Suplente
#> 25  07/03/2023 05/06/2024 Suplente
#> 26  12/06/2024 01/02/2025 Suplente
#> 27  18/02/2025 16/07/2025 Suplente
#> 28  19/08/2025          - Suplente
#> 29  24/04/2018 21/12/2018 Suplente
#> 30  26/06/2023 01/02/2025 Suplente
#> 31  18/02/2025          -  Titular
#> 32  22/02/2011 30/01/2015 Suplente
#> 33  25/02/2015 10/02/2017 Suplente
#> 34  17/04/2018 25/04/2018 Suplente
#> 35  04/12/2018 21/12/2018  Titular
#> 36  13/02/2019 10/04/2019 Suplente
#> 37  19/02/2021 31/01/2023  Titular
#> 38  07/03/2023 01/02/2025  Titular
#> 39  25/03/2025          -  Titular
#> 40  22/03/2012 06/03/2013  Titular
#> 41  25/02/2015 10/02/2017  Titular
#> 42  09/03/2017 22/03/2017 Suplente
#> 43  22/03/2017 21/12/2018  Titular
#> 44  13/02/2019 19/02/2021 Suplente
#> 45  09/03/2017 21/12/2018 Suplente
#> 46  13/02/2019 31/01/2023 Suplente
#> 47  14/05/2019 31/01/2023 Suplente
#> 48  07/03/2023 01/02/2025 Suplente
#> 49  18/02/2025          - Suplente
#> 50  26/08/2015 28/09/2015  Titular
#> 51  26/04/2011 06/03/2013  Titular
#> 52  25/04/2016 04/08/2016 Suplente
#> 53  05/10/2016 10/02/2017  Titular
#> 54  13/06/2023 26/06/2023 Suplente
#> 55  26/06/2023 01/02/2025  Titular
#> 56  22/02/2011 30/01/2015 Suplente
#> 57  09/03/2017 21/12/2018 Suplente
#> 58  07/03/2023 01/02/2025 Suplente
#> 59  11/02/2014 30/01/2015  Titular
#> 60  25/02/2015 10/02/2017 Suplente
#> 61  31/05/2016 10/02/2017 Suplente
#> 62  09/03/2017 21/12/2018 Suplente
#> 63  23/09/2025          -  Titular
#> 64  03/08/2017 21/05/2018 Suplente
#> 65  21/02/2017 01/02/2019 Suplente
#> 66  19/09/2023 31/01/2025  Titular
#> 67  08/12/2014 19/02/2015  Titular
#> 68  25/02/2015 12/02/2016  Titular
#> 69  27/03/2023 21/08/2023 Suplente
#> 70  27/03/2023 05/04/2023 Suplente
#> 71  27/03/2023 05/04/2023 Suplente
#> 72  27/03/2023 05/04/2023 Suplente
#> 73  27/03/2023 05/04/2023 Suplente
#> 74  27/03/2023 05/04/2023 Suplente
#> 75  27/03/2023 05/04/2023 Suplente
#> 76  05/04/2023 01/08/2023  Titular
#> 77  27/03/2023 05/04/2023 Suplente
#> 78  27/03/2023 05/04/2023 Suplente
#> 79  27/03/2023 05/04/2023 Suplente
#> 80  27/03/2023 05/04/2023 Suplente
#> 81  27/03/2023 05/04/2023 Suplente
#> 82  05/04/2023 13/09/2023  Titular
#> 83  27/03/2023 05/04/2023 Suplente
#> 84  23/05/2023 26/10/2023 Suplente
#> 85  26/06/2023 02/12/2023  Titular
#> 86  14/08/2023 12/02/2024 Suplente
#> 87  16/10/2023 19/04/2024  Titular
#> 88  02/04/2024 28/07/2024 Suplente
#> 89  08/04/2025 12/09/2025 Suplente
#> 90  01/07/2025 06/12/2025  Titular
#> 91  23/09/2025 06/10/2025 Suplente
#> 92  23/09/2025 01/04/2026 Suplente
#> 93  23/09/2025          - Suplente
#> 94  15/12/2025          -  Titular
#> 95  15/12/2025 10/02/2026 Suplente
#> 96  24/02/2026          - Suplente
#> 97  05/02/2026          - Suplente
#> 98  05/02/2026          - Suplente
#> 99  09/02/2026          -  Titular
#> 100 14/11/2012 14/11/2012  Titular
#> 101 14/11/2012 25/05/2013 Suplente
#> 102 14/11/2012 03/06/2013  Titular
#> 103 10/12/2012 07/07/2013 Suplente
#> 104 10/12/2012 13/07/2013  Titular
#> 105 13/12/2012 23/06/2013 Suplente
#> 106 13/12/2012 15/07/2013  Titular
#> 107 06/02/2013 03/06/2013  Titular
#> 108 06/02/2013 03/06/2013  Titular
#> 109 22/02/2013 18/06/2013 Suplente
#> 110 12/03/2013 05/07/2013 Suplente
#> 111 11/04/2013 09/09/2013  Titular
#> 112 22/05/2013 10/11/2013  Titular
#> 113 06/06/2013 26/11/2013  Titular
#> 114 12/06/2013 30/11/2013  Titular
#> 115 11/07/2013 15/12/2013  Titular
#> 116 06/08/2013 24/02/2014 Suplente
#> 117 11/02/2014 27/07/2014  Titular
#> 118 11/02/2014 21/05/2014  Titular
#> 119 11/02/2014 06/07/2014  Titular
#> 120 11/02/2014 27/07/2014  Titular
#> 121 11/02/2014 19/02/2014  Titular
#> 122 26/02/2014 27/07/2014  Titular
#> 123 11/02/2014 27/07/2014  Titular
#> 124 11/02/2014 27/07/2014 Suplente
#> 125 11/02/2014 27/07/2014 Suplente
#> 126 11/02/2014 27/07/2014  Titular
#> 127 25/03/2014 08/04/2014 Suplente
#> 128 08/04/2014 15/07/2014  Titular
#> 129 25/03/2014 08/04/2014 Suplente
#> 130 08/04/2014 22/04/2014  Titular
#> 131 22/04/2014 13/09/2014 Suplente
#> 132 26/03/2014 08/04/2014  Titular
#> 133 08/04/2014 19/09/2014  Titular
#> 134 29/04/2014 21/10/2014  Titular
#> 135 06/05/2014 28/10/2014  Titular
#> 136 08/05/2014 01/11/2014  Titular
#> 137 29/05/2014 22/11/2014  Titular
#> 138 02/06/2014 15/07/2014  Titular
#> 139 15/07/2014 01/11/2014 Suplente
#> 140 09/06/2014 30/11/2014  Titular
#> 141 10/06/2014 02/12/2014  Titular
#> 142 03/07/2014 28/10/2014  Titular
#> 143 14/07/2014 31/01/2015  Titular
#> 144 30/07/2014 13/08/2014  Titular
#> 145 13/08/2014 01/02/2015  Titular
#> 146 13/08/2014 13/08/2014  Titular
#> 147 13/08/2014 30/01/2015  Titular
#> 148 10/10/2014 31/01/2015  Titular
#> 149 16/10/2014 30/01/2015  Titular
#> 150 03/11/2014 11/11/2014  Titular
#> 151 11/11/2014 30/01/2015 Suplente
#> 152 07/07/2014 09/12/2014  Titular
#> 153 09/12/2014 30/01/2015 Suplente
#> 154 25/02/2015 11/03/2015  Titular
#> 155 26/02/2015 11/03/2015  Titular
#> 156 25/02/2015 11/03/2015  Titular
#> 157 25/02/2015 11/03/2015  Titular
#> 158 08/04/2015 26/07/2015 Suplente
#> 159 25/02/2015 11/03/2015  Titular
#> 160 08/04/2015 25/07/2015 Suplente
#> 161 25/02/2015 11/03/2015  Titular
#> 162 13/03/2015 13/03/2015  Titular
#> 163 13/03/2015 29/08/2015  Titular
#> 164 24/03/2015 09/04/2015  Titular
#> 165 09/04/2015 11/09/2015  Titular
#> 166 27/03/2015 07/04/2015  Titular
#> 167 07/04/2015 09/04/2015  Titular
#> 168 09/04/2015 06/09/2015  Titular
#> 169 26/05/2015 03/06/2015  Titular
#> 170 03/06/2015 06/12/2015 Suplente
#> 171 22/06/2015 01/07/2015  Titular
#> 172 01/07/2015 14/02/2016  Titular
#> 173 25/06/2015 01/07/2015  Titular
#> 174 01/07/2015 13/02/2016  Titular
#> 175 26/06/2015 01/07/2015  Titular
#> 176 01/07/2015 29/02/2016  Titular
#> 177 26/06/2015 01/07/2015  Titular
#> 178 01/07/2015 21/12/2015  Titular
#> 179 09/07/2015 29/02/2016  Titular
#> 180 15/07/2015 21/12/2015  Titular
#> 181 15/07/2015 06/03/2016  Titular
#> 182 15/07/2015 06/08/2015  Titular
#> 183 06/08/2015 19/02/2016 Suplente
#> 184 03/08/2015 06/08/2015  Titular
#> 185 06/08/2015 25/03/2016 Suplente
#> 186 03/08/2015 06/08/2015  Titular
#> 187 20/08/2015 20/08/2015  Titular
#> 188 20/08/2015 01/09/2015  Titular
#> 189 01/09/2015 12/03/2016 Suplente
#> 190 20/08/2015 19/03/2016  Titular
#> 191 02/09/2015 14/09/2015  Titular
#> 192 14/09/2015 07/04/2016 Suplente
#> 193 02/09/2015 14/09/2015  Titular
#> 194 14/09/2015 01/04/2016 Suplente
#> 195 02/09/2015 14/09/2015  Titular
#> 196 14/09/2015 01/04/2016  Titular
#> 197 24/09/2015 06/10/2015  Titular
#> 198 06/10/2015 16/05/2016  Titular
#> 199 02/10/2015 08/10/2015  Titular
#> 200 08/10/2015 03/06/2016 Suplente
#> 201 02/10/2015 07/10/2015  Titular
#> 202 07/10/2015 07/05/2016  Titular
#> 203 06/10/2015 07/10/2015  Titular
#> 204 07/10/2015 22/05/2016 Suplente
#> 205 07/10/2015 07/10/2015  Titular
#> 206 07/10/2015 05/06/2016 Suplente
#> 207 27/10/2015 26/06/2016  Titular
#> 208 16/11/2015 04/07/2016  Titular
#> 209 14/12/2015 16/07/2016  Titular
#> 210 14/12/2015 30/07/2016  Titular
#> 211 11/02/2016 11/02/2016  Titular
#> 212 11/02/2016 17/02/2016  Titular
#> 213 17/02/2016 28/07/2016 Suplente
#> 214 11/02/2016 03/07/2016  Titular
#> 215 11/02/2016 17/02/2016  Titular
#> 216 17/02/2016 30/07/2016 Suplente
#> 217 28/12/2015 17/02/2016  Titular
#> 218 17/02/2016 20/08/2016 Suplente
#> 219 31/12/2015 14/08/2016  Titular
#> 220 31/12/2015 21/08/2016  Titular
#> 221 01/02/2016 27/08/2016  Titular
#> 222 02/03/2016 04/03/2016  Titular
#> 223 18/03/2016 19/09/2016  Titular
#> 224 02/03/2016 04/03/2016  Titular
#> 225 18/03/2016 25/09/2016  Titular
#> 226 17/03/2016 23/03/2016  Titular
#> 227 28/03/2016 28/11/2016  Titular
#> 228 17/03/2016 23/03/2016  Titular
#> 229 28/03/2016 27/09/2016  Titular
#> 230 30/03/2016 01/04/2016  Titular
#> 231 30/03/2016 01/04/2016  Titular
#> 232 16/06/2016 26/09/2016 Suplente
#> 233 02/05/2016 02/05/2016  Titular
#> 234 16/06/2016 14/11/2016  Titular
#> 235 16/06/2016 28/11/2016 Suplente
#> 236 16/06/2016 14/11/2016 Suplente
#> 237 16/06/2016 10/12/2016 Suplente
#> 238 21/06/2016 10/12/2016  Titular
#> 239 21/06/2016 10/12/2016 Suplente
#> 240 15/06/2016 27/11/2016 Suplente
#> 241 05/07/2016 06/02/2017 Suplente
#> 242 13/07/2016 05/03/2017  Titular
#> 243 13/07/2016 13/02/2017 Suplente
#> 244 06/09/2016 13/09/2016  Titular
#> 245 16/09/2016 24/04/2017  Titular
#> 246 23/09/2016 04/10/2016  Titular
#> 247 03/10/2016 14/12/2016  Titular
#> 248 13/10/2016 21/05/2017  Titular
#> 249 14/10/2016 21/05/2017  Titular
#> 250 14/11/2016 26/06/2017  Titular
#> 251 25/11/2016 19/08/2017  Titular
#> 252 19/12/2016 10/08/2017  Titular
#> 253 20/12/2016 12/08/2017  Titular
#> 254 20/12/2016 07/02/2018  Titular
#> 255 20/12/2016 21/02/2017  Titular
#> 256 20/12/2016 21/02/2017  Titular
#> 257 20/12/2016 21/02/2017  Titular
#> 258 23/12/2016 02/02/2017  Titular
#> 259 06/02/2017 09/03/2017  Titular
#> 260 23/12/2016 01/02/2017  Titular
#> 261 06/02/2017 09/03/2017  Titular
#> 262 23/12/2016 02/02/2017  Titular
#> 263 06/02/2017 08/03/2017  Titular
#> 264 23/12/2016 02/02/2017  Titular
#> 265 06/02/2017 08/03/2017  Titular
#> 266 23/12/2016 02/02/2017  Titular
#> 267 06/02/2017 08/03/2017  Titular
#> 268 27/12/2016 03/02/2017  Titular
#> 269 06/02/2017 08/03/2017  Titular
#> 270 30/12/2016 03/02/2017  Titular
#> 271 06/02/2017 08/03/2017  Titular
#> 272 05/01/2017 03/02/2017  Titular
#> 273 06/02/2017 08/03/2017  Titular
#> 274 06/01/2016 03/02/2017  Titular
#> 275 06/02/2017 08/09/2017  Titular
#> 276 07/02/2017 08/03/2017  Titular
#> 277 27/03/2017 29/03/2017  Titular
#> 278 30/03/2017 01/04/2017  Titular
#> 279 31/05/2017 20/03/2018  Titular
#> 280 16/08/2017 12/03/2018  Titular
#> 281 16/08/2017 03/04/2018 Suplente
#> 282 20/09/2017 08/04/2018  Titular
#> 283 30/11/2017 08/06/2018  Titular
#> 284 27/02/2018 11/08/2018 Suplente
#> 285 27/02/2018 27/08/2018  Titular
#> 286 27/02/2018 14/08/2018  Titular
#> 287 27/02/2018 11/08/2018 Suplente
#> 288 27/02/2018 02/09/2018 Suplente
#> 289 27/02/2018 28/05/2018  Titular
#> 290 05/06/2018 13/10/2018  Titular
#> 291 31/10/2018 01/02/2019  Titular
#> 292 14/02/2019 13/05/2019  Titular
#> 293 14/02/2019 20/03/2019  Titular
#> 294 20/03/2019 23/06/2019 Suplente
#> 295 14/02/2019 23/06/2019  Titular
#> 296 14/02/2019 20/03/2019  Titular
#> 297 14/02/2019 03/08/2019  Titular
#> 298 14/02/2019 15/07/2019  Titular
#> 299 14/02/2019 20/03/2019  Titular
#> 300 20/03/2019 03/08/2019 Suplente
#> 301 14/02/2019 20/03/2019  Titular
#> 302 14/02/2019 20/03/2019  Titular
#> 303 14/02/2019 27/07/2019  Titular
#> 304 13/02/2019 20/03/2019  Titular
#> 305 14/02/2019 21/03/2019  Titular
#> 306 14/02/2019 21/03/2019  Titular
#> 307 21/03/2019 02/08/2019 Suplente
#> 308 14/02/2019 07/09/2019  Titular
#> 309 14/02/2019 21/03/2019  Titular
#> 310 14/02/2019 21/03/2019  Titular
#> 311 14/02/2019 05/06/2019  Titular
#> 312 07/03/2019 20/03/2019  Titular
#> 313 13/03/2019 09/09/2019  Titular
#> 314 14/03/2019 10/09/2019  Titular
#> 315 26/03/2019 19/06/2019  Titular
#> 316 28/03/2019 19/06/2019  Titular
#> 317 26/04/2019 18/06/2019  Titular
#> 318 02/05/2019 19/06/2019  Titular
#> 319 06/05/2019 18/06/2019  Titular
#> 320 22/05/2019 18/06/2019  Titular
#> 321 14/06/2019 18/06/2019  Titular
#> 322 18/06/2019 10/07/2019  Titular
#> 323 26/06/2019 10/07/2019  Titular
#> 324 26/06/2019 10/07/2019  Titular
#> 325 19/07/2019 14/08/2019  Titular
#> 326 24/07/2019 14/08/2019  Titular
#> 327 02/08/2019 14/08/2019  Titular
#> 328 14/08/2019 28/03/2020 Suplente
#> 329 08/08/2019 14/08/2019  Titular
#> 330 08/08/2019 14/08/2019  Titular
#> 331 20/08/2019 24/09/2019  Titular
#> 332 05/09/2019 15/10/2019  Titular
#> 333 09/09/2019 24/09/2019  Titular
#> 334 09/09/2019 25/09/2019  Titular
#> 335 04/10/2019 17/10/2019  Titular
#> 336 16/10/2019 07/11/2019  Titular
#> 337 17/10/2019 07/11/2019  Titular
#> 338 18/10/2019 07/11/2019  Titular
#> 339 21/10/2019 07/11/2019  Titular
#> 340 06/11/2019 20/11/2019  Titular
#> 341 07/11/2019 20/11/2019  Titular
#> 342 12/11/2019 20/11/2019  Titular
#> 343 20/11/2019 19/06/2020 Suplente
#> 344 12/11/2019 04/12/2019  Titular
#> 345 20/11/2019 17/12/2019  Titular
#> 346 21/11/2019 17/12/2019  Titular
#> 347 29/11/2019 17/12/2019  Titular
#> 348 17/12/2019 06/07/2020 Suplente
#> 349 10/12/2019 17/12/2019  Titular
#> 350 11/12/2019 17/12/2019  Titular
#> 351 20/12/2019 14/02/2020  Titular
#> 352 18/02/2020 02/08/2020  Titular
#> 353 18/02/2020 04/06/2020  Titular
#> 354 14/02/2020 26/05/2020  Titular
#> 355 24/11/2014 31/03/2015 Suplente
#> 356 29/03/2017 18/04/2017  Titular
#> 357 15/05/2018 01/02/2019 Suplente
#> 358 08/02/2017 01/02/2019  Titular
#> 359 08/04/2015 01/02/2019  Titular
#> 360 10/04/2019 05/07/2023  Titular
#> 361 11/07/2023          -  Titular
#> 362 29/04/2015 13/06/2016 Suplente
#> 363 24/10/2024 12/06/2025  Titular
#> 364 14/05/2015 03/12/2015  Titular
#> 365 25/02/2026          -  Titular
#> 366 07/07/2015 08/03/2016  Titular
#> 367 08/03/2016 09/12/2016 Suplente
#> 368 25/03/2015 15/08/2016  Titular
#> 369 16/07/2015 17/07/2015  Titular
#> 370 17/07/2015 03/02/2017  Titular
#> 371 04/07/2017 20/12/2018 Suplente
#> 372 15/04/2021 03/11/2021  Titular
#> 373 13/05/2014 22/12/2014  Titular
#> 374 15/03/2013 06/05/2013  Titular
#> 375 21/08/2019 27/04/2021  Titular
#> 376 26/08/2025 10/09/2025 Suplente
#> 377 10/09/2025 25/09/2025 Suplente
#> 378 01/10/2025 16/10/2025  Titular
#> 379 16/10/2025 03/11/2025 Suplente
#> 380 05/11/2025 12/11/2025  Titular
#> 381 26/11/2025 04/02/2026 Suplente
#> 382 04/02/2026 24/02/2026 Suplente
#> 383 24/02/2026 04/03/2026 Suplente
#> 384 04/03/2026 28/03/2026  Titular
#> 385 16/07/2014 04/12/2014 Suplente
#> 386 27/05/2014 22/12/2014  Titular
#> 387 14/12/2011 04/07/2013 Suplente
#> 388 24/04/2012 14/06/2012  Titular
#> 389 09/03/2017 21/12/2018 Suplente
#> 390 07/03/2023 01/02/2025  Titular
#> 391 18/12/2014 31/01/2015  Titular
#> 392 25/02/2015 10/02/2017 Suplente
#> 393 09/03/2017 07/06/2017  Titular
#> 394 07/06/2017 21/12/2018 Suplente
#> 395 13/02/2019 13/08/2019 Suplente
#> 396 13/08/2019 19/02/2021  Titular
#> 397 19/02/2021 31/01/2023  Titular
#> 398 07/03/2023 01/02/2025  Titular
#> 399 18/02/2025          -  Titular
#> 400 27/08/2013 30/01/2015  Titular
#> 401 09/03/2017 21/12/2018 Suplente
#> 402 18/02/2025 25/03/2025  Titular
#> 403 07/04/2015 22/12/2016  Titular
#> 404 30/04/2014 27/11/2014 Suplente
#> 405 15/06/2022 16/08/2022  Titular
#> 406 22/10/2019 10/11/2022  Titular
#> 407 11/04/2012 22/12/2014  Titular
#> 408 15/02/2023 12/06/2023  Titular
#> 409 09/03/2017 21/12/2018 Suplente
#> 410 13/02/2019 19/02/2021  Titular
#> 411 19/02/2021 18/10/2022 Suplente
#> 412 07/11/2022 31/01/2023 Suplente
#> 413 07/03/2023 01/02/2025  Titular
#> 414 02/12/2024 17/12/2024  Titular
#> 415 06/12/2023 17/07/2025  Titular
#> 416 10/05/2018 12/06/2018  Titular
#> 417 14/07/2015 03/08/2015  Titular
#> 418 04/08/2015 03/08/2015 Suplente
#> 419 04/08/2015 11/08/2015 Suplente
#> 420 12/08/2015 28/09/2015 Suplente
#> 421 17/06/2015 18/06/2015  Titular
#> 422 18/06/2015 06/10/2015  Titular
#> 423 10/02/2011 22/12/2011 Suplente
#> 424 17/04/2012 20/12/2013  Titular
#> 425 10/10/2013 22/12/2014  Titular
#> 426 30/05/2023          -  Titular
#> 427 19/04/2023          -  Titular
#> 428 05/09/2024          -  Titular
#> 429 14/04/2022 31/01/2023  Titular
#> 430 05/09/2023          -  Titular
#> 431 16/11/2023          -  Titular
#> 432 20/08/2021 31/01/2023  Titular
#> 433 07/07/2023          -  Titular
#> 434 11/09/2019 31/01/2023  Titular
#> 435 25/10/2023          -  Titular
#> 436 24/03/2021 31/01/2023  Titular
#> 437 05/04/2023          -  Titular
#> 438 08/11/2021 31/01/2023  Titular
#> 439 01/12/2021 31/01/2023  Titular
#> 440 13/03/2023          -  Titular
#> 441 22/05/2019 31/01/2023  Titular
#> 442 01/11/2019 31/01/2023  Titular
#> 443 04/07/2023          -  Titular
#> 444 16/06/2016 02/08/2017  Titular
#> 445 27/11/2018 04/02/2019  Titular
#> 446 17/09/2019 30/01/2023  Titular
#> 447 17/03/2026          -  Titular
#> 448 06/08/2014 28/12/2018  Titular
#> 449 24/09/2019 31/01/2023  Titular
#> 450 09/05/2023          -  Titular
#> 451 15/06/2023          -  Titular
#> 452 31/03/2015 28/12/2018  Titular
#> 453 27/03/2019 31/01/2023  Titular
#> 454 09/05/2023          -  Titular
#> 455 09/07/2013 28/12/2018  Titular
#> 456 07/07/2011 28/12/2018  Titular
#> 457 31/03/2015 28/12/2018  Titular
#> 458 27/02/2023          -  Titular
#> 459 05/06/2019 31/01/2023  Titular
#> 460 02/05/2023          -  Titular
#> 461 12/12/2013 28/12/2018  Titular
#> 462 03/03/2020 31/01/2023  Titular
#> 463 04/03/2020 31/01/2023  Titular
#> 464 19/04/2023          -  Titular
#> 465 26/08/2019 31/01/2023  Titular
#> 466 04/03/2015 28/12/2018  Titular
#> 467 27/03/2019 31/01/2023  Titular
#> 468 05/05/2022 31/01/2023  Titular
#> 469 28/03/2023          -  Titular
#> 470 07/06/2011 07/05/2013 Suplente
#> 471 08/05/2013 31/01/2015 Suplente
#> 472 02/07/2014 21/07/2014  Titular
#> 473 25/02/2015 03/03/2015  Titular
#> 474 15/04/2014 03/05/2014  Titular
#> 475 25/02/2015 03/03/2015  Titular
```
