#  Parties System Indicators
#
# Party Nationalization Score
# Consejo Nacional Electoral - Ecuador (2014)
#

pns <- function(subnational_shares) {
     if (class(subnational_shares) != 'numeric') {
          stop('Input vector must be numeric')
     }
     1-Gini(subnational_shares)
}
