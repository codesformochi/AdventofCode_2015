# Library
library(digest)

#PART1
#given key
key <- "ckczppom"

#counter
count <- 1

#repeat loop
repeat {
  
#add to our counter
print(count)  
count <- count + 1

#add our counter to the end of the key
test_key <- paste(key, count, sep = "")

#get the hash of our key + counter
hash <- digest(test_key, algo = "md5", serialize = F)

#see if it matches "00000" 
  if (startsWith(hash, "00000") == T)
  { 
    print(paste("The answer is:", count, sep = " "))
    break 
    } #if close
  
} #repeat close


#PART2
#counter
count <- 1

#repeat loop
repeat {
  
  #add to our counter
  print(count)  
  count <- count + 1
  
  #add our counter to the end of the key
  test_key <- paste(key, count, sep = "")
  
  #get the hash of our key + counter
  hash <- digest(test_key, algo = "md5", serialize = F)
  
  #see if it matches "00000" 
  if (startsWith(hash, "000000") == T)
  { 
    print(paste("The answer is:", count, sep = " "))
    break 
  } #if close
  
} #repeat close
