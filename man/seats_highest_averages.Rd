\name{seats_ha}
\alias{seats_ha}
\title{Allocating Seats - Highest Averages}
\usage{
seats_ha(parties, votes, n_seats, method)
}
\arguments{
\item{parties}{vector of names of parties, must be uniques}
\item{votes}{vector of votes, same length as parties.}
\item{n_seats}{number of seats to be allocated (integer equal or greater 1).}
\item{method}{string according seat allocating method: "dhondt", "webster", "danish", "imperiali", "hill-huntington", "dean", "mod-saint-lague", "equal-proportions" or "adams".}
}
\value{
A vector of the number seats allocated for each party in "parties", with the same length as parties and votes.
}
\description{
Highest averages is the name for a variety of ways to allocate seats proportionally for representative assemblies with party list voting systems. It requires the number of votes for each party to be divided successively by a series of divisors. This produces a table of quotients, or averages, with a row for each divisor and a column for each party. The nth seat is allocated to the party whose column contains the nth largest entry in this table, up to the total number of seats available. Different methods uses different series of divisors:

If there are n_seats seats to allocate these methods requires n_seats divisors (from 1 to n_seats), being the nth divisor:

D'Hondt: n

Webster: 2 * n - 1

Danish: 3 * n - 2

Imperiali: n + 1

Hill-Huntington: sqrt(n * (n + 1))

Dean: (2 * n) * (n + 1) / (2 * n + 1)

Modified Sainte-Lague: (10 * n - 5) / 7

Equal proportions: sqrt(n * (n - 1))

Adams: n - 1

In case of ties, the implemented algorithm not allocate the involved seats, and prints how many seats had been allocated and how many are in tie.

More information: https://en.wikipedia.org/wiki/Highest_averages_method

Developed by Jorge Albuja Delgado (albuja@yahoo.com).
}
\examples{
seats_ha(parties = c("A", "B", "C"),
       votes = c(100, 150, 60),
       n_seats = 5,
       method = "dhondt")

seats_ha(parties = c("V", "W", "X", "Y", "Z"),
      votes = c(100, 150, 60, 80, 160),
      n_seats = 15,
      method = "webster")
}
