#libraries
library(stringr)

#read in rtf
floors <- striprtf::read_rtf("adventofcode2015_1.rtf") 

#PART1
#count all occurences of '(' and all occurrences of ')'
start_parentheses <- str_count(floors, fixed("("))
end_parentheses <- str_count(floors, fixed(")"))

#Find the final floor
total_floors <- start_parentheses - end_parentheses


#PART2
current_floor <- 0

#Separate each character and save in a vector
v_floors <- unlist(str_split(floors, ""))

#For each character in floors...
for(i in 1:length(v_floors)){

  #If '(' then add 1, else -1. 
  ifelse(v_floors[i] == fixed("("), current_floor <- current_floor+1, current_floor <- current_floor-1)
  
  #Print location, if current_floor < 0 then stop!    
  ifelse(current_floor < 0, return(i), print(current_floor)) 
  
} #for close

#get position
i
