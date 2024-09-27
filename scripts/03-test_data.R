#### Preamble ####
# Purpose: test both simulated and cleaned data
# Author: Xizi Sun
# Date: 23 September 2024 
# Contact: xizi.sun@mail.utoronto.ca
# License: MIT
# Pre-requisites: Run the files "01-download_data.R" and "02-data_cleaning.R".
# Any other information needed? no


# Load necessary libraries
library(dplyr)

### Part 1: Test the Simulated Data

# Load the simulated data
simulated_data <- read_csv(here::here("data", "raw_data", "simulated_data.csv"))


cat("----Testing Simulated Data----\n")

# 1. Test for duplicate rows
if (any(duplicated(simulated_data))) {
  cat("There are duplicate rows in the simulated data.\n")
} else {
  cat("No duplicate rows in the simulated data.\n")
}

# 2. Test for missing values (partial missingness)
missing_values_simulated <- colSums(is.na(simulated_data))
cat("Missing values per column in simulated data:\n")
print(missing_values_simulated)

# 3. Test the range of the date column
simulated_data$date.mmm.yy <- as.Date(paste0("01-", simulated_data$date.mmm.yy), format = "%d-%b-%y")
date_range_simulated <- range(simulated_data$date.mmm.yy)
cat("Date range in simulated data is from:", date_range_simulated[1], "to", date_range_simulated[2], "\n")

# 4. Test the range of 'returned_to_shelter' and 'returned_from_housing'
cat("Range of returned_to_shelter in simulated data:", range(simulated_data$returned_to_shelter), "\n")
cat("Range of returned_from_housing in simulated data:", range(simulated_data$returned_from_housing), "\n")

# 5. Check for outliers in 'returned_to_shelter' and 'returned_from_housing'
outliers_returned_to_shelter <- simulated_data$returned_to_shelter[simulated_data$returned_to_shelter > (mean(simulated_data$returned_to_shelter) + 3*sd(simulated_data$returned_to_shelter))]
outliers_returned_from_housing <- simulated_data$returned_from_housing[simulated_data$returned_from_housing > (mean(simulated_data$returned_from_housing) + 3*sd(simulated_data$returned_from_housing))]
cat("Outliers in 'returned_to_shelter':", outliers_returned_to_shelter, "\n")
cat("Outliers in 'returned_from_housing':", outliers_returned_from_housing, "\n")

# 6. Summary statistics for numeric columns
cat("Summary statistics for simulated data:\n")
summary(simulated_data)

# 7. Check for unique values in categorical columns
unique_population_groups <- unique(simulated_data$population_group)
cat("Unique values in population_group:\n")
print(unique_population_groups)


### Part 2: Test the Cleaned Data

# Load the cleaned data
cleaned_data <- read_csv(here::here("data", "analysis_data", "analysis_data.csv"))
cat("\n----Testing Cleaned Data----\n")

# 1. Test for duplicate rows
if (any(duplicated(cleaned_data))) {
  cat("There are duplicate rows in the cleaned data.\n")
} else {
  cat("No duplicate rows in the cleaned data.\n")
}

# 2. Test for missing values (partial missingness)
missing_values_cleaned <- colSums(is.na(cleaned_data))
cat("Missing values per column in cleaned data:\n")
print(missing_values_cleaned)

# 3. Test the range of the date column
cleaned_data$date.mmm.yy <- as.Date(paste0("01-", cleaned_data$date.mmm.yy), format = "%d-%b-%y")
date_range_cleaned <- range(cleaned_data$date.mmm.yy)
cat("Date range in cleaned data is from:", date_range_cleaned[1], "to", date_range_cleaned[2], "\n")

# 4. Test the range of 'returned_to_shelter' and 'returned_from_housing'
cat("Range of returned_to_shelter in cleaned data:", range(cleaned_data$returned_to_shelter), "\n")
cat("Range of returned_from_housing in cleaned data:", range(cleaned_data$returned_from_housing), "\n")

# 5. Check for outliers in 'returned_to_shelter' and 'returned_from_housing'
outliers_returned_to_shelter_cleaned <- cleaned_data$returned_to_shelter[cleaned_data$returned_to_shelter > (mean(cleaned_data$returned_to_shelter) + 3*sd(cleaned_data$returned_to_shelter))]
outliers_returned_from_housing_cleaned <- cleaned_data$returned_from_housing[cleaned_data$returned_from_housing > (mean(cleaned_data$returned_from_housing) + 3*sd(cleaned_data$returned_from_housing))]
cat("Outliers in 'returned_to_shelter' (cleaned data):", outliers_returned_to_shelter_cleaned, "\n")
cat("Outliers in 'returned_from_housing' (cleaned data):", outliers_returned_from_housing_cleaned, "\n")

# 6. Summary statistics for numeric columns
cat("Summary statistics for cleaned data:\n")
summary(cleaned_data)

# 7. Check for unique values in categorical columns
unique_population_groups_cleaned <- unique(cleaned_data$population_group)
cat("Unique values in population_group (cleaned data):\n")
print(unique_population_groups_cleaned)
