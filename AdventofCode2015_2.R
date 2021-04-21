#libraries
library(dplyr)
library(tidyr)

#Read in csv file
presents <- read.csv("adventofcode2015_2.txt", header = FALSE)


#Create a function to find the minimum of n cols
min_x_cols <- function(data, col_names){
  
  #First find the min of the cols...
  mins_value <- apply(data[col_names], MARGIN = 1, FUN = min)
  
  #...and then attach as a new col
  new_df <- cbind(data, mins_value)
  
  #Return the new dataframe
  return(new_df)

  } #function close


#PART 1 
#Split by x and save each piece into new cols, keep the original string, and 
#convert the pieces into integers
split_presents <- presents %>% 
                      separate(col = V1, 
                               into = c("length", "width", "height"), 
                               sep = "x",
                               remove = FALSE,
                               convert = TRUE) 

#Calculate SA = 2*l*w + 2*w*h + 2*h*l, and the product of each side
SA_presents <- split_presents %>%
                      mutate(SA = 2*(length*width + width*height + height*length),
                             prod_lw = length*width,
                             prod_wh = width*height,
                             prod_lh = length*height)

#Find A{smallest side}:
A_min_presents <- min_x_cols(data = SA_presents, col_names = c("prod_lw", "prod_wh", "prod_lh"))

#Calculate the overall total wrapping paper = SA + A_min
total_wp <- sum(A_min_presents$SA + A_min_presents$mins_value)
total_wp


#PART2
#For part 2, we don't need any of the previous calculations. So we can start from
#split_presents object. 

#Calculate the bow volume and the perimeter of each side. 
vol_peri_presents <- split_presents %>% 
                        mutate(bow_vol = length*width*height,
                               peri_1 = 2*(length+width),
                               peri_2 = 2*(length+height),
                               peri_3 = 2*(width+height))

#Find the perimeter{smallest side}:
peri_min_presents <- min_x_cols(data = vol_peri_presents, col_names = c("peri_1", "peri_2", "peri_3"))

#Calculate the overall total ribbon = bow_vol + peri_min
total_ribb <- sum(peri_min_presents$bow_vol + peri_min_presents$mins_value)
total_ribb
