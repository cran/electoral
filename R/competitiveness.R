#  Parties System Indicators
#
# Competitiveness
# Consejo Nacional Electoral - Ecuador (2014)
#

competitiveness <- function(votes) {
     if (class(votes) != 'numeric') {
          stop('Input vector must be numeric')
     }
     if (length(votes) < 2 & class(votes) == 'numeric') {
          stop('Input vector must have minimal lenght of 2.')
     }
     fractions <- sort(votes/sum(votes), decreasing = TRUE)
     1 - (fractions[1] - fractions[2])
}

