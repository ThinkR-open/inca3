## code to prepare `DATASET` dataset goes here

usethis::use_data("DATASET")

library(tidyverse)

nn <- list.files(path = "data-raw/",pattern = "csv$",full.names = TRUE) 

tout <- nn %>% 
  map(read_csv2) %>% 
  set_names(
    
    basename(nn) %>% str_remove("[.]csv") %>% str_replace_all("-","_")
    
  )
list2env(tout,envir = .GlobalEnv)

for ( i in names(tout)){
  print(i)
  eval(parse(text = glue::glue("try(usethis::use_data(`{i}`,overwrite=FALSE))") ))
}

