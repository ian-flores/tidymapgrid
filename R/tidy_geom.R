tidy_geom <- function(geom){
  grid <- sf::st_as_sf(geom[[2]])
  return(grid)
}
