library(tidyverse)

l <- readLines("input.txt") #readLines 
    
head(l)

# part 1


# l %>% 
#     separate(V1, into = c("bounds", "letter", "pattern"), sep = " ") %>% 
#     separate(bounds, into = c("lower", "upper"), sep = "-") %>%
#     mutate(letter = gsub(":", "", letter), 
#     count = str_count(pattern, letter), 
#     good = if_else((count >= lower & count <= upper), 1, 0)) %>% 
#     count(good)

check <- function(x) {
  numbers <- as.numeric(str_extract_all(x, "[0-9]+")[[1]])
  string <- str_extract_all(x, "[a-z]+")[[1]]
  
  count <- str_count(string[2], string[1])
  (numbers[1] <= count) & (numbers[2] >= count) 
}
sum(map_lgl(l, check))


# part 2 

check_2 <- function(x) {
  numbers <- as.numeric(str_extract_all(x, "[0-9]+")[[1]])
  chars <- str_extract_all(x, "[a-z]+")[[1]]
  
  loc1 <- str_sub(chars[2], numbers[1], numbers[1])
  loc2 <- str_sub(chars[2], numbers[2], numbers[2])
     
  sum(loc1 == chars[1], loc2 == chars[1]) == 1
  
}
sum(map_lgl(l, check_2))




