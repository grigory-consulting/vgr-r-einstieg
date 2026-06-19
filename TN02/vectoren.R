

#Vektoren

numbers <- c(1,3,4,5,6,443,9) # concatenate = zusammenführen
numbers

numbers <- c(1,3,4,5,6,443,"9") # automatische Typumwandlung = Coercion
# numbers ist jetzt Vektor aus characters

logicals <- c(TRUE, FALSE, TRUE)

logicals2 <- c(TRUE, FALSE, 1) # Coercion greift wieder ein

seq_vec <- 1:1000 # Vektor mit Einträgen von 1 bis 1000
rep_vec <- rep(10, 4) # Wiederhole 4 mal die 10
rep_vec
empty_vec <- numeric(70) # 70 mal die 0
empty_vec


# Benannte Vektoren (named vectors)
# Schlüsselwert Paare
einkommen <- c("Anna" = 45000, "Bert" = 60000, "Clara" = 80000)
einkommen
einkommen["Clara"] # Zugriff auf den Schlüssel
einkommen[["Clara"]] # Zugriff auf Wert vom Schlüssel Clara

numbers <- 1:9
numbers <- numbers*10+120
numbers

length(numbers) # Anzahl der Elemente = Länge der Vektoren

# Zugriffe

numbers[2] # Zugriff auf das zweite Element
numbers[c(1,5)] # Zugriff auf das erste und fünfte Element

# Negativer Zugriff (R-feature)
numbers[-2] # das zweite Element rauslassen
numbers[-1:-3] # die ersten drei Elemente werden rausgelassen


# Logisches Zugreifen (Filter)
mask <- (numbers != 130) # != ungleich 
mask

numbers[mask] # alle Elemente, die die Maske erfüllen
numbers[!mask] # alle Elemente, die die Maske NICHT erfüllen


# neue Elemente hinzufügen = Länge + 1 modifizieren

numbers[length(numbers) +1] <- 999
numbers

# Komnination
numbers_neu <- c(numbers, empty_vec) # Kombination auf 2 Vektoren
numbers_neu

# Vektorielle Operationen/Funktionen

v1 <- c(1,2,3)
v2 <- c(34,43,11)

v1+v2 # elementenweise Addition
v1*v2 # elementenweise Multiplikation

sum(v2) # Summe
mean(v2) # Durchschnitt
sort(v2) # Sortieren

v1 %*% v2 # im Sinne der Matritzenmultiplikation

