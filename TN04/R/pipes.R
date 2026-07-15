
library(tidyverse)

daten <-
  read_csv("data/lieferung_2024q4.csv")

head(daten, 2) # erste zwei Zeilen anzeigen


glimpse(daten)


q4_2024 <-
  daten |> 
  filter(jahr == 2024 &
           quartal == 4
  )
  

zeitraum <-
  daten |> 
  filter(between(jahr, 2022, 2024))


gefiltert <-
  daten |> 
  filter(quartal %in% c(3, 4) &
            between(wert, 36000, 145000)
  )
          
 
# Anteil jedes Bereichs an der Quartalssumme
anteile <-
  daten |> 
  group_by(jahr,  quartal
  ) |> 
  mutate(anteil = wert / sum(wert)
  ) |> 
  ungroup(
  )


# Abweichung vom Quartalsmittel
abweichung <-
  daten |> 
  group_by(jahr, quartal
  ) |> 
  mutate (abweichung = wert - mean(wert)
  ) |> 
  ungroup(
  )



install.packages("readxl")
library(readxl)

daten <-
  read_excel("data/lieferung_excel.xlsx",
             sheet = "Daten",
             skip = 3)










         
    