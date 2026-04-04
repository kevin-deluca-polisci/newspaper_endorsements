# QA Report: Anniston Star

**Audit date:** 2026-04-02
**Folder:** Anniston Star
**Newspaper ID:** 100050
**Data coverage:** 2008-2016, 5 clippings, 34 candidate records, 33 proposition records

## Overall Assessment

**PASS**

Exceptionally clean folder. Modern clippings (2008-2016) with clear, list-format endorsement summaries. 100% accuracy on spot-check. No corrections needed. All confidence scores are 0.90 or above.

## Stage 1: Structural Validation

- CSV columns: OK. All expected columns present in both candidates (16 columns) and propositions (11 columns).
- Row integrity: OK. All years valid (2008-2016, all even). Endorsed values are 1, 0, or empty (3 records with no recommendation).
- Election date sanity: OK. All clippings from November of the corresponding election years.
- Metadata consistency: OK. Record counts match CSVs. Updated REVIEW placeholders for Alternative Names, Years Published, and Newspaper ID.
- Newspaper ID: 100050 populated in all rows.

## Stage 2: Spot Check

**Clippings sampled:** Anniston_Star_2008_Endorsements.pdf (2008), Anniston_Star_2016_Endorsements.pdf (2016)
**Accuracy:** 100%

### 2008 clipping
Independently identified 9 candidates and 1 proposition. All 10 records in the CSV matched perfectly: correct names, offices, districts, and endorsement directions.

### 2016 clipping
Independently identified 1 candidate (Clinton for President) and 14 proposition recommendations. The "3rd District, U.S. House: No recommendation" was correctly excluded from the data. All 15 records matched perfectly, including the two No recommendations (Amendments 8 and 10).

**Recommendation:** Excellent shape. No issues found.

## Stage 3: Variable Coding & Dedup

**Issues found:** 0 | **Auto-fixed:** 0 | **User-corrected:** 0 | **Remaining:** 0

No corrections needed. All office codes are standard or accepted Alabama-specific codes (SERVICE COMMISSION for Public Service Commission). All names in correct LASTNAME, FIRSTNAME format. Party labels valid. No duplicates. Incumbency fields clean (no erroneous "0" values).

## Stage 4: Low-Confidence Re-Scan

**Records reviewed:** 0 | **Confirmed correct:** N/A | **Corrected:** 0 | **Still uncertain:** 0

No records below the 0.75 confidence threshold. Minimum confidence in the dataset is 0.90. No re-scan needed.
