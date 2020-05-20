#  Party System Indicators - Concentration----

concentration <- function(votes) {
     if (class(votes) != 'numeric') {
          stop('Input vector must be numeric')
     }
     if (length(votes) < 2 & class(votes) == 'numeric') {
          stop('Input vector must have minimal lenght of 2.')
     }
     sum(sort(votes/sum(votes), decreasing = TRUE)[1:2])
}

