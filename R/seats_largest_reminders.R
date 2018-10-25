#  Allocating Seats by Largest Remainders Methods

globalVariables(c('THRESHOLD',
                  'REMAINDERS',
                  'RANK',
                  'INTEGER_SEATS',
                  'REMAINDER_SEATS'))

seats_lr <- function(parties,
                  votes,
                  n_seats,
                  method) {

     if (length(unique(parties)) != length(parties)) {
          stop('every party name must be unique')
     }

     if (n_seats < 1 | floor(n_seats) != ceiling(n_seats)) {
          stop('n_seats must be an integer greater than 0')
     }

     votacion_original <- tibble(PARTY=as.character(parties), VOTES=votes)
     votacion <- votacion_original
     add <- 0

     if (method=='hare') {
          divisor <- n_seats
     } else if (method=='droop') {
          add <- n_seats + 1
          divisor <- n_seats + 1
     } else if (method=='hangenbach-bischoff') {
          divisor <- n_seats + 1
     } else if (method=='imperial') {
          divisor <- n_seats + 2
     } else if (method=='mod-imperial') {
          divisor <- n_seats + 3
     } else if (method=='quotas-remainders') {
          divisor <- n_seats
          votacion <-  votacion_original %>%
               mutate(THRESHOLD = VOTES / (sum(VOTES)/(2*n_seats))) %>%
               filter(THRESHOLD >= 1)
     } else {
          stop('No implemented method.')
     }

     seats <- votacion %>%
          mutate(INTEGER_SEATS = VOTES %/% ((sum(VOTES)+add)/divisor),
                 REMAINDERS = VOTES %% ((sum(VOTES)+add)/divisor),
                 RANK = rank(-REMAINDERS, ties.method='max'),
                 REMAINDER_SEATS = ifelse(RANK <= n_seats - sum(INTEGER_SEATS), 1, 0),
                 SEATS = INTEGER_SEATS + REMAINDER_SEATS) %>%
          right_join(votacion_original, by = c('PARTY', 'VOTES')) %>%
          mutate(SEATS = ifelse(is.na(SEATS), 0L, as.integer(SEATS)))

     if(sum(seats$SEATS) != n_seats) {
          empates <- seats %>%
                filter(RANK > n_seats - sum(INTEGER_SEATS)) %>%
                mutate(ORDEN_EMPATES=rank(RANK, ties.method='min')) %>%
                filter(ORDEN_EMPATES==1)
          print(paste('IMPORTANT: ',
                      sum(seats$SEATS),
                      'seats had been allocated. There is(are)',
                      n_seats-sum(seats$SEATS),
                      'seat(s) with tie.'))
          print(c('Parties in tie:', empates$PARTY))
     }

     seats <- as.vector(seats$SEATS)
     names(seats) <- parties
     seats

}

