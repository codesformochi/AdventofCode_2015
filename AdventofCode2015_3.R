#libraries
library(dplyr)
library(tidyr)
library(stringr)


#Read in csv file
directions <- read.csv(file = "adventofcode2015_3.txt", header = FALSE)

#PART1
#Since we're only interested in how many houses Santa visits, we only track his location. 
houses <- data.frame(location = "")

#Separate each character and save in a vector
v_directions <- unlist(str_split(directions, ""))

#Track x and y directions 
x <- 0
y <- 0

#For each character in directions...
for(i in 1:length(v_directions)){
    
  #... based on the direction change x, y accordingly
  if(v_directions[i] == fixed("^")){
    x <- x+1
  }
  if(v_directions[i] == fixed("v")){
     x <- x-1 
  }
  if(v_directions[i] == fixed(">")){
     y <- y+1 
  }
  if(v_directions[i] == fixed("<")){
     y <- y-1 
  }

  #Save that location
  houses[i,] <- paste(x, y, sep = ", ")
 
} #i close

#Find the number of unique locations/homes + 1 (Santa's starting location)
nrow(unique(houses)) + 1
