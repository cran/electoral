#  Allocating Seats by highest averages methods----

globalVariables(c('QUOTIENTS',
                  'DIVISOR',
                  'ORDER',
                  'PARTY',
                  'SEATS',
                  'VOTES',
                  'TIES_ORDER'))

seats_ha <- function(parties,
                     votes,
                     n_seats,
                     method) {
        
        if (length(unique(parties)) != length(parties)) {
                stop('every party name must be unique')
        }
        
        if (n_seats < 1 | floor(n_seats) != ceiling(n_seats)) {
                stop('n_seats must be an integer greater than 0')
        }
        
        s <- 1:n_seats
        
        if (method=='dhondt') {
                divisors = s
        } else if (method=='webster') {
                divisors <- 2*s-1
        } else if (method=='danish') {
                divisors <- 3*s-2
        } else if (method=='imperiali') {
                divisors <- s+1
        } else if (method=='hill-huntington') {
                divisors <- sqrt(s*(s+1))
        } else if (method=='dean') {
                divisors <- (2*s)*(s+1)/(2*s+1)
        } else if (method=='mod-saint-lague') {
                divisors <- (10*s-5)/7
                divisors[1] <- 1
        } else if (method=='equal-proportions') {
                divisors <- sqrt(s*(s-1))
        } else if (method=='adams') {
                divisors <- s-1
        } else {
                stop('Not an implemented method!')
        }
        
        votes <- tibble(PARTY=as.character(parties), VOTES=votes)
        
        quot <- as_tibble(expand.grid(PARTY = parties,
                                           DIVISOR = divisors)) %>%
                mutate(PARTY = as.character(PARTY)) %>%
                left_join(votes, by = 'PARTY') %>%
                mutate(QUOTIENTS = VOTES/DIVISOR) %>%
                mutate(ORDER=rank(-QUOTIENTS, ties.method='max'))
        
        seats <- quot %>%
                arrange(ORDER) %>%
                filter(ORDER <= length(divisors)) %>%
                group_by(PARTY) %>%
                summarise(SEATS=n())
        
        if(sum(seats$SEATS) != n_seats) {
                empates <- quot %>%
                        filter(ORDER > length(divisors)) %>%
                        mutate(TIES_ORDER = rank(ORDER, ties.method = 'min')) %>%
                        filter(TIES_ORDER == 1)
                
                print(paste('IMPORTANT:',
                            sum(seats$SEATS),
                            'seats had been allocated. There is(are)',
                            n_seats-sum(seats$SEATS),
                            'seat(s) with tie.',
                            paste(c('Parties in tie:', empates$PARTY), collapse = " ")))
        }
        
        seats <- votes %>%
                left_join(seats, by = 'PARTY') %>%
                mutate(SEATS = ifelse(is.na(SEATS), 0L, as.integer(SEATS)))
        
        seats <- as.vector(seats$SEATS)
        names(seats) <- parties
        print('Seats allocated')
        seats
}