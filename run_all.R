# Re-run the whole project from scratch, in order.
# Open project.Rproj in RStudio, then: source("run_all.R")
# local = new.env() runs each script in a clean workspace, so a script
# can't accidentally use objects left over from an earlier one.

source("scripts/01_download_data.R", local = new.env())
source("scripts/02_clean_data.R", local = new.env())
source("scripts/03_analysis.R", local = new.env())
source("scripts/04_figures_tables.R", local = new.env())