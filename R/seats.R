#  Allocating Seats by any method----

seats <- function(parties,
                  votes,
                  n_seats,
                  method) {
  
  if (length(unique(parties)) != length(parties)) {
    stop('every party name must be unique')
  }
  
  if (n_seats < 1 | floor(n_seats) != ceiling(n_seats)) {
    stop('n_seats must be an integer greater than 0')
  }
  
  if (method %in% c('dhondt', 
                    'webster', 
                    'danish', 
                    'imperiali', 
                    'hill-huntington',
                    'mod-saint-lague', 
                    'equal-proportions', 
                    'adams')) {
    return(seats_ha(parties,
                    votes,
                    n_seats,
                    method))
  } else if (method %in% c('hare', 
                           'droop', 
                           'hangenbach-bischoff', 
                           'imperial',
                           'mod-imperial',
                           'quotas-remainders')) {
    return(seats_lr(parties,
                    votes,
                    n_seats,
                    method))
  } else {
    stop('Not an implemented method!')
  }
}