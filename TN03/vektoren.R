# Vektoren

numbers <-c(1,3,4,5,6,443,9) #concatenate = zusammenführen

numbers # Vektor aus numerical

numbers <-c(1,3,4,5,6,443,"9") #automatische Typumwandlung = Coercion
# numbers ist jetzt ein Vektorus aus characters

logicals <- c(TRUE, FALSE, TRUE)
 
logicals2 <- c(TRUE, FALSE, 1) #Coercion greift wieder ein

seq_vec <- 1:1000 #Vector mit Einträgen von 1 bis 1000
seq_vec

rep_vec <- rep(10, 4) #Wiederhole 4 mal die 10
rep_vec

empty_vec <- numeric(70) # 70 mal die Null
empty_vec


# Benannte Vektoren 
# Schlüssel-Wert Paare

einkommen <-  c("Anna" = 45000, "Bert" = 60000, "Clara" = 80000)
einkommen["Clara"] # Zugriff auf Schlüssel-Wert Paar
einkommen[["Clara"]]

numbers <-  1:9
numbers <-  numbers * 10 + 120
numbers

length(numbers) # Anzahl der Elemente = Länge der Vektoren
# Zugriffe

numbers[2] # Zugriff auf das zweite Element
numbers[c(1,5)] # Zugriff auf das erste und fünfte Element


#negativer Zugriff (R-FEature)
numbers[-2] #  das zweite Element raus lassen
numbers[-1:-3] # die ersten drei werden raus gelassen
 
# Logisches Zugreifen (Filter)
mask <-  (numbers != 130) # != ungleich
mask

mask <-  (numbers > 199) # != ungleich
mask

numbers[mask] # alle Elemente, die die Maske erfüllen
numbers[!mask] # alle Elemente, die die Maske NICHT erfüllen

# Modifikation

numbers[3]<- 99 # das dritte Element modifizieren
numbers

# Neue Elemente hinzufügen = Länge + 1 modifizieren
# Element ans Ende anhängen
numbers[length(numbers)+1] <- 999
numbers

# Kombination
numbers_neu <- c(numbers, empty_vec) # Kombination aus zwei Vektoren
numbers_neu

# Vektorelle Operationen/Funkionen
v1 <- c(1,2,3)
v2 <- c(34, 43, 11)

v1 + v2 # Elementenweise Addition
v1 * v2 # Elementenweise Multiplikation

v1 %*% v2 # im Sinne der Matrizenmultiplikation

sum(v2) # Summe
mean(v2) # Durchschnitt
sort(v2) # Sortieren
