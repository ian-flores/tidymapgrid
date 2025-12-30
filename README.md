
<!-- README.md is generated from README.Rmd. Please edit that file -->

# tidymapgrid

<!-- badges: start -->
[![Lifecycle: experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
[![CRAN status](https://www.r-pkg.org/badges/version/tidymapgrid)](https://CRAN.R-project.org/package=tidymapgrid)
[![R-CMD-check](https://github.com/ian-flores/tidymapgrid/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/ian-flores/tidymapgrid/actions/workflows/R-CMD-check.yaml)
[![Codecov test coverage](https://codecov.io/gh/ian-flores/tidymapgrid/branch/main/graph/badge.svg)](https://codecov.io/gh/ian-flores/tidymapgrid?branch=main)
<!-- badges: end -->

tidymapgrid provides a simple interface for converting geographic polygons into grid representations (hexagonal or square). This is useful for creating tile grid maps where each geographic unit is represented by a uniformly-sized cell, making it easier to visualize data without the distortion caused by varying polygon sizes.

The package wraps the [geogrid](https://github.com/jbaileyh/geogrid) package and returns tidy sf objects that integrate seamlessly with the tidyverse and ggplot2.

## Installation

You can install the released version of tidymapgrid from
[GitHub](https://github.com/ian-flores) with:

``` r
devtools::install_github('ian-flores/tidymapgrid')
```

## Example

This is a basic example which shows you how to obtain the grid for your
map.

``` r
library(sf)
library(tidymapgrid)
library(ggplot2)
```

``` r
json_url <- 'https://raw.githubusercontent.com/ian-flores/Hurricane_Maria_Mortality_Analysis/master/analysis/data/pueblos.json'

pueblos <- st_read(json_url)
#> Reading layer `pueblos' from data source `https://raw.githubusercontent.com/ian-flores/Hurricane_Maria_Mortality_Analysis/master/analysis/data/pueblos.json' using driver `GeoJSON'
#> Simple feature collection with 78 features and 3 fields
#> geometry type:  POLYGON
#> dimension:      XY
#> bbox:           xmin: -67.27135 ymin: 17.92688 xmax: -65.24442 ymax: 18.51576
#> CRS:            EPSG:4326

ggplot(pueblos) +
  geom_sf() +
  theme_void()
```

<img src="man/figures/README-reg-ggplot-1.png" width="100%" />

``` r
grid <- get_grid(pueblos, type = 'hexagonal', seed = 40)

ggplot(grid) +
  geom_sf() +
  theme_void()
```

<img src="man/figures/README-get_grid-1.png" width="100%" />

## Features

- Convert geographic polygons to **hexagonal** or **square** grid representations
- Preserves all attributes from the original sf object
- Returns tidy sf objects compatible with dplyr and ggplot2
- Reproducible results via seed parameter

## Learn More

- Check out the [Getting Started vignette](https://ian-flores.github.io/tidymapgrid/articles/getting-started.html) for a detailed tutorial
- See the [function reference](https://ian-flores.github.io/tidymapgrid/reference/index.html) for API documentation
