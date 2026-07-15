

library(readxl)
library(openxlsx)

daten <-
  read_excel("data/lieferung_excel.xlsx",
             sheet = "Daten",
             skip = 3)


daten_flach <-
  daten |> 
  pivot_longer(cols = -c(bereich_name, bereich_code),
               values_to = "wert",
               names_to = c("jahr", "quartal"),
               names_sep = "Q"
  ) |> 
  select(jahr, quartal, wert, bereich_code, bereich_name
  ) |> 
  mutate(jahr = as.integer(jahr),
         quartal = as.integer(quartal)
  ) |> 
  arrange(jahr, quartal, bereich_code
  )


summe_bereich <-
  daten_flach |> 
  filter(jahr == 2024
  ) |> 
  group_by(bereich_code, bereich_name
  ) |> 
  summarise(summe_2024 = sum(wert, na.rm = TRUE)
  ) |> 
  arrange(desc(summe_2024)
  )
          
          
wb <- 
  createWorkbook()
          
addWorksheet(wb, "summe_2024")  
writeData(wb, "summe_2024", summe_bereich)

saveWorkbook(wb, "output/ergebnis_summe_2024.xlsx")
          
          
          
          