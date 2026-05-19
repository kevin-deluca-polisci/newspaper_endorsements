# QA Report: Decatur Herald and Review (111300)

**Audit date:** 2026-05-19
**Folder:** done/Decatur Herald and Review/
**Newspaper ID:** 111300
**Data coverage:** 1960–2004, 80 clippings, 347 candidate records, 46 proposition records

## Overall Assessment

**PASS WITH FIXES**

Independent QA spot-check across 4 sampled clippings (1960, 1974, 1992, 2000 final recaps) showed ~97.5% accuracy. After Stage 3 deduplication and Stage 4 low-confidence rescan, all records have extraction_confidence ≥ 0.75 and mean confidence is 0.927. Data quality is high.

## Stage 1: Structural Validation

- All 16 candidate CSV columns present and correctly named
- All 11 proposition CSV columns present and correctly named
- **Auto-fixed 84 d_inc/r_inc/o_inc `0` values to empty**
- No invalid year/endorsed/state values
- Election dates all in Oct–Nov (no anomalies)
- Metadata file complete

## Stage 2: Spot Check

**Clippings sampled:**
- `111300_19601107` (1960 Nixon era final ballot recap)
- `111300_19741103` (1974 Sunday recap with marked ballot)
- `111300_19921102` (1992 Clinton endorsements list)
- `111300_20001105` (2000 Bush endorsements list)

**Accuracy:** 57.5/59 = ~97.5%

- 1960: 22/23 = 95.7% (1 office mis-code)
- 1974: 11/11 = 100%
- 1992: 13/13 = 100%
- 2000: 11.5/12 = 95.8% (1 party-field inconsistency)

### Errors found and fixed

- **Office correction**: `KELLEY, JAMES C.` (1960 Circuit Clerk) — office was incorrectly coded as JUDGE; corrected to CNTY CLERK
- **Party correction**: `SAPP, DAVE` (2000 AUDITOR) — party was inconsistently labeled Republican on one record and blank on another; corrected to Democrat per editorial context (the GOP challenger was Culp)

**Recommendation:** Good shape; corrected minor coding errors.

## Stage 3: Variable Coding & Dedup

**Issues found:** 73 | **Auto-fixed:** 73 | **Remaining:** 0

### Changes applied

- **Office codes standardized (6 rows):** CIRCUIT CLERK → CNTY CLERK; OTHER → CNTY CLERK (Whiteman 1980, Hogan 1984 — both Circuit Clerks)
- **Party labels normalized (43 rows):** Single-letter `R`/`D` → `Republican`/`Democrat`, `Dem`/`Rep` variants standardized
- **Empty party for judges (15 rows):** Empty → Nonpartisan (JUDGE, SUPREME COURT, COURT OF APPEALS retentions)
- **d_inc/r_inc/o_inc `0` values auto-fixed (84 instances across 28 rows):** All "0" values reset to empty
- **Duplicate rows removed (58 rows):** Records appearing in both editorial and final recap clippings deduplicated by keeping highest-confidence version
- **Proposition duplicates removed (3 rows):** Same proposition described twice across editorial + recap

## Stage 4: Low-Confidence Re-Scan

**Records reviewed:** 1 | **Confirmed correct:** 1

### Confirmations

- `TATE` (1980 STATE REP 51) — CONFIRMED as `endorsed=0` (explicit non-endorsement per 1980-11-02 marked ballot showing Donovan/Dunn/Borchers marked with X, Tate's box empty); updated note to clarify this is explicit non-endorsement rather than implied; conf 0.7 → 0.95

## Final counts

- 80 clippings, 347 candidate records, 46 proposition records
- Year coverage: 1960-2004
- Mean confidence: 0.927
- All records have extraction_confidence ≥ 0.75
- 38 records have empty party (mostly local Macon County offices where party affiliation was not stated in the source clipping; these are valid endorsements with incomplete party metadata)

## Notes on data structure

- Pre-1979 clippings labeled "111300" represent the Sunday combined edition of the morning Decatur Herald and evening Decatur Daily Review under Lindsay-Schaub ownership
- Post-1979 clippings labeled "111300" are the daily Lee Enterprises Herald & Review
- The two-paper structure means 1979 and later candidates appear only under HR (111300); 1962-1978 candidates may appear in both DDR (111302) and HR (111300) depending on which edition published the editorial
- 1978-11-05_v2 (DDR) is the most comprehensive single-clipping recap in the dataset (32 endorsements including 25 Macon County local offices)
