

remplace_vide_en_NA <- function(vec){
  vec[vec %in% c(""," ","  ","   ")] <- NA
  vec
}

colle_tout_sauf_V1_V2 <- function(x,...){
  ll <- list(...)
  ll[!names(ll) %in% c("V1","V2")] %>% unlist() %>% paste(collapse = " ")
  }


yales_colonnes_attendues <- function(x){
  a_trouver <-  c( "VARIABLE", "TYPE", "FORMAT", "LIBELLE")
  dedans <- x[1,] %>% unlist() %>% as.character()
  all(a_trouver %in% dedans)
}

from_pdf_to_df <- function(res){
  
 res%>% 
    as.data.frame() %>% 
    mutate(libelle = pmap(.,colle_tout_sauf_V1_V2)) %>% 
    select(V1:V2,libelle) %>% 
    mutate_all(remplace_vide_en_NA) %>% 
    fill(V1) %>% 
    filter(! (is.na(V2) & is.na(libelle))) %>% 
    mutate(
      lag_libelle = lag(libelle),
      lead_libelle = lead(libelle)
    ) %>%
    drop_na(V2)%>% 
    mutate(
      libelle = unlist(libelle),
      test = paste(lag_libelle,lead_libelle),
      libelle = case_when(
        is.na(libelle) ~ test,
        TRUE          ~ libelle
      )
    )   %>% 
    select(-lag_libelle,-lead_libelle,-test) %>% 
    set_names(c("format","code","libelle"))
  
  
}
tabulizer::extract_tables(file = "data-raw/notice-utilisateurs-donnees-inca3-data.gouv.pdf",pages = 19,encoding = "UTF-8")

pour_corr <- tabulizer::extract_tables(file = "data-raw/notice-utilisateurs-donnees-inca3-data.gouv.pdf",pages = 19:85,encoding = "UTF-8")
res <- tabulizer::extract_tables(file = "data-raw/notice-utilisateurs-donnees-inca3-data.gouv.pdf",pages = 86:117,encoding = "UTF-8")




a <- pour_corr %>% 
  map(as.data.frame) %>% 
  # map(~slice(.,1:3)) %>% 
  set_names(1:length(pour_corr))

a_virer <- a[a %>% map_lgl(negate(yales_colonnes_attendues))] %>% 
  names() %>% setdiff("76")

liaison_format <- a[!names(a) %in% a_virer] %>% bind_rows() %>%
  select(-V1,-V6) %>% filter(V2 != "VARIABLE") %>% 
  set_names(c( "VARIABLE", "TYPE", "FORMAT", "LIBELLE"))%>% 
  mutate_all(stringr::str_trim)


table_correspondance <- res %>% 
  map(from_pdf_to_df) %>% 
  bind_rows() 

table_correspondance <- table_correspondance %>% 
  mutate(format = case_when(
    format == 'e' ~ "format_freq_collation_ecole",
    format == 'n' ~ "format_freq_collation_matin",
    TRUE ~ format
  )) %>% mutate_all(stringr::str_trim)




usethis::use_data(liaison_format,overwrite = TRUE)
usethis::use_data(table_correspondance,overwrite = TRUE)

# il faut lire les colonne de correspondance, qui contient les correspondance




decode <- function(dataset,table_correspondance,liaison_format){
  for ( n in names(dataset)){
    print(n)
    
    col <- liaison_format %>% 
      filter(VARIABLE == n) %>% 
      pull(FORMAT)
    if ( length(col) > 0 && col %in% unique(table_correspondance$format) ){
      cc <- table_correspondance %>% filter(format == col )
      corresp <- cc$libelle %>% set_names(cc$code)
      dataset[[n]] <-   corresp[as.character(dataset[[n]])] %>% 
        set_names(NULL)
    }
  }
  dataset
}

library(tidyverse)

# read_csv2("data-raw/description-indiv.csv")$poids
# read_delim(delim = ";","data-raw/description-indiv.csv")$poids
# 


nn <- list.files(path = "data-raw/",pattern = "csv$",full.names = TRUE) 

tout <- nn %>% 
  map(
    ~ read_delim(.x, 
                 ";", escape_double = FALSE, locale = locale(), 
                 trim_ws = TRUE)
    
    
    
    
  ) %>% 
  set_names(
    
    basename(nn) %>% str_remove("[.]csv") %>% str_replace_all("-","_")
    
  )

# tout <- nn %>% 
#   map(read_csv2) %>% 
#   set_names(
#     
#     basename(nn) %>% str_remove("[.]csv") %>% str_replace_all("-","_")
#     
#   )

list2env(tout,envir = .GlobalEnv)

for ( i in names(tout)){
  print(i)
  eval(parse(text = glue::glue("try(usethis::use_data(`{i}`,overwrite=TRUE))") ))
}




# debugonce(decode)

occasions_decode <- decode(occasions,
                           table_correspondance = table_correspondance,
                           liaison_format = liaison_format)
# 
# conso_compo_alim_decode <- decode(conso_compo_alim,
#                            table_correspondance = table_correspondance,
#                            liaison_format = liaison_format)
# 




for ( k in c("actphys_sedent","apports_nut_alim", "conso_ca_indiv", "conso_ca_prod", "conso_compo_alim", 
  "conso_gpe_inca3", "description_indiv", "fpq", "habitudes_indiv", 
  "habitudes_men", "nomenclature", "occasions") ){
  message(k)
 eval(parse(text= glue::glue("{k}_decode <- decode({k},
                           table_correspondance = table_correspondance,
                           liaison_format = liaison_format)")
 ))
  
}






for ( k in c("actphys_sedent","apports_nut_alim", "conso_ca_indiv", "conso_ca_prod", "conso_compo_alim", 
             "conso_gpe_inca3", "description_indiv", "fpq", "habitudes_indiv", 
             "habitudes_men", "nomenclature", "occasions") ){
  message(k)
  eval(parse(text= glue::glue("usethis::use_data({k}_decode,overwrite=TRUE)")
  ))
}

# 
# decode(conso_gpe_inca3,table_correspondance = table_correspondance,
#        liaison_format = liaison_format)
# actphys_sedent_decode <- decode(actphys_sedent,table_correspondance = table_correspondance,
#        liaison_format = liaison_format)
