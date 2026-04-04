# QA Report: Austin Chronicle

**Audit date:** 2026-04-02
**Folder:** Austin Chronicle
**Newspaper ID:** Not available (not in newspapermembernumbers.xlsx; the Chronicle is an alternative weekly not in the standard NAA registry)
**Data coverage:** 2012, 1 clipping, 36 candidate records, 18 proposition records

## Overall Assessment

**PASS WITH FIXES**

Excellent data quality. All 54 records have extraction confidence of 1.0. The single 2012 clipping was a comprehensive endorsement guide covering federal, state, and local races plus ballot propositions. Five office code standardization issues and a party label issue ("Democratic" -> "Democrat") were identified and should be fixed.

## Stage 1: Structural Validation

- CSV columns: OK. All expected columns present (plus additional pipeline columns).
- Row integrity: OK. All years valid (2012), endorsed values valid (1, 0, and null for one no-position proposition), confidence scores all 1.0.
- Election date sanity: OK. Single clipping dated November 6, 2012 (Election Day).
- Metadata consistency: OK. 36 candidates and 18 propositions match between metadata and CSV.
- Newspaper ID: Empty. Not found in newspapermembernumbers.xlsx. The Austin Chronicle is an alternative weekly newspaper, likely not in the standard Newspapers.com/NAA member registry.

## Stage 2: Spot Check

**Clippings sampled:** AUSTINCHRONICLE_20121106.pdf (the only clipping)
**Accuracy:** 100%

Independent extraction matched all 36 candidate endorsements and 18 proposition records. The Chronicle's 2012 endorsement guide used a clean, readable format with bold candidate names and clear for/against positions for each proposition. No missing endorsements, no extra records, no field errors.

**Recommendation:** Good shape. Formatting fixes only.

## Stage 3: Variable Coding & Dedup

**Issues found:** 6 types | **Auto-fixed:** 0 (identified, not yet applied) | **User-corrected:** 0 | **Remaining:** 6

### Changes needed

- **Party label (36 records):** "Democratic" -> "Democrat"
- **Office code (2 records):** "RAILROAD COMMISSIONER" -> "RAILROAD COMMISSION"
- **Office code (2 records):** "STATE BOARD OF EDUCATION" -> "STATE BOARD OF ED"
- **Office code (3 records):** "TEXAS SUPREME COURT" -> "TX SUPREME COURT"
- **Office code (1 record):** "COUNTY COMMISSIONER" -> "CNTY COMM"
- **Office code (4 records, optional):** "THIRD COURT OF APPEALS" is more specific than the standard "COURT OF APPEALS" -- could keep as-is since it adds useful information.

One record was removed during processing: the Barton Springs/Edwards Aquifer Conservation District Pct 3 Director seat had no candidate filed (listed as "UNKNOWN" with no endorsement). Dropped since no actual endorsement was made.

No duplicates found. All names in correct LASTNAME, FIRSTNAME ALL CAPS format.

## Stage 4: Low-Confidence Re-Scan

**Records reviewed:** 0 | **Confirmed correct:** 0 | **Corrected:** 0 | **Still uncertain:** 0

No low-confidence records. All 54 records have extraction_confidence = 1.0. No re-scan needed.
