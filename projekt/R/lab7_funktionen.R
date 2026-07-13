# Übung 7: Dokumentierte VGR-Funktion
# Teil VIII: Dokumentation, R-Glossar/-Bibliothek, Shiny-Backup-UI
#
# Aufgabe: Vervollständigen Sie die Funktion bws_zusammenfassung() an den
# mit # TODO markierten Stellen.
# Testen Sie aus dem Projektordner heraus:
#   cd labs/projekt && Rscript R/lab7_funktionen.R

suppressPackageStartupMessages({
  library(dplyr)
  library(readr)
})

#' TODO: kurzer Titel
#'
#' @param daten TODO: Struktur und benötigte Spalten beschreiben.
#' @param jahr TODO: erwarteten Wert beschreiben.
#'
#' @return TODO: Rückgabe beschreiben.
#'
#' @examples
#' daten <- readr::read_csv("data/lieferung_2024q4.csv", show_col_types = FALSE)
#' bws_zusammenfassung(daten, 2024)
bws_zusammenfassung <- function(daten, jahr) {

  # TODO 1: Eingaben mit stopifnot() validieren. Prüfen Sie mindestens:
  #   - daten ist ein data.frame
  #   - die nötigen Spalten sind vorhanden
  #   - jahr hat Länge 1 und kommt in daten$jahr vor
  # stopifnot(
  #   ...
  # )

  jahr <- as.numeric(jahr)

  # TODO 2: daten auf das gewählte Jahr filtern, je Bereich gruppieren und
  #   die Jahressumme (sum) sowie die Quartalsanzahl (n) bilden. Ergebnis
  #   absteigend nach jahressumme sortieren und zurückgeben.
  #
  # Gerüst (Lücken füllen):
  # daten |>
  #   dplyr::filter(...) |>
  #   dplyr::group_by(...) |>
  #   dplyr::summarise(
  #     jahr        = dplyr::first(.data$jahr),
  #     jahressumme = ...,
  #     n_quartale  = ...,
  #     .groups     = "drop"
  #   ) |>
  #   dplyr::arrange(...)

}

# --- Beispielaufruf (erst nach Vervollständigung lauffähig) -----------------
if (sys.nframe() == 0L) {
  daten <- readr::read_csv("data/lieferung_2024q4.csv", show_col_types = FALSE)
  print(bws_zusammenfassung(daten, 2024))
}
