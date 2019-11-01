library(sf)
library(tidymapgrid)

json_url <- 'https://raw.githubusercontent.com/ian-flores/Hurricane_Maria_Mortality_Analysis/master/analysis/data/pueblos.json'

pueblos <- st_read(json_url)

saveRDS(pueblos, file= 'tests/testthat/pueblos.RDS')

pueblos_grid <- get_grid(pueblos, seed = 1)
saveRDS(pueblos_grid, file= 'tests/testthat/pueblos_grid.RDS')
