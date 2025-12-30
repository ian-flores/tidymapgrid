#' Calculate grid geometry using geogrid
#'
#' Internal function that wraps geogrid::calculate_grid, mapping the
#' user-friendly "square" type to geogrid's "regular" type.
#'
#' @param file An sf object containing the geographic polygons
#' @param type The type of grid to generate ("square" or "hexagonal")
#' @param seed The seed for reproducible grid generation
#' @return Raw grid output from geogrid::calculate_grid
#' @keywords internal

calculate_geom <- function(file, type, seed) {
  if (type == "square") {
    type <- "regular"
  }
  grid <- geogrid::calculate_grid(file, grid_type = type, seed = seed)
  return(grid)
}
