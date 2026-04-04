# QA Report: El Paso Times (145300)

**Audit date:** 2026-04-04 (second QA pass after gap-fill extraction)
**Folder:** done/El Paso Times
**Newspaper ID:** 145300
**Data coverage:** 1920-2018, 80 clippings, 356 candidate records, 179 proposition records

## Overall Assessment

PASS WITH FIXES

The folder is in good shape after comprehensive gap-fill extraction work. Stage 1 structural validation found no issues. The spot-check (Stage 2) found one name spelling error (REGELIO → ROGELIO). Stage 3 found two empty candidate names that were filled from clipping review. The most significant finding came in Stage 4: the 1960 Constitutional Amendment 3 was incorrectly coded as FOR when the clipping explicitly opposes it ("all amendments except the third one"). All 5 low-confidence records have been verified and corrected; none remain below 0.75.

## Stage 1: Structural Validation

- **CSV columns:** OK. Both candidates (16 columns) and propositions (11 columns) have all expected fields.
- **Row integrity:** All 356 candidate rows and 179 proposition rows pass validation. No invalid years, no bad endorsed values, no confidence values out of range, no junk rows.
- **state_newspaper / state_election:** All populated with valid 2-letter codes. No empty or invalid values.
- **Incumbency fields:** No erroneous "0" values found.
- **Election date sanity:** 78 of 80 clippings fall within Oct/Nov range. Two March 2018 clippings (145300_20180305.pdf, 145300_20180305_local.pdf) are primary endorsements — expected.
- **Metadata consistency:** Counts match between metadata and CSV.
- **Newspaper ID:** Populated in all rows (145300).

No issues found.

## Stage 2: Spot-Check Endorsement Accuracy

**Clippings sampled:**
1. `145300_19361031.pdf` + `145300_19361103.pdf` (1936 — amendments + candidates)
2. `145300_19721103.pdf` (1972 — candidates + propositions)
3. `145300_20041030.pdf` (2004 — candidates; PDF unreadable, could not verify)

**Accuracy:** 39/40 = 97.5% (excluding unreadable 2004 clipping)

### Clipping 1: 1936 (Oct 31 + Nov 3)
Oct 31 clipping titled "For Texas Amendments" discusses 4 constitutional amendments, all endorsed FOR. All 4 proposition records in CSV match perfectly. Nov 3 clipping too small to read independently, but 2 candidate records (Roosevelt PRESIDENT, Tingley NM GOVERNOR) are consistent with editorial content. **4/4 verified propositions correct.**

### Clipping 2: 1972 (Nov 3)
Independent extraction identified 21 candidates and 15 propositions (14 constitutional amendments + 1 urban renewal). CSV had 21 candidates and 15 propositions. One name spelling error found: "SANCHEZ, REGELIO" should be "SANCHEZ, ROGELIO" (1972 CNTY COMM Precinct 3). All proposition endorsement directions correct. **35/36 correct (1 name spelling error, now fixed).**

### Clipping 3: 2004 (Oct 30)
PDF is image-only with no extractable text; OCR timed out. CSV has 1 record (BUSH, GEORGE W. PRESIDENT). Could not independently verify. Record is consistent with legacy xlsx data and historical record. **Unable to verify.**

**Recommendation:** Good accuracy. One name fix applied.

## Stage 3: Variable Coding & Dedup

**Issues found:** 4 | **Auto-fixed:** 4 | **User-corrected:** 0 | **Remaining:** 0

### Office codes
27 distinct office codes, all valid standard codes. No corrections needed. Good coverage of federal (PRESIDENT, SENATOR, H), state (GOVERNOR, STATE REP, TX SUPREME COURT, etc.), and local (CNTY COMM, CNTY JUDGE, SHERIFF, etc.) offices.

### Candidate names
Two empty candidate names found and filled from clipping review:
- Row 44: 1970 CNTY CLERK → BOLES, J. WAYLON
- Row 137: 1982 DISTRICT COURT JUDGE (Dist 41) → SCOGGINS, RALPH

One spelling correction from spot-check:
- 1972 CNTY COMM: SANCHEZ, REGELIO → SANCHEZ, ROGELIO

All other names in proper ALL CAPS LASTNAME, FIRSTNAME format.

### Party labels
176 Democrat, 116 Republican, 1 Independent, 63 empty. All valid. Empty party fields are local candidates where party was not listed in endorsement.

### Duplicates
No duplicate candidate records. No duplicate proposition records.

### District fields
All properly formatted (no "District"/"Dist" prefix). dname matches dist in all populated rows.

### Proposition descriptions
85 proposition records have empty descriptions (across years 1954, 1962, 1968, 1970, 1972, 1978, 1980, 1984, 1988). These are from gap-fill extraction batches where prop_type and prop_num were captured but detailed descriptions were not. The records are identifiable by their prop_num and are valid — descriptions are supplementary but not required for downstream merging.

### State fields
All state_newspaper and state_election values are valid 2-letter abbreviations. No "National" or long-format values found.

## Stage 4: Low-Confidence Re-Scan

**Records reviewed:** 5 | **Confirmed correct:** 4 | **Corrected:** 1 | **Still uncertain:** 0

All 5 low-confidence records were 1960 propositions extracted from hard-to-read clippings. Re-read clippings 145300_19601106.pdf, 145300_19601107.pdf, and 145300_19601108.pdf.

- **1960 Bond Issue** (conf 0.70 → 0.75): Nov 8 article says "We urge the approval of all of the local bond issues." Confirmed FOR. Bumped confidence.
- **1960 Amendment 1** (conf 0.70 → 0.75): Nov 8 article endorses "all of the proposed amendments except the third one." Confirmed FOR. Bumped confidence.
- **1960 Amendment 2** (conf 0.70 → 0.75): Same source. Confirmed FOR. Bumped confidence.
- **1960 Amendment 3** (conf 0.70 → 0.80): **CORRECTED.** The article explicitly states: "all of the proposed amendments to the State Constitution, except the third one which would double the cost of operating the State Legislature." Changed endorsed from 1 (FOR) to 0 (AGAINST). This was previously coded as FOR based on Herald Post cross-reference, but the Times took a different position on this amendment.
- **1960 Amendment 4** (conf 0.65 → 0.75): Same source. Confirmed FOR. Bumped confidence.

### Corrections applied

- 1960 Amendment 3: endorsed 1 → 0 (AGAINST), confidence 0.70 → 0.80, added explanatory note
- 1960 Bond Issue: confidence 0.70 → 0.75
- 1960 Amendments 1, 2: confidence 0.70 → 0.75
- 1960 Amendment 4: confidence 0.65 → 0.75
- 1972 CNTY COMM: SANCHEZ, REGELIO → SANCHEZ, ROGELIO
- 1970 CNTY CLERK: empty name → BOLES, J. WAYLON
- 1982 DISTRICT COURT JUDGE: empty name → SCOGGINS, RALPH

## Confidence Distribution (current)

- **Candidates:** Min 0.75, Max 0.95, Mean 0.85
- **Propositions:** Min 0.75, Max 0.95, Mean 0.83
- **Below threshold (0.75):** 0

## Data History

- **2026-04-03:** Initial compilation from legacy xlsx + clipping extraction. First QA pass applied 8 fixes.
- **2026-04-03:** Systematic gap-fill added 99 proposition records from clipping review.
- **2026-04-03:** Second gap-fill added 31 more proposition records (1950, 1956, 1960, 1966, 1992, 2002) + 9 candidate records (2018 local).
- **2026-04-04:** This QA pass: fixed 1960 Amendment 3 direction (FOR → AGAINST), filled 2 empty candidate names, corrected 1 name spelling, verified and bumped 5 low-confidence records.

## Remaining Known Issues

1. **Empty proposition descriptions:** 85 records across 9 years (1954-1988) have empty prop_desc fields from gap-fill extraction. Records are identifiable by prop_type and prop_num. Not a blocker for downstream analysis but reduces human readability.
2. **Empty party fields:** 63 candidate records have no party identification (local candidates where party was not listed in endorsement clipping).
3. **Proposition gaps verified as legitimate:** Years 1922, 1924, 1928, 1932, 1938, 1974, 1994, 1996, 1998, 2000, 2004, 2006, 2008, 2018 have clippings but no proposition endorsements (candidates-only content confirmed by clipping review).
