# Local Newspaper Endorsements Archive

**Authors:** Kevin DeLuca, Jim Snyder, Tyler Simko, David Beavers (contact: kevin.deluca@yale.edu)

## Abstract

The Local Newspaper Endorsements Archive represents the largest systematic collection of newspaper endorsements for political candidates and ballot measures from U.S. newspapers, spanning from 1900 to the present day. The dataset currently contains over 30,000 endorsements and continues to grow as additional records are digitized and added. This comprehensive historical record enables researchers to examine newspaper editorial behavior across more than a century of American politics, revealing patterns of partisan bias, editorial slant, and evolving media influence on electoral outcomes. The endorsements also provide a novel measure of candidate quality: candidates who receive support from newspapers with diverse partisan leanings demonstrate broader appeal and measurable strength as political contenders. By combining historical depth with ongoing updates, this archive serves as an essential resource for scholars studying the intersection of media, politics, and democracy.

## Contributors

Kevin DeLuca, Jim Snyder, Tyler Simko, David Beavers, Grace Aitken, Andrew Beingessner, Mary Fahy, Will Forbes, Sabrina Goldfischer, Khuan-Yu Hall, Owen Hannon, Patricia Hughes, Sasha Jones, Zoe Kava, Natasha Khazzam, Matthew Kind, Marina Legoretta, Julia Lin, Emily Mao, Nat Markey, William Porayouw, Alexandra Schoettler, Evan Sun, and Karen Yang.

## Overview

The Local Newspaper Endorsements Archive contains historical newspaper endorsements for political candidates and propositions (including amendments, ballot questions, referenda, etc.) from local newspapers across the United States. This dataset provides a comprehensive resource for studying newspaper behavior, candidate quality, and media bias.

## Citation

If you use this dataset in your research, please cite:

> DeLuca, Kevin, James M. Snyder Jr., Tyler Simko, and David Beavers. 2025. "Local Newspaper Endorsements Database", Version TBD. [URL to be added]

If you use either the quality estimates or the partisan bias estimates, please cite:

> DeLuca, Kevin. 2025. "Editor's Choice: Measuring Candidate Quality using Local Newspaper Endorsements." *Journal of Politics*, XX(X):XXX-XXX. https://doi.org/10.1086/736463

## Data Files

Candidate endorsements: 

Proposition endorsements: 

### Candidate Quality Estimates: 
Candidates who receive endorsements from newspapers with diverse partisan leanings are rated as higher quality. The intuition is that endorsements from ideologically varied sources provide stronger evidence of genuine candidate merit, as papers with different biases must overcome their predispositions to support the same candidate.

Quality estimates:

### Partisan Bias Estimates: 
A newspaper's partisan bias is measured by the average party affiliation of candidates it endorses. Papers that consistently endorse candidates from one party are classified as having stronger partisan leanings, while those with more balanced endorsement patterns are considered more nonpartisan.

Newspaper partisan bias estimates: 

If you use either the quality estimates or the partisan bias estimates, please cite:

> DeLuca, Kevin. 2025. "Editor's Choice: Measuring Candidate Quality using Local Newspaper Endorsements." *Journal of Politics*, XX(X):XXX-XXX. https://doi.org/10.1086/736463

## Updates and Versions

This dataset is updated periodically. For the most current version and previous iterations, visit the [newspaper_endorsements repository](https://github.com/kevinedeluca/newspaper_endorsements) on GitHub.

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
| `office` | Office being endorsed |
| `dist` | District number (if applicable) |
| `dname` | District name or clarification (county name for county offices, etc.) |
| `state_election` | State of the election (may differ from `state_newspaper` for cross-state endorsements) |
| `cand_name` | Name of the endorsed candidate |
| `party` | Party affiliation of candidate: `D` (Democratic), `R` (Republican), `LBT` (Libertarian), `PROG` (Progressive), `IND` (Independent), `NP` (Non-partisan), or other scattered codes |
| `endorsed` | 1 if endorsed, 0 if explicitly not endorsed |
| `d_inc` | 1 if Democrat is incumbent, 0 otherwise |
| `r_inc` | 1 if Republican is incumbent, 0 otherwise |
| `o_inc` | 1 if candidate from other party or independent is incumbent, 0 otherwise |
| `notes_endorse` | Additional notes about the endorsement (include "incumbent" status, "neither endorsed," "both endorsed," etc. when applicable) |

### Proposition/Amendment Endorsements
Dataset containing newspaper endorsements of ballot measures, propositions, and amendments.

| Variable | Description |
|----------|-------------|
| `state_newspaper` | Two-letter abbreviation for state where the newspaper is located |
| `newspaper` | Name of the newspaper |
| `newspaper_id` | Unique identifier for the newspaper |
| `year` | Year of the election |
| `state_election` | State of the proposition (may differ from `state_newspaper` for cross-state endorsements) |
| `prop_type` | Type of measure: "proposition," "amendment," "question," etc. |
| `prop_num` | Proposition number or identifier (e.g., "101" or "2B") |
| `prop_desc` | Short description (one sentence or less) of the ballot measure |
| `endorsed` | 1 if endorsed/recommended, 0 if not endorsed |
| `notes_endorse` | Additional notes about the proposition or endorsement |
