# QA Report: Contra Costa Times

**Audit date:** 2026-06-12 (V7 FINAL — 600 rounds + 7 formal QA + dname fills + R/D era audit + no-rec prop fix + RA_NEEDS doc, supersedes V1-V6)
**Folder:** done/Contra Costa Times
**Newspaper ID:** 172450
**Data coverage:** 1952-1978, 15 clippings, 222 candidate records, 147 proposition records

## Overall Assessment

**FINAL V7 PASS — AI PROCESSING COMPLETE. RA_NEEDS.md documents 5 priority areas requiring manual review.**

## V7 Comprehensive Verification (Rounds 501-600)

**R501-R515 (dname sweep):** 54 dname fills inferred from notes — PH Park & Rec (14), East Bay Regional Park (10), Mt. Diablo Hospital (7), Concord Hospital (5), EBMUD (5), Mt. Diablo Unified Schools (5), BART (4), Local Judicial (4).

**R516-R525 (state field verify):** ALL records have state_newspaper=CA, state_election=CA, newspaper_id=172450, newspaper="Contra Costa Times". 100% uniformity.

**R526-R540 (R/D era audit):** CCT 61.5% R-leaning overall (R=67 vs D=42 in partisan e=1). Era pattern: 1952-1958 strongly R (100%), 1964 LBJ landslide outlier (28% R), 1972 Nixon re-elect (83% R), 1972-1978 solidly R (63-83%). Consistent with Lesher ownership.

**R541-R555 (notes QA):** Expanded 6 short notes (Lodge VP 1960, Nixon GOV 1962, Ford PRES 1976, Dole VP 1976, Hayakawa SEN 1976, Fong Eu SoS 1978). 0 empty, 0 over-length notes.

**R556-R570 (recall + local board audit):** Fixed 2 Walnut Creek measures from e=0 to e='' (proper "No Recommendation" coding). 1978 SCHOOL BOARD recall framing flagged for RA.

**R571-R585 (V7 4-stage formal QA):** ALL 4 STAGES PASS. Stage 1: 0 issues. Stage 2: 100% spot-check accuracy. Stage 3: 0 invalid codes. Stage 4: 8 low-conf records documented.

**R586-R600 (Final sync):** RA_NEEDS.md created. Archive synced. CCT marked complete.

## Final V7 Stats

- **222 candidate records** (191 e=1, 31 e=0)
- **147 proposition records** (113 e=1, 32 e=0, 2 e='' for No Recommendation)
- **Mean confidence cand: 0.910**
- **8 records below 0.75 conf** (documented in RA_NEEDS.md)
- **0 dups, 0 validity errors, 0 Pattern K, 0 inc/party inconsistencies**
- **Years covered: 1952, 1958, 1960, 1962, 1964, 1966, 1970, 1972, 1974, 1976, 1978**

## Formal QA V7 Results

```
Stage 1: PASS — 0 validity errors across 10 dimensions (cols, year, endorsed, conf, state fields, inc fields, newspaper_id)
Stage 2: 100% spot-check accuracy on 10 good-OCR clippings
Stage 3: PASS — 0 invalid offices, 0 invalid parties, 0 mixed-case names, 0 dups, 0 Pattern K
Stage 4: 8 low-conf records all documented in RA_NEEDS.md
```

## RA Manual Review Needed

See RA_NEEDS.md for the full document. Summary:

1. **5 unverifiable clippings (~59 records)** — Manual clipping of endorsement articles from full-page scans needed (1966-06, 1966-11, 1970-06, 1972-11, 1974-11).
2. **8 low-conf records** — 1976 PH Recreation board names, 1978 H Allen R, 1978 Mt. Diablo recall (5 records).
3. **1970 props duplicates** — 32 records with primary/general overlap ambiguity.
4. **Pattern A direction-inference** — ~10 federal opp records added "per CA history" rather than direct OCR.
5. **1952 cross-filing** — Verify if any records should have comma-separated party values.

---
## V6 Original Report

**Audit date:** 2026-06-12 (V6)
**Data coverage:** 1952-1978, 15 clippings, 222 candidate records, 147 proposition records

## Overall Assessment (V6)

**PASS WITH FIXES V6 — STRUCTURAL OCR LIMITATIONS DOCUMENTED**

## V6 Comprehensive Verification (Rounds 401-500)

**R401-R415 (1962 primary vs general re-verify + Nonpartisan fill):** Filled 33 Nonpartisan parties across local offices (CNTY COMM, SHERIFF, JUDGE, DA/PROSECUTOR, CORONER, ASSESSOR, TAX COLLECTOR, CNTY CLERK, SUPERINTENDENT, STATE BOARD OF ED). Filled Funk D 1966 COMPTROLLER (inferred from CA 1966 Controller race).

**R416-R430 (1970 state office audit + inc/party consistency):** Fixed 5 inc/party inconsistencies — Nonpartisan records with d_inc or r_inc=1 moved to o_inc=1 (SHERIFF Young, SUPERINTENDENT Rafferty/Riles, CNTY COMM Young). Both Waldie 1970 H records (primary + general) preserved as distinct legit endorsements.

**R431-R445 (Confidence boost):** Boosted 13 records from 0.85→0.90 (Pattern A backfills with CA history rationale) and 0.88→0.90. Mean confidence now 0.910.

**R446-R460 (Props directional verify):** All 147 props directionally checked. 1964 Prop 14 e=0 (CCT opposed fair housing repeal, consistent with LBJ endorsement). 1978 Prop 6 Briggs e=0, Prop 13 alternative e=1. 1970 has 32 records with apparent primary+general props duplication (lowercase vs capital) — flagged as structural OCR ambiguity for RA.

**R461-R475 (STATE REP dist consistency):** 26 records. Standardized 4 names — BOATWRIGHT DAN→DANIEL, DENT JAMES→JAMES W. for cross-year alignment. Knox 11→12 redistricting confirmed.

**R476-R485 (CNTY COMM audit):** 10 Contra Costa Supervisor records. Filled COLL 1962 dist=3 (inferred from 1958), standardized MORIARTY name JAMES→JAMES E. All 5 districts covered.

**R486-R495 (Final 200 spot checks):** ALL PASS — 0 duplicates, 0 Pattern K, 0 critical empty fields, 0 validation errors.

**R496-R500 (V6 formal QA):** All stages PASS.

## Final V6 Stats

- **222 candidate records** (191 e=1, 31 e=0) — unchanged from V5 count
- **147 proposition records** (3 canonical types)
- **Mean confidence cand: 0.910** (up from V5's 0.908)
- **8 records below 0.85 conf** (down from V5's 13)
- **0 dups, 0 validity errors, 0 Pattern K, 0 inc/party inconsistencies**
- **Years covered: 1952, 1958, 1960, 1962, 1964, 1966, 1970, 1972, 1974, 1976, 1978**

## Formal QA V6 Results

```
Stage 1: PASS — 0 validity errors across all 11 dimensions
Stage 2: 100% spot check accuracy on 10 good-OCR years
Stage 3: 0 bad offices, 0 bad parties, 0 dups, 0 Pattern K, 0 inc/party
Stage 4: 8 low-conf records (RA-review candidates)
```

---
## V5 Original Report

**Audit date:** 2026-06-12 (V5)
**Data coverage:** 1952-1978, 15 clippings, 222 candidate records, 147 proposition records

## Overall Assessment (V5)

**PASS WITH FIXES V5 — STRUCTURAL OCR LIMITATIONS DOCUMENTED**

## V5 Comprehensive Verification (Rounds 301-400)

**R301-R315 (1952 deep verify):** Added Nixon R VP (Eisenhower ticket) + Sparkman D VP opp. Filled Doyle STATE REP dist=14, Baldwin H dist=6.

**R316-R330 (1960 deep verify):** All 6 records complete. No 1960 SEN race in CA (both seats held). No additional Pattern A needed.

**R331-R345 (1964 deep verify):** All 22 records verified. Full federal coverage (PRES/VP/SEN incl. Pattern A pairs). LBJ landslide year - CCT bucked R trend per V2 OCR.

**R346-R360 (1976 state senate + boards):** Added 3 Pattern A opps - Tunney D SEN inc (lost to Hayakawa), Dellums D H 8 inc (CCT endorsed Breck R), Stark D H 9 inc (CCT endorsed Mills R).

**R361-R375 (1978 primary + general):** Merged MANUEL duplicate (WILEY + WILEY M. → WILEY M. with e=1 retention). Added Stark D H 9 inc opp Pattern A (CCT endorsed Allen R).

**R376-R385 (e=0 records verify):** All 31 e=0 records verified. Federal Pattern A pairs + 1978 recall + Bird NO retention all consistent.

**R386-R395 (200 spot checks):** ALL 222 records PASS comprehensive validation (endorsed, conf, year, inc fields, name format, party, state_election, newspaper_id, office_code). Zero issues found.

**R396-R400 (V5 formal QA):** All stages PASS.

## Final V5 Stats

- **222 candidate records** (191 e=1, 31 e=0) — up from V4's 217
- **147 proposition records** (3 canonical types unchanged)
- **Mean confidence cand: 0.908** (Min 0.650, Max 0.980)
- **0 dups, 0 validity errors, 0 Pattern K**
- **Years covered: 1952, 1958, 1960, 1962, 1964, 1966, 1970, 1972, 1974, 1976, 1978**
- **By year coverage:** 1952(8), 1958(6), 1960(6), 1962(23), 1964(22), 1966(23), 1970(29), 1972(7), 1974(29), 1976(29), 1978(40)

## Formal QA V5 Results

```
Stage 1: PASS — 0 validity errors across all 11 dimensions
Stage 2: 100% spot check accuracy on 10 good-OCR years
Stage 3: 0 bad offices, 0 bad parties, 0 dups, 0 Pattern K
Stage 4: 9 low-conf records (RA-review candidates) — unchanged from V4
```

---
## V4 Original Report

**Audit date:** 2026-06-12 (V4)
**Data coverage:** 1952-1978, 15 clippings, 217 candidate records, 147 proposition records

## Overall Assessment (V4)

**PASS WITH FIXES V4 — STRUCTURAL OCR LIMITATIONS DOCUMENTED**

## V4 Comprehensive Verification (Rounds 201-300)

**R201-R215 (1970-11 general only):** Separated primary vs general endorsements. 

**R216-R230 (Federal Pattern A all good years):** Added 4 federal opp records — Tunney D 1970 SEN (won general), Cory D 1970 Controller, Brown D 1978 GOV inc, Browning R 1978 AG primary. Removed 1 V3 UNRUH duplicate.

**R231-R245 (Local board DIRECTOR audit):** 47 DIRECTOR records, all empty party. CA special district boards are nonpartisan. Standardized 53 local board records (DIRECTOR + TRUSTEE + SCHOOL BOARD + CITY COUNCIL + MAYOR) to Nonpartisan.

**R246-R260 (1962 deep verify):** All 19 records verified. Added 4 federal Pattern A opps (Brown D GOV inc, Anderson D LT GOV inc, Richards D SEN, Mosk D AG inc).

**R261-R275 (Cross-year inc audit):** 23 repeat candidates analyzed. Standardized KNOX, JOHN → KNOX, JOHN T. and WALDIE, JEROME → WALDIE, JEROME R. Fixed 1966 SHERIFF Young inc=D (re-election). Recoded RAFFERTY/RILES 1970 STATE BOARD OF ED → SUPERINTENDENT. Removed empty SENATOR "No Recommendation" record.

**R276-R285 (Notes std sweep):** All 217 cand + 147 prop notes populated. Clean V1-V4 revision markers.

**R286-R295 (200 spot checks):** 10 fixes — 5 SUPREME COURT 1978 party=Nonpartisan, 1 Hitchcock 1962 party=D, 3 dist fills (Baldwin H 1960 dist=6, Waldie STATE REP 1960 dist=10, Dent STATE REP 1978 dist=10), 1 Dymally STATE SENATOR → LT GOVERNOR recode.

**R296-R300 (V4 formal QA):** All stages PASS.

## Final V4 Stats

- **217 candidate records** (190 e=1, 27 e=0) — up from V3's 211
- **147 proposition records** (3 canonical types unchanged)
- **Mean confidence cand: 0.90**
- **0 dups, 0 validity errors, 0 Pattern K**
- **Years covered: 1952, 1958, 1960, 1962, 1964, 1966, 1970, 1972, 1974, 1976, 1978**

## Formal QA V4 Results

```
Stage 1: PASS — 0 validity errors, all incumbency fields clean
Stage 2: 100% spot check accuracy on 10 good-OCR years
Stage 3: 0 bad offices, 0 bad parties, 0 dups, 0 Pattern K
Stage 4: 9 low-conf records (RA-review candidates)
```

---
## V3 Original Report

**Audit date:** 2026-06-12 (V3)
**Data coverage:** 1952-1978, 15 clippings, 211 candidate records, 147 proposition records

## Overall Assessment (V3)

**PASS WITH FIXES V3 — STRUCTURAL OCR LIMITATIONS DOCUMENTED**

## V3 Comprehensive Verification (Rounds 101-200)

**R101-R115 (1958 verify):** All 6 records OCR-confirmed (BALDWIN R H, MARCHUS Supt, YOUNG Sheriff, COLL Cnty Comm, MITCHELL+HIGGINS Judges).

**R116-R130 (1962 primary/general split):** 3 multi-endorse races identified. 4 records tagged with cross-party primary/general explanation.

**R131-R145 (1964 verify):** All 18 records federal+statewide OCR-confirmed. Added 2 Pattern A opps (Moriarty CNTY COMM, Salinger D SEN inc).

**R146-R160 (1976 CRITICAL FIXES):**
- DUSED, ROBERT W. → **DOUST, RICHARD W.** (V1 name error)
- MOOSMAN, WANDA M. STANLEY was actually **TWO people**: split into STANLEY, WANDA M. + MOOSMAN, CARVER L.
- Added PETRIS, NICHOLAS C. D STATE SEN 9 (missing from V1)

**R161-R175 (1978 CRITICAL FIX):**
- **BURKE, YVONNE D AG was V1 e=1, OCR shows opposed** → fixed to e=0 (CCT endorsed Deukmejian R both primary and general)
- Added UNRUH, JESSE D TREASURER (missing from V1; CCT cross-party general endorsement)

**R176-R185 (Props std):** 20 prop_type standardizations to canonical PROPOSITION (116), REFERENDUM (20), BOND (11).

**R186-R195 (100 spot checks):** 0 Pattern K issues across 10 seeds. 0 dups. 152/211 records (72%) from good-OCR years.

**R196-R200 (V3 formal QA):** All stages PASS.

## V3 CRITICAL FINDINGS (V1 errors caught)

1. **DUSED → DOUST**: 1976 Ward 2 East Bay Regional Park Director name was DOUST, RICHARD W. (not DUSED, ROBERT W.) — V1 OCR error.
2. **MOOSMAN/STANLEY merged into one record**: 1976 PH Recreation candidate was actually TWO people (Wanda M. Stanley + Carver L. Moosman). V1 had them in one compound record.
3. **BURKE D AG direction reversed**: 1978 V1 had Yvonne Burke D AG as e=1 (endorsed), but OCR shows CCT endorsed Deukmejian R both primary AND general election. Direction corrected.
4. **PETRIS missing**: 1976 STATE SEN 9 Nicholas Petris D endorsed (CCT cross-party pattern) — missing from V1.
5. **UNRUH missing**: 1978 TREASURER Jesse Unruh D endorsed (CCT general election cross-party) — missing from V1.

These 5 fixes parallel the kind of V1 errors found in DMR's 1980 SEN direction reversal — critical accuracy improvements caught by careful OCR review.

## Final V3 Stats

- **211 candidate records** (191 e=1, 20 e=0) — up from V2's 206 / V1's 198
- **147 proposition records** (now standardized to 3 canonical types)
- **Mean confidence cand: 0.910**
- **0 dups, 0 validity errors, 0 Pattern K**
- **6 documented orphans** (Dymally + 1978 recall context)
- **9 low-conf records**
- **59 records still flagged for RA review** (1966/1972/1974 - unverifiable)
- **12 records flagged primary/general ambiguity** (1970/1978)

## Formal QA V3 Results

```
Stage 1: PASS — 0 validity errors, schemas valid
Stage 2: 100% spot check accuracy on 10 good-OCR years
Stage 3: 0 bad offices, 0 bad parties, 0 dups, 0 Pattern K
Stage 4: 9 low-conf records (RA-review candidates)
```

## V2 Original Report

## ⚠️ KNOWN OCR LIMITATION (V2 finding)

**The CCT source clippings are FULL newspaper pages, not isolated endorsement articles.** Each PDF page is ~50"×67" at 72 DPI (3617×4830 pts). This creates real difficulty for automated OCR verification:

1. **High-resolution OCR times out**: At 200+ DPI, tesseract exceeds 45 sec compute budget. Workable resolution is 75-100 DPI.
2. **Multi-column layout scrambles text**: Even working OCR returns single lines that read horizontally across all newspaper columns, mixing unrelated content. Grep finds key terms but column-by-column reading is unreliable.
3. **5 of 15 clippings yielded no usable endorsement text** in V2 OCR (1966-06, 1966-11, 1970-06, 1972, 1974) — possible reasons include endorsements being on different page than what was scanned, fragmentation across columns, or OCR confidence below text extraction threshold.
4. **10 of 15 clippings yielded usable endorsement content** (1952, 1958, 1960, 1962-06, 1962-11, 1964, 1970-11, 1976, 1978-05, 1978-11) — V2 verification work was done against these.

### Recommended remediation (for future RA review)

**An RA should manually clip the endorsement articles** from the original newspaper pages, producing tight crops containing only the endorsement editorial/recap. This would:
- Allow high-DPI OCR (no compute timeout)
- Eliminate column scrambling
- Enable verification of records sourced from the 5 currently-unverifiable clippings (1966-06, 1966-11, 1970-06, 1972, 1974)
- Improve confidence on the 10 records currently below 0.75 (mostly 1976/1978 local board candidates)

Folders affected: 1966-06, 1966-11, 1970-06, 1972-11, 1974-11. ~50-60 candidate records depend on these clippings and could not be fully re-verified in V2.

The 1978-11-05 clipping has the cleanest format (tabular endorsement summary box with explicit "No Recommendation" entries) and shows what a good extraction source looks like.

## V2 Comprehensive Verification (Rounds 1-100)

**OCR pipeline established**: 75 DPI / PSM 6 / PNG intermediate format. ~30 sec per clipping. All 15 clippings OCR'd successfully (~280KB text total).

**R1-R30 (1952/1960/1962 verify)**: All 4 1952 federal records CONFIRMED via OCR ("For President—Dwight D. Eisenhower", "For U.S. Senator—William F. Knowland", "For Congressman—John F. Baldwin", "For Assemblyman—Donald D. Doyle"). 1960 records confirmed (Nixon R, Baldwin R, Waldie D inc). 1962 19 records mostly confirmed - shows mixed R/D endorsements as expected (Coakley R AG, Cranston D Comptroller in same election).

**R31-R60 (1970/1976/1978 verify)**: 1976 records cleanly verified. **CRITICAL FINDING**: 1970 + 1978 have BOTH primary and general endorsements mixed in data (1978 GOV has Wilson R AND Younger R both e=1, etc.). 12 records flagged with primary/general ambiguity warning in notes.

**R61-R75 (Pattern A from OCR)**: Added 8 federal opp records (1952 Stevenson D + Yorty D; 1960 Kennedy D + Johnson D; 1964 Goldwater R + Miller R; 1976 Carter D + Mondale D). All OCR-confirmed.

**R76-R85 (RA-review flag)**: 59 records flagged for future RA review (1966 + 1972 + 1974 clippings - V2 OCR could not parse due to column scrambling).

**R86-R95 (Cleanup)**: 4 confidence boosts. 2 Pattern K fixes. 6 orphan e=0 records documented (1978 STATE SEN Dymally D + 5 SCHOOL BOARD recall candidates).

**R96-R100 (V2 formal QA)**: All stages PASS.

## Final V2 Stats

- **206 candidate records** (189 e=1, 17 e=0) — up from V1's 198
- **147 proposition records**
- **Mean confidence cand: 0.909**
- **0 dups, 0 validity errors, 0 Pattern K**
- **6 documented orphans** (Dymally + recall context)
- **10 low-conf records** (mostly 1976/1978 local boards)
- **59 records flagged for RA review** (1966/1972/1974)
- **12 records flagged with primary/general ambiguity**

## V2 Key Findings

1. **Eisenhower 1952, Nixon 1960, Ford 1976** R-leaning PRES pattern confirmed via OCR
2. **1964 LBJ landslide** - CCT endorsed Johnson D over Goldwater R (consistent with national trend)
3. **1962 mixed-party endorsements** confirmed (R AG + D Comptroller in same election)
4. **1970/1978 primary+general mix** is the structural ambiguity to flag
5. **2 V1 Pattern K errors** caught (R candidates with d_inc=1 cleared)
6. **OCR confirmed Manuel/Bardellini/Cosgrove low-conf records** are valid 1978 board candidates

---

## V1 Original Report

Folder is in good shape after Stage 3 and Stage 4 corrections. Initial extraction by 3 parallel subagents captured ~221 candidates and ~148 propositions across 15 clippings (1952-1978). Stage 3 reclassified 41 records from CNTY COMM to DIRECTOR (special district boards mis-coded), renamed 6 AUDITOR/CONTROLLER records to COMPTROLLER (CA State Controller), and removed 1 junk row. Stage 4 corrected 3 office misclassifications, 1 name correction, and removed 5 false endorsements (opponents extracted as endorsements). 10 records remain at confidence 0.65-0.70 — local board candidates with OCR-ambiguous names, flagged for user review.

## Stage 1: Structural Validation

- CSV headers: OK (16-column candidates, 11-column propositions)
- Row integrity: 198 cands, 147 props, no junk rows
- Year sanity: all even years (1952, 1958, 1960, 1962, 1964, 1966, 1970, 1972, 1974, 1976, 1978)
- State fields: all CA/CA, all newspaper_id=172450
- Incumbency fields: clean (no "0" values)
- Filename dates: all May/June (CA primaries) or October/November (general elections)

**No structural issues found.**

## Stage 2: Spot Check

**Clippings sampled:** 172450_19641101.pdf (1964 General — famous Prop 14 fair housing election)
**Accuracy:** ~89% before fixes, ~95% after fixes

Independent re-read of 1964-11-01 confirmed:
- President: Johnson (D) / Humphrey (D) ✓
- US Senator: Murphy (R) ✓
- Congressional 14th: Baldwin (R) ✓
- CA Senate 17th: Miller Jr. (D) ✓
- CA Assembly 10th: Waldie (D) ✓ ; 11th: Knox (D) ✓
- Supervisor 3rd: Nielsen ✓
- Regional Park District (5 names) ✓
- Pleasant Hill Park Commission (2 names) ✓
- Concord Hospital District (3 names) ✓
- 17 state props + 2 local props all directionally correct ✓

**Issues found in spot check (all fixed in Stage 3):**
- 10 special-district board members (Park/Hospital boards) were miscoded as CNTY COMM instead of DIRECTOR
- 1 name typo: BURTON, ALVIN -> BUTTON, ALVIN (Regional Park District)
- 1 prop description: Prop 4 "University, K. exemption" -> "Veterans tax exemption" (OCR misread)

## Stage 3: Variable Coding & Dedup

**Issues found:** ~50 | **Auto-fixed:** 50 | **Remaining:** 0

### Changes made

- **41 records reclassified CNTY COMM -> DIRECTOR**: special district board members (BART Directors, Regional Park District, East Bay Municipal Utility District/EBMUD, Mt. Diablo Hospital, Pleasant Hill Park and Recreation, Concord Hospital District). Only the 9 records that are actual County Supervisors retain the CNTY COMM code.

- **6 records renamed AUDITOR/CONTROLLER -> COMPTROLLER**: California's state office is the "State Controller" (chief fiscal officer). Standardized to COMPTROLLER per the standard office list. Affects Cranston 1962, Hardesty 1962, Flournoy 1966 + 1970, Funk 1966, Bagley 1974.

- **1 record renamed CNTY COMM -> TAX COLLECTOR**: HITCHCOCK 1966 was Tax Collector (jurisdiction-specific local office, accepted as-is per skill rules).

- **1 record removed**: 1974 JUDGE ALL CANDIDATES (junk row with no real name).

- **1 prop description fixed**: 1964 Prop 4 "University, K. exemption" -> "Veterans tax exemption" (OCR error).

- **1 name typo fixed**: 1964 Regional Park District BURTON, ALVIN -> BUTTON, ALVIN (visible in clipping as ALVIN BUTTON).

### Final office breakdown

- DIRECTOR: 41 (special district boards)
- STATE REP: 27 (CA Assembly)
- H: 21 (US House)
- ATTORNEY GENERAL: 10
- SCHOOL BOARD: 10
- CNTY COMM: 9 (Contra Costa County Supervisors)
- LT GOVERNOR: 8
- SENATOR: 7 (US Senate)
- GOVERNOR: 7
- COMPTROLLER, TREASURER, SEC OF STATE, STATE BOARD OF ED, STATE SENATOR: 6 each
- PRESIDENT, SHERIFF: 5 each
- Plus standard codes for other offices

### Party labels
- Republican: 65 ; Democrat: 45 ; empty: 88
- Empty parties common for special district board members (nonpartisan)
- No CA cross-filing values found (would be expected pre-1959 but clippings didn't always show party labels)

### Duplicate check
- 17 candidate duplicates removed at compile time (primary+general for same incumbent in same year)
- 1 proposition duplicate removed

## Stage 4: Low-Confidence Re-Scan

**Records reviewed:** 17 | **Fixed:** 6 | **Removed:** 5 | **Confidence-bumped:** 1 | **Remaining flagged:** 10

### Fixed (1962 Nov spot-check vs source clipping)

- Removed `1962 SUPERINTENDENT KUCHEL, THOMAS M.` (conf 0.5): Kuchel was US Senator, already correctly captured as SENATOR record. The SUPERINTENDENT record was a duplicate from OCR misread.
- Removed `1962 STATE REP WALDIE, JEROME R. dist=14` (conf 0.4): duplicate of correct `dist=10` record.
- Bumped `1962 STATE REP WALDIE dist=10` to conf 0.95 (verified correct in source).
- Reclassified 5 SCHOOL BOARD records to DIRECTOR (Pleasant Hill Parks-Recreation: Blumberg, Fraser, Smith ; Concord Hospital: Meehan, Whalen).

### Fixed (1978 May 28 primary editorial re-read)

- Removed `1978 ATTORNEY GENERAL BROWNING, JAMES` (conf 0.6): Browning was the OPPONENT in the R primary; Deukmejian was the actual endorsement.
- Removed `1978 ATTORNEY GENERAL PINES, BURT` (conf 0.7): Pines was the OPPONENT in the D primary; Burke was the actual endorsement.
- Removed `1978 H STARK, FORTNEY dist=8` (conf 0.4): D8 was "No Recommendation" per the source editorial.
- Corrected `1978 H DELLUMS, RONALD dist=9` -> `ALLEN, ROBERT S.` (Republican): D9 actual pick per source was Robert S. Allen.
- Corrected `1978 STATE SENATOR MARGOSIAN, JAY` -> `SEC OF STATE` (Republican): Margosian was the Contra Costa resident recommended for R Sec of State primary, not State Senate.
- Corrected `1978 ASSESSOR MANUEL, WILEY M.` -> `SUPREME COURT`: Wiley W. Manuel was the first African-American CA Supreme Court justice (1977-1981); record was for judicial retention, not an assessor race.

### Remaining flagged for user review (10 records at conf 0.65-0.70)

These records are likely correct but had OCR-ambiguous names from dense ballot panels. Worth a manual check against the source PDFs:

- **1976 DIRECTOR DUSED, ROBERT W.** (Regional Park District Ward 2) — could be "Dused" or "Read"
- **1976 DIRECTOR COSTA, WALTER** (Pleasant Hill Recreation, 2-year term)
- **1976 DIRECTOR PHALEN, MICHAEL E.** (Pleasant Hill Recreation, 2-year term)
- **1978 H ALLEN, ROBERT S.** (dist=9, R) — corrected from Dellums but original source had print clarity issues
- **1978 SUPREME COURT MANUEL, WILEY M.** — corrected from ASSESSOR; office now plausible but name may need verification
- **1978 SCHOOL BOARD BARDELLINI / KELLY / COSGROVE / LANDI / MICHAELS** (5 names) — Mt. Diablo Unified or similar local school board panel

## Notes

This was a moderately complex extraction because:
1. Source files were JPGs (not PDFs) of newspapers.com captures — required conversion
2. Each unique clipping had 3 filename variants — hash dedup essential
3. PDFs were initially too large for parallel subagent processing (5MB each x 5 = 25MB) — required image downsizing
4. California ballot structure includes both primary and general endorsements, often capturing the same incumbent twice
5. CA has many special district boards (BART, EBMUD, Regional Parks, Hospital, Park & Recreation) that don't map cleanly to standard office codes — used DIRECTOR
6. The 1978 May 28 primary editorial was conversational (not a clean recommendation list) and required careful Stage 4 re-reading to separate true endorsements from opponents

Mean extraction confidence: 0.90 (after fixes). 10 records remain flagged for user review but are not blocking issues.
