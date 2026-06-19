library(tidyverse)

daten <- read_csv("Data/lieferung_2024q4.csv")

head(daten) # zeigt den Tabellenkopf an

glimpse(daten) # auch eine Anzeigeoption

#Zugriff auf eine Spalte mit $
daten$jahr

# Filtern: filter()
# z.B.: alle Zeilen aus Jahr 2024 und Q4

q4_2024 <- daten |> 
  filter(jahr == 2024, quartal == 4)
q4_2024

# between() als kurzform für => und <=
zeitraum <- daten |>
  filter(between(jahr, 2022, 2024))
zeitraum

# Alle Zeilen aus Q3 und Q4 und Wert zwischen 36000 und 145000

zwischenwert <- daten |>
  filter(between(quartal, 3, 4), between(wert, 36000, 145000)
          )
 zwischenwert

# Neue Kennzahlen mit mutate() ausrechnen
# Ziel: neue spalte hinzufügen
# Anteil jedes Bereichs an der Quartalsgesamtsumme
# Q12022 -> eine Gruppe
# Q22024 -> andere Gruppe
 
 anteile <- daten |>
   group_by(jahr, quartal) |> # Gruppierung 
   mutate(anteil = wert/sum(wert)) |> #Spalten hinzugefügt und berechnet
   ungroup() # Gruppierung aufheben
 anteile
 
 # Abweichung vom Quartalsmittel
 
 abweichung <- daten |>
   group_by(jahr, quartal) |>
   mutate(abweichung = wert - mean(wert)) |>
   ungroup()
 abweichung
 
 # Zählen
 zeilen_pro_jahr <- daten |> count(jahr)
 bereiche <- daten |> distinct(bereiche_code) # einzelne eindeutige Bereiche
 
 #Aggregation mit group_by() und summarise
 # Jahressumme
 
 summe_pro_jahr <- daten |>
 group_by(jahr) |>
   summarise(jahr_summe = sum(wert), .groups = "drop" )
 summe_pro_jahr
 
 # Mittelwert pro Bereich
 mittelwert_bereich <- daten |>
   group_by(bereich_code) |>
   summarise(mittelwert = mean(wert), .groups = "drop" )
 mittelwert_bereich
 
 # arrange ... sortieren
 # lag() ... vorhergehenden WErt nehmen
 
 daten_neu <-  daten |> 
   group_by(bereich_code) |>
   arrange(jahr, quartal) |>  # sortieren nach Jahr/Quartal aufsteigend
   mutate(jahr_vergleich = wert - lag(wert, n=4)) |>
 ungroup()
 filter(!is.na(jahr_vergleich))
 
 daten_neu
 
 #Berechnen Sie gleitenden Durchschnitt (3 Perioden)
 
 daten_durchschnitt <-  daten |> 
   group_by(bereich_code) |>
   arrange(jahr, quartal) |>  # sortieren nach Jahr/Quartal aufsteigend
   mutate(gl_durchschnitt = (wert + lag(wert, 1) +lag(wert, 2))/3) |>
   ungroup() |>
 filter(!is.na(gl_durchschnitt))
 
 daten_durchschnitt