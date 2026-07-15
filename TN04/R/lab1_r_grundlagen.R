

bws_be <- 165000
bws_f <- 38000
bws_gi <- 120000

quartalssumme <- sum(bws_be, bws_f, bws_gi)

mittelwert <- quartalssumme / 3

jahreshochrechnung <- quartalssumme * 4


mittelwert_gerundet <- round(mittelwert, 1)


bereich_code <- "BE"
ist_freigegeben <- TRUE
stichtag <- as.Date("2024-12-31")

class(mittelwert_gerundet)
class(bereich_code)
class(ist_freigegeben)
class(stichtag)


werte <- c(165000, NA, 38000, NA, 120000)
test <- sum(werte, na.rm = TRUE)
anzahl_na <- sum(is.na(werte))




