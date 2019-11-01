#' Calculate grid based on type and seed
#'
#' @param file The file that has been loaded
#' @param type The type of grid to generate (square or hexagonal)
#' @param seed The seed to generate the grid
#' @return The grid generated

calculate_geom <- function(file, type, seed){
  if (type == 'square'){type = 'regular'} else {type}
  grid <- geogrid::calculate_grid(file, grid_type = type, seed = seed)

  return(grid)
}
