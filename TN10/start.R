

x <- 10
mein.var <- 5
.versteckt <- 7


# Ausdrücke

z <- x + mein.var
z <- x + mein.var + 10
z <- z + 1 # Inkrement ( um 1 erhöhen)
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
typeof(name)

# Vektoren

numbers <- c(1, 3, 4, 5, 68, 5, 9)
numbers

# Vektor (Container mit Objekten vom gleiche Typ)

numbers <- c(1, 3, 4, 5, 68, 5, "9")
numbers # (alles wird stillschweigend nach character umgewandelt)

# Coercion
# logical < numeric < character

sec_vec <- c(TRUE, FALSE, 3, "4")
sec_vec

seq_vec <- 1:100 # Vektor mit Einträgen vo 1 bis 100
seq_vec
rep_vec <- rep(10, 4) # wiederhole 4 mal die 10
rep_vec
empty_vec <- numeric(80) # 80 mal die Null
empty_vec

sum(seq_vec) # Vekorielle Berechnung
mean(rep_vec)

# Schlüssel-Wert Paare

einkommen <- c("Anna" = 40000, "Bert" = 60000, "Clara" = 870000)
einkommen




