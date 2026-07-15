
IST_FREIGEGEBEN <- TRUE

# Kontrollstrukturen 

# if, else if, else 

x <- 39

if (x < 20){
  print("x ist kleiner 20")
}else if (x < 30){
  print("x ist kleiner 30 aber größer gleich 20")
}else if (x < 40){
  print("x ist kleiner 40 aber größer gleich 30")
}else{
  print("x is größer gleich 40")
}


# if else vektorisiert 

vals <- c(5,25,15,30)
res <- ifelse(vals<20, "klein", "groß")
res




if(IST_FREIGEGEBEN){
  print("Bericht verfasst")
  # save ... /bericht_final/ 
}else{
  print("TODO")
  # save ... /bericht_todo/ 
}



if(IST_FREIGEGEBEN){
  print("Bericht verfasst")
  # save ... /bericht_final/ 
}else{
  print("TODO")
  # save ... /bericht_todo/ 
}


if(IST_FREIGEGEBEN){
  print("Bericht verfasst")
  # save ... /bericht_final/ 
}else{
  print("TODO")
  # save ... /bericht_todo/ 
}


# for-Schleife 


for (i in 1:5){ # eine fünfmalige Wiederholung 
  print(i)
  print(i*i)
}


v <- c("Anna", "Bert", "Clara")

for (name in v){
  # for-Schleife ohne Index
  print(name) # nacheinander folgender Zugriff
              # auf die Namen
}


greet <- function(name){
  
  name <- toupper(nae)
  
  return(paste("Hallo", name))
}


greet("Welt")
greet("Anna")
greet("Bert")

