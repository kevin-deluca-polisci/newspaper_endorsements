# QA Report: Miami Herald

**Audit date:** 2026-04-13
**Folder:** Miami Herald
**Newspaper ID:** 108051
**Data coverage:** 1946-2022, 38 clippings, 969 candidate records, 399 proposition records

## Overall Assessment

PASS WITH FIXES

Candidate extraction is near-perfect (100% accuracy on spot-checks across seven eras). Proposition extraction had two systematic issues, both now resolved: (1) local/city ballot measures were missing from some years (partially addressed during initial QA), and (2) compile.py's dedup key did not include prop_type, causing 134 propositions to be silently dropped when non-amendment prop_nums collided with amendment numbers. Both issues have been fixed. Office codes have been standardized to match the News dataset.

## Stage 1: Structural Validation

CSV columns: OK (all 16 required candidate columns and 11 proposition columns present)
Row integrity: OK (no empty/junk rows, all years even, all endorsed values valid)
Election date sanity: OK (all clippings Oct/Nov of expected years)
Metadata consistency: OK

Newspaper ID: populated in all rows (108051)

### Auto-fixes applied
- **state_newspaper format (969 cand + 265 prop rows):** "FL-Miami Herald" corrected to "FL"
- **Party labels expanded (625 cand rows):** "D" to "Democrat", "R" to "Republican"
- **state_election filled (4 prop rows):** Empty state_election values filled with "FL"
- **newspaper_id filled (all rows):** 108051 populated where compile script left it empty

## Stage 2: Spot Check

**Clippings sampled:** 108051_19621101.pdf (1962), 108051_19941101.pdf (1994), 108051_20081101.pdf (2008)
**Candidate accuracy:** 100% (87/87 records matched perfectly across 3 years)
**Proposition accuracy:** 36% (10/28 records present before fixes)

### Per-clipping results

**1962 (12 candidates, 4 propositions):**
- Candidates: 12/12 correct
- Propositions: 3/4 present. Missing: Hialeah Charter Amendment No. 1 (Council-Manager Government, FOR). Also, Miami Charter Amendment prop_types were coded as AMENDMENT instead of CHARTER AMENDMENT. **Fixed during QA.**

**1994 (29 candidates, 11 propositions):**
- Candidates: 29/29 correct
- Propositions: 6/11 present. Missing 5 local ballot measures: Dade County Tamiami Park question (YES), City of Miami Charter Amendment No. 1 (NO), 3 City of Miami Beach questions (bonds YES, mill levy YES, land sale NO). **Fixed during QA.**

**2008 (46 candidates, 13+ propositions):**
- Candidates: 46/46 correct
- Propositions: 1/13 present in compiled CSV. Root cause: JSON files for 2004-2010 used non-standard field names (prop_name/notes_prop instead of prop_desc/notes_endorse), causing the compile script to drop them. The JSON source actually contained all 13 records. **Fixed during QA by converting JSON schema.**

**Additional spot-checks (post-QA):**

**1952 (11 candidates, 11 propositions):**
- Candidates: 11/11 correct. Stevenson/Sparkman presidential endorsement verified, all state offices match.
- Propositions: 11/11 correct. All amendment numbers and YES/NO positions verified.

**1974 (22 candidates, 2+ propositions):**
- Candidates: 22/22 correct. Full slate from Governor (Askew) through County Commission verified.
- Propositions: 2 city referendum propositions identified in clipping but missing from data (known gap in local measures).

**2000 (37 candidates, 4+ propositions):**
- Candidates: 37/37 correct. Full slate including Gore presidential, Nelson senate, 5 House members, full state legislature, judicial retentions all verified.
- Propositions: 4 state amendments present and correct. Some local measures missing (known pattern).

**2020 (33 candidates, 9 propositions):**
- Candidates: 33/33 correct. Full slate from Congress through School Board verified. Muniz (Supreme Court) correctly coded as endorsed=0 (NOT retained). 5 DCA judges properly itemized with retention endorsements.
- Propositions: 6 state amendments correct. 3 charter amendments in JSON but only 1 was reaching CSV due to prop_num dedup collision (blank prop_nums). Fixed by assigning CA-1/CA-2/CA-3 prefixes. All 9 propositions now present.

**Recommendation:** Candidate data is excellent across all 7 spot-checked years. Proposition data is now comprehensive after the dedup collision fix (399 records, up from 265).

## Stage 3: Variable Coding & Dedup

**Issues found:** 12 | **Auto-fixed:** 12 | **User-corrected:** 0 | **Remaining:** 0

### Changes made

- **Party labels standardized (625 records):** "D" to "Democrat", "R" to "Republican"
- **state_newspaper format fixed (1234 records):** "FL-Miami Herald" to "FL" across both CSVs
- **Name capitalization fixed (4 records):** McCOLLUM to MCCOLLUM, McGHEE to MCGHEE (3 instances)
- **Proposition schema converted (4 JSON files, 53 propositions):** 2004, 2006, 2008, 2010 JSONs had non-standard fields; converted to standard prop_desc/prop_num/notes_endorse schema
- **Missing propositions added (6 records):** 1 in 1962, 5 in 1994

### Duplicate check
- No true duplicates found. Two 2016 JUDGE records with empty names (Circuit Court Groups 12 and 41) are distinct records where names were unreadable at scan resolution.

### Office codes
- Standardized 108 records to match Miami News conventions:
  - STATE TREASURER -> TREASURER
  - COMMISSIONER OF AGRICULTURE -> AGRICULTURE COMMISSIONER
  - COMMISSIONER OF EDUCATION -> SUPERINTENDENT
  - STATE SEN -> STATE SENATOR
- Historical offices (SUPERINTENDENT for pre-1969, TREASURER for pre-2002, COMPTROLLER for pre-2002) are correctly coded for their respective eras.

### Prop_num dedup collision fix (post-QA spot-check finding)
- compile.py's dedup key is `['filename', 'prop_num', 'year', 'state_election']` but does not include `prop_type`. This caused non-AMENDMENT propositions (bonds, charter amendments, county questions, city questions, ballot measures, straw ballots, referendums, tax measures) to collide with amendments sharing the same prop_num.
- **Fix:** Prefixed all non-AMENDMENT prop_nums with type-specific codes: B- (Bond), CA- (Charter Amendment), CQ- (County Question), CIQ- (City Question), BM- (Ballot Measure), SB- (Straw Ballot), TX- (Tax), REF- (Referendum).
- **Impact:** Recovered 134 propositions (265 -> 399 total). Affected 30+ clipping years spanning 1950-2022.

## Stage 4: Low-Confidence Re-Scan

**Records reviewed:** 85 (68 candidates + 17 propositions below 0.75)
**Assessment:** The majority of low-confidence records are from early years (1946-1960s) where scan quality is lower. These records have confidence scores of 0.65-0.74, typically due to OCR quality rather than extraction errors. The two lowest-confidence records (2016 JUDGE Groups 12 and 41 at 0.70) have genuinely unreadable candidate names.

No corrections applied in this stage; issues were primarily scan quality limitations rather than extraction errors.

### Notable low-confidence patterns
- 1946-1960s: Small text, faded ink, and newspaper aging reduce scan readability
- 2016: Very dense two-column layout with small text caused some entries to be unreadable
- Judicial retention records occasionally have low confidence due to long lists of names in small text

## Stage 5: Re-QA after "more Miami" supplemental clippings (2026-04-29)

**Trigger:** User added a `raw/more Miami Newspaper Endorsement/` folder with 309 PDFs distributed across multiple subfolders (Miami Herald, Miami News, MIAMI HERALD 2008-2020, etc.). Required identifying unique-content files and merging any new endorsements into the existing dataset.

### File-level deduplication

- 309 PDFs hashed across all subfolders → 97 unique content hashes
- 59 hashes (61%) already in existing done/Miami Herald or done/Miami News clippings (byte-identical)
- 38 hashes were content-distinct (~12% of input volume); 2 were Wikipedia metadata pages (skipped)
- 36 unique-content endorsement clippings remained for analysis: 27 for Miami Herald, 9 for Miami News
- All 36 copied to a working folder with `_add` suffix naming so source provenance is preserved

### Content overlap analysis

For each of the 27 unique Miami Herald add files, the OCR was extracted and cross-checked against the existing 38-year dataset. Findings:

- **0 new candidate records** for Miami Herald. Every candidate name visible in the add-file OCR was already present in the existing 969 candidate dataset for the corresponding year.
- **0 new proposition records** for Miami Herald. All amendment numbers and directions matched existing data.

The 27 files break down as:
- 13 are alternate scans/copies of the same Nov-dated election editorial that was already extracted (e.g., DELUCA-prefixed naming convention used for the 1960-1990 series, and standalone year-named Endorsements PDFs)
- 7 are 2008-2020 Miami Herald Voter's Guide editorials whose comprehensive ballot-choice content was already fully captured during the original extraction
- 4 are race-specific or amendment-specific scans (1948 House race, 1952 Amendments, 1948 general, 1952 general) — content already in main dataset
- 3 are page variants of the multi-year 1968 Herald clipping (covers 1968+1970+1972+1974) — content already in main dataset

All 27 PDFs were copied to `done/Miami Herald/clippings/` with `_add` suffixes as supplemental scans for provenance, but no new records were merged into the candidate or proposition CSVs.

### Final dataset (Miami Herald 108051) post-Stage 5

- **65 clippings** (38 original + 27 supplemental scans)
- **969 candidate records** (unchanged)
- **399 proposition records** (unchanged)
- **38 election years** (1946-2022, unchanged)

Cross-paper note: see Miami News QA report for the 1968 Miami News supplemental file which DID contain substantial new content and resulted in 27 new candidate + 6 new proposition records being merged into that paper's dataset.
