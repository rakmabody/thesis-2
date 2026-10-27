# Step 4: figures and tables for the manuscript -> figures/
#
# Reads:   data/clean/measurements_clean.csv, output/monthly_means.csv
# Writes:  figures/timeseries.png
#          figures/table1_monthly_means.csv

source("scripts/paths.R")

clean <- read.csv(file.path(clean_data_path, "measurements_clean.csv"))
clean$date <- as.Date(clean$date)
monthly_means <- read.csv(file.path(output_path, "monthly_means.csv"))

# ---- Figure: daily values by site ----
sites <- unique(clean$site)
png(file.path(figures_path, "timeseries.png"), width = 8, height = 4, units = "in", res = 150)
plot(NULL, xlim = range(clean$date), ylim = range(clean$value),
     xlab = "Date", ylab = "Value (units)", xaxt = "n")
axis.Date(1, clean$date)
for (i in seq_along(sites)) {
  d <- clean[clean$site == sites[i], ]
  lines(d$date, d$value, col = i)
}
legend("topright", legend = sites, col = seq_along(sites), lty = 1, bty = "n")
invisible(dev.off())

# ---- Table 1: monthly means, one column per site ----
table1 <- reshape(monthly_means, idvar = "month", timevar = "site", direction = "wide")
names(table1) <- sub("^value\\.", "", names(table1))
write.csv(table1, file.path(figures_path, "table1_monthly_means.csv"), row.names = FALSE)

cat("Wrote figures/timeseries.png and figures/table1_monthly_means.csv\n")
