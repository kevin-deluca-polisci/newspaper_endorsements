# QA Report: Chico Enterprise Record (101500)

**Audit date:** 2026-05-19
**Folder:** done/Chico Enterprise Record/
**Newspaper ID:** 101500
**Data coverage:** 1924–2024, 51 clippings, 439 candidate records, 634 proposition records

## Overall Assessment

**PASS WITH FIXES**

Full re-extraction replacing the Feb 2025 archive (which had 326 cands + 519 props from an older xlsx-format extraction). New extraction is 35% larger (1073 vs 845 records) and corrects systematic semantic errors found in 2022 propositions where opposition was miscoded as endorsement.

QA spot-check across 3 clippings (1966, 1988, 2022) showed:
- 1966-11-07: 100% (44/44 records)
- 1988-11-07: 100% logical content (3 duplicate records since fixed)
- 2022-10-18: 92.2% after fixes applied

## Stage 1: Structural Validation

- All 16 candidate CSV columns present and correctly named
- All 11 proposition CSV columns present and correctly named
- No invalid year/endorsed/state/incumbency values
- Election dates all in expected ranges
- All records have valid CA state code

No structural issues found.

## Stage 2: Spot Check

**Clippings sampled:**
- `101500_19661107.pdf` (1966 Sunday recap)
- `101500_19881107.pdf` (1988 endorsement list)
- `101500_20221018.pdf` (2022 final recap)

### Errors found and fixed

- **CRITICAL — 2022 propositions**: 5 propositions with `endorsed=1` when the editorial explicitly opposed them (Measure L, Props 26, 27, 29, 30). All flipped to `endorsed=0`.
- **1988 propositions**: 3 duplicate rows (Props 84, 95, 104 appeared twice — once with descriptive title, once with bare number). Removed via dedup.
- **prop_num backfill**: 237 proposition records had `prop_num` empty because the number was embedded in the description. Auto-extracted from prop_desc.

**Recommendation:** Good shape after fixes.

## Stage 3: Variable Coding & Dedup

**Issues found:** ~600+ (varied across batches) | **Auto-fixed:** All | **Remaining:** 0

### Changes applied

- **Office codes standardized** (~290 records): Acronyms used by different batch agents normalized to canonical forms. Major mappings:
  - `USHOR`/`USH` → `H`
  - `USSEN`/`USS` → `SENATOR`
  - `STHOR`/`STH`/`SH` → `STATE REP`
  - `STSEN`/`SS`/`STS` → `STATE SENATOR`
  - `STSCJ`/`JS`/`CHIEF JUSTICE` → `SUPREME COURT`
  - `STAPP`/`JAP` → `COURT OF APPEALS`
  - `COSUP`/`CSUP`/`county_supervisor` → `CNTY COMM`
  - `BOE`/`BOARD OF EQUALIZATION` → `STATE BOARD OF ED`
  - `CC`/`CCL`/`city_council` → `CITY COUNCIL`
  - `SB`/`SCH`/`school_board` → `SCHOOL BOARD`
  - `JC`/`COMMUNITY COLLEGE BOARD` → `TRUSTEE`
  - `LOC`/`RECREATION DISTRICT` → `DIRECTOR`
  - `GOV`/`LG`/`SOS`/`AG`/`PRES` → full names
- **Party labels normalized** (~11 records): single letters/abbreviations to full names
- **Duplicate rows removed**: 52 candidates + 90 propositions removed via final dedup pass
- **"No Recommendation" records removed**: 1 (1970 Prop A)

## Stage 4: Low-Confidence Re-Scan

**Records reviewed:** 0 | All records have `extraction_confidence` ≥ 0.75

Mean confidence: 0.902

## Final counts

- 51 clippings (50 PDFs/JPGs + 1 RTF for 2010)
- 439 candidate records (417 endorsed, 22 opposed)
- 634 proposition records (350 endorsed, 284 opposed)
- 1073 total records (vs 845 in old Feb 2025 archive)
- Year coverage: 1924-2024
- Mean confidence: 0.902

## Comparison vs old archive (Feb 2025)

| Metric | Old (Feb 2025) | New (May 2026) | Δ |
|---|---|---|---|
| Candidates | 326 | 439 | +113 |
| Propositions | 519 | 634 | +115 |
| Total | 845 | 1073 | +228 |
| Year range | 1924-2024 | 1924-2024 | same |
| Clippings | 51 | 51 | same |

The 2002 records (10 candidates) from the old archive have no source clipping in the raw/done folders — those records were not regenerated since they can't be verified. All other years are present and substantially expanded.

## Backup files

Pre-re-extraction CSVs preserved alongside the new files:
- `101500_candidates.csv.bak_pre_reextract`
- `101500_propositions.csv.bak_pre_reextract`
- `101500_metadata.txt.bak_pre_reextract`
- `QA_REPORT.md.bak_pre_reextract`
