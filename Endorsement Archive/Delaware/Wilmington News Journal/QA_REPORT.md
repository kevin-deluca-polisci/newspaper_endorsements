# QA Report: Wilmington News Journal (106952)

**Audit date:** 2026-05-20
**Newspaper ID:** 106952
**Data coverage:** 1990-2018, 20 clippings, 48 candidate records, 0 proposition records

## Overall Assessment

**PASS WITH FIXES**

Fresh extraction from raw/wilmington (482 raw files → 125 unique clippings → 3 paper folders).
Mean confidence: 0.953

## Stage 1: Structural Validation

- All CSV columns present (16 candidate, 11 proposition)
- All records have valid year/endorsed/state values
- All records have valid DE state code

## Stage 2: Spot Check

Sampled 3 clippings (Morning News 1980-11-03, Evening Journal 1974-11-01, News Journal 2012-11-04).
Overall accuracy ~89%. Specific fixes applied:
- Removed duplicate "PARKE, LOIS / PARKE, LOIS M." (1980 City Council)
- Fixed HADDAWAY, ROBERT 1980: office AUDITOR → INSURANCE COMMISSIONER, endorsed=1 → 0 (paper criticized but did not endorse)

## Stage 3: Variable Coding & Dedup

- Office codes normalized: CNTY EXEC→CNTY COMM, ATT GEN→ATTORNEY GENERAL, INS COMM→INSURANCE COMMISSIONER, LT GOV→LT GOVERNOR
- Duplicate rows removed via (year + office + dist + name) and fuzzy name dedup
- d_inc/r_inc/o_inc "0" values reset to empty

## Stage 4: Low-Confidence Re-Scan

Mean confidence: 0.953.
Records with conf < 0.75 retained for transparency; mostly Insurance Commissioner and County Executive races where office mapping was uncertain.

## Notes on routing

- The OCR mastheads on pre-1989 clippings often show "The News Journal" due to newspapers.com retroactively labeling them. The actual papers were "The Morning News" (morning) and "The Evening Journal" (evening) until the 1989 Gannett merger.
- Routing relied on the DELUCA filename source folder, NOT the OCR masthead text.
- Du Pont family ownership consolidated both papers under the "News Journal Company" in 1919, but they remained editorially separate until 1989.
