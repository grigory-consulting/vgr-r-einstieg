

# Vektoren

numbers <- c(1,3,4,5,6,443,9) # concatenate = zusammenführen 
numbers # Vektor aus numerical

numbers <- c(1,3,4,5,6,443,"9") # automatische Typumwandlung = Coercion 
# numbers ist jetzt Vektor aus characters


logicals <- c(TRUE, FALSE, TRUE) 
logicals2 <- c(TRUE, FALSE, 1) # Coercion greift wieder ein

seq_vec <- 1:1000 # Vektor mit Einträgen von 1 bis 1000
rep_vec <- rep(10, 4) # Wiederhole 4 mal die 10 
rep_vec
empty_vec <- numeric(70) # 70 mal die Null 
empty_vec


# Benannte Vektoren (named vectors) 
# Schlüssel-Wert Paare 
einkommen <- c("Anna" = 45000, "Bert" = 60000, "Clara" = 80000 )
einkommen["Clara "] #Zugriff auf ein Schlüssel-Wert Paar
numbers <-  1:9
numbers <-numbers *10
 length(numbers) # Anzahl der Elemente = Länge der Vektoren

 
 # Zugriffe
 
 # Logisches Zugreifen (Filter)
 
 
 
v1 <- c(1,2,3)
v2 <- c(34,43,11) 

v1+v2 # elementenweise Addition










