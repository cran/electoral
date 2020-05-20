\name{volatility}
\alias{volatility}
\title{Electoral Volatility}
\usage{
volatility(votes_1, votes_2)
}
\arguments{
\item{votes_1}{vector of number/share of votes/seats per party at time t-1 (previous election)}
\item{votes_2}{vector of number/share of votes/seats per party at time t (given election}
}
\value{
A single numeric with volatility value in the interval [0, 1]
}
\description{
Defined as the net change within the electoral party system resulting from individual vote transfers, electoral volatility is measured according to the following formula:

\deqn{Volatility = sum|pi,t-1 - pi,t| / 2}

in which pi,t is the vote/seat share for the party ith at a given election (t) and pi,t-1 is the vote/seat share of the same party ith at the previous elections (t-1) (Pedersen, 1979).

The index is a number from 0 to 1, 0 means no volatility (proportion of votes/seats remains constant for every party) and 1 means total volatility (every party pass from 0 to any votes or viceversa).

Developed by Jorge Albuja Delgado (albuja@yahoo.com).
}
\examples{
volatility(votes_1 = c(100, 150, 60),
           votes_2 = c(80, 120, 100))
}
