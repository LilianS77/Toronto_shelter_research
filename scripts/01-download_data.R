#### Preamble ####
# Purpose: Downloads and saves the data from the City of Toronto’s open data portal.
# Author: Xizi Sun
# Date: 23 September 2024 
# Contact: xizi.sun@mail.utoronto.ca
# License: MIT
# Pre-requisites: Install the tidyverse
# Any other information needed? no


#### Workspace setup ####
library(opendatatoronto)
library(tidyverse)


#### Download data ####
#We will use the `opendatatoronto` package to access a dataset from the City of Toronto’s open data portal.


#| echo: false
#| warning: false
# Install necessary packages (if not installed)
install.packages("opendatatoronto")
# install.packages("tidyverse")
library(opendatatoronto)
library(tidyverse)

# Retrieve a list of all available data packages from the OpenDataToronto portal
packages <- list_packages(300)
# Display the list of available packages
packages


#| echo: false
#| warning: false
# Search for a specific package on OpenDataToronto by keyword ("Toronto Shelter System Flow")
trt_shelter <- search_packages("Toronto Shelter System Flow")
trt_shelter
# Retrieve a list of all resources (datasets) available within the found package
trt_shelter_resources <- trt_shelter %>%
  list_package_resources()
# Display the list of resources available in the "Toronto Shelter System Flow" package
trt_shelter_resources

trt_shelter <- trt_shelter_resources[2,] %>%
  get_resource()
data=trt_shelter



trt_shelter
write.csv(trt_shelter,"/Users/XiziS/OneDrive/Desktop/1/Toronto_shelter_research/starter_folder-main (1)/trtdata1.csv")




         
