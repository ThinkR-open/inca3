# Hide this file from build
usethis::use_build_ignore("devstuff_history.R")
usethis::use_build_ignore("codecov.yml")
usethis::use_build_ignore(".travis.yml")
# usethis::use_build_ignore("inst/dev")
usethis::use_build_ignore("rsconnect")
usethis::use_git_ignore("docs/")
usethis::use_git_ignore("rsconnect/")
usethis::use_git_ignore("inst/docs/")
usethis::use_git_ignore("inst/fichiers_dataset/")
# usethis::create_package(".")

# description ----
library(desc)
unlink("DESCRIPTION")
my_desc <- description$new()
my_desc$set_version("0.0.0.9000")
my_desc$set(Package = "inca3")
my_desc$set(Title = "Données de l'étude INCA 3")
my_desc$set(Description = "Données de consommations et habitudes alimentaires de l'étude INCA 3.Carine Dubuisson, Ariane Dufour, Sandrine Carrillo, Peggy Drouillet-Pinard, Sabrina Havard, Jean-Luc Volatier (2019). The Third French Individual and National Food Consumption (INCA3) Survey 2014-2015:method, design and participation rate in the framework of a European harmonization process. Public Health Nutrition: 22(4), 584–600. (doi:10.1017/S1368980018002896).")
my_desc$set("Authors@R",
            'c(person("Cervan", "Girard", email = "cervan@thinkr.fr", role = c("aut")),
               person("Vincent", "Guyader", email = "vincent@thinkr.fr", role = c("aut", "cre"), comment = c(ORCID = "0000-0003-0671-9270")),
               person(given = "ANSES", role = "cph"))'
            )
my_desc$set("VignetteBuilder", "knitr")
my_desc$del("Maintainer")
my_desc$del("URL")
my_desc$del("BugReports")
my_desc$set_version("0.0.0.9000")
my_desc$write(file = "DESCRIPTION")

# Licence ----
usethis::use_mit_license("ThinkR")
# usethis::use_gpl3_license("ThinkR")

# Pipe ----
usethis::use_pipe()

# Data
dir.create("inst")
dir.create("inst/excel_files")

# Package quality ----

# _Tests
usethis::use_testthat()
usethis::use_test("app")

# _CI
# thinkridentity::use_gitlab_ci(image = "thinkr/runnerci", upgrade = "never")
# tic::use_tic()
# travis::travis_set_pat()
usethis::use_travis()
usethis::use_appveyor()
usethis::use_coverage()
# CI github
usethis::use_github_actions()
usethis::use_github_action(name = "check-standard")
usethis::use_github_actions_badge("R-CMD-check")
usethis::use_github_action(name = "pkgdown")


#### Badges
usethis::use_travis_badge()
usethis::use_appveyor_badge()
# _rhub
# rhub::check_for_cran()


# Documentation ----
# _Readme
file.copy("inst/logo/logo-inca3.png", to = "man/figures/logo.png")
# usethis::use_readme_rmd()
# chameleon::generate_readme_rmd()
# chameleon::generate_readme_rmd(parts = "description")
# _News
usethis::use_news_md()
# _Vignette
file.copy(system.file("templates/html/header_hide.html", package = "thinkridentity"),
          "vignettes")
thinkridentity::add_thinkr_css(path = "vignettes")

thinkridentity::create_vignette_thinkr("aa-presentation-tables")
# usethis::use_vignette("ab-model")
devtools::build_vignettes()


# _Book
# remotes::install_github(repo = "ThinkR-open/chameleon")
# chameleon::create_book("inst/report", clean = TRUE)
# chameleon::open_guide_function()
# devtools::document()
# chameleon::build_book(clean = TRUE)
# inca3::open_guide()

# _Pkgdown
# chameleon::build_pkgdown(
#   # lazy = TRUE,
#   yml = system.file("pkgdown/_pkgdown.yml", package = "thinkridentity"),
#   favicon = system.file("logo/logo-inca3.png", package = "inca3"),
#   move = TRUE, clean_before = TRUE, clean_after = TRUE
# )
file.copy("inst/logo/logo-inca3.png", to = "logo.png")
pkgdown::build_favicons(overwrite = TRUE)
unlink("logo.png")
# chameleon::open_pkgdown_function(path = "inst/docs")
pkgdown::build_site()
usethis::use_git_ignore("docs/")
usethis::use_build_ignore("pkgdown/")

## __ deploy on rsconnect
usethis::use_git_ignore("docs/rsconnect")
usethis::use_git_ignore("inst/docs/rsconnect")
usethis::use_git_ignore("rsconnect")

# Dependencies ----
# devtools::install_github("ThinkR-open/attachment")
#attachment marche pas ici..
#attachment::att_to_description(path = ".")
# attachment::create_dependencies_file()
usethis::use_package("DT", type = "Suggests")
usethis::use_package("knitr", type = "Suggests")
usethis::use_package("dplyr", type = "Suggests")

# Description and Bibliography
chameleon::create_pkg_desc_file(out.dir = "inst", source = c("archive"), to = "html")
thinkridentity::create_pkg_biblio_file_thinkr()

# Utils for dev ----
# Get global variables
checkhelper::print_globals()
# Install
devtools::install(upgrade = "never")
# devtools::load_all()
devtools::check(vignettes = TRUE)
# ascii
stringi::stri_trans_general("é", "hex")


### Tests 

usethis::use_testthat()
usethis::use_test("data")
usethis::use_test("helper-config")


### Documentation

# files <- list.files("data/")
# files <- gsub(pattern = "\\.rda", replacement = "", files)
# personnel usethis
# lapply(files, function(x){usethis::use_data_doc(x, description = "Data inca3", source = "Inca3")})


