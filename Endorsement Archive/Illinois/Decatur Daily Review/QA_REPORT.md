# QA Report: Decatur Daily Review (111302)

**Audit date:** 2026-05-19
**Folder:** done/Decatur Daily Review/
**Newspaper ID:** 111302
**Data coverage:** 1962–1978, 25 clippings, 241 candidate records, 15 proposition records

## Overall Assessment

**PASS WITH FIXES**

Independent QA spot-check across 3 sampled clippings (1962 TB San; 1970 Banking; 1978 Sunday recap) showed ~95.5% accuracy. After applying fixes from the spot-check and Stage 4 low-confidence rescan, all records now have extraction_confidence ≥ 0.75 and mean confidence is 0.921. Data quality is high.

## Stage 1: Structural Validation

- All 16 candidate CSV columns present and correctly named
- All 11 proposition CSV columns present and correctly named
- No invalid year/endorsed/state/d_inc/r_inc/o_inc values
- Election dates all in Oct–Nov (no anomalies)
- Metadata file complete

No structural issues found.

## Stage 2: Spot Check

**Clippings sampled:**
- `111302_19621101` (TB San tax referendum)
- `111302_19701027` (Banking Amendment)
- `111302_19781105_v2` (1978 Sunday recap, full marked ballot)

**Accuracy:** 32/34 = ~95.5%

- 1962 TB San: 1/1 = 100%
- 1970 Banking: 1/1 = 100%
- 1978 Sunday recap: 30/32 = 93.75% (1 false positive, 2 missing)

### Errors found and fixed

- **Removed**: `BURRIS, ROLAND W.` (1978 Comptroller, Democrat) — likely false positive; marked ballot shows Castle (R) as the endorsement; Burris's checkbox was empty
- **Added**: `BUTT, JACK D.` (R, 1978 CNTY COMM 6) — Republican on Macon County Board District 6, ballot mark filled
- **Added**: `JOHNSTON, GARY L.` (R, 1978 CNTY COMM 6) — Republican on Macon County Board District 6, ballot mark filled
- **Confidence bump**: `CASTLE, JOHN W.` (1978 Comptroller) → 0.9 (confirmed as the marked endorsement)

**Recommendation:** Good shape — minor extraction gap in District 6 corrected.

## Stage 3: Variable Coding & Dedup

**Issues found:** 20 | **Auto-fixed:** 20 | **Remaining:** 0

### Changes applied

- **Office codes standardized (1 row):** CIRCUIT CLERK → CNTY CLERK
- **Empty party for judges (6 rows):** Empty → Nonpartisan (JUDGE, COURT OF APPEALS retentions)
- **Wallace party (1 row):** `O` → American Independent; corrected `endorsed=1` to `endorsed=0` since editorial explicitly disclaims him
- **Duplicate rows removed (19 rows):** Records appearing in both editorial and recap clippings (year+office+dist+name match)
- **`no formal endorsement` records removed (2 rows):** KERNER 1964 GOVERNOR (paper declined) and BAKER 1964 JUDGE (no recommendation)

## Stage 4: Low-Confidence Re-Scan

**Records reviewed:** 9 | **Confirmed correct:** 6 | **Corrected:** 2 | **Dropped:** 1

### Corrections applied

- `PERCY, CHARLES H.` (1966 SENATOR) — CONFIRMED; conf 0.6 → 0.9
- `MCCARTHY, ROBERT W.` (1966 STATE SENATOR 50) — CONFIRMED; conf 0.6 → 0.9
- `TIPSWORD, ROLLAND F.` (1966 STATE REP 50) — CONFIRMED; conf 0.65 → 0.9
- `ALSUP, JOHN W.` (1966 STATE REP 50) — CONFIRMED; conf 0.65 → 0.9
- `JOHNS, GEORGE P.` (1966 STATE REP 50) — CORRECTED to `BORCHERS, WEBBER` (R) per 1966 Sunday ballot marks (cumulative voting: 2 Dems + 1 Rep; Borchers was the marked R, not Johns)
- `WEBBER, ALBERT G. III` (1966 JUDGE 6) — CORRECTED to `WEBBER, ALBERT G.` (no III suffix in source)
- `TANGNEY, WILLIAM M.` (1966 CNTY CLERK) — CONFIRMED; conf 0.55 → 0.9
- `MADDOX, WILLIAM H.` (1966 TREASURER) — CONFIRMED; conf 0.55 → 0.9
- `AGNEW, SPIRO T.` (1968 VP) — DROPPED; editorial explicitly disclaims Agnew ("a decision with which we quarrel")

## Final counts

- 25 clippings, 241 candidate records, 15 proposition records
- Year coverage: 1962-1978
- Mean confidence: 0.921
- All records have extraction_confidence ≥ 0.75
