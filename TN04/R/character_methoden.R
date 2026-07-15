
# Character-Methoden


name <- "    Anna Meier "

# Anzahl der Zeichen
nchar(name)


# Leerzeichen am Anfang und Ende entfernen
name_trim <- trimws(name)


# Groß- und Kleinschreibung
gross <- toupper(name_trim)
klein <- tolower(name_trim)


# paste
umsatz <- paste("Umsatz", 2026, sep = "_")

vektor <- paste0("TN", 1:11)



cities <- c("Berlin", "Bonn", "München", "Bremen")

check <- "Bonn" %in% cities


Schnittmenge <- cities %in% c("Bonn", "Wiesbaden")


teil <- substr("Statistik", 1, 4)


namen <- c("     Anna", "BERT", "  Clara  ", "Dora    ")
clean <- trimws(tolower(namen))

mail <- paste0(clean, "@destatis.de")


# Ersetzen
sub("n", "N", "Bananen") # erstes N ersetzen
gsub("n", "N", "Bananen") # alle N ersetzen (g = global)





# Eingelesene Zahlen bearbeiten
geld <- c("1.200,5", "654,9")

# Punkt löschen: "." wäre der komplette Text
# Komma durch Punkt ersetzen
ohne_punkt <- gsub("\\.", "", geld) 
ohne_komma <- gsub(",", ".", ohne_punkt)

numeric <- as.numeric(ohne_komma)










