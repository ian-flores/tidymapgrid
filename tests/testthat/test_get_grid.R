library(sf)
library(tidymapgrid)

pueblos <- readRDS('pueblos.RDS')

test_that("Verifying computation of hexagonal", {
  pueblos_grid <- get_grid(pueblos, type = 'hexagonal', seed = 1)
  expect_equal(dim(pueblos_grid$geometry[[1]][[1]]), c(7, 2))
})

test_that("Verifying computation of square", {
  pueblos_grid <- get_grid(pueblos, type = 'square', seed = 1)
  expect_equal(dim(pueblos_grid$geometry[[1]][[1]]), c(5, 2))
})
