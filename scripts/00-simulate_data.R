#### Preamble ####
# Purpose: Generates a simulated version of the Toronto Shelter
# Author: Xizi Sun
# Date: 23 September 2024 
# Contact: xizi.sun@mail.utoronto.ca
# License: MIT
# Pre-requisites: Install the tidyverse
# Any other information needed? no

# Load necessary libraries
library(dplyr)

# Define the population groups
population_groups <- c("All Population", "Chronic", "Refugees", "Families", "Youth", "Single Adult", "Non-refugees")

# Set up the simulation for 12 months (2018), monthly data
set.seed(123)
n_months <- 12  # Simulate for 12 months
dates <- format(seq(as.Date("2018-01-01"), by = "month", length.out = n_months), "%b-%y")

# Create simulated data without the removed columns
simulated_data <- data.frame(
  date.mmm = rep(dates, each = length(population_groups)),
  population_group = rep(population_groups, times = n_months),
  newly_identified = sample(0:1200, n_months * length(population_groups), replace = TRUE),
  moved_to_housing = sample(0:600, n_months * length(population_groups), replace = TRUE),
  age_under_16 = sample(0:1500, n_months * length(population_groups), replace = TRUE),
  age_16_24 = sample(0:1500, n_months * length(population_groups), replace = TRUE),
  age_25_34 = sample(0:1500, n_months * length(population_groups), replace = TRUE),
  age_35_44 = sample(0:1500, n_months * length(population_groups), replace = TRUE),
  age_45_54 = sample(0:1500, n_months * length(population_groups), replace = TRUE),
  age_55_64 = sample(0:1500, n_months * length(population_groups), replace = TRUE),
  age_65over = sample(0:1500, n_months * length(population_groups), replace = TRUE)
)

# Preview the simulated data
head(simulated_data)

# Optionally, save to a CSV
write.csv(simulated_data,"/Users/XiziS/OneDrive/Desktop/1/Toronto_shelter_research/data/raw_data/simulated_data.csv")

# View the first few rows of the simulated data
head(simulated_data)



