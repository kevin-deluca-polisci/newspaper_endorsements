# compile_all.R
# Compiles QA-approved candidate and proposition CSVs into two master files:
#   all_candidates.csv and all_propositions.csv
#
# Reads from qa_manifest.csv to determine which newspaper folders to include.
# Only folders that have passed QA (listed in the manifest) are compiled.
#
# Usage:
#   cd "Processing Code"
#   Rscript compile_all.R
#
# Or from the repo root:
#   Rscript "Processing Code/compile_all.R"
#
# Output goes to Compiled Data/ in the repo root.

library(readr)
library(readxl)
library(dplyr)
library(stringr)
library(purrr)

# ── Configuration ──────────────────────────────────────────────────────────────

# Find repo root (parent of Processing Code/)
script_dir <- tryCatch(
  dirname(sys.frame(1)$ofile),
  error = function(e) "."
)

# Try to locate qa_manifest.csv
if (file.exists(file.path(script_dir, "qa_manifest.csv"))) {
  manifest_path <- file.path(script_dir, "qa_manifest.csv")
  repo_root <- dirname(script_dir)
} else if (file.exists("qa_manifest.csv")) {
  manifest_path <- "qa_manifest.csv"
  repo_root <- ".."
} else if (file.exists(file.path("Processing Code", "qa_manifest.csv"))) {
  manifest_path <- file.path("Processing Code", "qa_manifest.csv")
  repo_root <- "."
} else {
  stop("Cannot find qa_manifest.csv. Run from Processing Code/ or repo root.")
}

output_dir <- file.path(repo_root, "Compiled Data")
dir.create(output_dir, showWarnings = FALSE)

# Standard column schemas
candidate_cols <- c(
  "state_newspaper", "newspaper", "newspaper_id", "year", "office", "dist",
  "dname", "state_election", "cand_name", "party", "endorsed",
  "d_inc", "r_inc", "o_inc", "notes_endorse", "extraction_confidence"
)

proposition_cols <- c(
  "state_newspaper", "newspaper", "newspaper_id", "year", "state_election",
  "prop_type", "prop_num", "prop_desc", "endorsed", "notes_endorse",
  "extraction_confidence"
)

# ── Read manifest ─────────────────────────────────────────────────────────────

cat("Reading QA manifest...\n")
manifest <- read_csv(manifest_path, col_types = cols(.default = "c"),
                     show_col_types = FALSE)
cat(sprintf("  %d QA-approved folders in manifest\n", nrow(manifest)))

# ── Helper functions ───────────────────────────────────────────────────────────

read_data_file <- function(path) {
  ext <- tolower(tools::file_ext(path))
  if (ext == "csv") {
    df <- read_csv(path, col_types = cols(.default = "c"), show_col_types = FALSE)
  } else if (ext %in% c("xlsx", "xls")) {
    df <- read_excel(path, col_types = "text")
  } else {
    warning("Skipping unknown file type: ", path)
    return(NULL)
  }
  names(df) <- str_trim(tolower(names(df)))
  df
}

standardize_candidates <- function(df, source_folder) {
  name_map <- c(
    "state" = "state_newspaper", "st" = "state_newspaper",
    "name" = "cand_name", "candidate" = "cand_name",
    "candidate_name" = "cand_name",
    "district" = "dist",
    "confidence" = "extraction_confidence",
    "notes" = "notes_endorse",
    "newspaper_name" = "newspaper"
  )
  for (old_name in names(name_map)) {
    new_name <- name_map[[old_name]]
    if (old_name %in% names(df) && !new_name %in% names(df)) {
      names(df)[names(df) == old_name] <- new_name
    }
  }
  df$source_folder <- source_folder
  for (col in candidate_cols) {
    if (!col %in% names(df)) df[[col]] <- NA_character_
  }
  df <- df[, c(candidate_cols, "source_folder"), drop = FALSE]
  df
}

standardize_propositions <- function(df, source_folder) {
  name_map <- c(
    "state" = "state_newspaper", "st" = "state_newspaper",
    "confidence" = "extraction_confidence",
    "notes" = "notes_endorse",
    "newspaper_name" = "newspaper"
  )
  for (old_name in names(name_map)) {
    new_name <- name_map[[old_name]]
    if (old_name %in% names(df) && !new_name %in% names(df)) {
      names(df)[names(df) == old_name] <- new_name
    }
  }
  df <- df[, !names(df) %in% c("newspaper_type"), drop = FALSE]
  df$source_folder <- source_folder
  for (col in proposition_cols) {
    if (!col %in% names(df)) df[[col]] <- NA_character_
  }
  df <- df[, c(proposition_cols, "source_folder"), drop = FALSE]
  df
}

fix_party_labels <- function(x) {
  case_when(
    x %in% c("Democratic", "democratic") ~ "Democrat",
    x %in% c("GOP", "gop") ~ "Republican",
    x %in% c("Dem", "D", "dem") ~ "Democrat",
    x %in% c("Rep", "R", "rep") ~ "Republican",
    x %in% c("Ind", "I", "ind") ~ "Independent",
    x %in% c("Lib", "lib") ~ "Libertarian",
    TRUE ~ x
  )
}

fix_state_field <- function(x) {
  ifelse(!is.na(x) & nchar(x) > 2, substr(x, 1, 2), x)
}

# ── Main logic ────────────────────────────────────────────────────────────────

cat("\nCompiling from manifest...\n")
all_candidates <- list()
all_propositions <- list()
skipped <- character()

for (i in seq_len(nrow(manifest))) {
  row <- manifest[i, ]
  folder_name <- row$folder_name

  # Candidates
  cand_path_rel <- row$candidates_csv
  if (!is.na(cand_path_rel) && nchar(trimws(cand_path_rel)) > 0) {
    cand_path <- file.path(repo_root, cand_path_rel)
    if (file.exists(cand_path)) {
      cat(sprintf("  Reading candidates: %s\n", cand_path_rel))
      df <- read_data_file(cand_path)
      if (!is.null(df) && nrow(df) > 0) {
        df <- standardize_candidates(df, folder_name)
        all_candidates <- c(all_candidates, list(df))
      }
    } else {
      cat(sprintf("  WARNING: File not found: %s\n", cand_path_rel))
      skipped <- c(skipped, paste0(folder_name, " (candidates missing)"))
    }
  }

  # Propositions
  prop_path_rel <- row$propositions_csv
  if (!is.na(prop_path_rel) && nchar(trimws(prop_path_rel)) > 0) {
    prop_path <- file.path(repo_root, prop_path_rel)
    if (file.exists(prop_path)) {
      cat(sprintf("  Reading propositions: %s\n", prop_path_rel))
      df <- read_data_file(prop_path)
      if (!is.null(df) && nrow(df) > 0) {
        df <- standardize_propositions(df, folder_name)
        all_propositions <- c(all_propositions, list(df))
      }
    } else {
      cat(sprintf("  WARNING: File not found: %s\n", prop_path_rel))
      skipped <- c(skipped, paste0(folder_name, " (propositions missing)"))
    }
  }
}

# ── Combine and clean ─────────────────────────────────────────────────────────

cat("\nCombining datasets...\n")

if (length(all_candidates) > 0) {
  master_candidates <- bind_rows(all_candidates)

  master_candidates <- master_candidates %>%
    mutate(
      state_newspaper = fix_state_field(state_newspaper),
      state_election  = fix_state_field(state_election),
      party           = fix_party_labels(party),
      year            = as.integer(year),
      endorsed        = case_when(
        tolower(endorsed) %in% c("1", "yes", "true") ~ "1",
        tolower(endorsed) %in% c("0", "no", "false") ~ "0",
        TRUE ~ endorsed
      )
    )

  # Deduplicate
  n_before <- nrow(master_candidates)
  master_candidates <- master_candidates %>%
    group_by(newspaper, year, office, dist, cand_name, state_election) %>%
    arrange(desc(as.numeric(extraction_confidence))) %>%
    slice(1) %>%
    ungroup() %>%
    arrange(state_newspaper, newspaper, year, office, cand_name)
  n_after <- nrow(master_candidates)

  out_path <- file.path(output_dir, "all_candidates.csv")
  write_csv(master_candidates, out_path, na = "")
  cat(sprintf(
    "  Candidates: %d records from %d newspapers (%d duplicates removed)\n",
    n_after, n_distinct(master_candidates$newspaper), n_before - n_after
  ))
} else {
  cat("  No candidate data found.\n")
}

if (length(all_propositions) > 0) {
  master_propositions <- bind_rows(all_propositions)

  master_propositions <- master_propositions %>%
    mutate(
      state_newspaper = fix_state_field(state_newspaper),
      state_election  = fix_state_field(state_election),
      year            = as.integer(year),
      endorsed        = case_when(
        tolower(endorsed) %in% c("1", "yes", "true") ~ "1",
        tolower(endorsed) %in% c("0", "no", "false") ~ "0",
        TRUE ~ endorsed
      )
    )

  n_before <- nrow(master_propositions)
  master_propositions <- master_propositions %>%
    group_by(newspaper, year, state_election, prop_type, prop_num, prop_desc) %>%
    arrange(desc(as.numeric(extraction_confidence))) %>%
    slice(1) %>%
    ungroup() %>%
    arrange(state_newspaper, newspaper, year, prop_type, prop_num)
  n_after <- nrow(master_propositions)

  out_path <- file.path(output_dir, "all_propositions.csv")
  write_csv(master_propositions, out_path, na = "")
  cat(sprintf(
    "  Propositions: %d records from %d newspapers (%d duplicates removed)\n",
    n_after, n_distinct(master_propositions$newspaper), n_before - n_after
  ))
} else {
  cat("  No proposition data found.\n")
}

# ── Summary ──────────────────────────────────────────────────────────────────

cat("\n── Summary ──────────────────────────────────────\n")
cat(sprintf("Manifest entries: %d\n", nrow(manifest)))
if (length(skipped) > 0) {
  cat(sprintf("Missing files: %s\n", paste(skipped, collapse = ", ")))
}
if (exists("master_candidates")) {
  cat(sprintf("Candidates:   %d records, %d newspapers, years %d-%d\n",
              nrow(master_candidates),
              n_distinct(master_candidates$newspaper),
              min(master_candidates$year, na.rm = TRUE),
              max(master_candidates$year, na.rm = TRUE)))
}
if (exists("master_propositions")) {
  cat(sprintf("Propositions: %d records, %d newspapers, years %d-%d\n",
              nrow(master_propositions),
              n_distinct(master_propositions$newspaper),
              min(master_propositions$year, na.rm = TRUE),
              max(master_propositions$year, na.rm = TRUE)))
}
cat(sprintf("Output: %s/\n", output_dir))
cat("Done.\n")
