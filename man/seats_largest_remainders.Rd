\name{seats_lr}
\alias{seats_lr}
\title{Allocating Seats - Largest Remainders}
\usage{
seats_lr(parties, votes, n_seats, method)
}
\arguments{
\item{parties}{vector of names of parties, must be uniques}
\item{votes}{vector of votes, same length as parties.}
\item{n_seats}{number of seats to be allocated (integer equal or greater 1).}
\item{method}{string according seat allocating method: "hare", "droop", "hangenbach-bischoff", "imperial", "mod-imperial" or "quotas-remainders".}
}
\value{
A vector of the number seats allocated for each party in 'parties', with the same length as parties and votes.
}
\description{
Largest remainders methods require the numbers of votes for each party to be divided by a quota representing the number of votes required for a seat (i.e. usually the total number of votes cast divided by the number of seats, or some similar formula). The result for each party will usually consist of an integer part plus a fractional remainder. Each party is first allocated a number of seats equal to their integer. This will generally leave some seats unallocated: the parties are then ranked on the basis of the fractional remainders, and the parties with the largest remainders are each allocated one additional seat until all the seats have been allocated. This gives the method its name. The quota formula for each largest remainder method is:

Hare: (sum(votes))/n_seats

Droop: (sum(votes))/(n_seats + 1) + 1

Hangenbach Bischoff: (sum(votes))/(n_seats + 1)

Imperial: (sum(votes))/(n_seats + 2)

Modified Imperial: (sum(votes))/(n_seats + 3)

Quotas & remainders:
\enumerate{
   \item threshold: select all parties that meet votes_i >= (sum(votes))/(2*n_seats)
   \item quota: (sum(votes))/n_seats  (only over selected parties)
}

In case of ties, the implemented algorithm not allocate the involved seats, and prints how many seats had been allocated and how many are in tie.

Developed by Jorge Albuja Delgado (albuja@yahoo.com).
}
\examples{
seats_lr(parties = c("A", "B", "C"),
       votes = c(100, 150, 60),
       n_seats = 5,
       method = "hare")

seats_lr(parties = c("V", "W", "X", "Y", "Z"),
      votes = c(100, 150, 60, 80, 160),
      n_seats = 15,
      method = "droop")
}
