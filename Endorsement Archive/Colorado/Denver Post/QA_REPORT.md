# QA Report: Denver Post (105650)

**Audit date:** 2026-04-30
**Folder:** Denver Post (Denver, CO)
**Newspaper ID:** 105650
**Data coverage:** 1968, 2000-2022 (12 election years), 102 clippings, 312 candidate records, 140 proposition records

## Overall Assessment

**PASS WITH NOTES**

New folder created from `raw/DENVER POST/` — 504 raw files reduced to **102 unique-content clippings via hash dedup** (80% duplication rate due to multiple naming-convention copies of same files). All clippings extracted and processed.

## Stage 0: Folder Setup

- **Source:** `raw/DENVER POST/` — 504 PDFs across 4+ naming conventions:
  - `105650_NoneMMDD_versionN.pdf` (~99 files)
  - `105650_YYYYMMDD_v*.pdf` (~100 files)
  - `105650_YYYY***.pdf` (with 4-digit year prefix)
  - `DELUCA_CO_DENVERPOST_105650_YYYYMMDD_*.pdf` (proper-date names)
  - `Denver_Post_YYYY_TopicName.pdf`
  - 1 explicit-date `DenverPost_19681105.pdf`
- **Hash dedup:** 504 → 102 unique hashes (402 duplicates removed)
- **Date extraction:** 100 of 102 had dates in DELUCA-style filenames; 2 inferred from web-page download dates (`Denver_Post_2008_Pres.pdf` → 2008-10-31; index page → 2022-11-21)
- **Naming:** all renamed to standard `105650_YYYYMMDD[_vN].pdf` format

## Stage 1: Structural Validation

- 16 candidate columns + 11 proposition columns (canonical schema)
- Year range 1968, 2000-2022, 12 unique election years
- All `endorsed` values valid (1/0/empty)
- All `state_newspaper` and `state_election` populated as `CO`
- All `newspaper_id` populated as `105650`
- 0 incumbency `=0` errors
- 0 junk rows
- 0 name format issues

## Stage 2: Spot Check

Verified against source PDFs:
- 1968-11-05: full-page recap with 61 candidates (Nixon-era)
- 2008-10-31: Romney editorial (despite Obama being the actual Denver Post endorsement, this is a contrarian "would be a better executive" piece)
- 2014-2017: individual single-race articles plus year-end recaps for state offices, US House, propositions
- 2018-2022: comprehensive coverage including Polis (D) for Governor twice; Bennet (D) re-elected; Hickenlooper (D) for US Senate over Gardner (R) in 2020
- 2022-11-14 recap: full slate including Polis-Anderson-Young-Bennet-Weiser; opposed Boebert (R) in CD3 (Frisch endorsed)

## Stage 3: Variable Coding & Dedup

- **22 distinct office codes** — all standard. Top: STATE REP (100), H (62), STATE SENATOR (32), DA/PROSECUTOR (12), TRANSIT BOARD (11), CITY COUNCIL (11), CU REGENT (10), SCHOOL BOARD (14, including 10 for DPS), STATE BOARD OF ED (10).
- Office code consolidation applied: `SBOE` → `STATE BOARD OF ED`; `SCHOOL BOARD (DPS)` → `SCHOOL BOARD` with `dist=DPS`.
- 5 party values: Democrat (151), Republican (115), empty (42 — mostly nonpartisan local offices like school board, judge, RTD), Libertarian (3), Independent (1).
- All names ALL CAPS in `LASTNAME, FIRSTNAME`. 0 format issues.
- Cross-file dedup absorbed 42 candidate matches and 1 proposition (heavy overlap because year-end recap editorials repeat individual-race endorsements).
- 0 (year, name, office, dist) duplicates after dedup.

## Stage 4: Low-Confidence Re-Scan

Most records at high confidence. Lower-conf clusters in:
- Some 2008 single-article files where party affiliation wasn't explicitly stated
- The 2022-11-21 index page (marked `no_endorsements`)

## Final dataset summary

### Candidates (312 records, 12 years)

- Endorsed: 248 (79.5%)
- Opposed: 62 (19.9%)
- No-direction: 2 (0.6%)

### Propositions (140 records)

- Endorsed: 80 (57.1%)
- Opposed: 59 (42.1%)
- No-direction: 1 (0.7%)

## Coverage notes

- **Editorial pattern:** Denver Post editorial board is moderate-to-Democrat-leaning in modern era. Endorsed Hickenlooper (D) over Gardner (R) for US Senate 2020; Bennet (D) over O'Dea (R) 2022; Polis (D) for Governor twice; Crow (D), Pettersen (D), Caraveo (D), Frisch (D over Boebert R) for House. Some cross-party picks (e.g., Anderson R for Sec State 2022 over Griswold D inc).
- **2008 anomaly:** the `Denver_Post_2008_Pres.pdf` file is a "Romney would be a better executive" article from 2012 archives reproduced on the 2008 page. The actual 2008 Denver Post endorsement was Obama. Year set to 2008 per filename and content context; flagged in extraction notes.
- **Strong propositions coverage:** 140 prop records across 2014-2022 with detailed engagement on Colorado's many ballot measures (Amendments, Propositions, Initiatives, Referendums, Ordinances, Questions, Issues).
- **Heavy state-leg engagement:** STATE REP (100) and STATE SENATOR (32) records reflect 2000-era full-slate state legislative endorsements.
- **DPS, RTD, City Council, CU Regent:** strong Denver-area local coverage.
- **Hash dedup was the heavy lifting:** 80% of source files were redundant copies under different naming conventions.
