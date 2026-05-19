# QA Report: Lincoln Journal

**Audit date:** 2026-04-21
**Folder:** Lincoln Journal 126151
**Newspaper ID:** 126151
**Data coverage:** 1952-1994, 19 clippings, 405 candidate records, 178 proposition records

## Overall Assessment

**PASS WITH FIXES**

Data quality is high — Stage 2 spot-check across three years (1962, 1982, 1992) showed 98.75% substantive accuracy. Fixes applied in Stage 3 normalize incumbency flags and the `state_newspaper` column; one missing proposition (1962 Amendment 6) was added. No low-confidence records to re-scan.

## Stage 1: Structural Validation

- CSV headers complete (all 16 core candidate columns, all 11 core proposition columns)
- Year range 1952-1994, all valid even years
- No bad `endorsed` values (1/0/empty only)
- `state_election` = "NE" on all rows (100% populated)
- No `newspaper_id` missing
- No incumbency field = "0" errors
- **Fixed:** 405 candidate rows and 177 proposition rows had `state_newspaper = "NE-Lincoln Journal"` — auto-normalized to "NE" per the skill's 2-letter convention
- Metadata (`126151_metadata.txt`) says 398 candidates; after RA merge (Will P. records) and QA additions the CSV now has 405 candidates and 178 propositions. Metadata refreshed at QA.

## Stage 2: Spot Check

**Clippings sampled:**
- `Lincoln_Journal_1962_Endorsements.pdf` (Nov 5, 1962 — 12 candidates + 9 propositions)
- `Lincoln_Journal_1982_Endorsements.pdf` (Nov 1, 1982 — 32 candidates + 13 propositions)
- `Lincoln_Journal_1992_Endorsements.pdf` (Nov 2, 1992 — 9 candidates + 5 propositions)

**Accuracy:** 79/80 = 98.75% on substance (name/office/endorsement direction)

- **1962:** 20/21 records matched. Candidates 12/12 perfect. Propositions 8/9 — Amendment 6 ("Merit Plan" for selection of judges, "No position") was missing; added in Stage 3.
- **1982:** 45/45 substantively correct (all candidates and propositions present with right names/offices/directions). However, incumbency fields (`d_inc`/`r_inc`/`o_inc`) were systematically under-coded: ~20 records whose notes said "INCUMBENT (ASTERISK IN CLIPPING)" had no corresponding flag set. One false positive — FELLMAN, RICHARD (H dist=2) marked `r_inc=1` though he was the D challenger, not R incumbent.
- **1992:** 14/14 perfect (9 candidates + 5 propositions). No asterisks used in this year.

**Recommendation:** Good shape. Targeted fixes in Stage 3.

## Stage 3: Variable Coding & Dedup

**Issues found:** 22 | **Auto-fixed:** 22 | **User-corrected:** 0 | **Remaining:** 0

### Changes made

- **Incumbency flags set from notes (20 records, year 1982):** Wherever `notes_endorse` contained "INCUMBENT (ASTERISK IN CLIPPING)", "INCUMBENT PER PRIOR", or "INCUMBENCY INFERRED" and no flag was set, added the correct flag based on party: Democrat → `d_inc=1`, Republican → `r_inc=1`, nonpartisan/empty → `o_inc=1`. Affected state senators (Carsten, Hoagland, V. Johnson, Koch, Wesley, Beutler, Vickers, Landis), NRD board members (Kennedy, Warner, Harlan, Geist, Janike, Amen), county officials (Ferguson, Broman, Adams, Colin), and the SCC 5th district incumbent (Wekesser).
- **Incumbency flag cleared (1 record):** FELLMAN, RICHARD 1982 H dist=2 — cleared the incorrect `r_inc=1` (he was the Democratic challenger to Hal Daub, not the incumbent).
- **Party label normalized (1 record):** HUDKINS, LARRY D. 1984 — party "Petition" → "Independent".
- **state_newspaper reformatted (405 candidate + 177 proposition rows):** "NE-Lincoln Journal" → "NE" per skill convention.
- **Office codes:** All 31 distinct office codes already canonical after pre-QA normalization pass (PRESIDENT, VP, SENATOR, H, GOVERNOR, LT GOVERNOR, STATE SENATOR, ATTORNEY GENERAL, SEC OF STATE, TREASURER, AUDITOR, SHERIFF, CNTY COMM, CNTY CLERK, CNTY TREASURER, RECORDER, ASSESSOR, SURVEYOR, PUBLIC DEFENDER, DA/PROSECUTOR, CLERK DC, JUDGE, REGENT, STATE BOE, NPPD, OPPD, CONSUMERS PPD, PSC, RAILWAY COMM, CMTY COLLEGE, NRD, SANITARY COMMISSIONER, WEED CONTROL AUTH). No further fixes.
- **Candidate names:** All in ALL CAPS, LASTNAME FIRSTNAME format. No fixes needed.
- **Districts:** No values containing "District"/"Dist." prefix. No fixes needed.
- **Proposition types:** All in canonical set (AMENDMENT, BALLOT MEASURE, INITIATIVE, BOND, REFERENDUM). No fixes needed.
- **Duplicates:** Zero duplicate candidate rows, zero duplicate proposition rows.

### Addition from Stage 2 spot-check

- **1962 Amendment 6 added (1 record):** "Merit Plan" for selection of judges. Endorsement coded as empty (paper took "No position"). Note flags the QA-added provenance.

## Stage 4: Low-Confidence Re-Scan

**Records reviewed:** 0 | **Confirmed correct:** 0 | **Corrected:** 0 | **Still uncertain:** 0

All extraction_confidence values are at or above 0.75 (range 0.80-0.98, mean 0.92). No records required re-scanning.

## RA-Sourced Records (Will P.)

Seven candidate records in this CSV came from the Will P. xlsx rather than direct clipping extraction. They are flagged in `notes_endorse` with the prefix "FROM WILL P. XLSX (RA-CODED); NOT EXTRACTED FROM CLIPPING":

- 1952 EISENHOWER, DWIGHT D. (PRESIDENT, R)
- 1956 EISENHOWER, DWIGHT D. (PRESIDENT, R)
- 1960 MEYER, CLARENCE A.H. (ATTORNEY GENERAL, R)
- 1964 GOLDWATER, BARRY M. (PRESIDENT, R)
- 1970 BEERMANN, ALLEN J. (SEC OF STATE, R)
- 1978 EXON, JOHN JAMES (SENATOR, D)
- 1986 BUOSALIS, HELEN (GOVERNOR, D)

These fill pre-1960 presidential endorsements and a handful of other races where the existing clippings lacked the record.
