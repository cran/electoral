#  Parties System Indicators - Party Nationalization Score (PNS)----

pns <- function(subnational_shares, method = 'Jones-Mainwaring') {
  if (class(subnational_shares) != 'numeric') {
    stop('Input vector must be numeric')
  }
  if (is.na(sum(subnational_shares))) {
    stop('NA not allowed in input')
  }
  if (!method %in%  c('Jones-Mainwaring', 'Golosov')) {
    stop('Not a valid method')
  }
  if (method == 'Jones-Mainwaring') {
    pns <- 1 - Gini(subnational_shares)
  } else if (method == 'Golosov') {
    n_sub <- length(subnational_shares)
    pns <- 1- (n_sub - sum(subnational_shares)^2/sum(subnational_shares^2))/(n_sub - 1)
  } 
  pns
}
