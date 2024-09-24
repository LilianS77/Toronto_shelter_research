#### Preamble ####
# Purpose: Generates a simulated version of the Toronto Shelter
# Author: Xizi Sun
# Date: 23 September 2024 
# Contact: xizi.sun@mail.utoronto.ca
# License: MIT
# Pre-requisites: Install the tidyverse
# Any other information needed? no


#### Workspace setup ####
library(tidyverse)


#### Simulate data ####

# Set seed for reproducibility

set.seed(123)

# Number of rows (change based on your dataset size)
n <- 100  

# Simulate "returned_from_housing" data: Assuming a normal distribution around 50 with some variation
returned_from_housing <- round(rnorm(n, mean = 50, sd = 15))

# Simulate "returned_to_shelter" data: Assuming a normal distribution around 100 with some variation
returned_to_shelter <- round(rnorm(n, mean = 100, sd = 30))

# Combine the simulated data into a data frame
simulated_data <- data.frame(
  returned_from_housing = returned_from_housing,
  returned_to_shelter = returned_to_shelter
)

# View the first few rows of the simulated data
head(simulated_data)

# Optionally, save the simulated data to a CSV file
write.csv(simulated_data, "/Users/XiziS/OneDrive/Desktop/1/Toronto_shelter_research/starter_folder-main (1)/simulated_data.csv")


