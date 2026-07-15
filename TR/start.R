

x <- 10 
mein_var <- 5 
mein.var <- 8 
.versteckt <- 7

# Ausdrücke 

z <- x + mein.var 
z <- x + mein.var + 10 
z <- z + 1 # Inkrement (um 1 erhöhen)
z

# löschen von Objekten 

rm("mein.var")

# Konstanten (nur per Namenskonvention)

PI <- 3.14 

# Datentypen 

num <- 7 # numeric (double) ... Fließkommazahlen 
int_num <- 7L # Ganzzahl / Integer / Long 

name <- "DESTATIS"


class(name)

# oder

typeof(name)


# Vektoren 

numbers <- c(1,3,4,5,68,2,5,68,5,9)
numbers

# Vektor -> Container mit Objekten vom gleichen Typ

numbers <- c(1,3,4,5,68,2,5,68,5,"9") 
numbers # alles wird stillschweigend nach character umgewandelt

# Coercion 
# logical < numeric < character 

vec <- c(TRUE, FALSE, 3, "4")
vec

logicals <- c(TRUE, FALSE, FALSE, TRUE) # logische Vektoren 


seq_vec <- 1:100 # Vektor mit Einträgen von 1 bis 100
seq_vec
rep_vec <- rep(10, 4) # Wiederhole 4 mal die 10
rep_vec
empty_vec <- numeric(80) # 80 mal die Null
empty_vec

sum(seq_vec) # Vektorielle Berechnung 
mean(rep_vec)


# Schlüssel-Wert Paare 
einkommen <- c("Anna" = 45000, "Bert" = 60000, "Clara" = 80000)
einkommen

# Zugriffe
einkommen["Clara"] # Zugriff auf ein Schlüssel-Wert Paar 
einkommen[["Clara"]] # Zugriff auf Wert von Schlüssel "Clara"

# Ausdrücke 
numbers <- 1:9 
numbers <- numbers * 10 + 120
numbers 

length(numbers) # Anzahl der Elemente = "Länge" der Vektoren 














