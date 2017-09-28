\name{psns}
\alias{psns}
\title{Party System Nationalization Score (PSNS)}
\usage{
psns(tidy_votes)
}
\arguments{
\item{tidy_votes}{a tibble/data.frame in tidy format with 3 variables: 'PROVINCE', 'PARTY' and 'VOTES', where:
\enumerate{
   \item PROVINCE: names or codes of subnational units.
   \item PARTY: names of national parties.
   \item VOTES: number of votes for every PARTY in every PROVINCE.
}
}
}
\value{
A single numeric with Party System Nationalization Score (PSNS) in the interval [0, 1]
}
\description{
Party System Nationalization Score is a measure for the uniformity of vote share of a party system over subnational units (provinces for Ecuador).  It is computed as the sum of part nationalization scores, weighted by the national share of every party (Jones and Mainwaring, 2003).

\deqn{PSNS = sum(PNSi*pi)}

where PNSi is the party nationalization score for party ith,
and pi is the national vote share for party ith.

Party system nationalization score is a number from 0 to 1, low value (near 0) means a low level of nationalization, i.e. heterogeneous distribution of vote shares in subnational territorial units.

High score (near 1) indicates a high level of nationalization, i.e. homogeneous distribution of vote shares in subnational territorial units.

Input tibble must have 3 columns with fixed names: 'PROVINCE', 'PARTY and 'VOTES'.

See \code{\link{pns}} function for further information.

Developed by Jorge Albuja Delgado (albuja@yahoo.com).
}
\examples{
data <- data.frame(PROVINCE=c(1,1,2,2),
               PARTY=c('A','B','A','B'),
               VOTES=c(200,100,190,800))

psns(data)
}
