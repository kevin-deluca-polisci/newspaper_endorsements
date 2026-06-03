# QA Report: Austin American

**Audit date:** 2026-06-01 (V6 — formal endorsement-qa skill pass after 6 rounds of spot checks)
**Folder:** Austin American
**Newspaper ID:** 144701
**Data coverage:** 1960-1972, 26 clippings, 18 candidate records, 34 proposition records

## Overall Assessment

**PASS WITH MAJOR FIXES V6**

Austin American is the pre-merger morning edition (paired with afternoon Austin Statesman, 144702). V1 had a critical Stage 1 issue (all 34 prop records had `endorsed` = "YES"/"NO" strings instead of 1/0) plus systemic under-extraction of 1960/1970 candidates and 11 missing incumbency flags. 45 spot checks across 6 rounds + formal pass yielded ~50 fixes and additions.

## Stage 1: Structural Validation (final pass)

- CSV headers: PASS (16 cand + 11 prop columns, all standard)
- Row integrity: PASS (0 year/endorsed/conf/state issues)
- state_newspaper / state_election: PASS (all TX)
- Incumbency=0 values: PASS (0)
- Junk rows: PASS (0)
- Newspaper ID 144701: populated consistently across all rows
- 4 candidate election years 1960-1970, 5 proposition election years 1960-1972

## Stage 2: Spot Check — 45 total across 6 rounds

### Round 1: 1960/1962/1968 baseline
- 1960 critical Pattern J: missing JOHNSON LYNDON B (VP + Senate)
- 1962 critical Stage 1 fix: 34 prop YES/NO strings to 1/0
- 1962 CONNALLY d_inc=1 erroneous (was new candidate elected 1962, not incumbent) - fixed

### Round 2: 1962/1968/1970 detailed verification
- 1962 amendment direction recheck (14 amendments)
- 1968 morning vs afternoon edition reconciliation with Austin Statesman 144702
- 1970 critical Pattern J: missing BUSH GEORGE Senate opposed (vs Bentsen)

### Round 3: 1970 STATE REP coverage gap
- 1970 critical Pattern J: missing MUTSCHER GUS STATE REP (Speaker D inc)
- 1970 critical Pattern J: missing DAVIS HAROLD STATE REP Place 1 D inc

### Round 4: incumbency flag systematic add
- Added 11 incumbency flags across 1960/1962/1968/1970
- d_inc and r_inc populated where editorial language indicated (I) markers

### Round 5: Pattern A opposed-candidate audit
- Bush 1970 confirmed as Pattern A opposed pair (Austin American endorsed Bentsen)
- All other opposed records verified

### Round 6: Final 5 verification
- Cross-newspaper consistency check vs Austin Statesman 144702 (found 4 errors in Statesman: Barnes office, Angrly typo, Foreman party, Mutscher SPEAKER OF HOUSE non-standard)
- 1964 clippings confirmed as NEWS ARTICLES about other papers' endorsements (Gainesville, Wichita Falls) — correctly excluded from data
- 1968_1 vs 1968_2 edition pairing verified
- All 26 clipping PDFs OCR-verified or page-flipped

**Accuracy:** ~98% post all fixes
**Recommendation:** Good shape

## Stage 3: Variable Coding & Dedup (final pass)

**Issues found:** 0 | **Auto-fixed:** 0 | **Remaining:** 0

All coding categories pass cleanly:
- 9 unique office codes (PRESIDENT, VICE PRESIDENT, GOVERNOR, LT GOVERNOR, SENATOR, H, STATE REP, ATTORNEY GENERAL, CNTY CLERK) — all standard
- 3 party labels (Democrat 12, Republican 4, empty 2) — all valid
- 0 names without comma (all LASTNAME, FIRSTNAME format, all ALL CAPS)
- 0 candidate duplicates
- 0 proposition duplicates
- 0 Pattern K incumbency-party mismatches
- All prop_type, prop_desc, notes_endorse ALL CAPS
- 34/34 props use AMENDMENT prop_type (all Texas constitutional amendments)
- Synthetic prop_num assignments resolved key collisions

## Stage 4: Low-Confidence Re-Scan (final pass)

**Records reviewed:** 3 prop records below 0.75
- 1962 Amendment 2 (Constitutional Authority) — conf 0.70, notes documented as "could not independently verify"
- 1962 Amendment 5 (Governmental Structure) — conf 0.70, notes documented as "could not independently verify"
- 1962 Amendment 10 (Tax Authority) — conf 0.70, notes documented as "could not independently verify"

These three 1962 amendments are from a 14-amendment editorial where Austin American gave a general "recommended"/"not recommended" without a dedicated paragraph. Direction is captured (e=1 or e=0) but the editorial reasoning was not specific to each amendment. Notes_endorse fields document this limitation.

**Mean confidence:** 0.900 (cand) / 0.856 (prop)

All 0 candidate records below 0.75 threshold.

## Stage 5: Manifest Registration

Austin American registered in `qa_manifest.csv` as entry #19 with qa_result "PASS WITH MAJOR FIXES V6".

---

## Final Statistics

- **18 candidate records, 34 proposition records (52 total)**
- **Cand years: 1960, 1962, 1968, 1970 (4)**
- **Prop years: 1960, 1962, 1966, 1970, 1972 (5)**
- **End=1: 16 cand, 22 prop**
- **End=0: 1 cand, 12 prop**
- **Empty endorsed: 1 cand (VP slot ambiguity), 0 prop**
- **Mean confidence: 0.871**
- **0 duplicates, 0 Pattern K mismatches**
- **Incumbency coverage: 11/18 = 61%**
- **1 Pattern A opposed pair (Bush 1970)**

## Total Changes V1 to V6

| Metric | V1 | V6 | Change |
|--------|----|----|--------|
| Cand records | 13 | 18 | +5 (+38%) |
| Prop records | 34 | 34 | 0 |
| YES/NO -> 1/0 conversion | 34 strings | 34 ints | Stage 1 fix |
| Incumbency flags | 0 | 11 | +11 |
| Pattern A opposed | 0 | 1 | +1 (Bush 1970) |
| Mean conf | 0.83 | 0.87 | +0.04 |

~50 total fixes/additions across 6 rounds (45 spot checks).

## Notes for Future Work

1. **Paired with Austin Statesman (144702)** — same parent paper, different edition times. 1968-era endorsements appear in both archives but with different editorial language. Records consistent post-V6 reconciliation.
2. **1964 archive has news articles, not editorials** — 2 clippings are stories ABOUT Gainesville Daily Register and Wichita Falls Times endorsements; correctly excluded from Austin American data.
3. **1962 amendment editorial style** — 14-amendment block recommendation; 3 amendments coded with low conf because editorial gave general direction without dedicated reasoning.
4. **Cross-newspaper consistency note for Austin Statesman QA** — 4 errors identified in Statesman that should be fixed when that folder is QA'd: Barnes office (US House vs Texas House mismatch), Angrly typo, Foreman party flip, Mutscher SPEAKER OF HOUSE non-standard office code.
5. **1972 props only** — no candidate records for 1972 in this archive; Statesman 144702 may have them.
