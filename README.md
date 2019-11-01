
<!-- README.md is generated from README.Rmd. Please edit that file -->

# tidymapgrid

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
[![CRAN
status](https://www.r-pkg.org/badges/version/tidymapgrid)](https://CRAN.R-project.org/package=tidymapgrid)
[![Travis build
status](https://travis-ci.org/ian-flores/tidymapgrid.svg?branch=master)](https://travis-ci.org/ian-flores/tidymapgrid)
[![Codecov test
coverage](https://codecov.io/gh/ian-flores/tidymapgrid/branch/master/graph/badge.svg)](https://codecov.io/gh/ian-flores/tidymapgrid?branch=master)
<!-- badges: end -->

The goal of tidymapgrid is to …

## Installation

You can install the released version of tidymapgrid from
[GitHub](https://github.com/ian-flores) with:

``` r
devtools::install_github('ian-flores/tidymapgrid')
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(tidymapgrid)
library(ggplot2)
## basic example code

json_url <- 'https://raw.githubusercontent.com/ian-flores/Hurricane_Maria_Mortality_Analysis/master/analysis/data/pueblos.json'

grid <- get_grid(json_url)
#> Reading layer `pueblos' from data source `https://raw.githubusercontent.com/ian-flores/Hurricane_Maria_Mortality_Analysis/master/analysis/data/pueblos.json' using driver `GeoJSON'
#> Simple feature collection with 78 features and 3 fields
#> geometry type:  POLYGON
#> dimension:      XY
#> bbox:           xmin: -67.27135 ymin: 17.92688 xmax: -65.24442 ymax: 18.51576
#> epsg (SRID):    4326
#> proj4string:    +proj=longlat +datum=WGS84 +no_defs

ggplot(grid) +
  geom_sf()
```

<img src="man/figures/README-example-1.png" width="100%" />

What is special about using `README.Rmd` instead of just `README.md`?
You can include R chunks like so:

``` r
summary(cars)
#>      speed           dist       
#>  Min.   : 4.0   Min.   :  2.00  
#>  1st Qu.:12.0   1st Qu.: 26.00  
#>  Median :15.0   Median : 36.00  
#>  Mean   :15.4   Mean   : 42.98  
#>  3rd Qu.:19.0   3rd Qu.: 56.00  
#>  Max.   :25.0   Max.   :120.00
```

You’ll still need to render `README.Rmd` regularly, to keep `README.md`
up-to-date.

You can also embed plots, for example:

<img src="man/figures/README-pressure-1.png" width="100%" />

In that case, don’t forget to commit and push the resulting figure
files, so they display on GitHub\!
