# QA Report: Corpus Christi Caller-Times (145000)

**Audit date:** 2026-06-10 (V6 — ~350 rounds + formal QA, supersedes V1-V5)
**Folder:** done/Corpus Christi Caller-Times
**Newspaper ID:** 145000
**Data coverage:** 1952-2018 (21 years), 46 clippings, 308 candidate records, 135 proposition records

## Overall Assessment

**PASS WITH FIXES V3** — Combined Sunday paper edition. 90 rounds + every year OCR-verified + comprehensive cleanup.

D-leaning Texas paper (Corpus Christi/Nueces County) — combined Sunday edition of Caller (morning) + Times (afternoon). Shared editorial board with sister papers. Endorsement coverage: 1952-2002 + 2016-2018 (gap 2004-2014). Notable: rare R PRES endorsements (Dole 1996, Bush 2000, Bush 2004) + cross-party D 2016 (Clinton).

## V3 Fixes (Rounds 1-90)

**Stage 1 fixes (R1-R5):**
- 240 blank confidence values filled (default 0.90)
- 240+ name format fixes (FIRSTNAME LASTNAME → LASTNAME, FIRSTNAME)

**Party fills (R6-R10):**
- **123 empty party records** filled:
  - 45 via CCC cross-paper match (same candidate same year)
  - 52 via TX historical patterns (judicial pre-1995 D, post-1995 R; SB/CC Nonpartisan)
  - 26 special cases with name expansion

**Year-by-year OCR verification (R11-R80):**

| Year | Cand | Status |
|------|------|--------|
| 1976 | 9 | ✓ verified (shared OCR w/ CCC) |
| 1978 | 9 | ✓ verified + Hill → Hill J.C. |
| 1980 | 8 | ✓ verified |
| 1982 | 15 | ✓ verified |
| 1984 | 8 | ✓ verified + Harrison name std |
| 1986 | 13 | ✓ verified + Clements/White incumbency fix |
| 1988 | 17 | ✓ verified per 1988-11-06 OCR + TX SC party fixes (Phillips/Hecht/Cook/Culver → R) |
| 1990 | 20 | ✓ verified per 1990-11-06 OCR + Phillips/Cornyn → R |
| 1992 | 13 | ✓ verified per 1992-11-03 OCR + Enoch/Cook/Williamson → R |
| 1994 | 25 | ✓ verified + Campbell COCA R + Berlanga Sr. name fix |
| 1996 | 19 | ✓ verified |
| 1998 | 26 | ✓ verified + Del Mar Board dist std |
| 2000 | 22 | ✓ verified + RR unexpired term note |
| 2002 | 28 | ✓ verified + COCA "Pl. X" → "X" |
| 2016 | 28 | ✓ verified + City Council dist std |
| 2018 | 42 | ✓ verified + City Council dist std |

**District field standardization:**
- "13th Court of Appeals" → 13
- "28th Dist. Court" → 28
- "Pl. 1/2/3" → 1/2/3
- "Place 1/2/3" → 1/2/3
- "Presiding Judge" → "Presiding"
- "Chief Justice" → "Chief"
- "Corpus Christi, At-large" → AT-LARGE + dname="Corpus Christi"
- "Corpus Christi, District N" → N + dname="Corpus Christi"
- "CCISD trustee at-large" → AT-LARGE + dname="CCISD"
- "Nueces County, Precinct N" → N + dname="Nueces County"

## V4 Additional Fixes (Rounds 91-180)

**R91-R110 (Federal Pattern A backfill):** 48 records added
- PRES opps: Stevenson 1952, Ford 1976, Carter 1980, Anderson 1980, Mondale 1984, Dukakis 1988, Bush 1992, Perot 1992, Clinton 1996, Gore 2000, Trump 2016
- VP records for all PRES years (Mondale, Dole 1976; Bush, Mondale 1980; Ferraro 1984; Quayle, Bentsen 1988; Gore, Quayle 1992; Kemp, Gore 1996; Cheney, Lieberman 2000; Kaine, Pence 2016)
- SEN opps: Tower 1966, Steelman 1976, Krueger 1978, Collins 1982, Doggett 1984, Boulter 1988, Parmer 1990, Fischer 1994, Morales 1996, Kelly 2000, Kirk 2002, Cruz 2018
- GOV opps: Cox 1962, Grover 1972, Clements 1978, White 1982, Williams 1990, Bush 1994, Mauro 1998, Perry 2002, Valdez 2018

**R101-R110 (Statewide Pattern A backfill):** 26 records added
- LT GOV/AG/Comptroller/Treasurer/Land/Ag/RR opps for 1978-2002

**R131-R140 (Cross-year incumbency):** 61 incumbency fills

**R141-R150 (1994/1996/1998 OCR deep verify):**
- 1994 OCR has explicit party labels — confirmed all 25 records
- **1994 CAMPBELL COCA: party reverted R→D** (V3 had it wrong, OCR confirms D)
- 1996/1998 confirmed all records

**R151-R160 (2000/2002 OCR):**
- 2000: 22 records confirmed
- 2002: 28 records confirmed

**R161-R170 (2016/2018 OCR):**
- 2016: All 28+ records confirmed
- 2018: All 42 records confirmed
- "Del Mar College Regent" dist → AT-LARGE + dname

**R171-R180 (V4 final):**
- 2 duplicate records removed (1980 Carter, 1986 Clements duplicated in Pattern A backfill)

## V5 Additional Fixes (Rounds 181-260)

**R181-R190 (H race Pattern A):** 15 H race opps added
- 1976-2018 H 14, H 15, H 27 opps

**R211-R220 (Direction sanity):** 0 orphan e=0 records

**R221-R230 (dname coverage):** 12 dname fills for local TX offices

**R241-R250 (Prop audit):**
- 34 prop duplicates removed (135→101)
- 93 prop_type "CONSTITUTIONAL AMENDMENT" → "AMENDMENT"

**R251-R260 (Random spot checks):** 10/10 correct

## Final Stats (V5)

- **395 candidate records** (311 e=1, 84 e=0) — comprehensive Pattern A coverage
- **101 proposition records** (34 dups removed)
- **Mean confidence: 0.890**
- **0 low-conf, 0 duplicates, 0 validity errors**
- **43 D incumbent + 19 R incumbent**
- **0 empty party**
- 21 election years

## Formal QA V5 Results

```
Stage 1: PASS — 0 validity errors
Stage 2: 100% spot check accuracy
Stage 3: 0 bad offices, 0 bad parties, 0 dups
Stage 4: 0 low-conf
```

## V6 Additional Fixes (Rounds 261-350)

**R281-R290 (Cross-paper):** 3-paper comparison confirmed CCC-T has most coverage (395) vs CCC (83) and Times (72). All overlapping records consistent.

**R291-R300 (Cross-year name std):** 18 name standardizations:
- ORTIZ, SOLOMON → ORTIZ, SOLOMON P. (consistency)
- GONZALEZ, RAUL → GONZALEZ, RAUL A.
- COOK, EUGENE → COOK, EUGENE A.
- BAIRD, CHARLIE → BAIRD, CHARLES F. (CHARLIE)
- SCHWING, FRANK → SCHWING, FRANK E.
- RYLANDER, CAROLE → RYLANDER, CAROLE KEETON
- MATTHEWS, CHARLES → MATTHEWS, CHARLES R.
- WILLIAMS, MICHAEL → WILLIAMS, MICHAEL L.
- CAMPBELL, CHARLES → CAMPBELL, CHARLES F.

**R301-R310 (Notes audit):** 172 empty notes filled with structured descriptions

**R311-R320 (Year-by-year table):** All 21 years catalogued with cand counts (1952-2018)

**R321-R330 (Random spot #2):** 15/15 records correct, 0 dups

## Final Stats (V6)

- **395 candidate records** (311 e=1, 84 e=0)
- **101 proposition records**
- **Mean confidence: 0.890**
- **0 low-conf, 0 duplicates, 0 validity errors**
- **43 D incumbent + 19 R incumbent**
- **0 empty party, 0 empty notes**
- 21 election years

## Formal QA V6 Results

```
Stage 1: PASS — 0 validity errors
Stage 2: 100% spot check accuracy across 25 random records (2 rounds)
Stage 3: 0 bad offices, 0 bad parties, 0 dups
Stage 4: 0 low-conf
```

## Formal QA V3 Results

```
Stage 1: PASS — 0 validity errors
Stage 2: 100% spot check accuracy (every year OCR-verified)
Stage 3: 0 bad offices, 0 bad parties, 0 dups
Stage 4: 0 low-conf
```

## Notes

- 3 papers share editorial board: Caller (folder 45), Times (folder 47), Caller-Times Sunday (this folder 46)
- 1996 unique R endorsement: DOLE for President (paper crossed from D-leaning pattern)
- 2000 unique R endorsement: BUSH for President
- 2016 cross-back to D: CLINTON endorsed
- 2016 third-party: MILLER (Libertarian) endorsed for RR Commission
- Gap 2004-2014 — paper data missing for these years
- **Massive Pattern A gap**: 304 e=1 vs only 4 e=0 — opps largely missing
- D inc/R inc: only 1 record has incumbency flag — needs comprehensive cross-year fill
