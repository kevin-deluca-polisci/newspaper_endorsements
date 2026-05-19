# QA Report: Birmingham Post-Herald

**Audit date:** 2026-04-04
**Folder:** Birmingham Post Herald
**Newspaper ID:** 100100
**Data coverage:** 1950-2004, 62 clippings, 425 candidate records, 130 proposition records

## Overall Assessment

PASS WITH FIXES

The data is in excellent shape after QA. All 4 spot-checked clippings showed 100% extraction accuracy across 65 records. Fixes were limited to standardizing office codes, removing compilation-artifact duplicates, and filling in a missing field (newspaper_id). No extraction errors were found.

## Stage 1: Structural Validation

Both CSVs had all required headers present. Row integrity was clean: no junk rows, no bad year values, no invalid endorsed values, no incumbency zeros, no odd-year records. All state_newspaper and state_election values are valid 2-letter codes (AL).

**Issues found and fixed:**
- `newspaper_id` was empty in all 563 rows across both CSVs (filled with "100100")
- Metadata file had placeholder "REVIEW" values for Alternative Names, Years Published, and Newspaper ID number (filled with correct values)

Metadata counts matched CSV row counts exactly (before deduplication).

## Stage 2: Spot Check

**Clippings sampled:** 100100_19641102 (1964), 100100_19741104 (1974), 100100_19901105 (1990), 100100_20021104 (2002)
**Accuracy:** 100%

- **1974-11-04:** 1 candidate (Miglionico, H dist 6, Democrat). Correct name, office, party, and incumbency (r_inc=1 for Buchanan). Match: 1/1.
- **1990-11-05:** 29 candidates, 1 proposition. All names, offices, parties, districts, and incumbency markers matched. Included dense state legislature section with 11 state reps and 3 state senators. Match: 30/30.
- **1964-11-02:** 1 candidate (Huddleston, H, Democrat, d_inc=1), 5 propositions (Amendment 1 opposed, Amendments 2-5 endorsed). All correct. Match: 6/6.
- **2002-11-04:** 25 candidates, 3 propositions. All matched. Verified complex multi-office layout including 4 court seats, 4 constitutional offices, county offices, and state legislature. Match: 28/28.

**Recommendation:** Good shape. No issues found in any spot-checked clipping.

## Stage 3: Variable Coding & Dedup

**Issues found:** 42 | **Auto-fixed:** 42 | **User-corrected:** 0 | **Remaining:** 35 empty party values (legitimate)

### Changes made

- **Office codes standardized (32 records):** STATE BOARD OF EDUCATION -> STATE BOARD OF ED, SECRETARY OF STATE -> SEC OF STATE, STATE AUDITOR -> AUDITOR, STATE TREASURER -> TREASURER, DISTRICT ATTORNEY -> DA/PROSECUTOR, COUNTY TREASURER -> CNTY TREASURER, BOARD OF EDUCATION -> STATE BOARD OF ED
- **Candidate duplicates removed (5 records):** 1968 NIXON (PRESIDENT), 1972 CONNELL (PSC), THOMASON (TAX ASSESSOR), PARKER (CNTY TREASURER), 1976 BUCHANAN (H-6). All were multi-clipping compilation artifacts.
- **Proposition duplicates removed (3 records):** 1956 Amendment 1 (appeared in 3 clippings), 1978 Amendment 1 (appeared in 2 clippings).
- **Party values filled (2 records):** TORBERT, BO (1976 CHIEF JUSTICE) = Democrat; DOMINICK, CHARLOTTE LANE (1976 CNTY TREASURER) = Democrat.
- **Remaining empty parties (35 records):** 32 from 1966 (Alabama's one-party Democratic era; local/state races did not list party), 3 from nonpartisan Birmingham city council races (1974 Herring, 1978 Lasater/Newton). These are correct as-is.

All changes applied to working CSV, archive CSV, and JSON parts files.

## Stage 4: Low-Confidence Re-Scan

**Records reviewed:** 2 | **Confirmed correct:** 2 | **Corrected:** 0 | **Still uncertain:** 0

Both low-confidence records are from the 1992 US House 7th District race:
- JONES, KERVIN (Republican, conf=0.70): Paper described Jones and Lewis as "decent alternatives" to Hilliard but explicitly noted both "lack the political experience to be effective." Coded as endorsed=1 per user confirmation.
- LEWIS, JAMES M. (Independent, conf=0.70): Same tepid endorsement. Coded as endorsed=1 per user confirmation.

The 0.70 confidence accurately reflects the ambiguity. User reviewed and confirmed both should remain as endorsed.

All low-confidence records confirmed correct.

## Cross-Paper QA (2026-04-04)

A cross-paper consistency check was run across all 4 Birmingham papers (Age Herald, News, Post, Post Herald).

### Party fills (1 record)

- 1966 COLLINS, DON (Attorney General): party was empty, filled as Democrat from Birmingham News cross-reference.

### Incumbency fills (2 records filled from News)

- 1978 WAGGONER, JABO (State Rep 51): d_inc=1 filled from News
- 1982 LEWIS, DUANE (State Rep 50): d_inc=1 filled from News

### Name corrections (3 records)

- NIXON, RICHARD -> NIXON, RICHARD M. (1968, fuller name from News)
- CLEMON, L. W. -> CLEMON, U. W. (1974, corrected initials; U.W. Clemon was the actual politician)
- JOHNSON, EARNEST -> JOHNSON, ERNEST (1994, corrected spelling from News cross-reference)
