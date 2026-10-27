# Folder paths used by every script.
# Paths are relative to the project folder, so always open project.Rproj first.

raw_data_path   <- "data/raw"
clean_data_path <- "data/clean"
output_path     <- "output"
figures_path    <- "figures"

# Create any folders that don't exist yet (data/ isn't stored in git)
for (path in c(raw_data_path, clean_data_path, output_path, figures_path)) {
  dir.create(path, recursive = TRUE, showWarnings = FALSE)
}
