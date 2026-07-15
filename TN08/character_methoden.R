paste("Umsatz", 2026)
paste("Umsatz", 2026, sep = "_")
paste("q", 1:4)
cities <- c("Berlin", "Bonn", "München", "Bremen")
"Bonn" %in% cities
cities %in% c("Bonn", "Berlin", "Wiesbaden")
substr ("statistik", 1,4)

namen <- c(" Anna", "Bert", " clara ", "Dora ")
namen_bereinigt <- tolower(trimws(namen))


sub("n", "N", "Bananen")

geld <- C("1.200,50")
geld_ohne_punkt <- gsub("\\.","", geld)
