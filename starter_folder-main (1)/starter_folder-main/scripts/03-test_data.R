#### Preamble ####
# Purpose: test a simulated version of the Toronto Shelter
# Author: Xizi Sun
# Date: 23 September 2024 
# Contact: xizi.sun@mail.utoronto.ca
# License: MIT
# Pre-requisites: Install the tidyverse
# Any other information needed? no


#### Workspace setup ####
library(tidyverse)


#### Test data ####
# Assuming the ID column is named 'X_id' or another column name
# Replace 'ID_column_name' with the actual name of your ID column if it's different

# Check if the minimum value in the ID column is at least 1
min_value <- min(cleaned_data$X)

# Print the result
if(min_value >= 1) {
  print("The minimum value in the ID column is at least 1.")
} else {
  print("Warning: The minimum value in the ID column is less than 1.")
}

# Alternatively, simply print the minimum value of the ID column
min_value

