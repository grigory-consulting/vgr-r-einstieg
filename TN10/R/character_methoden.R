# character-Methoden (Strings)

# Überblick Funktionen

name <- "  Anna Meier "

class(name)

nchar(name) # Anzahl der Zeichen (inkl. Leerzeichen)
name_trim <- trimws(name) # Löschung der führenden Leerzeichen
name_trim

toupper(name) # alles groß
tolower(name) # alles klein

# Gleichheitsprüfung

"Anna" == "anna"# Ungleich
tolower ("Anna") == tolower("anna") # normalisieren


# paste ... zusamenfügen, Trenner ... Leerzeichen
paste("Umsatz", 2026) # "Umsatz 2026"
paste("Umsatz", 2026, sep = "_")
paste0("TN", 1:11)
paste("Q", 1:4)

cities <- c("Berlin", "Bonn", "München", "Bremen")

"Bonn" %in% cities

substr("statistik", 1,4)

namen <- c("   Anna", "BERT", "clara", "Dora")
namen_trim <- trimws(namen)
tolower(namen)

paste0(namen,"@destatis.de")










