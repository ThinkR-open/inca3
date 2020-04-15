habitudes_indiv_decode
habitudes_men_decode

list(individus=habitudes_indiv_decode,menages = habitudes_men_decode) %>% 
  writexl::write_xlsx(path = "inst/fichiers_dataset/habitudes.xlsx")



ind_to_keep <- conso_ca_indiv_decode %>% distinct(NOIND) %>% 
  sample_n(100) %>% pull(NOIND)
conso_ca_indiv_decode %>% filter(NOIND %in% ind_to_keep) %T>% 
  writexl::write_xlsx(path = "inst/fichiers_dataset/conso_ca_indiv.xlsx") %>% 
  readr::write_csv2("inst/fichiers_dataset/conso_ca_indiv.csv") 


conso_ca_prod_decode %>% filter(NOIND %in% ind_to_keep) %T>% 
  writexl::write_xlsx(path = "inst/fichiers_dataset/conso_ca_prod.xlsx") %>% 
  readr::write_csv("inst/fichiers_dataset/conso_ca_prod.csv") 
  

habitudes_indiv_decode %>% 
    readr::write_csv2("inst/fichiers_dataset/habitudes_indiv.csv") 

fpq_decode %>% readr::write_tsv(path = "inst/fichiers_dataset/fpq.txt")

nomenclature_decode %>% write_delim(delim = ";",path = "inst/fichiers_dataset/nomenclature.csv")

# read_csv2("inst/fichiers_dataset//nomenclature.csv")


conso_compo_alim_decode %>% 
  slice(1:100) %>% 
  select(POPULATION,NOIND,occ_type,occ_lieu,aliment_libelle_INCA3,aliment_code_INCA3,qte_conso)%>% 
  # write_delim(delim = ";",
              write_csv2(
              
              path = "inst/fichiers_dataset/conso_compo_alim_lite.csv")
# + manuellement, rajout d 'une ligne 

read_csv2(file = "inst/fichiers_dataset/conso_compo_alim_lite.csv")
read_csv(file = "inst/fichiers_dataset/conso_compo_alim_lite - Copie.csv")
