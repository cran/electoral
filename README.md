
<!-- README.md is generated from README.Rmd. Please edit that file -->
electoral
---------

The goal of electoral package is provide simple functions to compute allocating seats methods and party system scores

Implemented allocating seats methods are:

For highest averages group: D'Hondt, Webster, Danish, Imperiali, Hill-Huntington, Dean, Modified Sainte-Lague, Equal proportions and Adams.

For largest remainders group: Hare, Droop, Hangenbach-Bischoff, Imperial, Modified Imperial, Quotas&Remainders.

Developed party system scores are:

Competitiveness, concentration, effective number of parties (ENP), party nationalization score (PNS), party system nationalization score (PSNS) and volatility. Effective number of parties implemented methods are Laakso-Taagepera and Golosov. Available party nationalization score and party system nationalization score methods are Jones-Mainwaring and Golosov.

Installation
------------

You can install electoral directly from CRAN:
``` r
install.packages("electoral")
```

Or install it from GitHub with:

``` r
if (!require("devtools")) {
  install.packages("devtools")
  library("devtools")
}
devtools::install_github("albuja/electoral")
```

Examples
--------

This is a basic example which shows you how to allocate seats by two common methods (D'Hondt and Hare):

``` r
library(electoral)

seats(parties = c("A", "B", "C"),
       votes = c(100, 150, 60),
       n_seats = 5,
       method = "dhondt")

seats(parties = c("A", "B", "C"),
       votes = c(100, 150, 60),
       n_seats = 5,
       method = "hare")
```

This is a basic example which shows you how to compute effective number of parties using Laakso-Taagepera method:

``` r
library(electoral)

enp(votes = c(100, 150, 60))
```
