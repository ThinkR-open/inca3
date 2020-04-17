
<!-- README.md is generated from README.Rmd. Please edit that file -->

# inca3 <img src="man/figures/logo.png" align="right" alt="" width="120" />

<!-- badges: start -->

[![R build
status](https://github.com/ThinkR-open/inca3/workflows/R-CMD-check/badge.svg)](https://github.com/ThinkR-open/inca3/actions)
<!-- badges: end -->

Le package {inca3} est un package qui contient les jeux de données issus
de l’étude
[inca3](https://www.anses.fr/fr/content/etude-inca-3-pr%C3%A9sentation)
de l’[ANSES](https://www.anses.fr).

Il a pour objectif de faciliter l’utilisation de ces données pour le
logiciel R.

## Présentation des données

> Les études INCA permettent de situer l’alimentation de la population
> au regard des recommandations du Programme National Nutrition Santé
> (PNNS) et d’envisager de poursuivre, modifier ou renforcer les
> priorités de la politique nutritionnelle en France.

#### INCA 3 en chiffres

##### Qui ?

  - 4 000 participants, âgés de 0 à 79 ans, dont
      - 2 000 enfants et adolescents de 0 à 17 ans
      - 2 000 adultes de 18 à 79 ans

##### Où ?

  - 472 communes participent à l’étude, réparties sur l’ensemble du
    territoire métropolitain.

##### Comment ?

  - 3 jours de recueil de consommation répartis sur 3 semaines (week-end
    compris) : tous les aliments et boissons consommés sur ces 3 jours,
    décrits et quantifiés
  - Des questionnaires complémentaires pour mieux connaître vos
    habitudes : activité physique, compléments alimentaires,
    conservation des aliments et préparation des repas…

<!-- description: end -->

## Installation du package

<!-- install: start -->

Pour installer le package :

``` r
# install.packages("remotes")
remotes::install_github("thinkr-open/inca3", build_vignettes = FALSE)
```

<!-- install: end -->

## Utilisation

Description des individus suivis

``` r
head(description_indiv_decode)
#> # A tibble: 6 x 185
#>    NOMEN  NOIND ech   enf_allaite pop1  pop2  pop3  pond_indiv_adu_…
#>    <dbl>  <dbl> <chr> <chr>       <chr> <chr> <chr>            <dbl>
#> 1 1.10e6 1.10e8 Adul… <NA>        Oui   Oui   Oui             11415.
#> 2 1.10e6 1.10e8 Adul… <NA>        Oui   Oui   Oui              4644.
#> 3 1.10e6 1.10e8 Adul… <NA>        Oui   Oui   Oui              6017.
#> 4 1.10e6 1.10e8 Adul… <NA>        Oui   Oui   Oui              1782.
#> 5 1.10e6 1.10e8 Adul… <NA>        Oui   Oui   Oui              2359.
#> 6 1.10e6 1.10e8 Adul… <NA>        Oui   Oui   Non             13624.
#> # … with 177 more variables: pond_indiv_enf_pop1 <dbl>,
#> #   pond_indiv_adu_pop2 <dbl>, pond_indiv_enf_pop2 <dbl>,
#> #   pond_indiv_adu_pop3 <dbl>, pond_indiv_enf_pop3 <dbl>, pond_men_pop1 <dbl>,
#> #   pond_men_pop2 <dbl>, zae <chr>, strate <chr>, fpc1 <dbl>, fpc2 <dbl>,
#> #   fpc3 <dbl>, saison_pop1 <chr>, saison_pop2 <chr>, saison_pop3 <chr>,
#> #   region_adm_12cl <chr>, region_inca3 <chr>, agglo_5cl <chr>, sex_PS <chr>,
#> #   tage_PS <chr>, tage_PS_mois <chr>, lien_rep_enf <chr>,
#> #   diplome_interv <chr>, etude_4cl_interv <chr>, situ_prof_5cl_interv <chr>,
#> #   atrav_interv <chr>, trav_nuit_interv <chr>, trav_nuit_2cl_interv <chr>,
#> #   PCS_8cl_interv <chr>, PCS_4cl_interv <chr>, tps_travail_interv <chr>,
#> #   vacances_interv <chr>, interv_PR <chr>, sex_PR <chr>, tage_PR <chr>,
#> #   lien_interv_PR <chr>, lien_PS_PR <chr>, diplome_PR <chr>,
#> #   etude_4cl_PR <chr>, atrav_PR <chr>, PCS_8cl_PR <chr>, PCS_4cl_PR <chr>,
#> #   tps_travail_PR <chr>, stat_log_2cl <chr>, soins <chr>, situ_fin_3cl <chr>,
#> #   revenu <chr>, RUC_4cl <chr>, nbpers <dbl>, nbadu <dbl>, nbenf <dbl>,
#> #   situ_alim_statut <chr>, IA_statut <dbl>, IA_score <dbl>, taille_m <dbl>,
#> #   taille_d <dbl>, taille <dbl>, poids_m <dbl>, poids_d <dbl>, poids <dbl>,
#> #   imc <dbl>, statnut <chr>, maladie_allergie_alim <chr>,
#> #   intoall_confirm_med <chr>, regime_vegetarien <chr>, regime_allergie <chr>,
#> #   regime_maigrir_med <chr>, regime_maigrir_choix <chr>,
#> #   regime_autre_med <chr>, regime_raisonmed_libelle <chr>,
#> #   regime_poidsstable <chr>, regime_forme <chr>, regime_autreraison <chr>,
#> #   regime_non <chr>, veget_viande <chr>, veget_prodmer <chr>,
#> #   veget_prodlait <chr>, veget_oeuf <chr>, veget_miel <chr>,
#> #   veget_autre_alim <chr>, veget_autre_alim_libelle <lgl>,
#> #   allergie_laitvache <chr>, allergie_prepainfsoja <chr>,
#> #   allergie_prepainfamande <chr>, allergie_gluten <chr>,
#> #   allergie_farineble <chr>, allergie_lupin <chr>, allergie_arachide <chr>,
#> #   allergie_fruitcoque <chr>, allergie_fruitcoque_libelle <chr>,
#> #   allergie_oeuf <chr>, allergie_poisson <chr>, allergie_crustace <chr>,
#> #   allergie_mollusque <chr>, allergie_soja <chr>, allergie_sesame <chr>,
#> #   allergie_moutarde <chr>, allergie_sulfite <chr>, allergie_celeri <chr>,
#> #   allergie_autres_fruitleg <chr>, …
```

Composition des consommations alimentaires des individus

``` r
head(conso_compo_alim)
#> # A tibble: 6 x 109
#>   POPULATION  NOIND NUM_LIGNE R24_num R24_nombre R24_pond occ_hdeb occ_type
#>   <chr>       <dbl>     <dbl>   <dbl>      <dbl>    <dbl> <drtn>      <dbl>
#> 1 Pop3       1.10e8         3       1          3        1 39600 s…        4
#> 2 Pop3       1.10e8        16       1          3        1 45000 s…        5
#> 3 Pop3       1.10e8    800001       1          3        1 45000 s…        5
#> 4 Pop3       1.10e8         6       1          3        1 45000 s…        5
#> 5 Pop3       1.10e8        14       1          3        1 45000 s…        5
#> 6 Pop3       1.10e8         7       1          3        1 45000 s…        5
#> # … with 101 more variables: occ_lieu <dbl>, occ_alim_libelle <chr>,
#> #   occ_alim_num <dbl>, occ_alim_num_seq <dbl>, gpe_INCA3 <dbl>,
#> #   aliment_code_INCA3 <dbl>, aliment_libelle_INCA3 <chr>,
#> #   aliment_code_FX <chr>, aliment_libelle_FX <chr>, qte_conso <dbl>,
#> #   qte_conso_pond <dbl>, facette_01 <chr>, facette_01_libelle <chr>,
#> #   facette_02 <chr>, facette_02_libelle <chr>, facette_03 <chr>,
#> #   facette_03_libelle <chr>, facette_04 <chr>, facette_04_libelle <chr>,
#> #   facette_05 <chr>, facette_05_libelle <chr>, facette_06 <chr>,
#> #   facette_06_libelle <chr>, facette_07 <chr>, facette_07_libelle <chr>,
#> #   facette_08 <chr>, facette_08_libelle <chr>, facette_09 <chr>,
#> #   facette_09_libelle <chr>, facette_10 <chr>, facette_10_libelle <chr>,
#> #   facette_12 <chr>, facette_12_libelle <chr>, aliment_marque_bio <dbl>,
#> #   aliment_marque_enrichi <dbl>, facette_13 <chr>, facette_13_libelle <chr>,
#> #   facette_14 <chr>, facette_14_libelle <chr>, facette_19 <chr>,
#> #   facette_19_libelle <chr>, facette_20 <chr>, facette_20_libelle <chr>,
#> #   facette_25 <chr>, facette_25_libelle <chr>, facette_27 <chr>,
#> #   facette_27_libelle <chr>, aet <dbl>, aesa <dbl>, proteines <dbl>,
#> #   glucides <dbl>, sucres <dbl>, amidon <dbl>, polyols <dbl>, fibres <dbl>,
#> #   acides_organiques <dbl>, lipides <dbl>, ags <dbl>, ag_16_0 <dbl>,
#> #   ag_18_0 <dbl>, ag_14_0 <dbl>, ag_12_0 <dbl>, ag_10_0 <dbl>, ag_04_0 <dbl>,
#> #   ag_06_0 <dbl>, ag_08_0 <dbl>, agmi <dbl>, ag_18_1_ole <dbl>, agpi <dbl>,
#> #   ag_18_2_lino <dbl>, ag_18_3_a_lino <dbl>, ag_20_4_ara <dbl>,
#> #   ag_20_5_epa <dbl>, ag_20_6_dha <dbl>, alcool <dbl>, eau <dbl>,
#> #   retinol <dbl>, beta_carotene <dbl>, vitamine_b1 <dbl>, vitamine_b2 <dbl>,
#> #   vitamine_b3 <dbl>, vitamine_b5 <dbl>, vitamine_b6 <dbl>, vitamine_b9 <dbl>,
#> #   vitamine_b12 <dbl>, vitamine_c <dbl>, vitamine_d <dbl>, vitamine_e <dbl>,
#> #   vitamine_k2 <dbl>, sodium <dbl>, sel <dbl>, magnesium <dbl>,
#> #   phosphore <dbl>, potassium <dbl>, calcium <dbl>, manganese <dbl>,
#> #   fer <dbl>, cuivre <dbl>, zinc <dbl>, selenium <dbl>, …
```

## Réferences

Carine Dubuisson, Ariane Dufour, Sandrine Carrillo, Peggy
Drouillet-Pinard, Sabrina Havard, Jean-Luc Volatier (2019). The Third
French Individual and National Food Consumption (INCA3) Survey
2014-2015: method, design and participation rate in the framework of a
European harmonization process. Public Health Nutrition: 22(4), 584–600.
[doi:10.1017/S1368980018002896](https://doi.org/10.1017/S1368980018002896).
