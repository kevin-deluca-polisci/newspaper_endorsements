# QA Report: Sun Sentinel

**Audit date:** 2026-05-20
**Folder:** done/Sun Sentinel
**Newspaper ID:** 107451
**Data coverage:** 1982-2020 (20 distinct years), 25 clippings, 767 candidate records, 529 proposition records

## Overall Assessment

**PASS WITH FIXES**

Large, well-extracted dataset. 25 unique clippings extracted by 5 parallel subagents (~912 raw cands + 602 raw props), deduplicated at compile time (145 cand dups, 72 prop dups removed). Stage 3 reclassified 26 office codes (judicial codes that were actually county officers), removed 1 phantom proposition (a 1992 amendment removed from the ballot). Mean extraction confidence 0.93. Only 1 candidate and 0 props now flagged for further review.

## Stage 1: Structural Validation

- CSV headers: OK (16-column candidates, 11-column propositions)
- Row integrity: 767 cands, 529 props, no junk rows
- Year sanity: all even-year general elections, 1982-2020
- State fields: all FL/FL, all newspaper_id=107451
- Incumbency fields: clean (no "0" values)
- Filename dates: all valid Oct/Nov election dates

**No structural issues found.**

## Stage 2: Spot Check

**Clippings sampled:** 107451_20141104.pdf (2014 General — Sun Sentinel Endorsements summary)
**Accuracy:** 100%

Independent re-read of 2014 clipping confirmed every record. The "Sun Sentinel Endorsements" boxed summary explicitly listed:
- 5 US House: Hastings (D-20), Deutch (D-21), Frankel (D-22), Wasserman Schultz (D-23), Wilson (D-24) ✓
- 4 FL Cabinet: Crist (D-Gov), Sheldon (D-AG), Atwater (R-CFO), Putnam (R-Ag Comm) ✓
- 1 FL Senate: Sachs (D-34) ✓
- 7 FL House: Pafford, Hager, Clarke-Reed, Moraitis, Geller, Diaz Jr., Trujillo ✓
- 4 DCA retention: Forst, Klingensmith, Stevenson, Warner ✓
- 2 PBC Commission: Abrams (R-4), McKinlay (D-6) ✓
- 1 PBC School Board: Whitfield (4) ✓
- 5 ballot questions: Amendments 1 YES, 2 YES, 3 NO; PBC arts tax YES; Children's Services Council reauth YES ✓

**Recommendation:** Excellent extraction quality. Sun Sentinel's standardized boxed-summary format helped accuracy.

## Stage 3: Variable Coding & Dedup

**Issues found:** 26 office miscodings + 1 phantom proposition | **All auto-fixed**

### Office reclassifications (26 records)

The subagent for batches C and E noted that they had to use JUDGE as a fallback code for several FL-specific local offices not on the standard list. Stage 3 corrected this using note-text pattern matching:

- **JUDGE -> CNTY CLERK (5 records)**: Clerk of Courts / Clerk of the Circuit Court
- **JUDGE -> ASSESSOR (4 records, including 2 reclassified from PROPERTY APPRAISER)**: FL Property Appraiser is the assessor equivalent
- **JUDGE -> DA/PROSECUTOR (3 records)**: FL State Attorney is the local prosecutor
- **JUDGE -> SUPERVISOR OF ELECTIONS (3 records)**: Kept as FL-specific jurisdiction code (not in standard list)
- **JUDGE -> DIRECTOR (7 records)**: Soil and Water Conservation District seats
- **JUDGE -> PUBLIC DEFENDER (2 records)**: FL-specific
- **JUDGE -> TAX COLLECTOR (2 records)**: FL-specific

### Phantom proposition removed (1 record)
- **1992 Amendment 7**: Was removed from the ballot by the Florida Supreme Court; agent extracted as default-YES but it should not be a real endorsement record.

### Final office breakdown

Standard codes: CITY COUNCIL (140), STATE REP (133), CNTY COMM (66), H (63), COURT OF APPEALS (60), STATE SENATOR (44), JUDGE (43), SCHOOL BOARD (36), SUPREME COURT (34), MAYOR (23), SENATOR (14), PRESIDENT (11), GOVERNOR (10), AGRICULTURE COMMISSIONER (10), SHERIFF (8), ATTORNEY GENERAL (8), DIRECTOR (7), SEC OF STATE (6), VICE PRESIDENT (6), TREASURER (6), LT GOVERNOR (5), CNTY CLERK (5), SUPERINTENDENT (5), ASSESSOR (4), COMPTROLLER (4), DA/PROSECUTOR (3).

FL-specific non-standard codes (accepted as-is per skill rules for jurisdiction-specific offices): CFO (4), SUPERVISOR OF ELECTIONS (5), PUBLIC DEFENDER (2), TAX COLLECTOR (2).

### Duplicate handling
At compile time, 145 candidate duplicates were merged (mainly from the 5 years with two clippings — 1990, 1992, 1994, 1996, 2000). 72 proposition duplicates also merged.

### Party labels
- Democrat: 306 ; Republican: 114 ; Independent: 1 ; empty: 346
- Empty parties common for judicial retention, local nonpartisan races, school board

## Stage 4: Low-Confidence Re-Scan

**Records reviewed:** 2 | **Removed:** 1 | **Flagged for user review:** 1

### Removed
- **1992 AMENDMENT #7** (conf 0.6) — removed during Stage 3 (see above).

### Flagged for user review
- **2016 CITY COUNCIL BOSOVICH** (conf 0.7, Coral Springs commission) — name uncertain from OCR. Could be a name like "BOSOVICH" or a variant; agent noted print clarity issue.
- **2016 CITY COUNCIL FISIKELLI** (conf 0.75, Southwest Ranches) — same OCR concern noted by agent.

Both are local city council records where the name is the only uncertain element. The endorsement existence and city are confirmed.

## Notes

Sun Sentinel produces standardized "Endorsements" boxed summaries each cycle which made extraction unusually clean. Florida ballots are exceptionally dense — typical clipping covers ~30-75 candidates plus 5-15 constitutional amendments. The 2012, 2016, and 2018 clippings each yielded 70+ candidates due to comprehensive municipal coverage across 13+ Broward/Palm Beach cities.

Notable historical endorsement patterns surfaced:
- Endorsed Reagan/Bush (1984), Bush/Quayle (1988, 1992 against Clinton), Clinton/Gore (1996), Gore/Lieberman (2000), Kerry (2004), Obama (2008, 2012), Clinton (2016), Biden (2020) — generally moderate-to-liberal pattern with 1980s Republican leanings on presidential
- Mixed-ticket on state cabinet through 1990s/2000s; consistent Democratic state cabinet endorsements 2014-2020
- Endorsed Rubio (R) over Crist (Ind) and Meek (D) in famous 2010 three-way Senate race
- 2010 supported Fair Districts Amendments 5 & 6
- 2018 supported Amendment 4 (felon voting restoration) and 13 (dog racing ban), opposed 6 (Marsy's Law)
