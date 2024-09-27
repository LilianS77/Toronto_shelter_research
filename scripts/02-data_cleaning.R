#### Preamble ####
# Purpose: Cleans the raw plane data recorded by 1 observer.
# Author: Xizi Sun
# Date: 23 September 2024 
# Contact: xizi.sun@mail.utoronto.ca
# License: MIT
# Pre-requisites: Install the tidyverse
# Any other information needed? no


# Load necessary library
library(dplyr)

# Load the raw data (replace 'raw_data.csv' with your actual file path if different)
raw_data <- read.csv("/Users/XiziS/OneDrive/Desktop/1/Toronto_shelter_research/data/raw_data/raw_data.csv")

# Perform data cleaning: keep only the columns that were simulated
cleaned_data <- raw_data %>%
  select(date.mmm.yy., population_group, returned_from_housing, returned_to_shelter, 
         ageunder16, age16.24, age25.34, age35.44, age45.54, age55.64, age65over)

# Preview the cleaned data
head(cleaned_data)

#### Save data ####
write_csv(cleaned_data, "/Users/XiziS/OneDrive/Desktop/1/Toronto_shelter_research/data/analysis_data/analysis_data.csv")
