# Local Newspaper Endorsements Archive

**Authors:** Kevin DeLuca, Jim Snyder, Tyler Simko, David Beavers (contact: kevin.deluca@yale.edu)

> **Note:** This archive is actively under construction. The newspapers and records currently available represent only a portion of our full collection. We are in the process of digitizing, extracting, quality-checking, and archiving additional newspapers on a rolling basis. Check back for updates.

## Abstract

The Local Newspaper Endorsements Archive represents the largest systematic collection of newspaper endorsements for political candidates and ballot measures from U.S. newspapers, spanning from 1882 to the present day. The dataset currently contains 60,765 endorsement records (44,729 candidates + 16,036 propositions) across 127 newspapers covering 32 states and the District of Columbia, and continues to grow as additional records are digitized and added. This comprehensive historical record enables researchers to examine newspaper editorial behavior across more than a century of American politics, revealing patterns of partisan bias, editorial slant, and evolving media influence on electoral outcomes. The endorsements also provide a novel measure of candidate quality: candidates who receive support from newspapers with diverse partisan leanings demonstrate broader appeal and measurable strength as political contenders. By combining historical depth with ongoing updates, this archive serves as an essential resource for scholars studying the intersection of media, politics, and democracy.

## Contributors

Kevin DeLuca, Jim Snyder, Tyler Simko, David Beavers, Grace Aitken, Andrew Beingessner, Mary Fahy, Will Forbes, Sabrina Goldfischer, Khuan-Yu Hall, Owen Hannon, Patricia Hughes, Sasha Jones, Zoe Kava, Natasha Khazzam, Matthew Kind, Marina Legoretta, Julia Lin, Emily Mao, Nat Markey, William Porayouw, Alexandra Schoettler, Evan Sun, and Karen Yang.

## Overview

The Local Newspaper Endorsements Archive contains historical newspaper endorsements for political candidates and propositions (including amendments, ballot questions, referenda, etc.) from local newspapers across the United States. This dataset provides a comprehensive resource for studying newspaper behavior, candidate quality, and media bias.

## Current Coverage

**127 newspapers** covering **32 states + the District of Columbia**, with elections from **1882 to 2024**.

| | Candidates | Propositions | Total |
|---|----------:|-----------:|------:|
| **Records (compiled)** | 44,729 | 16,036 | 60,765 |

| State | Newspapers | Records | Year Range |
|-------|----------:|--------:|-----------|
| Alabama | 5 | 1,962 | 1890-2016 |
| Arizona | 5 | 4,501 | 1920-2020 |
| California | 14 | 11,809 | 1882-2024 |
| Colorado | 2 | 1,042 | 1950-2022 |
| Connecticut | 1 | 58 | 1960-1974 |
| Delaware | 3 | 725 | 1960-2018 |
| District of Columbia | 1 | 1,318 | 1974-2020 |
| Florida | 3 | 3,145 | 1946-2022 |
| Georgia | 3 | 1,335 | 1960-2012 |
| Hawaii | 4 | 828 | 1900-2018 |
| Illinois | 2 | 649 | 1960-2004 |
| Indiana | 5 | 1,539 | 1918-2016 |
| Iowa | 3 | 401 | 1952-2020 |
| Kentucky | 1 | 235 | 1960-1990 |
| Louisiana | 2 | 549 | 1920-2014 |
| Massachusetts | 1 | 220 | 1964-2018 |
| Michigan | 2 | 4,903 | 1968-2022 |
| Minnesota | 4 | 378 | 1920-2020 |
| Montana | 1 | 250 | 1952-2010 |
| Nebraska | 3 | 1,116 | 1952-2018 |
| Nevada | 1 | 1,406 | 1968-2022 |
| New Jersey | 1 | 346 | 1978-2018 |
| New Mexico | 3 | 2,742 | 1882-2020 |
| North Carolina | 5 | 2,123 | 1950-2020 |
| Ohio | 6 | 4,391 | 1950-2022 |
| Oklahoma | 2 | 399 | 1920-1968 |
| Oregon | 1 | 585 | 1958-2000 |
| Pennsylvania | 8 | 1,883 | 1940-2022 |
| South Carolina | 9 | 1,612 | 1950-2020 |
| Tennessee | 7 | 612 | 1916-1974 |
| Texas | 14 | 3,447 | 1920-2022 |
| Washington | 2 | 2,825 | 1962-2018 |
| Wisconsin | 3 | 1,598 | 1928-2020 |

See [COVERAGE.md](COVERAGE.md) for the full per-newspaper breakdown.

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
    all_propositions_augmented.csv # With GS permid for newspaper-level linkage
  Estimates/                    # Research output estimates
    bias_estimates.dta          # Newspaper partisan bias estimates
    quality_estimates.dta       # Candidate quality estimates
  Project Documentation/        # RA handbook and reference materials
```

## Data Files

**Compiled datasets** (recommended for most users):

- [`Compiled Data/all_candidates.csv`](Compiled%20Data/all_candidates.csv) -- All candidate endorsements
- [`Compiled Data/all_propositions.csv`](Compiled%20Data/all_propositions.csv) -- All proposition endorsements

**Augmented dataset** (includes external identifiers for merging):

- [`Augmented Data/all_candidates_augmented.csv`](Augmented%20Data/all_candidates_augmented.csv) -- Candidate endorsements with ICPSR IDs, CFscores, and DW-NOMINATE scores
- [`Augmented Data/all_propositions_augmented.csv`](Augmented%20Data/all_propositions_augmented.csv) -- Proposition endorsements with Gentzkow-Shapiro newspaper permid for media panel linkage

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
4. **Compilation**: Individual QA-approved newspaper CSVs are compiled into master datasets.
5. **Augmentation**: Candidate records are linked to external databases (DIME/CFscore, Voteview/DW-NOMINATE, Gentzkow-Shapiro newspaper panel) for additional identifiers and ideological scores. Proposition records are linked to the Gentzkow-Shapiro newspaper panel via permid for newspaper-level analyses.

## License

This project is licensed under the MIT License. See [LICENSE](LICENSE) for details.
