\name{competitiveness}
\alias{competitiveness}
\title{Electoral Competitiveness}
\usage{
competitiveness(votes)
}
\arguments{
\item{votes}{greater-than-1-length vector of number/share of votes/seats per party}
}
\value{
A single numeric with electoral competitiveness value in the interval [0, 1]
}
\description{
Electoral competitiveness measures the difference in the percentages of valid votes obtained by the two most voted parties in a given territorial unit. It identifies the level of rivalry between the parties who occupied the first and second places in an election. Consejo Nacional Electoral del Ecuador (2014).
The formula is:

\deqn{Competitiveness = 1 - (p1 - p2)}

where p1 and p2 are the 2 votes o seats proportions for the 2 most voted parties. Thus, it requires elections with at least 2 parties.

The index is a number from 0 to 1, 0 means no competitiveness (p1 = 1 and p2 = 0) and 1 means maximum competitiveness (p1 = p2).

Developed by Jorge Albuja Delgado (albuja@yahoo.com).
}
\examples{
competitiveness(votes = c(100, 150, 60))
}
