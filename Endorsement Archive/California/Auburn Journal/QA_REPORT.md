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

---

## V9 Single-Pass Deep Verification — 2026-06-20
CA proposition-heavy folder: 76 candidates (73 e=1 / 3 e=0) + 313 props, 1926-1986, 23 clippings.

**OCR (Stage 1):** all 23 clippings OCR'd; 0 zero-text clippings; no multi-year-bundled PDFs (stray year hits were OCR noise). OCR thin for these old clippings, so the vision pass carried verification.

**Comprehensive vision pass — candidates (every record, all 11 years read from images):**
- **4 omitted endorsements ADDED** (vision-confirmed + externally validated): 1958 GOVERNOR **William F. Knowland (R)**, 1958 LT GOVERNOR **Harold J. Powers (R)**, 1958 SEC OF STATE **Frank M. Jordan (R)** (the recap's actual SoS pick), and 1986 STATE REP d5 **Tim Leslie (R)** ("We endorse Tim Leslie for California Assemblyman").
- **3 office/district miscodes FIXED:** 1958 Kirkwood SEC OF STATE → **AUDITOR** (image "For Controller: Robert C. Kirkwood"; V1 had conflated him with the SoS slot). 1958 & 1962 Paul Lunardi STATE SENATOR → **STATE REP (Assembly), d6** — externally confirmed: Lunardi was in the Assembly (6th Dist) 1958/1960/1962, only entering the Senate in 1963 (so the 1964 Senate record is correctly left as-is).
- **Confirmed, no change:** the 4 OCR-missing records (Chapple, Bailey, Cosgrove, Newberry) all present in images; Chapple/Chappie and Clair/Claire Engle spellings are genuine source-level variance (both faithfully transcribed); Ray Johnson's party (R 1976 → Independent 1984) is a real, image-confirmed party switch. No spurious records.
- **Stale review_queue cleared:** the "no endorsements detected" flag on 1928/1958/1986 is a FALSE NEGATIVE — all confirmed to contain endorsements (1928 prints the full straight-Republican box: Hoover/Curtis/Hiram Johnson/Englebright/Cassidy/Woodbridge). 1974 is genuinely prop-only.

**Props (Stage 4 — all 20 prop years read):** 0 direction disagreements (every CSV YES/NO matched the printed direction). Of the 14 empty-direction props, **4 real directions recovered** (1930 Amd-13 YES, 1930 Amd-15 YES, 1960 Prop-12 YES, 1960 Prop-14 NO) and **10 confirmed genuine "No recommendation"** (correctly blank). One RA flag: the 1930 CSV prop *descriptions* don't align with the paper's printed numbering for several amendments (e.g., CSV Amd-8 "SF Boxing" vs paper slot 8 "Hospitals") — directions are fine, descriptions need reconciliation.

**Cross-paper (Stage 7):** vs sister CA papers — Auburn agrees with **Chico Enterprise Record on all 32 shared statewide records** and with **Salinas Californian on all 16**, ZERO divergences. Strong statewide validation.

**External (Stage 6):** confirmed Knowland (1958 R gov nominee), Lunardi (Assembly→Senate 1963), Tim Leslie (1986 d5 R winner).

**Final:** 76 candidates (73 e=1 / 3 e=0), 313 props (10 deliberately blank), 0 dups, 0 Pattern K, self-audit PASS. V9 changes: 4 candidate adds, 3 office fixes, 4 prop directions recovered.

## Proposition cross-paper validation (added 2026-06-20)
Extended cross-paper validation to the 313 props (CA propositions are statewide, so sister CA papers vote on the same numbered measures). Matched on (year, prop-number):
- Auburn vs **Chico**: 220 shared props, 168 agree / 52 diverge (76%).
- Auburn vs **Salinas**: 172 shared props, 127 agree / 45 diverge (74%).

Divergence is higher than for candidates (expected — editorial boards differ more on policy propositions). **18 props diverge from BOTH sisters at once, and ALL 18 are Auburn=NO where both sisters=YES** — a one-directional pattern. Investigated the densest cluster (1954, props 9/13/14/15/19) by vision-reading Auburn's own 1954 recommendation box: every one is printed **NO** by Auburn ("(9) Exempt Church Property — No … (15) Exempting Welfare Buildings — No … (19) Inferior Court Judges — No"). 

**Conclusion: the prop divergences are REAL editorial differences, not extraction errors.** Auburn (a small fiscally-conservative Placer County paper) systematically opposed tax exemptions, bond acts, and legislator-pay/spending measures that the larger Chico and Salinas papers supported. This is consistent with the prop direction audit (0 disagreements vs Auburn's own print) and is a meaningful editorial-variation signal to preserve, not correct. No prop directions changed.

## Stage 7 CONSISTENCY re-run (corrected method, 2026-06-20)
Re-ran cross-paper as a metadata-consistency check (not direction-agreement) vs Chico & Salinas.
**Check A (same-candidate metadata agreement):** every cross-paper discrepancy involving Auburn resolves in Auburn's favor — Auburn's own clipping supports its coding:
- Paul Leake (Board of Equalization, 1954/1962): Auburn = Democrat, confirmed by Auburn's clipping note "DEM. INCUMBENT"; Chico's "Nonpartisan" is the outlier.
- Bizz Johnson (H, 1964): Auburn d2 is historically correct (CA 2nd CD, 1959-1975); Chico's d1 is the outlier. (Auburn's blank 1962 district filled to d2 for consistency.)
- Controller office: Auburn codes it AUDITOR consistently; Chico/Salinas use COMPTROLLER/CONTROLLER — a project-wide office-name normalization choice, not an Auburn error. (The Chico↔Salinas COMPTROLLER/CONTROLLER mismatches on Cranston/Flournoy/Bagley/Cory/McClintock are those papers' issue, not Auburn's.)
**Check B (per-race candidate-set sanity):** statewide single-winner pools are clean for Auburn. The 1982 "Superintendent Newberry" is correctly disambiguated as the **Placer County** superintendent (dname=PLACER), not the statewide office (Honig), so it is not a conflation. Same-party-duplicate pools (1968 president/senate, 1992 senate) are primary-vs-general or dual-Senate-seat artifacts in the sister papers' years (outside Auburn's 1926-1986 range). No Auburn metadata errors found.
**Net:** Auburn metadata confirmed internally consistent and clipping-supported; 1 district fill (1962 Bizz Johnson d2). Discrepancies surfaced point to sister-paper coding (Chico) or project-wide naming, logged for those papers.
