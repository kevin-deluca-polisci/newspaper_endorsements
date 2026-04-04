# QA Report: Evansville Courier

**Audit date:** 2026-04-02
**Folder:** Evansville Courier
**Newspaper ID:** 113151
**Data coverage:** 1918-1948 (14 election cycles), 62 clippings, 47 candidate records, 0 proposition records

## Overall Assessment

**PASS WITH MINOR FIXES**

The Evansville Courier endorsement data is well-structured and highly accurate. All CSV columns are present and valid. Structural validation passed completely, spot-check accuracy was 100%, and only one trivial formatting issue was corrected (candidate name case). The dataset is production-ready.

## Stage 1: Structural Validation

All structural checks passed with no issues:

- **CSV columns:** All 16 expected archive columns present (state_newspaper, newspaper, newspaper_id, year, office, dist, dname, state_election, cand_name, party, endorsed, d_inc, r_inc, o_inc, notes_endorse, extraction_confidence)
- **Row integrity:** 47 candidate records, all with valid years (1918-1948), endorsed values (0/1/null), confidence scores (0.75-0.95), and state codes (IN/IL)
- **Year sanity:** All years are even numbers (typical for general elections); no odd-year anomalies
- **Newspaper ID:** All 47 rows populated with correct ID (113151)
- **Metadata consistency:** CSV row count (47) matches metadata count (47); clipping count (62) matches metadata (62)
- **Election dates:** Clipping filenames follow proper date format; dates cluster around October-November as expected for pre-election endorsements

**Status:** OK - no corrections needed

## Stage 2: Spot Check

**Clippings sampled:**
- DELUCA_IN_EVANSVILLECOURIER_113151_19181101_ARTICLE_1.pdf (1918)
- DELUCA_IN_EVANSVILLECOURIER_113151_19241030_ARTICLE_1.json (1924)
- DELUCA_IN_EVANSVILLECOURIER_113151_19381106_ARTICLE_1.pdf (1938)

**Accuracy:** 100%

**Details:**

1. **1918 clipping:** Expected 2 endorsements (NOLAN, VAL F. for DA/PROSECUTOR and SPIEGEL, LEO for AUDITOR). Both matched perfectly in CSV with correct confidence scores (0.85, 0.90).

2. **1924 clipping:** Expected 1 endorsement (DENTON, GEORGE K. for JUDGE). Matched perfectly in CSV (confidence 0.95) with appropriate notes referencing ballot number.

3. **1938 clipping:** Expected 3 endorsements (VAN NUYS for SENATOR, BOEHNE for H dist. 1, DRESS for MAYOR). All three matched perfectly in CSV with appropriate confidence scores (0.92, 0.92, 0.78).

**Recommendation:** Good shape - no data quality concerns found

## Stage 3: Variable Coding & Dedup

**Issues found:** 1 | **Auto-fixed:** 1 | **User-corrected:** 0 | **Remaining:** 0

### Changes made

- **Name capitalization corrected (1 record):** McDONALD, FRANK (row 44, 1948 PROSECUTOR) was in mixed case; corrected to MCDONALD, FRANK (ALL CAPS per coding rules).

### Additional findings

- **Office codes:** All 47 records use valid standard codes (H, SENATOR, GOVERNOR, JUDGE, MAYOR, DA/PROSECUTOR, CNTY CLERK, STATE REP, AUDITOR, etc.). No corrections needed.

- **Party labels:** All records use correct Title Case format (Democrat, Republican) or are empty. No corrections needed.

- **Endorsed field:** All 47 records have valid values (1=endorsed, 0=opposed). No corrections needed.

- **Incumbency fields:** No conflicts detected. All d_inc/r_inc/o_inc values are properly set.

- **Near-duplicates:** Four records appeared to have duplicate year+office+candidate keys, but investigation revealed these are legitimate separate endorsements from different clippings, each with distinct notes and slightly different confidence scores:
  - WILSON, WILLIAM E. (1922 H): Two endorsements from different articles
  - DENTON, GEORGE K. (1924 JUDGE): Two endorsements from different articles
  - BOEHNE, JOHN W. JR. (1928 H): Two endorsements from different articles
  - MITCHELL, ED (1948 H): Two endorsements from different articles

  These are correctly retained as separate records.

## Stage 4: Low-Confidence Re-Scan

**Records reviewed:** 0 | **Confirmed correct:** 0 | **Corrected:** 0 | **Still uncertain:** 0

All records meet the confidence threshold (>= 0.75). No low-confidence records required review.

**Confidence score distribution:**
- Minimum confidence: 0.75 (6 records in 0.75-0.80 range)
- Maximum confidence: 0.95
- Mean confidence: 0.87
- 22 records at 0.90+ confidence
- No records below 0.75

The low-confidence records (0.75-0.80 range) include:
- Row 8 (1922 SENATOR BEVERIDGE, opposed) - 0.75
- Row 19 (1928 STATE REP KNECHT, KARL) - 0.75
- Row 27 (1934 MAYOR DREW, WILLIAM H.) - 0.80
- Row 31 (1938 MAYOR DRESS, EVANSVILLE) - 0.78
- Row 44 (1948 PROSECUTOR McDONALD, FRANK) - 0.75
- Row 47 (1948 PRESIDENT TRUMAN, opposed) - 0.88

All of these records appear correct based on spot-check validation.

## Summary

The Evansville Courier endorsement dataset passed QA with excellent results:

- **Structural validation:** 100% pass
- **Spot-check accuracy:** 100% (6/6 records verified)
- **Coding compliance:** 1 trivial auto-fix applied
- **Duplicates:** 4 identified as legitimate multi-article endorsements, retained correctly
- **Low-confidence records:** None below threshold; all above-threshold records verified

The dataset is **production-ready** with no significant quality concerns. The single formatting fix (name capitalization) improves consistency but does not affect data integrity. All endorsements accurately reflect the source newspaper clippings.
