

x <- 10
mein_var <- 5
mein.var <- 8

.versteckt <- 7


# Ausdrücke 

z <- x + mein.var
z <- x + mein.var + 10
z <- z + 1 # Increment

# löschen von Objekten

rm("mein.var")

# Konstanten (nur per Namenskonventionen)

PI <- 3.14

# Datentypen

num <- 7 # numerisch, double .... Fließkommazahl

int_num <- 7L #Ganzzahl/Integer

name <- "DESTATIS"

typeof(int_num)
typeof(num)


# logical 

flag1 <- TRUE
flag2 <- FALSE


# Datentyp konvertieren

print(flag1)


print(as.character(num)) #7 als Text
print(as.numeric("42")) # Einlesen von Text -> Zahl 


print(as.logical(0))  # 0 ist FALSE
print(as.logical(-12)) # alles andere ist TRUE



