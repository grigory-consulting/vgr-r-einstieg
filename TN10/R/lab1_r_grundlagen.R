bws_be <- 165000
bws_f <- 38000
bws_gi <- 120000

quartalssumme <- c(bws_be, bws_f, bws_gi)
quartalssumme

mittelwert <- mean(quartalssumme)
mittelwert

jahreshochrechnung <- mittelwert*4
jahreshochrechnung

?round
round(mittelwert,1)



bereich_code <- "BE"
 ist freigegeben <- TRUE
 stichtag <- as.Date("2024-12-31")
 class(bereich_code)
 
 
 
werte <- c(165000, NA, 38000, 120000)

sum(werte)
sum (werte, na.rm = TRUE)
sum(is.na(werte))











 