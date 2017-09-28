#  Parties System Indicators
#
# Party System Nationalization Score (PSNS)
# Consejo Nacional Electoral - Ecuador (2014)
#

globalVariables(c('PROVINCE',
                  'SHARE',
                  'PNS',
                  'NATIONAL_SHARE'))

psns <- function(tidy_votes) {
     pns <- tidy_votes %>%
          group_by(PROVINCE) %>%
          mutate(SHARE = VOTES/sum(VOTES)) %>%
          group_by(PARTY) %>%
          summarize(PNS = pns(SHARE),
                    VOTES = sum(VOTES)) %>%
          mutate(NATIONAL_SHARE = VOTES/sum(VOTES),
                 PNS_WEIGHTED = PNS*NATIONAL_SHARE)

     sum(pns$PNS_WEIGHTED)

}
