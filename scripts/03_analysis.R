# Step 3: analysis on clean data -> output/
#
# Reads:   data/clean/measurements_clean.csv
# Writes:  output/monthly_means.csv
#
# Save results here that are slow to re-run, so the figure script
# doesn't have to redo the analysis every time.

source("scripts/paths.R")

clean <- read.csv(file.path(clean_data_path, "measurements_clean.csv"))

monthly_means <- aggregate(value ~ site + month, data = clean, FUN = mean)
monthly_means$value <- round(monthly_means$value, 2)

write.csv(monthly_means, file.path(output_path, "monthly_means.csv"), row.names = FALSE)
cat("Wrote output/monthly_means.csv\n")
