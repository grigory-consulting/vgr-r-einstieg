# Erzeugt die synthetischen VGR-Demodaten fuer alle Labs.
# Ausfuehren aus dem Projektordner:  Rscript data/_generate_data.R
#
# KANONISCHES SCHEMA (alle Labs/Slides nutzen genau diese Spalten):
#   bws_lang  (tidy/long): jahr<int>, quartal<int 1..4>, bereich_code<chr>,
#                          bereich_name<chr>, wert<num, Mio. EUR, jeweilige Preise>
#   Wirtschaftsbereiche (10, VGR-Aggregation, NACE-aehnlich):
#     A   Land- und Forstwirtschaft, Fischerei
#     BE  Produzierendes Gewerbe ohne Baugewerbe
#     F   Baugewerbe
#     GI  Handel, Verkehr, Gastgewerbe
#     J   Information und Kommunikation
#     K   Finanz- und Versicherungsdienstleister
#     L   Grundstuecks- und Wohnungswesen
#     MN  Unternehmensdienstleister
#     OQ  Oeffentliche Dienstleister, Erziehung, Gesundheit
#     RU  Sonstige Dienstleister
#
# Dateien (alle synthetisch, klar als Demodaten gekennzeichnet):
#   lieferung_2024q4.csv  - Vintage 1 (Datenstand 2024Q4), 2018Q1..2024Q4
#   lieferung_2025q1.csv  - Vintage 2 (Datenstand 2025Q1): 2023/2024 revidiert + 2025Q1 neu
#   lieferung_excel.xlsx  - dieselben Daten als Excel, Blatt "Metadaten" + "Daten" mit Titelzeilen
#   klassifikation_korrespondenz.csv - alte -> neue Gliederung (GI wird in G/H/I gesplittet)
#   lieferung_pdf.pdf     - kleine Tabelle als PDF (fuer pdftools)
#   edo_demo.sqlite       - SQLite-DB (EDO-Proxy) mit Tabellen lieferung_2024q4 / lieferung_2025q1

set.seed(2024)
suppressWarnings(suppressMessages({
  library(dplyr); library(tidyr); library(readr)
}))

bereiche <- tribble(
  ~bereich_code, ~bereich_name,                                          ~basis,
  "A",  "Land- und Forstwirtschaft, Fischerei",                          6500,
  "BE", "Produzierendes Gewerbe ohne Baugewerbe",                        165000,
  "F",  "Baugewerbe",                                                    35000,
  "GI", "Handel, Verkehr, Gastgewerbe",                                  120000,
  "J",  "Information und Kommunikation",                                 38000,
  "K",  "Finanz- und Versicherungsdienstleister",                       28000,
  "L",  "Grundstuecks- und Wohnungswesen",                              78000,
  "MN", "Unternehmensdienstleister",                                     95000,
  "OQ", "Oeffentliche Dienstleister, Erziehung, Gesundheit",            115000,
  "RU", "Sonstige Dienstleister",                                        26000
)

jahre <- 2018:2024
quartale <- 1:4
# saisonfaktoren je Quartal (leicht), Trend + Rauschen
saison <- c(`1` = 0.96, `2` = 1.01, `3` = 1.00, `4` = 1.03)

bws_lang <- tidyr::crossing(jahr = jahre, quartal = quartale, bereiche) |>
  mutate(
    trend = (1 + 0.012) ^ ((jahr - 2018) * 4 + (quartal - 1)),
    wert  = round(basis * trend * saison[as.character(quartal)] *
                    rnorm(n(), 1, 0.012), 1)
  ) |>
  select(jahr, quartal, bereich_code, bereich_name, wert) |>
  arrange(jahr, quartal, bereich_code)

write_csv(bws_lang, "data/lieferung_2024q4.csv")

# Vintage 2: 2023/2024 leicht revidiert, ein neues Quartal 2025Q1 ergaenzt
revidiert <- bws_lang |>
  mutate(wert = if_else(jahr %in% c(2023, 2024),
                        round(wert * rnorm(n(), 1.004, 0.006), 1), wert))
neu_2025q1 <- bws_lang |>
  filter(jahr == 2024, quartal == 4) |>
  mutate(jahr = 2025, quartal = 1,
         wert = round(wert * rnorm(n(), 1.008, 0.008), 1))
vintage2 <- bind_rows(revidiert, neu_2025q1) |> arrange(jahr, quartal, bereich_code)
write_csv(vintage2, "data/lieferung_2025q1.csv")

# Klassifikations-Korrespondenz: GI -> G (Handel) / H (Verkehr) / I (Gastgewerbe)
korresp <- tribble(
  ~alt_code, ~neu_code, ~neu_name,                ~anteil,
  "GI",      "G",       "Handel",                 0.52,
  "GI",      "H",       "Verkehr und Lagerei",    0.36,
  "GI",      "I",       "Gastgewerbe",            0.12,
  "A",  "A",  "Land- und Forstwirtschaft, Fischerei",               1,
  "BE", "BE", "Produzierendes Gewerbe ohne Baugewerbe",             1,
  "F",  "F",  "Baugewerbe",                                         1,
  "J",  "J",  "Information und Kommunikation",                      1,
  "K",  "K",  "Finanz- und Versicherungsdienstleister",            1,
  "L",  "L",  "Grundstuecks- und Wohnungswesen",                   1,
  "MN", "MN", "Unternehmensdienstleister",                         1,
  "OQ", "OQ", "Oeffentliche Dienstleister, Erziehung, Gesundheit", 1,
  "RU", "RU", "Sonstige Dienstleister",                            1
)
write_csv(korresp, "data/klassifikation_korrespondenz.csv")

# Excel-Lieferung: realistische "Behoerden-Formatierung" mit Titelzeilen ueber den Daten
if (requireNamespace("openxlsx", quietly = TRUE)) {
  library(openxlsx)
  wb <- createWorkbook()
  addWorksheet(wb, "Metadaten")
  writeData(wb, "Metadaten", c(
    "Demodatensatz VGR-Schulung (synthetisch)",
    "Bruttowertschoepfung in jeweiligen Preisen, Mio. EUR",
    "Datenstand: 2024Q4",
    "ACHTUNG: frei erfundene Uebungsdaten, kein realer Statistikbezug"
  ))
  addWorksheet(wb, "Daten")
  writeData(wb, "Daten", "Bruttowertschoepfung nach Wirtschaftsbereichen (Mio. EUR)",
            startRow = 1, startCol = 1)
  writeData(wb, "Daten", "Datenstand 2024Q4 - synthetisch", startRow = 2, startCol = 1)
  # Wide-Format wie in Excel ueblich: Bereiche x Zeit, Daten ab Zeile 4
  wide <- bws_lang |>
    mutate(zeit = paste0(jahr, "Q", quartal)) |>
    select(bereich_code, bereich_name, zeit, wert) |>
    pivot_wider(names_from = zeit, values_from = wert)
  writeData(wb, "Daten", wide, startRow = 4, startCol = 1)
  saveWorkbook(wb, "data/lieferung_excel.xlsx", overwrite = TRUE)
}

# PDF-Tabelle (eine Seite) ohne Zusatzpakete: base pdf() + grid
local({
  tab <- bws_lang |>
    filter(jahr == 2024, quartal == 4) |>
    transmute(Bereich = bereich_code, Bezeichnung = bereich_name,
              `Wert (Mio. EUR)` = format(wert, big.mark = ".", decimal.mark = ","))
  grDevices::pdf("data/lieferung_pdf.pdf", width = 8.3, height = 5.8)
  grid::grid.newpage()
  grid::grid.text("VGR-Demodaten (synthetisch) - Bruttowertschoepfung 2024Q4, Mio. EUR",
                  y = 0.95, gp = grid::gpar(fontsize = 11, fontface = "bold"))
  y0 <- 0.86; dy <- 0.075
  grid::grid.text(paste(c("Bereich", "Bezeichnung", "Wert (Mio. EUR)"), collapse = "    "),
                  x = 0.05, y = y0, just = "left", gp = grid::gpar(fontface = "bold", fontsize = 9))
  for (i in seq_len(nrow(tab))) {
    grid::grid.text(tab$Bereich[i],     x = 0.05, y = y0 - i*dy, just = "left", gp = grid::gpar(fontsize = 9))
    grid::grid.text(tab$Bezeichnung[i], x = 0.16, y = y0 - i*dy, just = "left", gp = grid::gpar(fontsize = 9))
    grid::grid.text(tab$`Wert (Mio. EUR)`[i], x = 0.95, y = y0 - i*dy, just = "right", gp = grid::gpar(fontsize = 9))
  }
  grDevices::dev.off()
})

# SQLite-DB als EDO-Proxy (nur falls RSQLite vorhanden)
if (requireNamespace("DBI", quietly = TRUE) && requireNamespace("RSQLite", quietly = TRUE)) {
  con <- DBI::dbConnect(RSQLite::SQLite(), "data/edo_demo.sqlite")
  DBI::dbWriteTable(con, "lieferung_2024q4", bws_lang, overwrite = TRUE)
  DBI::dbWriteTable(con, "lieferung_2025q1", vintage2, overwrite = TRUE)
  DBI::dbDisconnect(con)
  message("SQLite-DB geschrieben: data/edo_demo.sqlite")
} else {
  message("RSQLite fehlt - edo_demo.sqlite uebersprungen (in install_packages.R enthalten).")
}

message("Fertig. Zeilen bws_lang: ", nrow(bws_lang), " | Vintage2: ", nrow(vintage2))
