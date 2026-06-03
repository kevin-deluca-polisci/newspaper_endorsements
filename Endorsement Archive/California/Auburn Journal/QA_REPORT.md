# QA Report: Auburn Journal

**Audit date:** 2026-06-01 (V6 — formal endorsement-qa skill pass after 6 rounds of spot checks)
**Folder:** Auburn Journal
**Newspaper ID:** 101330
**Data coverage:** 1926-1986, 23 clippings, 72 candidate records, 313 proposition records

## Overall Assessment

**PASS WITH MAJOR FIXES V6**

Auburn Journal is a prop-heavy California local paper (Placer County). Initial QA pass on 2026-04-28 had PASS but extensive 6-round spot-check verification revealed 28 missing candidate records (1928/1958/1962/1986 had Pattern J gaps) and 30 missing prop records. All recovered.

## Stage 1: Structural Validation (final pass)

- CSV headers: PASS
- Row integrity: PASS (0 year/endorsed/conf/state issues)
- state_election: PASS (all CA)
- Incumbency=0 values: PASS
- Junk rows: PASS
- Newspaper ID 101330: populated consistently
- 22 election years 1926-1986

## Stage 2: Spot Check — 36 total across 6 rounds

### Round 1: 1926/1954/1956/1962/1976/1982
- 1962 CRITICAL: 16 prop directions filled + 5 missing cand records added
- 1954/1976/1982 prop direction fixes

### Round 2: 1928/1930/1932/1960/1964/1970/1974
- 1960 CRITICAL: JOHNSON HIRAM ASSESSOR fixed to HAROLD T BIZZ H-2 D (Pattern M)
- 1930 added 3 amendments
- 1970/1974 missing props added

### Round 3: 1950/1952/1966/1978/1980/cross-year
- 7 name normalizations
- 1980/1966/1978 all match OCR

### Round 4: clipping coverage gaps + Pattern A + integrity
- CRITICAL: 1928/1958/1986 clippings had ZERO data extracted
- Added 6 1928 cand + 20 1928 props + 11 1986 cand
- 1986 Bird/Grodin/Reynoso opposed Supreme Court retention (historic vote)

### Round 5: 1928 Prop 21 + 1958 1200dpi retry + cross-year
- 1958 retry recovered 6 cand + 4 props
- LEAKE 1962 party R to D fix per historical record

### Round 6: Final 6
- 1974 v2 PDF same as v1
- Office codes/party labels/integrity all clean
- All 23 clippings OCR-verified

**Accuracy:** ~98% post all fixes
**Recommendation:** Good shape

## Stage 3: Variable Coding & Dedup (final pass)

**Issues found:** 0 | **Auto-fixed:** 0 | **Remaining:** 0

- 20 office codes — all valid (BOARD OF EQUALIZATION is CA-specific)
- 4 party labels (Democrat, Republican, Independent, empty)
- 0 names without comma, 0 duplicates, 0 Pattern K
- All prop_type/prop_desc ALL CAPS

## Stage 4: Low-Confidence Re-Scan

**Records reviewed:** 1 cand + 19 prop below 0.75
- All from 1928/1930/1958 with documented OCR limitations
- Notes_endorse fields document the issues
- 100% records have notes_endorse populated

## Stage 5: Manifest Registration

Auburn Journal registered as entry #18 with qa_result "PASS WITH MAJOR FIXES V6".

---

## Final Statistics

- **72 candidate records, 313 proposition records (385 total)**
- **Years: 1926-1986 (22 election years, ALL covered)**
- **End=1: 69 cand, 174 prop**
- **End=0: 3 cand, 125 prop**
- **Empty endorsed prop: 14 (intentional "no recommendation")**
- **Mean confidence: 0.877**
- **0 duplicates, 0 Pattern K mismatches**

## Total Changes V1 to V6

| Metric | V1 | V6 | Change |
|--------|----|----|--------|
| Cand records | 44 | 72 | +28 (+64%) |
| Prop records | 283 | 313 | +30 (+11%) |
| Years covered | 19 | 22 | +1928/1958/1986 |
| Empty endorsed props | 35 | 14 | -60% |

~89 total fixes/additions across 6 rounds (36+ spot checks).
