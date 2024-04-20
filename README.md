
# senatebR <img src="inst/figures/img.png" align="right" width="150"/> 

![License](https://img.shields.io/badge/license-MIT-blueviolet.svg?style=flat)

## :writing_hand: Author

Vinicius Santos <http://vsantos.rbind.io/>

PhD. Political Science, Universidade Federal de Minas Gerais (UFMG)

## Code for collect data from the Brazilian Senate

The `{senatebR}` package is a comprehensive tool designed to access information related to the functioning and activities of the Brazilian Federal Senate. This package offers detailed data in five main dimensions:

1.  Projects and Matters: This component allows you to identify and monitor bills, legislative proposals and other matters in progress in the Federal Senate. It provides access to details such as title, amendment, author, current status and processing history.
2.  Parliamentarian Information: Here, users can explore comprehensive profiles of current and former parliamentarians of the Federal Senate, including biographies, party affiliations, legislative history, committee positions, among other relevant information.
3.  Composition Information: This module offers an overview of the current composition of the Federal Senate, including the party distribution of senators, their federative units of origin, length of mandate, as well as demographic data and relevant statistics.
4.  Information about the Committees: Here, users can access details about the different committees of the Federal Senate, including their functions, current members, work agendas, reports produced and other related activities.
5.  Information on the Plenary: This last component provides insights into the activities of the plenary of the Federal Senate, including voting agendas, transcripts of debates, minutes of sessions, decisions taken and other relevant information.

## Table of Contents

- [Installation](#installation)
- [Usage](#usage)
- [About](#about)
- [Citation](#Citation)

# :arrow_double_down: [Installation](#installation)

You can install the current version of senatebR from GitHub:

```{r, eval = FALSE}

install.packages("remotes")
remotes::install_github("vsntos/senatebR")

```
# [Usage](#usage)

Below is a quick-start guide to using the `{senatebR}` package.

### Downloading veto details 

```{r, eval=FALSE}
# This function scraps a page containing information about vetoes.
# The parameter is the number of pages to be processed

vetos = extrair_detalhes_vetos(3)

```

### Downloading party details 

```{r, eval=FALSE}

df_partidos <- obter_dados_partidos()

```

# [About](#about)

The `{senatebR}` is an initiative dedicated to making the public data of the Brazilian Federal Senate more accessible and understandable to interested citizens. We firmly believe in government transparency and in strengthening civic participation through easy and efficient access to legislative information. Our commitment to the accessibility and usefulness of public data is reflected in our continuous effort to improve and expand our project. We are constantly looking for ways to enhance the functionality of the system and the user experience, ensuring that our project meets the needs and expectations of researchers and individuals interested in parliamentary activities.

# [Citation](#Citation)

Santos, Vinicius (2024). senatebR: Activities of the Brazilian Federal Senate. R package. https://github.com/vsntos/senatebR
