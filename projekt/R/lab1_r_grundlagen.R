# Übung 1: R-Grundlagen und Arbeiten im Projekt
# Name: ........................................................
# Stand: .......................................................

# ---- 01 Objekte und Berechnungen ----

bws_be <- 165000
bws_f  <- 38000
bws_gi <- 120000

# TODO 1: Summe, Mittelwert und Hochrechnung berechnen.
quartalssumme <- NA
mittelwert <- NA
jahreshochrechnung <- NA

# TODO 2: mittelwert mit round() auf eine Nachkommastelle runden.
mittelwert_gerundet <- NA


# ---- 02 Datentypen und Vektoren ----

bereich_code <- "BE"
ist_freigegeben <- TRUE
stichtag <- as.Date("2024-12-31")

# TODO 3: class() für quartalssumme, bereich_code,
# ist_freigegeben und stichtag aufrufen.

werte <- c(165000, NA, 38000, 120000)

# TODO 4: Summe einmal ohne und einmal mit na.rm = TRUE berechnen.
summe_mit_luecke <- NA
summe_ohne_luecke <- NA

# TODO 5: Anzahl der fehlenden Werte mit is.na() und sum() bestimmen.
anzahl_fehlend <- NA

# Fachliche Notiz: Warum darf NA nicht ungeprüft durch 0 ersetzt werden?
# .............................................................................


# ---- 03 Faktor, Datum und Tibble ----

# TODO 6: Aus BE, F, GI, BE einen Faktor mit den vorgegebenen Stufen
# A, BE, F, GI, OQ erzeugen.
bereiche <- NULL

# TODO 7: Faktor und erlaubte Stufen ausgeben.

# TODO 8: Die vier Quartalsstichtage 2024 als Date-Vektor erzeugen.
stichtage <- NULL

# TODO 9: Quartale aus stichtage ableiten.
quartale <- NA

# TODO 10: Ein Tibble mit den vorgegebenen Bereichscodes und Werten erzeugen.
bws <- NULL

# TODO 11: class(), nrow(), ncol(), names() und die Spalte wert ausgeben.


# ---- 04 Kontrollen ----

# TODO 12: Prüfen, ob das Projekt korrekt geöffnet ist.
projekt_ok <- file.exists("data/lieferung_2024q4.csv")

# Diese Kontrollen erst ausführen, wenn alle TODOs bearbeitet sind.
stopifnot(
  quartalssumme == 323000,
  isTRUE(all.equal(mittelwert_gerundet, 107666.7)),
  jahreshochrechnung == 1292000,
  is.na(summe_mit_luecke),
  summe_ohne_luecke == 323000,
  anzahl_fehlend == 1,
  identical(quartale, c("Q1", "Q2", "Q3", "Q4")),
  nrow(bws) == 3,
  ncol(bws) == 2,
  projekt_ok
)

message("Übung 1 erfolgreich abgeschlossen.")
