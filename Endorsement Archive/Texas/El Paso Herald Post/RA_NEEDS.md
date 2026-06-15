# RA Manual Review Needs: El Paso Herald Post

**Status:** AI processing complete through V4. The items below require manual RA intervention.

## V4-V5 Resolutions

- **Priority 2 RESOLVED (V4):** 1962 H 16 RUTHERFORD R record corrected to FOREMAN ED R via cross-paper ET verification. Added RUTHERFORD D inc opp Pattern A.
- **1934 (2 clippings, 0 records) + 1940 (1 clipping, 0 records):** Confirmed clipping-extraction gaps. May warrant re-extraction.
- **OCR quality limitation confirmed (V4):** Multiple attempts at 100/150/200/300 DPI with PSM 1/6/11 produced empty text output for most clippings. The clipping images are scanned at low resolution. Structural data limit.
- **92 confidence boosts (V4):** Records with ET cross-paper agreement boosted to 0.92.
- **NM cross-border dnames fixed (V5):** "Texas Senate" → "New Mexico Senate", "Texas Governor" → "New Mexico Governor", "1" → "U.S. House New Mexico At-Large".
- **Cross-year inc audit (V5):** 37 repeat candidate groups verified — 0 inc inconsistencies. TX D long-tenure officials properly tracked.
- **Additional Pattern A added (V5):** 5 LT GOV + RR COMM opp records.
- **11 confidence boosts (V5):** Pattern A records 0.80 → 0.85 with strong historical justification.

## Priority 1: Sparse early-year coverage

EHP has gaps in 1938-1950, 1942-1948, 1978-1988. Additional clippings would expand TX coverage.

## Priority 2: 1962 H 16 RUTHERFORD party verification

EHP record shows RUTHERFORD, J.T. as Republican for 1962 H 16, but historically Rutherford was a Democrat (D-TX 16, 1955-1963) who LOST as the D incumbent in 1962 to Ed Foreman R who flipped the seat. The R coding may be an extraction error.

**Recommended:** RA should verify the 1962 clipping to confirm whether:
- EHP endorsed Rutherford D inc (correct historical alignment), or
- The Republican coding indicates EHP actually endorsed Foreman R challenger (which would be unusual editorial pattern)

## Priority 3: 3 STATE REP empty dist (1974+)

Records with empty dist in post-1972 single-member district era:
- 1974 STATE REP SCOGGINS, RALPH (SKIP) R - needs dist
- 1976 STATE REP JONES, LUTHER D - needs dist  
- 1976 STATE REP VALLES, ROBERT D - needs dist

OCR of source clippings should reveal specific dist numbers.

## Priority 4: NM cross-border coverage

5 records have state_election=NM (legitimate El Paso border coverage):
- 1936 H DEMPSEY, JOHN J. (D NM at-large)
- 1936 SENATOR CHAVEZ, DENNIS D + HATCH, CARL D (NM)
- 1954 SENATOR MECHEM, EDWIN L. R (NM)
- 1958 GOVERNOR MECHEM, EDWIN L. R (NM)

These are correctly coded. EHP routinely covered cross-border NM races due to El Paso's geographic position.

## Priority 5: 1990/1994 PDF OCR quality

Higher-resolution clipping scans for 1990 and 1994 would help verify the rich years (17 + 23 records).

## What is NOT a concern (V3 PASS)

- **Structural integrity:** All 214 cand + 178 prop records PASS every validation check.
- **Federal Pattern A coverage:** All PRES cycles 1936-1996 have R+D pairs (Landon 36 + FDR; Eisenhower 52/56 + Stevenson; Nixon 60/68/72 + JFK/HHH/McGovern; Ford 76 + Carter; Reagan 80 + Carter inc; Bush 92 + Clinton; Dole 96 + Clinton inc; LBJ 64 + Goldwater R outlier).
- **EHP editorial identity:** R-leaning PRES picks 1936-1996 with LBJ D 1964 exception. Local TX races mostly D (one-party era). Notable D endorsement of Ann Richards D for GOV 1990/1994.
- **Cross-paper validation:** With sister TX paper El Paso Times (folder 61): 92 direct candidate agreements, PRES picks agreed 8/11 overlap years. EHP and ET divergence on 1992/1996 Clinton (ET endorsed Clinton D, EHP endorsed Bush/Dole R) reflects ET's late-90s shift.
- **TX-specific offices:** RAILROAD COMMISSION (13), LT GOV (12), COMPTROLLER (5), AG COMM (5), LAND COMM (5), TX SUPREME COURT (8), COURT OF CRIMINAL APPEALS (2) — all properly coded.
- **dname coverage:** 100% (0 empty).
- **Notes coverage:** 100%.
- **Empty party:** 0 (all filled).
- **Pattern K:** 0.
- **Duplicates:** 0 (12 dups removed across V2 + V3).
- **Mean confidence: 0.851.**
