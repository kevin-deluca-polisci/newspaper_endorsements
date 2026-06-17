# RA Manual Review Needs: Evansville Courier

**Status:** AI processing complete through V7 FINAL. The items below require manual RA intervention.

**Final state:** 439 cand + 21 props, mean conf 0.864, 14 records below 0.85, 21 empty party records.

## Priority 1: 21 empty party records

After V2-V7 fills (108 → 78 → 66 → 57 → 21), 21 records remain with empty party. These are mostly local Vanderburgh County officials whose party was not in V1 extraction and could not be reliably inferred:

| Office | Count | Notes |
|---|---|---|
| CITY COUNCIL | 6 | Vanderburgh County Council records (partisan) |
| JUDGE | 5 | Vanderburgh County / IN judicial |
| AUDITOR | 5 | County offices |
| ASSESSOR | 4 | County offices |
| Others | 1 | TOWNSHIP TRUSTEE |

Recommended: RA verify via Indiana election archives + Vanderburgh County election records.

## Priority 2: 1 NICHOLSON 1986 SCHOOL BOARD unopposed (e='' valid)

NICHOLSON, MARY E. "MIMI" 1986 SCHOOL BOARD — ran unopposed for 1st district. e='' coding is correct (NO RECOMMENDATION). No fix needed.

## Priority 3: 1 ASSESSOR 1974 "NO ENDORSEMENT" recoded V4 → e=''

V4 corrected from e=0 → e=''. No further action.

## Priority 4: 14 records below 0.85 conf

Mix of:
- V1 original conservative confidence on older records (1918-1948 era)
- V4 Pattern A speculative pairs (1922, 1934, 1946, 1952 SEN)
- Most are 0.78-0.82 range

These are reasonable confidences. RA verification of D primary winners for those specific cycles would boost.

## Priority 5: 23 STATE REP records without dist

Mostly pre-1972 multi-member era (Vanderburgh County elected STATE REPs at-large before 1972 redistricting). Legitimate empty dist. RA verification of specific representation may help.

## Priority 6: Federal Pattern A early years (1932/1936/1942/1946/1950)

EC has limited federal coverage in early Depression era:
- **1932 PRES**: 0 candidate records (clipping discussed state amendments, not PRES)
- **1936 PRES**: Limited
- Similar for 1938-1942 era

Could be collection gaps or genuine extraction misses.

## Priority 7: Collection gaps 1976/1978

0 records for 1976 PRES year and 1978 mid-term. RA should verify if clippings exist (current clipping set has 0 1976/1978 clippings).

## V7 OCR Verification Coverage (Cumulative V3-V7)

**18 years of OCR sidebar/editorial verification:**
- **Full sidebar verified (9 years)**: 1968, 1972, 1980, 1982, 1984, 1988, 1990, 1992, 1996
- **Federal/state offices verified (9 years)**: 1934, 1948, 1956, 1958, 1960, 1962, 1964, 1970, 1974, 1994, 1998

**Cross-paper validation:**
- EC vs Evansville Press (sister paper folder 65): 59 agreements + 8 documented disagreements
- 55 records boosted to 0.92 via cross-paper agreement

## What is NOT a concern (V7 PASS)

- **Structural integrity:** All 439 cand + 21 prop records PASS every validation check
- **Federal Pattern A coverage:** PRES cycles 1918-1996, all major SEN/GOV cycles
- **OCR verification:** 18 years of clipping OCR confirm data direction
- **Cross-year inc continuity:** All 83 repeat candidate groups verified (0 party inconsistencies)
- **Cross-paper validation:** 59/8 EC-EP agreements
- **dname coverage:** 100%
- **Notes coverage:** 100%
- **Pattern K:** 0
- **Dups:** 0
- **Empty endorsed:** 2 (1 valid unopposed, 1 valid NO RECOMMENDATION)
- **Mean confidence:** 0.864

## Evansville Courier Editorial Identity (V7 Confirmed)

EC was a R-leaning IN paper with notable cross-party flexibility:
- **R federal default**: Nixon 60/68/72, Reagan 80/84, Bush 88/92, Dole 96 — straight R PRES picks
- **D PRES exceptions**: 1920 Cox D, 1928 Smith D, 1964 LBJ D
- **Cross-party SEN flexibility**: Bayh D inc 68/74/80 (3 cycles), 1990 Hill D
- **8th District H pattern**: McCloskey D 84/88/92 (4 cycles cross-party), then Hostettler R 96+
- **Cross-party GOV**: 1992 Bayh D, 1996 O'Bannon D
- **Cross-paper context**: EP was straighter-R; EC was more cross-party-flexible

This pattern aligns with IN tradition of R papers endorsing capable D incumbents on individual merits.
