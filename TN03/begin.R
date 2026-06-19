## Wie kann man Variablen benennen? ----

x <- 10
mein_var <- 5
mein.var <-  8
.versteckt <- 7

# Ausdrücke

z <- x + mein.var

PI <-  3.14

num <-  7 # numerisch, double ... Fließkommazahl

int_num <- 7L # Ganzzahl/Integer

name <-  "DESTATIS" # character

# logical
flag1 <- TRUE
flag2 <- FALSE

# Datentyp konvertieren 
print(as.character(num)) # 7 als Text
print(as.numeric("42")) # Einlesen von Text -> Zahl
print(as.logical((0))) # 0 ist FALSE
print(as.logical(-12)) # alles andere ist TRUE

