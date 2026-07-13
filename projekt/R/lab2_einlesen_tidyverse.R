# Übung 2: Daten einlesen und mit dem tidyverse aufbereiten
# ----------------------------------------------------------------------
# Foliensatz: Teil II. Anleitung: Übungsblatt 2.
#
# Arbeitsverzeichnis: RStudio-Projekt labs/projekt/ (Datenzugriff als data/...).
# Füllen Sie die mit # TODO markierten Stellen aus.
# Sollwerte zum Prüfen stehen im Übungsblatt.
# ----------------------------------------------------------------------

library(tidyverse)

# Schritt 1: CSV einlesen, Spaltentypen explizit vorgeben ---------------
# TODO: lieferung mit read_csv() aus "data/lieferung_2024q4.csv" einlesen.
#       Typen mit col_types festlegen: jahr/quartal als col_integer(),
#       bereich_code/bereich_name als col_character(), wert als col_double().
lieferung <- NULL  # TODO ersetzen


# Schritt 2: Erster Blick mit glimpse() ---------------------------------
# TODO: glimpse(lieferung) aufrufen und Typen prüfen (jahr/quartal <int>, wert <dbl>).


# Schritt 3: Filtern mit filter(), %in% und between() -------------------
# TODO: q4_2024  = nur jahr == 2024 und quartal == 4
q4_2024 <- NULL  # TODO

# TODO: zeitraum = Jahre 2022 bis 2024 (between() verwenden)
zeitraum <- NULL  # TODO


# Schritt 4: Neue Kennzahlen mit mutate() und lag() --------------------
# TODO: anteile = Anteil jedes Bereichs am jeweiligen Quartalstotal
anteile <- NULL  # TODO

# TODO: veraenderung = Vorquartalswert und relative Veränderung je Bereich
veraenderung <- NULL  # TODO


# Schritt 5: Aggregieren mit group_by() und summarise() ----------------
# TODO: bws_je_jahr = BWS-Summe je Jahr (.groups = "drop" nicht vergessen)
bws_je_jahr <- NULL  # TODO

# TODO: mittel_je_bereich = Mittelwert je Wirtschaftsbereich
mittel_je_bereich <- NULL  # TODO


# Schritt 6: Sortieren und Top-Bereiche --------------------------------
# TODO: top_bereiche = drei größte Bereiche in 2024Q4
#       (filtern, je Bereich summieren, arrange(desc(wert)), slice_head(n = 3))
top_bereiche <- NULL  # TODO


# Schritt 7: Zählen mit count() und distinct() ------------------------
# TODO: zeilen_je_jahr = count(jahr)
zeilen_je_jahr <- NULL  # TODO

# TODO: bereiche = distinct(bereich_code, bereich_name)
bereiche <- NULL  # TODO


# Schritt 8: Format wechseln mit pivot_wider() -------------------------
# TODO: breit = Bereiche x Zeit. Zuerst zeit = paste0(jahr, "Q", quartal),
#       dann select(bereich_code, zeit, wert) und pivot_wider().
breit <- NULL  # TODO


# Schritt 9: Kennzahl ausgeben -----------------------------------------
# TODO: gesamt_bws_2024 = Summe wert für jahr == 2024 (mit pull() als Zahl)
gesamt_bws_2024 <- NULL  # TODO

# TODO: Kennzahl im deutschen Format ausgeben und mit dem Sollwert vergleichen.
