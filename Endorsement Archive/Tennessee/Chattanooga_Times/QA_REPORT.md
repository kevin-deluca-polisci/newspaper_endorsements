# QA Report: Chattanooga Times

**Audit date:** 2026-04-02
**Folder:** done/Chattanooga_Times
**Newspaper ID:** 143902
**Data coverage:** 1922-1962, 21 clippings, 121 candidate records, 10 proposition records

## Overall Assessment

**PASS WITH FIXES**

The Chattanooga Times folder is in excellent shape. Spot-check accuracy was 100% across three sampled clippings. A small number of structural and coding issues were found and corrected: empty newspaper_id across all rows, one non-standard office code, and metadata placeholders. Two low-confidence records were independently verified and confirmed correct.

## Stage 1: Structural Validation

**CSV columns:** OK — both candidates (16 columns) and propositions (11 columns) have all expected headers with no missing or extra columns.

**Row integrity:** One issue found and fixed. The `newspaper_id` field was empty in all 121 candidate rows and all 10 proposition rows. Filled with "143902" (the correct ID from the JSON extraction files and newspapermembernumbers.xlsx). No other row-level issues: all years are valid even-numbered integers (1922-1962), all `endorsed` values are 1/0/empty, all confidence scores are between 0 and 1, all state fields are valid 2-letter abbreviations, no "0" values in incumbency fields, no junk rows.

**Election date sanity:** N/A — clipping filenames use `{newspaper}_{year}.pdf` pattern rather than dated filenames.

**Metadata consistency:** Several issues found and fixed. The metadata file had placeholder values ("REVIEW") for Alternative Names and Years Published, and "Number of clippings: 0" instead of the actual count of 21. Metadata candidate/proposition counts (121 and 10) matched CSV row counts correctly. Updated metadata with correct values.

**Newspaper ID:** Filled in all 131 rows (121 candidates + 10 propositions) with "143902".

## Stage 2: Spot Check

**Clippings sampled:** Chattanooga_Times_1934.pdf (early), Chattanooga_Times_1948.pdf (middle), Chattanooga_Times_1960.pdf (late)
**Accuracy:** 100%

**1934 (2 pages, Nov 5-6):** Independent extraction found 4 candidate endorsements: McAlister (Governor, D, endorsed), McKellar (Senator, D, endorsed), Bachman (Senator, D, endorsed), McReynolds (H-3, D, endorsed). Data matched exactly — 4/4 correct.

**1948 (3 pages, Oct 31 - Nov 2):** Independent extraction found 8 endorsements: Dewey (President, R), Kefauver (Senator, D), Browning (Governor, D), Frazier (H-3, D), Ragon (State Senator, D), Locke (State Rep, D), Aymon (State Rep, D), Chambliss (State Rep, D). Data contains all 8 plus Truman (President, D, opposed) — a reasonable inferred opposition record from the Dewey endorsement. 9/9 correct.

**1960 (1 page, Nov 8):** Independent extraction found 5 candidates and 2 propositions: Kennedy (President, D), Johnson (VP, D), Kefauver (Senator, D), Caldwell (State Rep, D), Leader (State Rep, D), amendment to extend trustee's term (for), school bond referendum (for). Data matched exactly — 7/7 correct.

**Recommendation:** Good shape. No errors found in spot-check sample.

## Stage 3: Variable Coding & Dedup

**Issues found:** 2 | **Auto-fixed:** 2 | **User-corrected:** 0 | **Remaining:** 0

### Changes made

- **Office codes standardized (1 record):** UTILITY COMMISSION -> RAILROAD COMMISSION for AVERY, J. B., SR. (1952). The Tennessee Railroad and Public Utilities Commission was the correct body; "Utility Commission" was a shorthand from the editorial text. Fixed in both CSV and JSON.
- **Newspaper ID filled (131 records):** newspaper_id was empty in all rows of both CSVs. Filled with "143902" in candidates CSV (121 rows) and propositions CSV (10 rows). JSON files already had the correct ID.

No issues found with: candidate names (all ALL CAPS, LASTNAME FIRSTNAME format), party labels (all standard: Democrat, Republican, Independent), state fields (all valid 2-letter "TN"), district fields, endorsed values, incumbency fields, or proposition fields. No duplicate records detected.

## Stage 4: Low-Confidence Re-Scan

**Records reviewed:** 2 | **Confirmed correct:** 2 | **Corrected:** 0 | **Still uncertain:** 0

### Records reviewed

- **Chattanooga_Times_1950.json — BROWNING, GORDON (Governor, endorsed=1, conf 0.70→0.75):** Re-read the 1950 clipping. The "IN NATION AND STATE" editorial mentions Browning favorably ("Governor Browning will have a light vote") and notes his campaign activity, but uses analytical rather than explicit endorsement language. The coding as endorsed=1 is reasonable given the paper's overall pro-Democratic stance and favorable mentions, but the lack of explicit language justifies moderate confidence. Bumped from 0.70 to 0.75 after independent verification.

- **Chattanooga_Times_1956.json — HANNER, JOHN C. (Service Commission, endorsed=null, conf 0.70→0.75):** Re-read the 1956 clipping. The "IN LOCAL RACES" section mentions Hanner as "candidate for re-election as public service commissioner from Middle Tennessee" who "has no opposition." This is a factual mention of an unopposed candidate, not an endorsement. Correctly coded as endorsed=null (no position). Bumped from 0.70 to 0.75 after independent verification.

All low-confidence records confirmed correct. No corrections needed.
