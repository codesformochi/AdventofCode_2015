#libraries
library(dplyr)
library(tidyr)
library(stringr)


#Read in csv file
directions <- read.csv(file = "adventofcode2015_3.txt", header = FALSE)

#Write a function that takes directions as input and returns a df of coordinates
coord_tracking <- function(movements = c("^", "v", ">", "<")){
  
#Save the locations in a df
df_loc <- data.frame(location = "")
  
#Track x and y directions 
x <- 0
y <- 0

df_loc[1,] <- paste(x, y, sep = ", ")

#For each character in directions...
for(i in 1:length(movements)){
  
      #... based on the direction change x, y accordingly
      if(movements[i] == fixed("^")){
        x <- x+1
      }
      if(movements[i] == fixed("v")){
        x <- x-1 
      }
      if(movements[i] == fixed(">")){
        y <- y+1 
      }
      if(movements[i] == fixed("<")){
        y <- y-1 
      }
      
      #Save that location
      df_loc[i+1,] <- paste(x, y, sep = ", ")
  
  } #i close
  
#Return the df
return(df_loc)

} #function close


#PART1
#Since we're only interested in how many houses Santa visits, we only track his location. 
#Separate each character and save in a vector
v_directions <- unlist(str_split(directions, ""))

#Find the coordinates of his location
houses <- coord_tracking(v_directions)

#Find the number of unique coordinates/homes + 1 (Santa's starting location)
nrow(unique(houses))


#PART2
#We track Santa's and Robo-Santa's location. 
#Separate directions by every other starting with Santa
san_keep <- seq(from = 1, to = length(v_directions), by = 2)
robo_keep <- seq(from = 2, to = length(v_directions), by = 2)   

san_directions <- v_directions[san_keep]
robo_directions <- v_directions[robo_keep]

#Track Santa's and Robo-Santa's locations
san_houses <- coord_tracking(san_directions)
robo_houses <- coord_tracking(robo_directions)

#Identify the unique locations 
all_houses <- rbind(san_houses, robo_houses)

nrow(unique(all_houses))
