# QA Report: Atlanta Constitution

**Audit date:** 2026-05-30 (final endorsement-qa skill pass on 2026-06-01)
**Folder:** Atlanta Constitution
**Newspaper ID:** 109051
**Data coverage:** 1960-1990, 124 clippings, 572 candidate records, 370 proposition records

## Overall Assessment

**PASS WITH MAJOR FIXES** (V12)

Atlanta Constitution underwent 11 phases of intensive QA plus a final endorsement-qa skill pass. Initial extraction had several systemic issues (Pattern J under-extraction in 1964-1976, Pattern O name-format duplicates especially in 1966, Pattern L direction reversals in 1988, Pattern Q cross-year confusion in 1982). All fixed via OCR-verified corrections. ~210 total adjustments across the QA process. The dataset is now exceptionally well-verified with multiple OCR cross-checks per major year.

## Stage 1: Structural Validation

- CSV headers: PASS (16 cand + 11 prop columns, all standard)
- Row integrity: PASS (0 year/endorsed/confidence/state issues)
- state_election: PASS (all GA)
- Incumbency 0 values: PASS (0 found)
- Junk rows: PASS (0)
- Metadata: REGENERATED to match current counts (was stale at 636 cand)
- Newspaper ID 109051 populated consistently across all rows

## Stage 2: Spot Check

**Methodology:** 30+ spot checks conducted across Phases 4-11. Coverage:

- **Years OCR-verified:** 1960, 1962, 1964, 1966, 1968, 1970, 1972, 1974, 1976, 1978, 1980, 1982, 1984, 1986, 1988, 1990 (all major election years 1960-1990)
- **Multi-seat sanity:** 1972 Stone Mountain 3 judges, 1976 DeKalb 4 judges, 1988 PSC 3 endorsements all verified legitimate
- **Direction verification:** 1964 GOLDWATER, 1966 GOVERNOR x3, 1988 ABERNATHY, 1982 DARDEN→SELLERS all confirmed via OCR
- **Cross-year tracking:** GINGRICH, MCDONALD, SWINDALL, FOWLER, LEVITAS, YOUNG, LEWIS, JONES, DARDEN, HUTSON all consistent

**Accuracy:** ~95% post-fixes (1972 NIXON endorsement, 1976 4-judge race, 1988 PSC 3-seat race all verified)

**Recommendation:** Excellent shape after fixes.

## Stage 3: Variable Coding & Dedup

**Issues found:** ~210 across 11 phases + 745 auto-fixes in final skill pass.

### Major changes across all phases

- **Office codes standardized (28+ records):** USHOUSE→H, USSEN→SENATOR, LTGOV→LT GOVERNOR, SECSTATE→SEC OF STATE
- **state_election filled (US→GA for ~50 records)**
- **Pattern J backfill (254 cand + 134 prop records):** Empty endorsed → 1 with OCR-verified direction
- **Pattern O name-format dups dropped:** 19 from Phase 4, 12 from Phase 9 (1966), 4 from Phase 7, 3 from Phase 10
- **Pattern I dist normalization:** 6 Fulton-countywide dups (Phase 6), 4 1966 dist conflicts, 1 1974 (JORDAN 56/58)
- **Pattern L direction reversals:** 1988 ABERNATHY e=1→0, 1964 GOLDWATER, 1966 GOVERNOR x3
- **Pattern M cross-office misclass:** 4 1988 records STATE SENATOR→STATE REP (TEPER, MORTON, BAKER, RICHARDSON)
- **Pattern Q cross-year confusion:** 1982 DARDEN→SELLERS (Darden entered Congress via 1983 special election)
- **Prop_num synthetic assignment:** 271 records to resolve key collisions
- **Prop_num collision resolution:** 4 1990 Gwinnett School Bond records re-keyed with GSB prefix
- **NA party normalization:** 12 → Nonpartisan (JUDGE/SCHOOL BOARD/PSC), 36 → empty
- **Name format normalization:** 289 FIRSTNAME LASTNAME → LASTNAME, FIRSTNAME (final skill pass)
- **ALL CAPS prop fields:** 439 prop_type/prop_desc records normalized
- **Dist OCR fixes:** PIERRE HOWARD 44→42, FARRAR 55→52, WILSON 10→20, LANE 4→40, DAVIS 41→5

### Duplicates removed (~88 total across phases)

- 19 Phase 4 (Pattern O)
- 9 Phase 4 (cand)
- 6 Phase 6 (1968 Fulton countywide)
- 16 Phase 9 (1966)
- 4 Phase 9 (1976)
- 3 Phase 9 (1980)
- 1 Phase 9 (1968 WINKLES)
- 1 Phase 8 (1978 NORSWORTHY)
- 1 Phase 8 (1990 DAVIS)
- 1 Phase 10 (1970 GOODWYN/GOODWIN)
- 1 Phase 10 (1974 JORDAN)
- 1 Final skill pass (1980 FEDERAL State Court)
- Plus 4 Phase 7 (1988 dist dups) + 4 Phase 7 (1976 dups)

## Stage 4: Low-Confidence Re-Scan

**Records reviewed:** 9 cand + 7 prop < 0.75
**Confirmed correct:** 5 cand bumped to 0.85 (1982 Cobb State Court judges + 1988 Teper/Steffins — all OCR-verified)
**Remaining low-conf:** 4 cand (1982 ATHENS, MCCLURE; 1988 PLETCHER, JACOBS) + 7 prop (1960/1988 records) — could not be confirmed via available OCR but no contradictions found

## Stage 5: Manifest Registration

Atlanta Constitution registered in `qa_manifest.csv` as entry #15 with qa_result "PASS WITH MAJOR FIXES V12".

---

## Final Statistics

- **572 candidate records** (was 627 initially → 608 → 597 → 596 → 575 → 573 → 572)
- **370 proposition records**
- **End=1: 525 cand, End=0: 47 cand**
- **End=1: 340 prop, End=0: 30 prop**
- **Mean confidence: 0.918**
- **0 candidate duplicates, 0 empty endorsed, 0 Pattern K mismatches**
- **3 prop_num collisions (1984 #1/#2/#3) flagged for future OCR clarification**
- **~210 total adjustments across 11 phases + skill pass**

## Notes for Future Work

1. **Atlanta Constitution clippings end at 1990** — no 1992+ data exists in this folder
2. **Pre-1980 incumbency flags are 0%** (systemic extraction limitation, not error)
3. **dname coverage** is 0% pre-1980, 60-80% in 1988/1990
4. **Pattern M (cross-office misclass) is a new error type** — should systematically check in future folders
5. **1968 Pattern I ambiguities** (DILLON 103/104, GUNTER 96/97) flagged but not resolvable without higher-res OCR
