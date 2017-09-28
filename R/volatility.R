#  Parties System Indicators
#
# Volatility
# Consejo Nacional Electoral - Ecuador (2014)
#

volatility <- function(votes_1, votes_2) {
     if (class(votes_1) != 'numeric' | class(votes_2) != 'numeric' ) {
          stop('Both input vectors must be numeric')
     }
     if (length(votes_1) != length(votes_2)) {
          stop('Input vectors must be of same length')
     }
     sum(abs(votes_1/sum(votes_1) - votes_2/sum(votes_2)))/2
}
