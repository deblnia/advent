library(tidyverse)

l <- read.delim("input.txt", header = F, sep = '\n')

nrow(l)    
head(l)

# why doesn't this work ? 
l %>% 
    separate(V1, into = c("bounds", "letter", "pattern"), sep = " ") %>% 
    separate(bounds, into = c("lower", "upper"), sep = "-") %>%
    mutate(letter = gsub(":", "", letter), 
    count = str_count(pattern, letter), 
    good = if_else((count >= lower & count <= upper), 1, 0)) %>% 
    count(good)




