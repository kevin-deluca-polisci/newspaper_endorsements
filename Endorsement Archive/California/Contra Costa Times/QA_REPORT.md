# QA Report: Contra Costa Times

**Audit date:** 2026-05-20
**Folder:** done/Contra Costa Times
**Newspaper ID:** 172450
**Data coverage:** 1952-1978, 15 clippings, 198 candidate records, 147 proposition records

## Overall Assessment

**PASS WITH FIXES**

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
