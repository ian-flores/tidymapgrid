#' Convert geographic polygons to a grid representation
#'
#' Takes an sf object containing geographic polygons and converts them to a
#' grid representation (hexagonal or square). This is useful for creating
#' tile grid maps where each geographic unit is represented by a uniformly-sized
#' cell.
#'
#' @param file An sf object containing geographic polygons, typically loaded
#'   via [sf::st_read()].
#' @param type The type of grid to generate. Must be either "hexagonal"
#'   (default) or "square".
#' @param seed An integer seed for reproducible grid generation. The same seed
#'   will produce the same grid layout.
#' @return A tibble with sf geometry containing the grid representation.
#'   Original attributes from the input are preserved.
#' @export
#' @examples
#' \dontrun{
#' library(sf)
#' library(ggplot2)
#'
#' # Load geographic data
#' polygons <- st_read("path/to/shapefile.shp")
#'
#' # Create hexagonal grid
#' hex_grid <- get_grid(polygons, type = "hexagonal", seed = 42)
#'
#' # Create square grid
#' square_grid <- get_grid(polygons, type = "square", seed = 42)
#'
#' # Plot the result
#' ggplot(hex_grid) + geom_sf() + theme_void()
#' }
get_grid <- function(file, type = "hexagonal", seed = 2019) {
  # Input validation
  if (!inherits(file, "sf")) {
    stop("`file` must be an sf object", call. = FALSE)
  }

  valid_types <- c("hexagonal", "square")
  if (!type %in% valid_types) {
    stop(
      sprintf("`type` must be one of: %s", paste(valid_types, collapse = ", ")),
      call. = FALSE
    )
  }

  if (!is.numeric(seed) || length(seed) != 1) {
    stop("`seed` must be a single numeric value", call. = FALSE)
  }

  geom <- calculate_geom(file, type = type, seed = seed)
  geom_df <- tidy_geom(geom)

  file <- dplyr::as_tibble(file)
  file$geometry <- NULL

  map_grid <- dplyr::bind_cols(geom_df, file)

  return(map_grid)
}
