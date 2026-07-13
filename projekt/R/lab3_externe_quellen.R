# =============================================================================
# Übung 3: Externe Quellen und Excel-Schnittstellen (Startdatei)
# Einführung in R (VGR), it-schulungen.com
#
# Arbeiten Sie aus dem RStudio-Projekt labs/projekt/ heraus.
# Datenpfade sind relativ zum Projektordner (data/...).
# Füllen Sie die mit # TODO markierten Stellen aus.
# Vergleichswerte stehen im Übungsblatt.
# =============================================================================

suppressWarnings(suppressMessages({
  library(readxl)     # Excel lesen
  library(openxlsx)   # Excel schreiben
  library(pdftools)   # PDF-Text extrahieren
  library(stringr)    # Text in Spalten zerlegen
  library(readr)      # CSV lesen, parse_number
  library(tibble)     # tibble()
  library(dplyr)      # Datenaufbereitung
  library(tidyr)      # pivot_longer
  library(DBI)        # Datenbank-Schnittstelle
  library(RSQLite)    # SQLite-Treiber (EDO-Proxy)
}))

# Ausgabeordner anlegen (falls noch nicht vorhanden)
dir.create("output", showWarnings = FALSE)

# -----------------------------------------------------------------------------
# Aufgabe 1: Excel-Lieferung erkunden und korrekt einlesen
# -----------------------------------------------------------------------------
xl_pfad <- "data/lieferung_excel.xlsx"

# 1a) Listen Sie alle Blattnamen der Arbeitsmappe auf.
blaetter <- NULL  # TODO: excel_sheets(...)
cat("Blätter in der Arbeitsmappe:", paste(blaetter, collapse = ", "), "\n")

# 1b) Lesen Sie das Blatt "Metadaten". Es enthält nur freien Text in einer
#     Spalte. Tipp: col_names = FALSE, damit die erste Zeile nicht zur
#     Kopfzeile wird.
meta <- NULL  # TODO: read_excel(xl_pfad, sheet = "Metadaten", col_names = FALSE)
print(meta)

# 1c) Lesen Sie das Blatt "Daten". Achtung: zwei Titelzeilen und eine
#     Leerzeile; die Spaltenüberschriften stehen in Zeile 4, die Werte ab
#     Zeile 5.
#     Tipp: passendes skip = ... wählen.
wide <- NULL  # TODO: read_excel(xl_pfad, sheet = "Daten", skip = ...)
# cat("Wide-Tabelle:", nrow(wide), "Zeilen x", ncol(wide), "Spalten\n")

# -----------------------------------------------------------------------------
# Aufgabe 2: Wide -> Long aufbereiten
# Das Excel ist im Wide-Format (Bereiche x Zeitspalten 2018Q1..2024Q4).
# Ziel: jahr, quartal, bereich_code, bereich_name, wert.
# -----------------------------------------------------------------------------
# TODO: pivot_longer über alle Zeitspalten (alles außer bereich_code/_name),
#       names_to = "zeit", values_to = "wert". Danach aus "2018Q1" mit
#       str_sub() jahr (1..4) und quartal (Position 6) ableiten.
lang <- NULL
# print(head(lang, 3))

# -----------------------------------------------------------------------------
# Aufgabe 3: Auswertung berechnen und nach Excel zurückschreiben
# Beispiel: Summe je Bereich über alle Quartale 2024.
# -----------------------------------------------------------------------------
# TODO: aus lang filtern (jahr == 2024), nach bereich_code/_name gruppieren,
#       summe_2024 = sum(wert) berechnen, absteigend sortieren.
ergebnis <- NULL
# print(ergebnis)

# TODO: ergebnis als Excel-Datei nach output/ schreiben.

# -----------------------------------------------------------------------------
# Aufgabe 4: PDF-Tabelle einlesen
# pdf_text() liefert je Seite eine Zeichenkette. Datenzeilen beginnen mit
# einem Bereichscode (1-2 Großbuchstaben).
# -----------------------------------------------------------------------------
# TODO: seiten <- pdf_text("data/lieferung_pdf.pdf")
seiten <- NULL

# TODO: Text der ersten Seite an "\n" in Zeilen splitten.
zeilen <- NULL

# TODO: Datenzeilen mit str_subset() und Regex "^\\s*[A-Z]{1,2}\\s" filtern.
daten_zeilen <- NULL

# TODO: mit str_split(str_trim(...), "\\s{2,}", simplify = TRUE) in Felder
#       zerlegen und in einen tibble mit bereich_code, bereich_name, wert
#       überführen. Wert mit parse_number(..., locale = locale(
#       decimal_mark = ",", grouping_mark = ".")) parsen.
pdf_tab <- NULL
# print(pdf_tab)

# -----------------------------------------------------------------------------
# Aufgabe 5: Datenbank (EDO-Proxy) abfragen
# -----------------------------------------------------------------------------
# TODO: Verbindung öffnen.
con <- NULL

# 5a) TODO: Tabellen auflisten mit dbListTables(con).
tabellen <- NULL
# cat("Tabellen:", paste(tabellen, collapse = ", "), "\n")

# 5b) TODO: Aggregation per SQL: Summe je Bereich für 2024Q4
#     (WHERE jahr = 2024 AND quartal = 4, GROUP BY bereich_code).
db_agg <- NULL  # dbGetQuery(con, "SELECT ...")
# print(db_agg)

# 5c) TODO (optional): dasselbe per dplyr-Backend mit tbl(con, ...) und collect().

# 5d) TODO: ganze Tabelle lieferung_2024q4 nach R holen (für Aufgabe 6).
db_2024q4 <- NULL

# TODO: Verbindung schließen mit dbDisconnect(con).

# -----------------------------------------------------------------------------
# Aufgabe 6: Kurzvergleich DB-Tabelle vs. CSV
# Stimmt die DB-Tabelle lieferung_2024q4 mit data/lieferung_2024q4.csv überein?
# -----------------------------------------------------------------------------
# TODO: CSV lesen, beide Tabellen gleich sortieren und vergleichen.
csv_2024q4 <- NULL
gleich <- NULL

cat("\nÜbung 3 - bitte alle TODOs ausfüllen.\n")
