\name{pns}
\alias{pns}
\title{Party Nationalization Score (PNS)}
\usage{
pns(subnational_shares)
}
\arguments{
\item{subnational_shares}{vector of vote shares per subnational unit (province) for a single party}
}
\value{
A single numeric with party nationalization score of a party, in the interval [0, 1]
}
\description{
Party nationalization score is a measure for the uniformity of vote share of a party over subnational units (provinces for Ecuador).  It is computed as 1 minus Gini inequality index (Jones and Mainwaring, 2003)

\deqn{PNS = 1 - G}
\deqn{G = (2*sum(i*xi)) / (n*sum(xi)) - (n + 1)/n}

in which G is the Gini inequality index,
xi is the vote share in the province ith, indexed in non-decreasing order (xi <= xi+1)
i is an index from 1 to n
n is the total of provinces

Party nationalization score is a number from 0 to 1, a low value (near 0) means a low level of nationalization, i.e. heterogeneous distribution of vote shares in subnational territorial units.

High score (near 1) indicates a high level of nationalization, i.e. homogeneous distribution of vote shares in subnational territorial units.

See \code{\link{psns}} function for further information.

Developed by Jorge Albuja Delgado (albuja@yahoo.com).
}
\examples{
pns(subnational_shares = c(0.3, 0.1, 0.2))
}
