# Kontrollstrukturen

#if, else if, else

x <- 20

if(x<20){
 print("x ist kleiner 20") 
}else if(x<30){
  print("x ist kleiner als 30 aber größer gleich 20")
}else{
  print("")
}

# if else vektorisiert

vals <- c(5,15,25,30)
res <- ifelse(vals<20,"klein", "groß")
res

#Schleifen (for-Schleife)

#for-Schleife mit Index

for(i in 1:5){ # eine fünfmalige Wiederholung von { Ausdrücken } 
  print(i)
  print(i*i)
}


v <-c("Anna","Bert", "Clara")
 #for-Schleife oohne Index

for(name in v) { #nacheinander folgender Zugriff auf die Namen
  print(name)
  }

