\name{concentration}
\alias{concentration}
\title{Electoral Concentration}
\usage{
concentration(votes)
}
\arguments{
\item{votes}{2_or_more-length vector of number o proportion of votes/seats per party}
}
\value{
A single numeric with concentration value in the interval (0, 1].
}
\description{
Electoral concentration is a measure of the accumulation of votes in the two most voted parties of a given territorial unit. It is the cumulative fraction of valid votes obtained by the two most voted parties in a given election (Consejo Nacional Electoral - Ecuador, 2014).

The formula is:

\deqn{concentration = p1 + p2}

where p1 is the vote/seat proportion for the most voted party,
and p2 is the vote/seat proportion for the second most voted party.
Thus, it requires elections with at least 2 parties.

The index is a number positive up to 1. A value of 1 means maximum concentration (p1 + p2 = 1, i.e. pi = 0 for i = 3,4...)

Developed by Jorge Albuja Delgado (albuja@yahoo.com).
}
\examples{
concentration(votes = c(100, 150, 60))
}
