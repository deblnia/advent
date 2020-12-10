library(tidyverse)

l <- read_lines("input.txt")

# part 1
search_function <- function(string,range){
  midpoint <- length(range)%/%2
  accessor <- str_sub(string,1,1) 
  new_range <- switch(
    accessor,
    "L" = ,
    "F" = range[1:midpoint],
    "R" = ,
    "B" = range[-(1:midpoint)])
  if(length(new_range) == 1) return(new_range)
  
  new_string <- str_remove(string,"^.")
  
  search_function(new_string,new_range)
}

search_function("FBFBBFF",0:127)

df_boardingpasses <- tibble(input = l) %>% 
  mutate(row_string = str_sub(input,1,7),
         seat_string = str_sub(input,-3,-1),
         row = map_dbl(row_string,search_function,0:127),
         seat = map_dbl(seat_string,search_function,0:7),
         seat_id = row * 8 + seat)


head(df_boardingpasses)
max(df_boardingpasses$seat_id)

# part 2
actual_seats <-  df_boardingpasses %>% 
  arrange(row,seat) %>% 
  filter(
    row != min(row),
    row != max(row)
  )
x <- seq.int(min(actual_seats$seat_id),max(actual_seats$seat_id))
x[!(x %in% actual_seats$seat_id)]
