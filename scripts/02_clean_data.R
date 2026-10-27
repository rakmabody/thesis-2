# Step 2: clean raw data -> analysis-ready data in data/clean/
#
# Reads:   data/raw/measurements.csv   (never edited by hand)
# Writes:  data/clean/measurements_clean.csv

source("scripts/paths.R")

raw <- read.csv(file.path(raw_data_path, "measurements.csv"))

clean <- raw
clean$date  <- as.Date(clean$date)
clean$month <- format(clean$date, "%Y-%m")

# Example cleaning rule: negative values are instrument errors
n_dropped <- sum(clean$value < 0)
clean <- clean[clean$value >= 0, ]

write.csv(clean, file.path(clean_data_path, "measurements_clean.csv"), row.names = FALSE)
cat("Dropped", n_dropped, "negative values;", nrow(clean), "rows written to data/clean/\n")
