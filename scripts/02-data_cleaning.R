#### Preamble ####
# Purpose: Cleans the raw plane data recorded by 1 observer.
# Author: Xizi Sun
# Date: 23 September 2024
# Contact: xizi.sun@mail.utoronto.ca
# License: MIT
# Pre-requisites: Run the file "01-download_data.R".
# Any other information needed? no


# Load necessary library
library(dplyr)

# Load the raw data
raw_data <- read_csv(here::here("data", "raw_data", "raw_data.csv")) %>%
  # Perform data cleaning: keep only the columns that were simulated
  cleaned_data() <- raw_data %>%
  select(
    date.mmm.yy., population_group, returned_from_housing, returned_to_shelter,
    ageunder16, age16.24, age25.34, age35.44, age45.54, age55.64, age65over
  )

# Preview the cleaned data
head(cleaned_data)

#### Save data ####
write_csv(cleaned_data, here::here("data", "analysis_data", "analysis_data.csv"))
