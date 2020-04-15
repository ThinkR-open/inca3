context("Test data length")

path_to_data <- file.path(getwd(), "data")
files <- list.files(path = path_to_data, full.names = TRUE)
datasets <- map(files, ~ get(load(.x))) %>% set_names(gsub("\\.rda", "", basename(files)))

test_that("Check number of row", {
  rows <- read.csv("rows.csv")
  
  expect_true(
    all(
      map2(names(datasets),
           rows,
           ~ {
             nrow(datasets[[.x]]) == rows[rows$colonne == .x,]$row
           })
      )
    )
})


test_that("Check number of col", {
  cols <- read.csv("cols.csv")
  
  expect_true(
    all(
      map2(names(datasets),
           cols,
           ~ {
             ncol(datasets[[.x]]) == cols[cols$colonne == .x,]$col
           })
    )
  )
})