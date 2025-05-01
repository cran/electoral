#  Party System Indicators - Competitiveness----

competitiveness <- function(votes) {
     if (!is.numeric(votes)) {
          stop('Input vector must be numeric')
     }
     if (length(votes) < 2 & is.numeric(votes)) {
          stop('Input vector must have minimal lenght of 2.')
     }
     fractions <- sort(votes/sum(votes), decreasing = TRUE)
     1 - (fractions[1] - fractions[2])
}

