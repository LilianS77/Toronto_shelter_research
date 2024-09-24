#### Preamble ####
# Purpose: Cleans the raw plane data recorded by 1 observer.
# Author: Xizi Sun
# Date: 23 September 2024 
# Contact: xizi.sun@mail.utoronto.ca
# License: MIT
# Pre-requisites: Install the tidyverse
# Any other information needed? no


#### Workspace setup ####
library(tidyverse)

library(dplyr)

# Load the dataset (replace with the correct file path)
data <- read.csv("/Users/XiziS/OneDrive/Desktop/1/Toronto_shelter_research/starter_folder-main (1)/trtdata1.csv")

# Remove the columns: "X_id", "became_inactive", "actively_homeless"
cleaned_data <- data %>%
  select(-X_id, -became_inactive, -actively_homeless)

# Display the first few rows of the cleaned data
head(cleaned_data)

# Optionally, write the cleaned data to a new CSV file
write.csv(cleaned_data, "cleaned_trtdata1.csv", row.names = FALSE)


#### Save data ####
write_csv(cleaned_data, "/Users/XiziS/OneDrive/Desktop/1/Toronto_shelter_research/starter_folder-main (1)/starter_folder-main/data/analysis_data/cleaned_data.csv")
