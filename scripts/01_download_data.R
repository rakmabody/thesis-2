# Step 1: download raw data -> data/raw/
#
# In a real project this script would download your data (e.g., from an
# API), or the README would say exactly where it came from. Raw data can
# always be re-created, so it doesn't need to be in git.
#
# This example just generates fake measurements so the template runs.

source("scripts/paths.R")

set.seed(42)  # same "random" numbers every run = reproducible

baselines <- c("Site A" = 8, "Site B" = 12, "Site C" = 6)
dates <- seq(as.Date("2025-01-01"), by = "day", length.out = 90)

measurements <- do.call(rbind, lapply(names(baselines), function(site) {
  data.frame(site  = site,
             date  = dates,
             value = round(rnorm(length(dates), baselines[[site]], 4), 2))
}))

write.csv(measurements, file.path(raw_data_path, "measurements.csv"), row.names = FALSE)
cat("Wrote", nrow(measurements), "rows to data/raw/measurements.csv\n")
