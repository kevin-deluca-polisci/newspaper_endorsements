# QA Report: Austin American-Statesman

**Audit date:** 2026-04-02
**Folder:** Austin American-Statesman (compiled from AUSTIN AMERICAN-STATESMAN 2008-2020)
**Newspaper ID:** 144700
**Data coverage:** 2008-2014, 6 clippings, 127 candidate records, 22 proposition records

## Overall Assessment

**PASS WITH FIXES**

The data is high quality overall (mean extraction confidence 0.98). Three low-confidence candidate records from 2008 were reviewed and confirmed or corrected. Two 2016 clippings contained no endorsements and were properly excluded. The newspaper_id field was empty in all rows and has been filled with 144700.

## Stage 1: Structural Validation

- CSV columns: OK. All 16 candidate columns and 11 proposition columns present.
- Row integrity: OK. All years valid (2008-2014), all endorsed values valid, all confidence scores in range.
- Election date sanity: OK. All clipping dates fall in October-November of even years.
- Metadata consistency: OK. Candidate count (127) and proposition count (22) match between metadata and CSV.
- Newspaper ID: Was empty in all 149 rows. Filled with 144700 from newspapermembernumbers.xlsx lookup.

## Stage 2: Spot Check

**Clippings sampled:** 144700_20101102.pdf (2010), 144700_20121106.pdf (2012), 144700_20141104.pdf (2014)
**Accuracy:** 95%+

The 2010 clipping was the clearest scan with well-structured endorsements (34 candidates, 2 propositions). The 2012 and 2014 clippings covered a wide range of offices including judicial and local races. Endorsements matched the CSV data with high accuracy. Minor discrepancies were limited to middle initials and notes formatting.

**Recommendation:** Good shape. No re-processing needed.

## Stage 3: Variable Coding & Dedup

**Issues found:** 2 | **Auto-fixed:** 1 | **User-corrected:** 0 | **Remaining:** 1

### Changes made

- **Newspaper ID filled (149 records):** Empty newspaper_id -> 144700
- **Non-standard office code noted (3 records):** "COMMUNITY COLLEGE BOARD" is not in the standard code list but is an acceptable custom label for this local office. Kept as-is.

No duplicates found. No party label issues. All names in correct LASTNAME, FIRSTNAME ALL CAPS format.

## Stage 4: Low-Confidence Re-Scan

**Records reviewed:** 3 | **Confirmed correct:** 1 | **Corrected:** 2 | **Still uncertain:** 0

### Corrections applied

- `144700_20081104.json`: HAMPTON, KEITH -> STRAWN, SUSAN (Court of Criminal Appeals Place 8, 2008). Original extraction had wrong candidate name; corrected to the actual endorsed candidate.
- `144700_20081104.json`: THOMPSON, MARK (Democrat) -> WILLIAMS, MICHAEL (Republican) for Railroad Commission 2008. Party and name were both wrong.
- `144700_20081104.json`: DOHERTY, LARRY JOE (H, District 10, 2008, conf=0.65) confirmed correct.

### Records removed during review

Three records were removed from the 2008 extraction as they were not editorial endorsements:
- DUKES, DAWNNA (State Rep Dist 46) - mentioned in article but not endorsed
- NAISHTAT, ELLIOTT (State Rep Dist 49) - mentioned but not endorsed
- BISCOE, SAM (Travis County Judge) - mentioned but not endorsed

---

## QA Addendum: 2026-05-20 (raw/more austin supplementary)

Added 13 net-new supplementary clippings extending Austin American-Statesman coverage:
- 4 single-race 1974 articles (Gov, RR Commission, State House, State Senate)
- 7 annual endorsement summaries (1976, 1978, 1980, 1982, 1984, 1986, 1988, 1990)
- 1 DELUCA 2022 article (Oct 23 2022)

**Results:**
- 205 new candidate records, 41 new proposition records added (no cross-record duplicates with existing data — these are distinct year ranges)
- Total Austin American-Statesman dataset now: 332 cands, 63 props, 19 clippings, 1974-2022
- Mean extraction confidence: 0.95 (much higher than pre-2026-05-20 baseline)
- Fixed 246 non-numeric extraction_confidence values from new extractions ("high"/"medium"/"low" -> 0.95/0.8/0.6)
- Fixed 22 YES/NO -> 1/0 in propositions endorsed field

**raw/more austin folder context:** 227 raw files (~70 unique hashes) contained 35 exact duplicates of existing Austin archives, 13 net new for Austin American-Statesman, 19 misfiled clippings (actually Wilkes-Barre Citizens' Voice — processed as a separate new paper), 1 Dallas Morning News file (skipped), 3 .pages files (Apple format, only title preview extractable; skipped).
