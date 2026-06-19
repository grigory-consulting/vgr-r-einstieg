

x <- 10
mein_var <- 5
mein.var <- 8
.versteckt <- 7


# Ausdrücke

z <- x + mein.var
z <- x + mein.var + 10
z <- z + 1 #Increment

# löschen

rm("mein.var")

# Konstanten (nur per Namenskonventionen)
PI <- 3.14

# Datentypen

num <- 7 # numerisch, double ... Fließkommazahl

int_num <- 7L # Ganzzahl/Integer

name <- "DESTATIS" # character

# logical
flag1 <- TRUE
flag2 <- FALSE

# Datentyp konvertieren

as.character(num) # 7 als Text
as.numeric("42") # einlesen von Text -> Zahl
as.logical(0) # 0 ist False'
as.logical(17) # alles andere ist TRUE




