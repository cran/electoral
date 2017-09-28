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
A vector of the number seats allocated for each party in 'parties', with the same length as parties and votes.
}
\description{
Highest averages is the name for a variety of ways to allocate seats proportionally for representative assemblies with party list voting systems. It requires the number of votes for each party to be divided successively by a series of divisors. This produces a table of quotients, or averages, with a row for each divisor and a column for each party. The nth seat is allocated to the party whose column contains the nth largest entry in this table, up to the total number of seats available. Different methods uses different series of divisors:

D'Hondt: divisors 1, 2, 3, 4, 5, ... (nth divisor: n)

Webster: divisors 1, 3, 5, 7, 9, ... (nth divisor: 2*n-1)

Danish: divisors 1, 4, 7, 10, 13, ... (nth divisor: 3*n-2)

Imperiali: divisors 2, 3, 4, 5, 6, ... (nth divisor: n+1)

Hill-Huntington: divisors sqrt(2), sqrt(6), sqrt(12), sqrt(20), sqrt(30), ... (nth divisor: sqrt(n*(n+1)))

Dean: divisors 4/3, 12/5, 24/7, 40/9, 60/11, ... (nth divisor: (2*n)*(n+1)/(2*n+1))

Modified Sainte-Lague: 1, 15/7, 25/7, 35/7, 45/7 (1st divisor: 1, nth divisor: (10*n-5)/7)

Equal proportions: 0, sqrt(2), sqrt(6), sqrt(12), sqrt(20), ... (nth divisor: sqrt(n*(n-1)))

Adams: 0, 1, 2, 3, 4, ... (nth divisor: n-1)

where n = 1, 2, 3... until number of seats to be allocated

Currently methods used in Ecuador are: Webster (divisors 1,3,5...) for assembly national representatives and D'Hondt (divisors 1,2,3..) otherwise.

In case of ties, the implemented algorithm not allocate the involved seats, and prints how many seats had been allocated and how many are in tie.

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
