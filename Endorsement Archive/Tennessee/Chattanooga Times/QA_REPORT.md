# QA Report: Chattanooga Times

**Audit date:** 2026-06-04
**Folder:** Chattanooga Times
**Newspaper ID:** 143902
**Data coverage:** 1922-1974, 25 clippings, 180 candidate records, 19 proposition records

## Overall Assessment

**PASS WITH FIXES V2**

Democratic-leaning Chattanooga paper (1869-1999) — the rival of News-Free Press until 1999 merger formed Chattanooga Times Free Press. Owned by Ochs family (same family as NY Times). Formal endorsement-qa skill pass V2 found 5 prop_type non-canonical values + missing 1968 VP/PRES Pattern A pairs.

## Stage 1: Structural Validation

- CSV columns: 16 cand + 11 prop ✓
- Row-level issues: 0 (no bad endorsed, no inc-zero, no wrong state, no junk rows)
- Duplicates: 0 ✓
- Election dates: all valid ✓
- Newspaper_id 143902 consistent ✓

## Stage 2: Spot Check

**Clippings sampled:** 143902_19481102 (1948), 143902_19681105 (1968), 143902_19221107 (1922 — OCR failed)
**Accuracy:** 20/22 = 91%

- **1968 (11 cand + 5 props)**: All records match OCR — paper endorsed Humphrey-Muskie D + Pope D H3 + Atkins D Pub Service + Moore/O'Rear D State Sen + 6 State Reps D. Constitutional convention 5 props all AGAINST. **Missing**: VP MUSKIE D record (Humphrey was in data but Muskie missing — added in fixes). PRES Pattern A pairs (Nixon R + Wallace AIP) added.
- **1948 (9 cand)**: Paper clearly endorsed Kefauver D Sen + Browning D Gov + Frazier D H3 + D state legislative ticket. **Note**: Paper PRES direction unclear in OCR — paper noted "most observers think Dewey will be elected" but did not explicitly endorse Dewey R. Data shows DEWEY R e=1 + TRUMAN D e=0 which may need verification (paper was D-leaning). Flagging for review.
- **1922 (9 cand)**: OCR extraction failed (image-only PDF). Data shows paper endorsed Peay D Gov + McKellar D Sen + McReynolds D H3 + state slate D. Consistent with paper's D editorial line. Not independently verifiable from this OCR but consistent.

**Recommendation:** Good shape. 1968 missing Pattern A pairs fixed in Stage 3.

## Stage 3: Variable Coding & Dedup

**Issues found:** 9 | **Auto-fixed:** 9 | **Remaining:** 0

### Changes made

- **Prop type standardization (5 records)**: "PUBLIC QUESTION" → "REFERENDUM" for 1968 Constitutional convention call props
- **1968 VP MUSKIE D added** (e=1, paper's Humphrey-Muskie ticket endorsement)
- **1968 VP AGNEW R added** (e=0, Pattern A vs Muskie)
- **1968 PRES NIXON R added** (e=0, Pattern A vs Humphrey)
- **1968 PRES WALLACE Indep added** (e=0, 3rd party AIP)

All other variable coding clean: 0 non-canonical offices, 0 non-canonical parties, 0 non-uppercase names, 0 bad state fields, 0 dist field issues.

## Stage 4: Low-Confidence Re-Scan

**Records reviewed:** 0 | **Confirmed:** 0 | **Corrected:** 0

All candidate records have confidence >= 0.75. No low-confidence records.

## Historical Notes

1. **Democratic-leaning paper** (1869-1999) — owned by Ochs family (same family as NY Times)
2. **1999 merger**: Times merged with News-Free Press to form Chattanooga Times Free Press
3. **Editorial line**: Consistent D-leaning at top of ticket. Notable picks:
   - 1922: Peay D Gov, McKellar D Sen
   - 1948: Kefauver D Sen, Browning D Gov
   - 1968: Humphrey D Pres (opposite of NFP which endorsed Nixon R)
4. **Cross-paper contrasts vs News-Free Press**: Same-day 1968 — Times endorsed Humphrey D + Pope D H3 while NFP endorsed Nixon R + Brock R H3. Same-day 1972 — same opposite pattern. Documents the genuine pre-merger editorial split between the two Chattanooga dailies.

## Final State

- 180 candidate records (4 added in V2)
- 19 proposition records
- 162 endorsed, 18 opposed
- 40 D incumbent + 6 R incumbent
- Mean confidence: 0.953
- 0 duplicates, 0 bad fields, 0 empty party

## Outstanding Flags

- **1948 PRES direction questionable**: Data has DEWEY R e=1 and TRUMAN D e=0. OCR did not show explicit endorsement of either candidate (paper noted Dewey likely to win but didn't endorse). Paper's clear endorsements were KEFAUVER-BROWNING-FRAZIER (D ticket). Unusual for a D-leaning paper to endorse Dewey R. Recommend additional OCR verification or accept as cross-party endorsement.

Compiled: 2026-06-04 (V2 — formal endorsement-qa skill pass).
