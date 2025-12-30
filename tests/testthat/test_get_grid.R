library(sf)

# Load test data
pueblos <- readRDS(test_path("pueblos.RDS"))

# Test basic functionality
test_that("get_grid returns sf tibble for hexagonal type", {
  result <- get_grid(pueblos, type = "hexagonal", seed = 1)

  expect_s3_class(result, "sf")
  expect_s3_class(result, "tbl_df")
  expect_true("geometry" %in% names(result))
  expect_equal(nrow(result), nrow(pueblos))
})

test_that("get_grid returns sf tibble for square type", {
  result <- get_grid(pueblos, type = "square", seed = 1)

  expect_s3_class(result, "sf")
  expect_s3_class(result, "tbl_df")
  expect_true("geometry" %in% names(result))
  expect_equal(nrow(result), nrow(pueblos))
})

test_that("get_grid preserves original attributes", {
  result <- get_grid(pueblos, type = "hexagonal", seed = 1)

  # Original columns should be preserved (except geometry which is replaced)
  original_cols <- setdiff(names(pueblos), "geometry")
  expect_true(all(original_cols %in% names(result)))
})

# Test reproducibility with seed
test_that("same seed produces identical results", {
  result1 <- get_grid(pueblos, type = "hexagonal", seed = 42)
  result2 <- get_grid(pueblos, type = "hexagonal", seed = 42)

  expect_equal(result1, result2)
})

test_that("different seeds produce different results", {
  result1 <- get_grid(pueblos, type = "hexagonal", seed = 1)
  result2 <- get_grid(pueblos, type = "hexagonal", seed = 999)

  # Geometries should differ
  expect_false(identical(result1$geometry, result2$geometry))
})

# Test geometry properties
test_that("hexagonal grid has correct geometry dimensions", {
  result <- get_grid(pueblos, type = "hexagonal", seed = 1)
  # Hexagons have 7 vertices (first and last are the same to close the polygon)
  expect_equal(dim(result$geometry[[1]][[1]]), c(7, 2))
})

test_that("square grid has correct geometry dimensions", {
  result <- get_grid(pueblos, type = "square", seed = 1)
  # Squares have 5 vertices (first and last are the same to close the polygon)
  expect_equal(dim(result$geometry[[1]][[1]]), c(5, 2))
})

# Test input validation
test_that("get_grid errors with non-sf input", {
  expect_error(get_grid(data.frame(x = 1), type = "hexagonal"),
               "`file` must be an sf object")

  expect_error(get_grid(list(a = 1), type = "hexagonal"),
               "`file` must be an sf object")

  expect_error(get_grid(NULL, type = "hexagonal"),
               "`file` must be an sf object")
})

test_that("get_grid errors with invalid type", {
  expect_error(get_grid(pueblos, type = "triangle"),
               "`type` must be one of")

  expect_error(get_grid(pueblos, type = "hex"),
               "`type` must be one of")

  expect_error(get_grid(pueblos, type = ""),
               "`type` must be one of")
})

test_that("get_grid errors with invalid seed", {
  expect_error(get_grid(pueblos, type = "hexagonal", seed = "abc"),
               "`seed` must be a single numeric value")

  expect_error(get_grid(pueblos, type = "hexagonal", seed = c(1, 2, 3)),
               "`seed` must be a single numeric value")

  expect_error(get_grid(pueblos, type = "hexagonal", seed = NULL),
               "`seed` must be a single numeric value")
})

# Test default parameters
test_that("get_grid uses default parameters correctly", {
  # Default type is hexagonal
 result <- get_grid(pueblos, seed = 1)
  expect_equal(dim(result$geometry[[1]][[1]]), c(7, 2))

  # Default seed is 2019
  result1 <- get_grid(pueblos, type = "hexagonal")
  result2 <- get_grid(pueblos, type = "hexagonal", seed = 2019)
  expect_equal(result1, result2)
})
