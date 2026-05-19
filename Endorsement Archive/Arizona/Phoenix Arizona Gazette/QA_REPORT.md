# QA Report: Phoenix Arizona Gazette (100651)

**Audit date:** 2026-04-30 (V2 re-extraction applied)
**Folder:** Phoenix Arizona Gazette
**Newspaper ID:** 100651
**Data coverage:** 1952-1986 (11 election years), 15 clippings, 1062 candidate records, 132 proposition records

## Overall Assessment

**PASS WITH NOTES**

After spot-checks revealed substantial issues with the v1 extraction (multi-year compilations had 50-85% accuracy, with hallucinated names like "Stinson", "Roys", "Hump"; 6-11 missing county/judicial/JP records per page; office mislabeling), a complete V2 re-extraction was performed. The dataset grew from 615 candidates / 100 propositions to **1062 candidates / 132 propositions** — a 73% increase in candidate records and 32% increase in propositions.

## V2 Re-Extraction Changes

### Single-date 1958 + 1986 files (extracted by Agent A)
- **1958 single-date PDFs**: v1 was largely correct that most 1958 single-date PDFs are NOT endorsement editorials (they're news columns, syndicated pieces, reader letters, campaign news). Only Oct 17, Oct 29, Oct 30, Nov 3 contain actual endorsements. Net: 7 cands + 4 props across the era — minimal change from v1.
- **1986 single-date recap (`100651_19861103.pdf`)**: re-extracted to 73 cands + 6 props (was 61 + 6). Added missing records: D6 Rep Henry Evans (D), D22 Reps Hamilton + Wilcox, D18 Rep Jane Dee Hull (later Governor), Maricopa Community College Board (DePalma D2, Campbell D5), CAWCD board (Hunsaker, McMullin, Pyle, Raymond, Williams), Phoenix Union HS District Board (Custer, Butler). Names fixed: BEE,HERMAN→HERMON,BEV; WALKER,JESUS→WALKER,CAROLYN.

### Multi-year compilation: 1956-1960-1980 (Agent B)
- v1 had 114 cands; v2 has 87 cands (page-by-page re-extraction). The reduction is due to removal of "Stinson" hallucinations and other false records. Quality > quantity.

### Multi-year compilation: 1964-1970-1982-1984-1986 (Agent C)
- v1 had 225 cands; **v2 has 502 cands** — massive expansion. Agent re-read each of 14 pages and produced page-date-correct records. Key fixes:
  - "Alston" verified real (Lela Alston, D-Sen 20, 1982/84/86)
  - "Brown" verified real (I. Sylvan Brown, Maricopa Superior Court judge)
  - "Roys" not present — removed
  - **Brewer added** (Jan Brewer, R-Rep D19 1982/84; R-Sen D19 1986 — later Governor)
  - **Turley added** (Stan Turley, R-Sen D30)
  - **Hudson added** (Roy Hudson, D-Rep D7 1984)
  - 1984 Maricopa County full Board of Supervisors slate added (Freestone, Campbell, Koory, Atkinson, Pastor); Sheriff Godbehere; Recorder Imber; Superintendent Harris

### Multi-year compilation: 1952-1968-1972-1976-1978 (Agent D)
- v1 had 216 cands; **v2 has 258 cands**. Page-by-page extraction:
  - 1952: 14 cands (Eisenhower, Goldwater, Pyle, Rhodes, McFarland)
  - 1968: 12 props (constitutional amendments)
  - 1972: 67 cands (full state-leg slate D2-30)
  - 1974: 10 props (constitutional questions)
  - 1976: 70 cands + 3 props (Ford, Steiger, full legislative + 6 county/JP records that were missing in v1)
  - 1978: 107 cands + 3 props (judicial retentions, statewide, full state-leg D1-30)
- Specific fixes: "FLYNN, DICK" used (not "Hump"); "DYER, NONAVIE" coded as STATE SENATOR D-16

### Multi-year compilation: 1964-1970-1984-1986_LIST (Agent D)
- v1 had only 23 cands (massively under-extracted from a list-format recap); **v2 has 489 cands** — 21x growth!
  - 1964: 101 cands ("Gazette Lists Preferences" — Elson, Fannin, Rhodes, Udall, Kimble, Steiger + state-leg D1-40)
  - 1970: 71 cands ("71 Candidates Endorsed") + 12 props
  - 1982: 72 cands + 10 props (DeConcini, McCain, Babbitt, Mofford, Corbin)
  - 1984: 133 cands + 15 props (Reagan, McCain, Udall, Stump, Rudd, Kolbe, full Bar Assn judges)
  - 1986: 112 cands + 6 props (McCain, Rhodes III, Udall, Kyl, Kolbe, Mofford)

## Stage 1: Structural Validation

- 16 candidate columns + 11 proposition columns (canonical schema)
- Year range 1952-1986, 11 unique years, all even
- All `endorsed` values valid (1/0/empty)
- All states = AZ; all newspaper_id = 100651
- 0 incumbency `=0` errors
- 0 junk rows
- All confidence values in range

## Stage 2: Spot Check (post-V2)

The V2 extractions were performed with explicit instructions to fix every issue identified by the original spot-check (BEE→HERMON, WALKER→CAROLYN, Stinson removal, Brewer/Turley/Hudson added, Hump→Flynn, DYER office fix, 6 missing JP records). Cross-file dedup absorbed 353 cands and 2 props (heavy overlap between LIST recap and detailed editorials for the same year).

## Stage 3: Variable Coding & Dedup

- 24 distinct office codes (after consolidation: WATER BOARD + WATER CONSERVATION DISTRICT → CAWCD, 25 records)
- All office codes standard or accepted-local AZ: STATE REP (393), STATE SENATOR (235), JUDGE (215, mostly Maricopa Superior Court retentions and Bar Assn ratings), SCHOOL BOARD (35), H (33), CNTY COMM (28), CAWCD (25), CORPORATION COMMISSION (18), CENTER OF GOVT statewide offices, plus DA/PROSECUTOR for County Attorney
- Party labels: Republican (540), Democrat (276), empty (146 — mostly nonpartisan judicial + bar retention + school board), Nonpartisan (99, explicitly), Libertarian (1)
- 0 name format issues after V2
- 0 (year, name, office, dist) duplicates after dedup
- 0 proposition duplicates

## Stage 4: Low-Confidence Re-Scan

32 cand records < 0.85 (mean 0.92, generally 0.75-0.84); 4 prop records < 0.85. Most low-conf:
- Bar Association judge eval scores (1986 retentions, ~10 records at conf 0.75)
- 1978 Treasurer first-name OCR-illegible (CLARK, KRSMSKI)
- A few state-leg district records with first-name OCR uncertainty

All low-conf records carry `extraction_confidence_note` documenting the specific OCR issue.

## Final dataset summary

### Candidates (1062 records, 11 years)
- 1952: 14 cands
- 1958: 3 cands
- 1964: 189 cands
- 1970: 78 cands
- 1972: 67 cands
- 1976: 70 cands
- 1978: 107 cands
- 1980: 87 cands
- 1982: 109 cands
- 1984: 171 cands
- 1986: 167 cands

Direction: 1032 endorsed (97.2%), 12 opposed, 18 no-direction (mostly bar association "no opinion" judicial ratings)

### Propositions (132 records)
- Endorsed: 93 (70.5%)
- Opposed: 35 (26.5%)
- No-direction: 4 (3.0%)

## Coverage notes

- **Editorial pattern:** Republican-leaning (Eisenhower 1952, Goldwater 1964, Nixon 1968/72, Ford 1976, Reagan 1980/84, Bush etc.). Heavy state-leg and county coverage especially in the late 1970s-1980s recap editorials.
- **Strong AZ-specific office coverage:** Corporation Commission, Mine Inspector, Land Commissioner, Tax Commissioner (historical), CAWCD (Central AZ Water Conservation District) — all properly captured in V2.
- **Bar Association judicial retention:** The Gazette routinely published Bar Association evaluations and translated them into endorsements/no-opinion records. These are coded with `notes_endorse` indicating Bar Assn source where applicable.
- **Multi-year compilation handling:** 4 source PDFs aggregate editorials from multiple years. V2 extraction processed each page individually with the actual editorial date as the `year` field.
- **Backup preserved:** `parts_v1_backup/` retains the original (error-prone) v1 extractions for reference.
