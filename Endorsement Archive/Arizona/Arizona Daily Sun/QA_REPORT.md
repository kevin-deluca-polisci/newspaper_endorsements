# QA Report: Arizona Daily Sun (100580)

**Audit date:** 2026-04-29
**Folder:** Arizona Daily Sun (Flagstaff)
**Newspaper ID:** 100580
**Data coverage:** 1990-2014 (13 election years), 51 clippings, 125 candidate records, 78 proposition records

## Overall Assessment

**PASS WITH NOTES**

The original `raw/Arizona Daily Sun` folder had 82 mixed-paper clippings. After OCR-based identification, only **51 of the 82 were actually from the Flagstaff Arizona Daily Sun**. The other 29 were from the Tucson Arizona Daily Star (moved to a separate `done/Arizona Daily Star/` folder) and 2 image clippings from a separate Phoenix Black-press paper called "The Arizona Sun" (set aside in `raw/Arizona Sun_NOID_Phoenix/`).

The 51 retained Daily Sun clippings cover the modern era 1990-2014, with strong coverage of Flagstaff/Coconino County local races (school board, county supervisors, sheriff) and Arizona statewide propositions/candidates.

## Stage 0: Folder Setup & Misfile Recovery

- **Original location:** `raw/Arizona Daily Sun` (mixed papers)
- **Misfile breakdown:**
  - 29 PDFs (1922-2008 era, named `100580_*MMDD.pdf`) → actually Arizona Daily Star (Tucson) → moved to `raw/Arizona Daily Star_100750/`
  - 2 JPGs (1960, 1962) → actually "The Arizona Sun" Phoenix Black-press paper (not in GS panel) → moved to `raw/Arizona Sun_NOID_Phoenix/`
  - **51 PDFs (1990-2014)** → confirmed Flagstaff Arizona Daily Sun → kept in this folder
- **Naming:** All 51 retained clippings renamed to standard `100580_YYYYMMDD[_vN].pdf` format with dates extracted from newspapers.com headers

## Stage 1: Structural Validation

- 16 candidate columns + 11 proposition columns (canonical schema)
- Year range 1990-2014, 13 unique election years, all even
- All `endorsed` values valid (1/0/empty)
- All `state_newspaper` and `state_election` populated as `AZ`
- All `newspaper_id` populated as `100580`
- 0 incumbency `=0` errors
- 0 junk rows
- 0 confidence values out of `[0,1]` range

## Stage 2: Spot Check

Verified content against source PDFs:
- 1996 Pres: Bob Dole (R) endorsed; Bill Clinton (D inc) opposed
- 2008 Pres v2: explicit no-endorsement (paper declined to pick Obama vs McCain)
- 2010 Gov: Goddard (D) endorsed; Brewer (R inc) opposed
- 2014 Endorsements full slate: Kirkpatrick (D) for House CD-1, DuVal for Governor, Garcia for Sec State, plus mayoral, FUSD school board, multiple props

Notable: 3 clippings explicitly contained **no endorsement** (paper declined to pick): 2004-10-31 (CD1 Babbitt vs Renzi), 2006-11-05 (CD1 all 3 opposed), 2008-11-02 v2 (Pres Obama vs McCain).

## Stage 3: Variable Coding & Dedup

- 20 distinct office codes — all standard or accepted-local. Notable: CORPORATION COMMISSION (4), SCHOOL BOARD (23 — strong FUSD coverage), CITY COUNCIL.
- 5 party values: Democrat (45), Republican (42), Libertarian (3), Independent (1), empty (34). The 34 empty values are mostly School Board (nonpartisan), local races, and propositions.
- All names ALL CAPS in `LASTNAME, FIRSTNAME` format. 0 format issues.
- 0 (year, cand_name, office, dist) duplicates.
- 0 proposition duplicates.

## Stage 4: Low-Confidence Re-Scan

21 cand records < 0.85 (mean 0.896, min 0.40); 17 prop records < 0.85 (mean 0.869, min 0.40). Most cluster in:
- 2006 props summary (very small text)
- 2010 Gov small-text endorsement
- 2002 single-race articles where party wasn't stated

All low-conf records carry detailed `extraction_confidence_note` fields documenting OCR limitations.

## Final dataset summary

### Candidates (125 records, 13 election years)
- Endorsed: 81 (64.8%)
- Opposed: 39 (31.2%)
- No-direction: 5 (4.0%)

### Propositions (78 records)
- Endorsed: 45 (57.7%)
- Opposed: 30 (38.5%)
- No-direction: 3 (3.8%)

## Coverage notes

- **Editorial pattern:** Arizona Daily Sun (Flagstaff) is independent-minded and willing to decline endorsements. Three explicit no-endorsements in this dataset (2004 CD1, 2006 CD1, 2008 Pres). Mix of Democratic and Republican picks across years.
- **Strong local coverage:** Heavy focus on Flagstaff/Coconino County races — School Board (23 records), County Supervisor, Sheriff, Mayor — alongside Arizona statewide candidates and propositions.
- **Heavy proposition coverage:** 78 prop records across 13 years; the Sun publishes individual prop-by-prop editorials in late October.
- **Folder note:** The `raw/Arizona Sun_NOID_Phoenix/` folder contains 2 JPG clippings (1960, 1962) from a different paper of the same name — a Phoenix Black-press paper from 1942-1962 that's not in the GS member panel. Those JPGs are not included in this dataset.
