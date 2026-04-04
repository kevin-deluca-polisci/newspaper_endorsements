# Local Newspaper Endorsements Archive

**Authors:** Kevin DeLuca, Jim Snyder, Tyler Simko, David Beavers (contact: kevin.deluca@yale.edu)

## Abstract

The Local Newspaper Endorsements Archive represents the largest systematic collection of newspaper endorsements for political candidates and ballot measures from U.S. newspapers, spanning from 1882 to the present day. The dataset currently contains over 5,337 endorsement records across 17 newspapers in 7 states and continues to grow as additional records are digitized and added. This comprehensive historical record enables researchers to examine newspaper editorial behavior across more than a century of American politics, revealing patterns of partisan bias, editorial slant, and evolving media influence on electoral outcomes. The endorsements also provide a novel measure of candidate quality: candidates who receive support from newspapers with diverse partisan leanings demonstrate broader appeal and measurable strength as political contenders. By combining historical depth with ongoing updates, this archive serves as an essential resource for scholars studying the intersection of media, politics, and democracy.

## Contributors

Kevin DeLuca, Jim Snyder, Tyler Simko, David Beavers, Grace Aitken, Andrew Beingessner, Mary Fahy, Will Forbes, Sabrina Goldfischer, Khuan-Yu Hall, Owen Hannon, Patricia Hughes, Sasha Jones, Zoe Kava, Natasha Khazzam, Matthew Kind, Marina Legoretta, Julia Lin, Emily Mao, Nat Markey, William Porayouw, Alexandra Schoettler, Evan Sun, and Karen Yang.

## Overview

The Local Newspaper Endorsements Archive contains historical newspaper endorsements for political candidates and propositions (including amendments, ballot questions, referenda, etc.) from local newspapers across the United States. This dataset provides a comprehensive resource for studying newspaper behavior, candidate quality, and media bias.

## Current Coverage

| State | Newspaper | ID | Candidates | Propositions | Year Range |
|-------|-----------|---:|----------:|-----------:|-----------|
| Alabama | Anniston Star | 100050 | 34 | 33 | 2008-2016 |
| California | Chico Enterprise Record | 101500 | 326 | 519 | 1924-2024 |
| California | Los Angeles Times | 103000 | 515 | 1,196 | 1882-2022 |
| California | Oakland Tribune | 103350 | 152 | 695 | 1930-2024 |
| California | Santa Maria Times | 104700 | 145 | 226 | 1958-2008 |
| Indiana | Evansville Courier | 113151 | 43 | 0 | 1918-1948 |
| Indiana | Evansville Press | 113152 | 48 | 3 | 1918-1958 |
| Ohio | Akron Beacon Journal | 134150 | 117 | 22 | 2008-2018 |
| South Carolina | Aiken Standard | 143060 | 23 | 3 | 1952-1976 |
| Tennessee | Chattanooga_Times | 143902 | 121 | 10 | 1922-1962 |
| Texas | Austin American | 144701 | 13 | 34 | 1960-1972 |
| Texas | Austin American-Statesman | 144700 | 127 | 22 | 2008-2014 |
| Texas | Austin Chronicle | -- | 36 | 18 | 2012-2012 |
| Texas | Austin Statesman | 144702 | 9 | 9 | 1960-1972 |
| Texas | El Paso Herald | 1284 | 0 | 3 | 1920-1920 |
| Texas | El Paso Herald Post | 145301 | 168 | 132 | 1934-1996 |
| Texas | El Paso Times | 145300 | 356 | 179 | 1920-2018 |
| **Total** | **17 newspapers, 7 states** | | **2,233** | **3,104** | **1882-2024** |

## Citation

If you use this dataset in your research, please cite:

> DeLuca, Kevin, James M. Snyder Jr., Tyler Simko, and David Beavers. 2025. "Local Newspaper Endorsements Database", Version TBD. [URL to be added]

If you use either the quality estimates or the partisan bias estimates, please cite:

> DeLuca, Kevin. 2025. "Editor's Choice: Measuring Candidate Quality using Local Newspaper Endorsements." *Journal of Politics*, XX(X):XXX-XXX. https://doi.org/10.1086/736463

## Repository Structure

```
newspaper_endorsements/
  Endorsement Archive/          # Individual newspaper folders organized by state
    California/
      Chico Enterprise Record/
        clippings/              # Scanned newspaper clippings (gitignored)
        101500_candidates.csv   # Candidate endorsement records
        101500_propositions.csv # Proposition endorsement records
        101500_metadata.txt     # Newspaper metadata and data quality notes
        QA_REPORT.md            # Quality assurance audit report
      Los Angeles Times/
      Oakland Tribune/
      Santa Maria Times/
    Indiana/
    ...
  Compiled Data/                # Master datasets compiled from all newspapers
    all_candidates.csv          # All candidate endorsements combined
    all_propositions.csv        # All proposition endorsements combined
  Augmented Data/               # Enriched datasets with external identifiers
    all_candidates_augmented.csv  # With ICPSR IDs, CFscores, DW-NOMINATE
  Estimates/                    # Research output estimates
    bias_estimates.dta          # Newspaper partisan bias estimates
    quality_estimates.dta       # Candidate quality estimates
  Processing Code/              # Scripts for compilation and processing
    compile_all.R               # Compiles individual CSVs into master datasets
    qa_manifest.csv             # Registry of QA-approved newspapers
    CombineDatasets.do          # Legacy Stata compilation script
  Project Documentation/        # RA handbook and reference materials
```

## Data Files

**Compiled datasets** (recommended for most users):

- [`Compiled Data/all_candidates.csv`](Compiled%20Data/all_candidates.csv) -- All candidate endorsements
- [`Compiled Data/all_propositions.csv`](Compiled%20Data/all_propositions.csv) -- All proposition endorsements

**Augmented dataset** (includes external identifiers for merging):

- [`Augmented Data/all_candidates_augmented.csv`](Augmented%20Data/all_candidates_augmented.csv) -- Candidate endorsements with ICPSR IDs, CFscores, and DW-NOMINATE scores

### Candidate Quality Estimates
Candidates who receive endorsements from newspapers with diverse partisan leanings are rated as higher quality. The intuition is that endorsements from ideologically varied sources provide stronger evidence of genuine candidate merit, as papers with different biases must overcome their predispositions to support the same candidate.

Quality estimates: [`Estimates/quality_estimates.dta`](Estimates/quality_estimates.dta)

### Partisan Bias Estimates
A newspaper's partisan bias is measured by the average party affiliation of candidates it endorses. Papers that consistently endorse candidates from one party are classified as having stronger partisan leanings, while those with more balanced endorsement patterns are considered more nonpartisan.

Newspaper partisan bias estimates: [`Estimates/bias_estimates.dta`](Estimates/bias_estimates.dta)

If you use either the quality estimates or the partisan bias estimates, please cite:

> DeLuca, Kevin. 2025. "Editor's Choice: Measuring Candidate Quality using Local Newspaper Endorsements." *Journal of Politics*, XX(X):XXX-XXX. https://doi.org/10.1086/736463

## Additional Research Papers

> DeLuca, Kevin, Daniel Moskowitz, and Benjamin Schneer. 2025. "A Drag on the Ticket? Estimating Top-of-the-Ticket Effects on Down-Ballot Races", _American Journal of Political Science_, https://doi.org/10.7910/DVN/J6C26T

## Variable Definitions

### Candidate Endorsements
Dataset containing newspaper endorsements of candidates for political office.

| Variable | Description |
|----------|-------------|
| `state_newspaper` | Two-letter abbreviation for state where the newspaper is located |
| `newspaper` | Name of the newspaper |
| `newspaper_id` | Unique identifier for the newspaper |
| `year` | Year of the election |
| `office` | Office being endorsed (e.g., PRESIDENT, GOVERNOR, SENATOR, H, STATE REP) |
| `dist` | District number (if applicable) |
| `dname` | District name or clarification (county name for county offices, etc.) |
| `state_election` | State of the election (may differ from `state_newspaper` for cross-state endorsements) |
| `cand_name` | Name of the endorsed candidate (ALL CAPS, LASTNAME, FIRSTNAME format) |
| `party` | Party affiliation: Democrat, Republican, Independent, Libertarian, etc. |
| `endorsed` | 1 if endorsed, 0 if explicitly opposed |
| `d_inc` | 1 if Democrat is incumbent |
| `r_inc` | 1 if Republican is incumbent |
| `o_inc` | 1 if other party/independent is incumbent |
| `notes_endorse` | Additional notes about the endorsement |
| `extraction_confidence` | Confidence score (0-1) from automated extraction |

### Proposition/Amendment Endorsements
Dataset containing newspaper endorsements of ballot measures, propositions, and amendments.

| Variable | Description |
|----------|-------------|
| `state_newspaper` | Two-letter abbreviation for state where the newspaper is located |
| `newspaper` | Name of the newspaper |
| `newspaper_id` | Unique identifier for the newspaper |
| `year` | Year of the election |
| `state_election` | State of the proposition (may differ from `state_newspaper` for cross-state endorsements) |
| `prop_type` | Type of measure: CONSTITUTIONAL AMENDMENT, BOND ISSUE, BALLOT MEASURE, etc. |
| `prop_num` | Proposition number or identifier |
| `prop_desc` | Short description of the ballot measure |
| `endorsed` | 1 if endorsed/recommended, 0 if opposed |
| `notes_endorse` | Additional notes about the proposition or endorsement |
| `extraction_confidence` | Confidence score (0-1) from automated extraction |

## Data Processing Pipeline

The endorsement data goes through a multi-stage pipeline:

1. **Extraction**: Scanned newspaper clipping PDFs are processed to extract candidate and proposition endorsements into standardized CSV format.
2. **Quality Assurance**: Each newspaper folder undergoes a 4-stage QA audit (structural validation, spot-check accuracy, variable coding review, low-confidence re-scan).
3. **RA Review**: Research assistants manually verify the extracted data, correcting errors and resolving ambiguous cases.
4. **Compilation**: The R script `compile_all.R` combines all QA-approved newspaper CSVs into master datasets.
5. **Augmentation**: Candidate records are linked to external databases (DIME/CFscore, Voteview/DW-NOMINATE, Gentzkow-Shapiro newspaper panel) for additional identifiers and ideological scores.

## License

This project is licensed under the MIT License. See [LICENSE](LICENSE) for details.
