# install.packages("tidyverse")

library(tidyverse)

daten <- read_csv("data/lieferung_2024q4.csv")

head(daten) # die ersten 6 Zeilen 
head(daten, 2) # die ersten 2

glimpse(daten)

#View(daten)


# Zugriff auf eine einzelne Spalte 

daten$jahr # ist kein Tibble mehr, sondern Vektor 


q4_2024 <- daten %>% 
  filter(jahr == 2024, quartal == 4 )

q4_2024

zeitraum <- daten %>% 
  filter(between(jahr, 2022, 2024))
zeitraum

# Alle Zeilen aus (Q3 oder Q4) und Wert zwischen 36000 und 145000

gefiltert <- daten %>%
  filter(between(wert,36000, 145000), between(quartal,3,4))


gefiltert <- daten %>%
  filter(between(wert,36000, 145000), quartal %in% c(3,4))


# mutate()
# Ziel: eine Spalte hinzufügen 
# Anteil jedes Bereichs an der Quartalgesamtsumme 
# z.B. Q12022 -> eine Gruppe / Q22024 -> andere Gruppe 

anteile <- daten %>%
  group_by(jahr,quartal) %>% # Gruppierung 
  mutate(anteil = wert/sum(wert)) %>% # Summe auf die Gruppe anwenden, 
  ungroup()                                    # Spalte hinzufügen 

anteile

# Neue Spalte: Abweichung vom Quartalsmittel 
abweichung <- daten %>%
  group_by(jahr,quartal) %>%
  mutate( mittel = mean(wert), abweichung = wert - mittel) %>% 
  ungroup()



