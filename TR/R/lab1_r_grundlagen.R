

bws_be <- 165000
bws_f <- 38000
bws_gi <- 120000

quartalssumme <- bws_f + bws_be + bws_gi
# andere Möglichkeit
quartalssumme <- sum(bws_be, bws_f, bws_gi)
mittelwert <- quartalssumme/3
mittelwert
jahreshochrechnung <- mittelwert*4
jahreshochrechnung

bereich_code <- "BE"
ist_freigegeben <- TRUE
stichtag <- as.Date("2024-12-31")

round(mittelwert,1)

class(bereich_code)
class(ist_freigegeben)
class(stichtag)


werte <- c(165000,NA, 38000, 120000, NA)

sum(werte)
sum(werte, na.rm = TRUE)
sum(is.na(werte))








