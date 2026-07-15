bws_be <- 165000
bws_f <- 38000
bws_gi <- 120000

# Summe der drei Quartalswerte
quartalssumme <- bws_be + bws_f + bws_gi
#andere Möglichkeit 
quartalssumme <- sum(bws_be, bws_f, bws_gi)

# Mittelwert
mittelwert <- quartalssumme / 3

# Hochrechnung auf vier Quartale
jahreshochrechnung <- quartalssumme * 4

# Ergebnisse ausgeben
quartalssumme
mittelwert
jahreshochrechnung


# Hilfe zu round() aufrufen
?round

mittelwert_gerundet <- round(mittelwert,1)

bereich_code <- "BE"
ist_freigegeben <- TRUE
stichtag <- as.Date("2024-12-31")

# Klassen der Objekte prüfen
class(mittelwert)
class(mittelwert_gerundet)
class(bereich_code)
class(ist_freigegeben)
class(stichtag)

# Aufgabe 3

# Vektor erzeugen
werte <- c(165000, NA, 38000, 120000)

# 1. Summe berechnen
sum(werte)

# 2. Summe berechnen und fehlende Werte ignorieren
bereinigte_summe <- sum(werte, na.rm = TRUE)

# 3. Anzahl der fehlenden Werte ermitteln
anzahl_fehlend <- sum(is.na(werte))

# Ergebnisse ausgeben
bereinigte_summe
anzahl_fehlend

# 4. Kommentar:
# NA sollte nicht automatisch durch 0 ersetzt werden,
# da ein fehlender Wert nicht bedeutet, dass der tatsächliche Wert 0 ist.
# Ob fehlende Werte ersetzt oder ausgeschlossen werden, hängt vom fachlichen Kontext und der Datenanalyse ab.

