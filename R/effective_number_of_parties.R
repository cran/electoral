#  Parties System Indicators
#
# Effective Number of parties
# Laakso Taaggepera index
#

enp <- function(votes) {
     1/sum((votes/sum(votes))^2)
}
