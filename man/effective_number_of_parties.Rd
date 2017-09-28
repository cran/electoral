\name{enp}
\alias{enp}
\title{Effective Number of Parties (ENP)}
\usage{
enp(votes)
}
\arguments{
\item{votes}{vector of number/share of votes/seats per party}
}
\value{
A single numeric with the effective number of parties value.
}
\description{
Computes the effective number of parties. The effective number of parties is a concept introduced by Laakso and Taagepera (1979) which provides for an adjusted number of political parties in a country's party system. The idea behind this measure is to count parties and, at the same time, to weight the count by their relative strength.

Measuring how many parties, weighted according to size, are in a party system in a given election, the effective number of (electoral/legislative) parties is calculated employing the following formula:

\deqn{ENP = 1 / sum(pi^2)}

where pi is the share of votes/seats of the ith party.

Developed by Jorge Albuja Delgado (albuja@yahoo.com).
}
\examples{
enp(votes = c(100, 150, 60))
}
