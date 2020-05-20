#  Party System Indicators - Party System Nationalization Score (PSNS)----

globalVariables(c('PROVINCE',
                  'SHARE',
                  'PNS',
                  'NATIONAL_SHARE',
                  'PNS_WEIGHTED'))

psns <- function(tidy_votes, method = 'Jones-Mainwaring') {
  if (!ncol(tidy_votes) == 3) {
    stop('Data frame must have exactly 3 columns')
  }
  if (!identical(names(tidy_votes), c('PROVINCE', 'PARTY', 'VOTES'))) {
    stop('Data frame names must be PROVINCE, PARTY and VOTES')
  }
  if (!method %in%  c('Jones-Mainwaring', 'Golosov')) {
    stop('Not a valid method')
  }
  tidy_votes %>%
    group_by(PROVINCE) %>%
    mutate(SHARE = VOTES/sum(VOTES)) %>%
    group_by(PARTY) %>%
    summarize(PNS = pns(SHARE, method),
              VOTES = sum(VOTES)) %>%
    mutate(NATIONAL_SHARE = VOTES/sum(VOTES),
           PNS_WEIGHTED = PNS*NATIONAL_SHARE) %>% 
    ungroup() %>% 
    summarise(pns = sum(PNS_WEIGHTED)) %>%
    pull()
}
