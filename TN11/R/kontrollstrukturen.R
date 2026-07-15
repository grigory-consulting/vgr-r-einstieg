

# Kontrollstrukturen

# if, else, if, else

x <- 19

if (x < 20) {
  print("x ist kleiner 20");
} else if (x < 30) {
  print("x ist kleiner 30 aber größer gleich 20");
} else if (x < 40) {
  print("x ist kleiner 40 aber größer gleich 30");
} else {
  print("x ist größer gleich 40");
}


# if else vektorisiert 

vals <- c(5,25,15,30)
res <- ifelse(vals<20, "klein", "groß")
res


ist_freigegeben <- FALSE

if(ist_freigegeben){
  print("Bericht verfasst")
  # save ... /bericht_final/
}else{
  print("TODO")
  # save ... /bericht_todo/
}


# for-schleife

for (i in 1:5){ # eine fünmalige Wiederholung
  print(i)
  print(i*i)
}



v <- c("Anna", "Bert", "clara")

for (name in v){
  # for-Schleife ohne Index
  print(name) # nacheinander folgender Zugriff
              # auf die Namen
}


greet <- function(name){
  
  name <- toupper(name)

  return(paste("Hallo", name))
}

greet("Welt")
greet("Anna")
greet("Bert")
