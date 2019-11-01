#' Function to get the corresponding grid for a map
#'
#' @param file The file to be loaded. Comes from st_read() function.
#' @param type The type of grid to generate (square or hexagonal)
#' @param seed The seed to generate the grid
#' @return The grid generated
#' @export
get_grid <- function(file, type = 'hexagonal', seed = 2019){

geom <- calculate_geom(file, type = type, seed = seed)
geom_df <- tidy_geom(geom)

file <- dplyr::as_tibble(file)
file$geometry <- NULL

map_grid <- dplyr::bind_cols(geom_df, file)

return(map_grid)
}
