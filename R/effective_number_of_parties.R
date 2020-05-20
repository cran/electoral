#  Party System Indicators - Effective Number of Parties (ENP)----

enp <- function(votes, method = 'Laakso-Taagepera') {
  if (class(votes) != 'numeric') {
    stop('Votes input vector must be numeric')
  }
  if (!method %in%  c('Laakso-Taagepera', 'Golosov')) {
    stop('Not a valid method')
  }
  if (method == 'Laakso-Taagepera') {
    enp <- 1/sum((votes/sum(votes))^2)
  } else if (method == 'Golosov') {
    shares <- votes / sum(votes)
    enp <- sum(shares/(shares + (max(shares))^2 - shares^2))
  } 
  enp
}

