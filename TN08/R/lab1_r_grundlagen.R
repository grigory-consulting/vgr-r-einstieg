?round
bereich_code <-  "BE"
ist_freigegeben <-  TRUE
stichtag  <-  as.Date("2024-12-31")
class <- "BE"

werte <-  c(165000, NA, 38000, 120000)
na.rm = TRUE
sum(werte, na.rm = TRUE)

sum(is.na(werte))
sum(werte=TRUE)
daten <- read_csv("data/Lieferung_2024q4.csv")

library(tidyverse)
install.packages("tidyverse")
library(tidyverse)
daten <-  read_csv("r/data/lieferung_2024q4.csv")
gefiltert <-  daten %>%
  Filter(between(wert, 36000, 145000), between(quartal,3,4))

head(daten)
filter(jahr == 2024)

spec(daten)
