# Openness and Population Density: prepare the data
# Open this project's .Rproj file, then run the entire script with Source.
# All paths below start from the project folder.
# All numerical values are simulated for teaching.

# 1. Read the original data. NA means a value is missing.
# Keep the raw file unchanged so we can always start again from the same data.
raw_data <- read.csv("data/raw/national data_2026.csv", na.strings = "NA")

# 2. Keep countries with area, population, and openness available.
# Missing values in other variables do not affect inclusion in this analysis.
usable_rows <- complete.cases(raw_data[, c("area_km2", "population", "openness")])
processed_data <- raw_data[usable_rows, ]

# 3. Keep the country name and the variables needed for this analysis.
processed_data <- processed_data[, c("country", "area_km2", "population", "openness")]

# 4. Calculate population density in people per square kilometer.
# population is measured in people; area_km2 is measured in square kilometers.
processed_data$population_density <- processed_data$population / processed_data$area_km2

# 5. Save one clearly named processed dataset, separate from the raw data.
# Create the output folder if needed. Running this script again replaces the output.
dir.create("data/processed_data", recursive = TRUE, showWarnings = FALSE)

# row.names = FALSE prevents R from adding an extra column of row numbers.
write.csv(processed_data, "data/processed_data/national_data_processed.csv",
          row.names = FALSE)
