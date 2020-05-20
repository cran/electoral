#  Allocating Seats by largest remainders methods----

globalVariables(c('THRESHOLD',
                  'REMAINDERS',
                  'RANK',
                  'INTEGER_SEATS',
                  'REMAINDER_SEATS',
                  'TIES_ORDER'))

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
        
        votes_ini <- tibble(PARTY = as.character(parties), VOTES = votes)
        votes_mod <- votes_ini
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
                votes_mod <-  votes_ini %>%
                        mutate(THRESHOLD = VOTES / (sum(VOTES)/(2*n_seats))) %>%
                        filter(THRESHOLD >= 1)
        } else {
                stop('No implemented method.')
        }
        
        seats <- votes_mod %>%
                mutate(INTEGER_SEATS = VOTES %/% ((sum(VOTES) + add) / divisor),
                       REMAINDERS = VOTES %% ((sum(VOTES) + add) / divisor),
                       RANK = rank(-REMAINDERS, ties.method = 'max'),
                       REMAINDER_SEATS = ifelse(RANK <= n_seats - sum(INTEGER_SEATS), 1, 0),
                       SEATS = INTEGER_SEATS + REMAINDER_SEATS) %>%
                right_join(votes_ini, by = c('PARTY', 'VOTES')) %>%
                mutate(SEATS = ifelse(is.na(SEATS), 0L, as.integer(SEATS)))
        
        if(sum(seats$SEATS) != n_seats) {
                ties <- seats %>%
                        filter(RANK > n_seats - sum(INTEGER_SEATS)) %>%
                        mutate(TIES_ORDER = rank(RANK, ties.method = 'min')) %>%
                        filter(TIES_ORDER == 1)
                
                print(paste('IMPORTANT:',
                            sum(seats$SEATS),
                            'seats had been allocated. There is(are)',
                            n_seats-sum(seats$SEATS),
                            'seat(s) with tie.',
                            paste(c('Parties in tie:', ties$PARTY), collapse = " ")))
        }
        
        seats <- as.vector(seats$SEATS)
        names(seats) <- parties
        print('Seats allocated')
        seats
}