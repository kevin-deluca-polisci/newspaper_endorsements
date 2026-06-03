# QA Report: Atlanta Journal-Constitution

**Audit date:** 2026-06-01 (V6 — final formal endorsement-qa skill pass after 6 rounds of spot checks)
**Folder:** Atlanta Journal-Constitution
**Newspaper ID:** 109050
**Data coverage:** 2002-2012, 7 clippings, 190 candidate records, 30 proposition records

## Overall Assessment

**PASS WITH FIXES V6** — Atlanta Journal-Constitution is the post-2001 merged paper. Initial formal QA + 6 rounds of spot checks (30 total spot checks) yielded ~40 fixes across Pattern M, Pattern J, Pattern Q, Pattern L, name normalization, incumbency, and office code categories.

## Stage 1: Structural Validation (final pass)

- CSV headers: PASS (all standard columns)
- Row integrity: PASS (0 year/endorsed/conf issues)
- state_election: PASS (all GA)
- Incumbency=0 values: PASS (0)
- Junk rows: PASS (0)
- Newspaper ID 109050: populated consistently
- 0 empty endorsed records

## Stage 2: Spot Check (30 total across 6 rounds)

### Round 1 (initial formal QA Stage 2)
1. 2012 Charter School Amendment matches OCR
2. CRITICAL Pattern M find: 2002 THURMOND/IRVIN office swap (AGRICULTURE/LABOR commissioners)
3. 2006 deep verification with OCR
4. 2004 records + ELLIS BOB anomaly flagged
5. 2008 records verified

### Round 2 (spot checks 5-9)
5. ELLIS BOB 2004 conf 0.95→0.50 flagged
6. 2004 props verified
7. 2006 Pattern J caught — added Amendments 2 and 3 as e=0
8. 2008 v2 PDF: no new records
9. LEWIS 2006 H-5 Pattern J fill added

### Round 3 (spot checks 10-15)
10. 2006 Pattern A pairs added (Perdue Gov, Wise PSC, Burgess PSC)
11. 2002 Stoner career transition verified (STATE REP→STATE SENATE)
12. CNTY COMM AT-LARGE designations clean
13. dname coverage verified (federal/statewide empty correct)
14. Cross-year perennial tracking
15. Office code standardization

### Round 4 (spot checks 16-20)
16. 2002 STATE REP CRITICAL Pattern M: ADELMAN STATE REP→STATE SENATOR + STANLEY-TURNER dist 42→44 + 4 Post numbers
17. 2008 Court of Appeals 4-judge sanity
18. Cross-year party validation (0 mismatches)
19. Incumbency 0%→9% via 2002 (I) markers
20. Pattern K after fills (0)

### Round 5 (spot checks 21-25)
21. 2004 incumbency flags (3 added)
22. 2006 incumbency flags (18 added) — total 19% coverage
23. THOMAS/MORGAN ALISHA same person verified
24. 2008 BOND/REFERENDUM/TAX props clean
25. JUDGE+dist=COURT OF APPEALS → office=COURT OF APPEALS (6 normalizations)

### Round 6 (spot checks 26-30)
26. 2002 US House all 13 districts verified
27. 2006 STATE REP all 12 records match OCR
28. 2002 dname coverage verified clean
29. Confidence distribution healthy 0.929-0.950
30. Final structural sanity 0 issues

**Accuracy:** ~98% post all fixes
**Recommendation:** Good shape

## Stage 3: Variable Coding & Dedup (final pass)

**Issues found:** 0 | **Auto-fixed:** 0 | **Remaining:** 0

All coding categories pass cleanly:
- 22 unique office codes (all standard)
- 5 party labels (all standard)
- 0 names without comma (all LASTNAME, FIRSTNAME)
- 0 cand duplicates, 0 prop_num collisions
- 0 Pattern K incumbency-party mismatches
- All prop_type, prop_desc ALL CAPS

## Stage 4: Low-Confidence Re-Scan (final pass)

**Records reviewed:** 2 (both intentionally flagged for future OCR verification)
- 2004 H ELLIS, BOB at conf 0.50 — OCR doesn't support, possible misextraction
- 2006 H LEWIS, JOHN at conf 0.60 — Pattern J fill, OCR garbled at D-5

**Mean confidence:** 0.940

## Stage 5: Manifest Registration

Atlanta Journal-Constitution registered as entry #17 with qa_result "PASS WITH FIXES V6".

---

## Final Statistics

- **190 candidate records, 30 proposition records**
- **Years: 2002, 2004, 2006, 2008, 2012**
- **End=1: 187 cand, 20 prop**
- **End=0: 3 cand, 10 prop**
- **Mean confidence: 0.940**
- **0 duplicates, 0 Pattern K mismatches**
- **Incumbency coverage: 35/187 = 19% (was 0% pre-V4)**
- **22 unique office codes (all standard)**
- **2 low-conf records flagged for future review**

## Total Fixes Across All Rounds (~40)

- Pattern M cross-office: 2 (THURMOND/IRVIN swap; ADELMAN STATE REP→SENATOR)
- Pattern J fills: 3 (2006 Amendments 2/3 + Lewis 2006)
- Pattern A opposed records: 3 (Perdue/Wise/Burgess)
- Pattern I dist: 2 (Parsons 29→28, Stanley-Turner 42→44)
- Post number additions: 4 (D-42 Post 1-4)
- Office code normalization: 7 (Agriculture commissioner + 5 Court of Appeals + 1 Supreme Court)
- Synthetic prop_num: 10 (county-level props)
- Incumbency flags: 35 (was 0)
- ALL CAPS prop fixes: 50 records normalized

## Notes for Future Work

1. **AJC editorials list only endorsements** (no opposed candidates) — extraction style
2. **2008/2010/2012 lack US House records** — archive limitation, not extraction error
3. **2 records flagged for future OCR**: ELLIS BOB 2004 H-9 + LEWIS 2006 H-5
4. **Predecessor papers:** Atlanta Constitution (109051) 1960-1990; Atlanta Journal (109052) 1968-1974
5. **Pattern M (cross-office)** discovered as a systematic error type — should check in future folders
