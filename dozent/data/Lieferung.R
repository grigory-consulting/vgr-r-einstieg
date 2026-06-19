library(tidyverse)
daten <- read_csv("data/lieferung_2024q4.csv")
head(daten, 2)

glimpse(daten)
#Zugriff auf eine Spalte
daten$jahr

# Filtern: filter()
#z.B. alle Zeilen aus Jahr 2024 und Q4
q4_2024 <- daten |>
  filter(jahr == 2024, quartal == 4)
q4_2024
  


#between() als Kurzform für ==> und <==
zeitraum <- daten |>
  filter(between(jahr, 2022, 2024))
zeitraum

# Alle Zeilen aus Q3 und Q4 und Wert zwischen 36000 und 145000
zeitraum <- daten |>
  filter(between(quartal,3, 4),between(wert,36000,145000)) 
  
# Alle Zeilen aus Q3 und Q4 und Wert zwischen 36000 und 145000
  # | -> logisches ODER
  
daten_neu <- daten |> filter(quartal==3 | quartal==4, between(wert,36000,145000))

#Neue Kennzahlen mit mutate() auszurechnen 
#Anteil jedes Bereichs an der Quartalsgesamtsumme
#Q12022 -> eine Gruppe
#Q22024 -> andere Gruppe

anteile <- daten |>
  group_by(jahr, quartal) |> # Gruppierung
    mutate(anteil = wert / sum(wert))  #Spalten hinzufügen 

gruppen <- daten |> group_by(jahr, quartal) |> mutate( info = list(cur_group()))

# Neue Spalte: Abweichung vom Quartalsmittel

anteile <- daten |> #Gruppierung 
  mutate(abweichung = wert - mean(wert)) |>
  ungroup()

#Zählen 
zeilen_pro_jahr <- daten |> count(jahr)
bereiche <- daten |> distinct(bereich_code) #einzelne eindeutige Bereiche
bereiche

# Aggregation mit group_by() und summarise
#Jahressummen
summen_pro_jahr <- daten |>
  group_by(jahr) |>
  summarise(jahr_summe = sum(wert), .groups = "drop") # .groups = "drop" ... Gruppierung
#Mittelwert pro Bereich
mittelwert_pro_Bereich <- daten |>
  summarise(mittelwert = mean(wert), .groups = "drop")

# arrange ... sortieren
# lag()... vorhergehenden Wert nehmen

daten |>
  group_by(bereich_code) |>
  arrange(jahr, quartal) |> #sortieren nach Jahr/Quartal aufsteigend
  mutate(jahr_vergleich = wert - lag(wert, n= 4)) |>
  ungroup() |>
  filter(!is.na(jahr_vergleich)) #keine Zeilen mit NA

#Gleitender Durchschnitt(3 Perioden)

daten |>
  group_by(bereich_code) |>
  arrange(jahr, quartal) |> #sortieren nach Jahr/Quartal aufsteigend
  mutate(gl_durchschnitt = (wert + lag(wert,1)+lag(wert,2))/3) |>
  ungroup() |>
  filter(!is.na(gl_durchschnitt)) #keine Zeilen mit NA

bws_anteil <- function(df){
  #browser() #Stopp hier
  total <- sum(df$wert)
  df$wert/total
}

bws_anteil(daten)

stopifnot("2017 fehlt" = 2017 %in% daten$jahr)

