context("Test data length")

ds_names <- utils::data(package = "inca3")$results[, "Item"]
env <- new.env()
for (n in ds_names) {
  utils::data(list = n, package = "inca3", envir = env)
}
datasets <- mget(ds_names, envir = env)

test_that("Check number of row", {
  rows <- read.csv("rows.csv")
  expected <- setNames(rows$row, rows$colonne)

  expect_setequal(names(datasets), names(expected))
  for (n in names(datasets)) {
    expect_equal(
      nrow(datasets[[n]]),
      unname(expected[[n]]),
      info = paste("dataset:", n)
    )
  }
})

test_that("Check number of col", {
  cols <- read.csv("cols.csv")
  expected <- setNames(cols$col, cols$colonne)

  expect_setequal(names(datasets), names(expected))
  for (n in names(datasets)) {
    expect_equal(
      ncol(datasets[[n]]),
      unname(expected[[n]]),
      info = paste("dataset:", n)
    )
  }
})
