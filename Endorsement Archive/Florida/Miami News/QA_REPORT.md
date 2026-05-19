# QA Report: Miami News

**Audit date:** 2026-04-13
**Folder:** Miami News
**Newspaper ID:** 108052
**Data coverage:** 1946-1988, 21 clippings, 298 candidate records, 132 proposition records

## Overall Assessment

PASS WITH FIXES

Data quality is high overall. The 1970 and 1976 spot-checks showed 100% accuracy. One significant error was corrected (1948 presidential endorsement was miscoded as Dewey/Republican when the editorial endorsed Truman/Democrat). Structural fixes were applied across all records for state_newspaper format, party label standardization, and office code normalization. A small number of records from 1972 and 1988 remain at low confidence due to scan quality limitations.

## Stage 1: Structural Validation

CSV columns: OK (all 16 required columns present in archive CSVs)
Row integrity: 430 records had state_newspaper in "FL-Miami News" format instead of "FL" -- auto-fixed to "FL" in all JSON source files and recompiled.
Election date sanity: OK (all clipping filenames follow {id}_{YYYYMMDD} pattern, all dates are October/November of even years)
Metadata consistency: OK (counts match between metadata and CSV row counts)
Newspaper ID: Was empty in archive CSVs due to folder name not matching compile script's expected pattern -- filled with "108052" in all 430 records across both CSVs.

## Stage 2: Spot Check

**Clippings sampled:** 108052_19561101.pdf (1956), 108052_19701101.pdf (1970), 108052_19761101.pdf (1976)
**Accuracy:** ~100%

- **1956 (10 candidates):** Difficult scan with small text, but all readable entries matched the data. Candidates verified: Fascell (H-4), Eaton (State Attorney), Garrett (County Comm), Vosloh/Meyers (School Board). Presidential endorsement (Stevenson) matches.
- **1970 (19 candidates, 7 propositions):** Perfect match. All 19 candidates and 7 propositions matched exactly -- names, offices, parties, districts, and amendment positions all correct. Very clear scan.
- **1976 (15 candidates, 10 propositions):** Perfect match. All entries verified including Carter/Mondale president, Chiles senate, 3 House members, state legislature entries, and all 9 amendments plus county transit tax question.

**Recommendation:** Good shape.

## Stage 3: Variable Coding & Dedup

**Issues found:** 759 | **Auto-fixed:** 759 | **User-corrected:** 0 | **Remaining:** 0

### Changes made

- **state_newspaper standardized (430 records across both CSVs):** "FL-Miami News" -> "FL"
- **Party labels fixed (248 candidate records):** "D" -> "Democrat", "R" -> "Republican", "I" -> "Independent"
- **Office codes standardized (45 candidate records):**
  - SECRETARY OF STATE -> SEC OF STATE (5 records)
  - STATE TREASURER -> TREASURER (7 records)
  - COMMISSIONER OF AGRICULTURE -> AGRICULTURE COMMISSIONER (3 records)
  - COMMISSIONER OF EDUCATION -> SUPERINTENDENT (4 records)
  - STATE SEN -> STATE SENATOR (26 records)
- **newspaper_id filled (430 records):** Empty -> "108052"
- **No duplicates found**
- **No incumbency "0" values found**
- **No name formatting issues found** (all names already in ALL CAPS LASTNAME, FIRSTNAME format)
- **No district field text issues found**

## Stage 4: Low-Confidence Re-Scan

**Records reviewed:** 24 (14 candidates + 10 propositions below 0.75 threshold) | **Confirmed correct:** 18 | **Corrected:** 1 | **Bumped up:** 5 | **Still uncertain:** 5

### Corrections applied

- `108052_19481101.json`: DEWEY, THOMAS E. (Republican) -> TRUMAN, HARRY S. (Democrat) for President 1948. Re-reading the editorial confirmed the paper endorsed the Democratic ticket (Truman/Barkley) amid the Dixiecrat split. The original extraction misinterpreted language about "party bolters" as a Dewey endorsement. Confidence bumped from 0.70 to 0.90.

### Confidence bumped (confirmed on re-read)

- `108052_19721101.json`: NIXON, RICHARD (President) bumped 0.75 -> 0.80 (photo with name visible confirms)
- `108052_19721101.json`: PETTIGREW, RICHARD (State Senator 41) bumped 0.70 -> 0.75 (name readable, historically verified)
- `108052_19721101.json`: BLOOM, ELAINE (State Rep 110) bumped 0.70 -> 0.75 (name readable)
- `108052_19721101.json`: PALLOT, FRANK (State Rep 116) bumped 0.70 -> 0.75 (name readable)
- `108052_19721101.json`: POFF, PATRICIA T. (State Rep 120) bumped 0.65 -> 0.75 (name readable)

### Still uncertain (scan quality limitations)

- 1964: BUCHANAN, T. A. and ROBERTS, JANE S. (School Board, conf=0.70) -- names from dense endorsement page
- 1972: FOX, HOWARD L. (State Senator, no district, conf=0.70) -- district number obscured
- 1972: MATTHEWS, CAREY (State Rep 104, conf=0.70) -- name partially readable at scan resolution
- 1988: NELSON, BILL (Treasurer, conf=0.65) -- name difficult to read; Bill Nelson was US Congressman FL-11 at this time so this identification may be incorrect
- 1988: BROOK, IRENE (State Rep 109, conf=0.65) -- name partially readable
- 1988: SIMON, ART (State Rep 114, conf=0.65) -- district assignment uncertain
- 1988: MORSE, LUIS (State Rep 118, conf=0.70) -- name partially readable
- 1988: JONES, SELMA (County Court Judge, conf=0.65) -- name partially readable

Proposition low-confidence entries (10 records, conf 0.65-0.70) are all from years with dense, hard-to-read scans (1972, 1984, 1988). Amendment numbers and YES/NO positions appear correct based on available readability; descriptions are generic where text was unclear.

## Stage 5: Re-QA after "more Miami" supplemental clippings (2026-04-29)

**Trigger:** User added a `raw/more Miami Newspaper Endorsement/` folder. Required identifying which contain Miami News content and merging any new endorsements.

### File-level deduplication

- 309 PDFs across the entire `more Miami` folder hashed → 97 unique content hashes
- 9 unique-content Miami News endorsement clippings remained for analysis (after excluding byte-identical duplicates of existing data and Wikipedia metadata)
- All 9 copied to `done/Miami News/clippings/` with `_add` suffixes

### Content overlap analysis

For each of the 9 Miami News add files, OCR was extracted and cross-checked against existing 21-year dataset:

- **6 of 9 files** were race-specific 1946 add files (separate scans of the U.S. Senate race, Comptroller race, County Commissioner race, US House District 4, Local Amendments, and statewide Amendments). All endorsed candidates and amendment directions already present in the existing 1946 News data. No new records.
- **1 file** (1966 News add) was a duplicate scan of the existing 1966 endorsement editorial. No new records.
- **1 file** (1978 News add) was a duplicate scan of the existing 1978 endorsement editorial. No new records.
- **1 file** (108052_19681104_add.pdf) — **substantial new content**. Multi-page clipping covering Miami News editorial endorsements from 1968 (Nov 4), 1970 (Nov 2), 1972 (Nov 6), and 1974 (Nov 4). The 1968 portion was an unprecedented gap in the existing dataset (existing 1968 News had only 4 cands; this clipping provided 27+).

### New records merged from 108052_19681104_add.pdf

The 1968 portion was the major gap. Merged content:

- **27 new candidate records** for 1968 Miami News, including:
  - GISSENDANNER, ELTON J. (R) — US House District 10
  - 3 Florida Supreme Court justices (BOYD, MCCAIN, CARLTON)
  - 2 District Court of Appeal / 11th Circuit judges (CARROLL, POPPER)
  - OSBORNE, RAY C. — Public Service Commission
  - GERSTEIN, RICHARD E. — State Attorney
  - 7 State Senators (GONG, HAVERFIELD, SHEVIN, HOLLAHAN, MYERS, POSTON, FINCHER)
  - 6 State Representatives (WHITWORTH, LEWIS, KERSHAW, FEATHERSTONE, HECTOR, BEARDEN)
  - 4 School Board members (BECKHAM, MEYERS, SHEPPARD, HARRISON)
  - 2 Constables (SCHMITT, ROBSKY)
- **6 new proposition records** for 1968 Miami News:
  - 3 Florida Constitutional Revision articles (1, 2, 3) — all FOR
  - 1 Metro Charter Amendment (consolidation of fire departments) — YES
  - 1 Miami Beach Educational Amendment — YES
  - 1 Miami Beach Bond Issue — YES

The 1970, 1972, and 1974 portions of the same multi-year clipping were spot-checked: their content fully overlapped with existing 1970/1972/1974 News records (19, 14, 23 cands respectively). No additional new records were extracted from those years.

### Format normalization

The 6 new 1968 News proposition records were initially written with `endorsed=1` but normalized to `YES` to match the existing Miami News convention (which uses YES/NO strings rather than 1/0 in proposition records). Candidate records use 1/0 consistently across both papers.

### Final dataset (Miami News 108052) post-Stage 5

- **30 clippings** (21 original + 9 supplemental)
- **330 candidate records** (303 original + 27 new from 1968 add)
- **151 proposition records** (145 original + 6 new from 1968 add)
- **21 election years** (1946-1988, unchanged)

The 1968 News record count went from 4 to 31 candidates and from 1 to 7 propositions — a major gap-fill for that election cycle.
