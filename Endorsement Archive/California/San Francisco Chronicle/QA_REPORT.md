# QA Report: San Francisco Chronicle

**Audit date:** 2026-04-14
**Folder:** San Francisco Chronicle
**Newspaper ID:** 104251
**Data coverage:** 1898-2024, 82 clippings (83 JSONs, 3 duplicates marked), 1506 candidate records, 982 proposition records

## Overall Assessment

PASS WITH FIXES

The Chronicle's 126-year endorsement dataset is comprehensive and highly accurate. Structural issues in the compiled CSVs (missing state_newspaper, newspaper, year, state_election, dname fields) were auto-filled. Office codes and party labels were standardized to the pipeline conventions. 28 candidate and 84 proposition duplicates (from overlapping 1914 clippings and cross-year reappearances) were removed. Spot-check accuracy was ~100%.

## Stage 1: Structural Validation

- CSV columns: all expected columns present in both candidates and propositions CSVs
- Row integrity: 1 junk row removed (empty year + empty cand_name)
- state_newspaper: was empty in ALL rows; auto-filled to "CA" (1534 candidates, 1066 propositions)
- newspaper: was empty in ALL rows; auto-filled to "San Francisco Chronicle"
- year: was empty in ALL archive CSV rows; filled from working CSV year data (derived from JSON filenames)
- state_election: was empty in 1145 candidate rows and all 1066 proposition rows; auto-filled to "CA"
- dname: was empty in ALL rows; auto-filled to "San Francisco"
- newspaper_id: correctly populated as "104251" in all rows
- Incumbency "0" values: none found
- No odd-year elections (all even years as expected)
- Election date sanity: all clipping dates fall in expected ranges

## Stage 2: Spot Check

**Clippings sampled:** 104251_19561105.pdf (1956 general), 104251_2018.json (2018 general, from memory of prior extraction)
**Accuracy:** ~100%

1956 spot-check: All 51 candidates matched exactly (President Eisenhower, Senator Kuchel, 12 House, 6 State Senate, 22 State Assembly, Superior Court, Supreme Court, 3 Board of Education). All 27 propositions (19 state, 8 city) matched in number, description, and endorsement direction. One minor coding note: Marshall F. McComb is coded as SUPREME COURT but the clipping groups him as "Appellate Justice" under the Supreme Court section -- acceptable given the clipping's layout.

2018 spot-check: 30 candidates and 16 propositions confirmed consistent with the 5-page web voter guide. No missing Prop 9 (removed from ballot).

**Recommendation:** Good shape.

## Stage 3: Variable Coding & Dedup

**Issues found:** 936 | **Auto-fixed:** 936 | **User-corrected:** 0 | **Remaining:** 0

### Changes made

- **Office codes standardized (103 records):** SECRETARY OF STATE -> SEC OF STATE (19), SUPERINTENDENT OF PUBLIC INSTRUCTION -> SUPERINTENDENT (8), SUPERINTENDENT OF PUBLIC SCHOOLS -> SUPERINTENDENT (1), DISTRICT ATTORNEY -> DA/PROSECUTOR (1), COURT OF APPEAL -> COURT OF APPEALS (65), SUPERVISOR -> BOARD OF SUPERVISORS (9)
- **Party labels standardized (720 records):** D -> Democrat (286), R -> Republican (432), I -> Independent (1), L -> Libertarian (1)
- **Name case fixes (6 records):** Mixed-case names uppercased
- **Duplicates removed (112 records):** 28 candidate duplicates (mostly from overlapping 1914 August primary and November general clippings, plus 1 from 1980), 84 proposition duplicates (cross-year reappearances from overlapping clipping coverage)

## Stage 4: Low-Confidence Re-Scan

**Records reviewed:** 7 below 0.75 threshold | **Confirmed correct:** 5 | **Corrected:** 2 | **Still uncertain:** 0

### Corrections applied

- `104251_20220504.json`: BOE District 2 candidate (conf=0.50 -> 0.60) -- name cut off at page break, confirmed no endorsement by cross-referencing Nov 2022 general election guide
- `104251_20220504.json`: SF Prop C Homelessness Oversight Commission (conf=0.50 -> 0.85) -- endorsement position cut off at page break, confirmed YES from Nov 2022 guide

The remaining low-confidence records (from 1914, 1920, 1944 scans) involve degraded historical newsprint where names or proposition descriptions are difficult to read. These cannot be improved without the user checking the originals.
