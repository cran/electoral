
<!-- README.md is generated from README.Rmd. Please edit that file -->
electoral
=========

The goal of electoral is compute highest averages largest remainders allocating seats methods and party system scores: competitiveness, concentration, effective number of parties, party nationalization score, party system nationalization score and volatility

Installation
------------

You can install electoral from github with:

``` r
if (!require("devtools")) {
  install.packages("devtools")
  library("devtools")
}
devtools::install_github("albuja/electoral")
```

Examples
--------

This is a basic example which shows you how to allocate seats by two common methods:

``` r
library(electoral)

seats_ha(parties = c("A", "B", "C"),
       votes = c(100, 150, 60),
       n_seats = 5,
       method = "dhondt")
#> [1] "IMPORTANT:  4 seats had been allocated. There is(are) 1 seats with tie."
#> [1] "Parties in tie:" "A"               "B"

seats_lr(parties = c("A", "B", "C"),
       votes = c(100, 150, 60),
       n_seats = 5,
       method = "hare")
```

This is a basic example which shows you how to compute effective number of parties:

``` r
library(electoral)

enp(votes = c(100, 150, 60))
#> [1] 2.66205
```
