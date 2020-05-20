\name{psns}
\alias{psns}
\title{Party System Nationalization Score (PSNS)}
\usage{
psns(tidy_votes, method)
}
\arguments{
\item{tidy_votes}{a tibble/data.frame in tidy format with 3 variables (columns): 'PROVINCE', 'PARTY' and 'VOTES', where:
\enumerate{
   \item PROVINCE: names or codes of subnational units.
   \item PARTY: names or codes of national parties.
   \item VOTES: number of votes for every PARTY in every PROVINCE.
}
}
\item{method}{string to choose from c('Jones-Mainwaring', 'Golosov'). Defaults to 'Jones-Mainwaring'}
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

A new approach developed by Golosov (2014) 'Party System Nationalization: The Problems of Measurement with an Application to Federal States' (http://ppq.sagepub.com/content/early/2014/09/08/1354068814549342.abstract) is also available.  

Input tibble must have 3 columns with fixed names: 'PROVINCE', 'PARTY and 'VOTES'.

See \code{\link{pns}} function for further information.

Developed by Jorge Albuja Delgado (albuja@yahoo.com).
}
\examples{
data <- data.frame(PROVINCE = c(1, 1, 1, 2, 2, 2),
               PARTY = c('1', '2', '3',  '1', '2', '3'),
               VOTES = c(66389, 55372, 20319, 28156, 18790, 4954))
psns(data)
psns(data, method = 'Golosov')
}