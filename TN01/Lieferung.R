library(tidyverse)

daten <- read_csv("data/lieferung_2024q4.csv")

head(daten)  # zeigt die ersten sechs Beobachtungen, head(daten, 2) zeigt die ersten zwei Beobachtungen

glimpse(daten) # horizontale Übersicht der Daten
daten$jahr # so wird auf alle Spalten "Jahre" zu

# Filtern: filter()
# z.B. alle Zeilen aus Jahr 2024 und Q4

q4_2024 <- daten |> 
  filter(jahr == 2024, quartal == 4)
q4_2024

# between() als Kurzform für => und <=
zeitraum <- daten |>
  filter(between(jahr, 2022, 2024))
zeitraum

# Alle Zeilen aus Q3 und Q4 und Wert zwischen 36579 und 145411

daten_neu <- daten |> filter(quartal == 3 | quartal == 4, between(wert, 36579, 145411))

# Neue Kennzahlen mit mutate() ausrechnen
# neue Spalte hinzufügen
# Anteil jedes Bereichs an der Quartalsgesamtsumme
# Q12022 <-  eine Gruppe
# Q2024 <- andere Gruppe
anteile <- daten |>
  group_by(jahr, quartal) |> # Gruppierung
  mutate(anteil = wert / sum(wert)) |> #Spalten hinzufügen
  ungroup()

gruppen <- daten |> group_by(jahr, quartal) |> mutate( info = list(cur_group()))

# neue Spalte: Abweichung vom Quartalsmittel

anteile <- daten |>
  group_by(jahr, quartal) |>
  mutate(abweichung = wert - mean(wert) ) |>
  ungroup()

# Zählen
zeilen_pro_jahr <-  daten |> count(jahr)
bereiche <- daten |> distinct(bereich_code) # einzelne eindeutige Bereiche

# Aggregation mit group_by() und summarise
# Jahressummen
summe_pro_jahr <- daten |>
  group_by (jahr)|>
  summarise(jahr_summe = sum(wert), .groups = "drop") # .groups = "drop" ... Gruppierung
# Mittelwert pro Bereich
summe_pro_jahr <- daten |>
  group_by(bereich_code, bereich_name) |>
  summarise(mittelwert = mean(wert), .groups ="drop")


# arrange ... sortieren
# lag()... vorhergehende Werte

daten |> 
  group_by(bereich_code) |>
  arrange(jahr, quartal) |>
  mutate(jahr_vergleich) = wert - lag(wert, n=4) |>
  ungroup()|>
  filter(!is:na(jahr_vergleich)) # keine Zeilen mit N/A

# Berechnen Sie den gleitenden Durchschnitt (3 Perioden)
# Durchschnitt der letzen drei Quartale
daten |> 
  group_by(bereich_code) |>
  arrange(jahr, quartal) |>
  mutate(gl_durchschnitt) = (wert + lag(wert, 1) + lag(wert, 2))/3 |>
  ungroup()|>
  filter(!is:na(gl_durchschnitt))



