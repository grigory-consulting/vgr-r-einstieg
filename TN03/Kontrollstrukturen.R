# Kontrollstrukturen

# if, else if, else

x <- 21

if (x<=20){
  print("x ist kleiner 20")
}else if (x < 30){
  print("x ist kleiner als 30 aber größer gleich 20")
}else{
  
  
  print("x ist größer gleich 30")
}


# ifelse vektorisiert

vals <- c(5, 15, 25, 30)
res <- ifelse(vals < 20, "klein", "groß")
res

# Schleifen (for-Schleife)


# for-Schleife mit Index
for (i in 1:5){
  print(i) # fünfmalige Wiederholung der Ausdrücke in den geschweiften Klammern
  print(i*i)
}


v <- c("Anna", "Bert", "Clara") # forSchleife ohne Index
for (name in v){ # nacheinander Zugriff auf die Namen
  print(name)
}