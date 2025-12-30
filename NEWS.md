# tidymapgrid 0.2.0

## New Features

* Added input validation for `get_grid()` with informative error messages
* Added examples to function documentation

## Documentation

* Improved README with clearer package description and use cases
* Enhanced roxygen documentation for all functions
* Added this NEWS file to track changes

## Infrastructure

* Migrated from Travis CI to GitHub Actions
* Updated minimum R version to 4.1.0
* Added minimum version requirements for dependencies
* Updated to testthat edition 3
* Updated to roxygen2 7.3.2

## Bug Fixes

* Fixed inconsistent code style in `calculate_geom()`

# tidymapgrid 0.1.0

* Initial experimental release
* Added `get_grid()` function for converting sf polygons to grid representations
* Support for hexagonal and square grid types
