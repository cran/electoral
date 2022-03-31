\name{seats}
\alias{seats}
\title{Allocating Seats by any method}
\usage{
seats(parties, votes, n_seats, method)
}
\arguments{
\item{parties}{vector of names of parties, must be uniques}
\item{votes}{vector of votes, same length as parties.}
\item{n_seats}{number of seats to be allocated (integer equal or greater 1).}
\item{method}{string according seat allocating method:  "dhondt", "webster", "danish", "imperiali", "hill-huntington", "dean", "mod-saint-lague", "equal-proportions", "adams", "hare", "droop", "hangenbach-bischoff", "imperial", "mod-imperial" or "quotas-remainders".}
}
\value{
A tibble
}
\description{
This function is a wrapper for seats_ha and seats_lr functions. A shortcut to allocate seats by any method selected by its string name.

Developed by Jorge Albuja Delgado (albuja@yahoo.com).
}
\examples{
seats(parties = c("A", "B", "C"),
       votes = c(100, 150, 60),
       n_seats = 5,
       method = "hare")

seats(parties = c("V", "W", "X", "Y", "Z"),
      votes = c(100, 150, 60, 80, 160),
      n_seats = 15,
      method = "droop")
      
seats(parties = c("A", "B", "C"),
       votes = c(100, 150, 60),
       n_seats = 5,
       method = "dhondt")

seats(parties = c("V", "W", "X", "Y", "Z"),
      votes = c(100, 150, 60, 80, 160),
      n_seats = 15,
      method = "webster")
}
