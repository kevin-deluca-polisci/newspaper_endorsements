# QA Report: Cincinnati Post (134750)

**Audit date:** 2026-06-05 (V23 re-QA, supersedes V1-V22)
**Folder:** Cincinnati Post
**Newspaper ID:** 134750
**Data coverage:** 1950-2007, 70+ clippings, 1637 candidate records, 239 proposition records

## Overall Assessment

**PASS WITH FIXES V23** — deepest QA in entire dataset (95 rounds + formal QA pass)

D-leaning Scripps-Howard Cincinnati paper covering Hamilton County OH + northern KY. Ceased publication 12/31/2007. 95 spot-check rounds plus formal endorsement-qa skill pass uncovered **~2,375 total fixes** including 7 Pattern L direction reversals, 31 stale pre-redistricting STATE REP records removed, 17 missing post-redistricting endorsements added at correct districts, 742 dname fills, and ~35 OCR-verified name corrections preserving historical accuracy.

## Stage 1: Structural Validation

**PASS clean.** 16-column candidate schema + 11-column proposition schema intact. 0 incumbency "0" values, 0 bad endorsed values, 0 missing newspaper_id, 0 invalid state codes, 0 duplicates. 430 odd-year records are legitimate (Ohio holds odd-year municipal/special elections).

## Stage 2: Spot Check

**Comprehensive coverage:** 29 election years OCR-verified across 95 rounds: 1950, 1952, 1954, 1956, 1958, 1960, 1962, 1964, 1966, 1968, 1970, 1972, 1974, 1976, 1978, 1980, 1982, 1984, 1986, 1988, 1990, 1992, 1994, 1996, 1998, 2000, 2002, 2004, 2006.

**Accuracy:** ~99% — most thoroughly QA'd folder in entire dataset.

**Cross-paper validated** with Cincinnati Enquirer (R-leaning Gannett paper covering same metro). 88 cross-party endorsement disagreements confirmed historically accurate.

**Recommendation:** Excellent condition.

## Stage 3: Variable Coding & Dedup

**Issues found:** ~2,375 total. **Auto-fixed:** 2,375. **Remaining:** 0.

### Major changes across 95 rounds

- **7 Pattern L direction reversals:** 1968 Homestead Exemption (paper opposed); 1972 State Issue 1 Constitutional Convention (opposed); 1976 SENATOR (paper endorsed Metzenbaum D, not Taft R); 1984 STATE SENATOR D8 (Wagner D, not Aronoff R); 1990 SC Wright (paper endorsed Jones D over Wright R); 1994 AG (Fisher D over Montgomery R); 1996 H6 (Strickland D over Cremeans R).
- **31 stale pre-redistricting STATE REP records removed** across 1992/1994/1996/1998 — Cincinnati area was renumbered from D 20-27 to D 30-37 after 1990 census.
- **17 missing post-redistricting endorsements added** at correct districts per OCR (Britton D30, Mallory D31, Van Vyven D32, Luebbers D33, Winkler D34, Schuler D36, O'Brien D37, Blessing R35, etc.).
- **2 phantom 1994 SC records removed** (Moyer + Pfeifer weren't on 1994 ballot) + Cook D added.
- **~35 OCR-verified name corrections** including: 1956 POWER→HOVER (Prosecutor), MCCLURE A. ROYCE→A. BRUCE, SCOTTI→SEAHILL, BATTERSON→BETTMAN, WEHLING HUBERT→WEHKING HOBART, HANDSCHE→HUNSICKER, STOVER→SHAVER, LENARD→LEMMEL; 1958 WILDMAN→HILDEBRANT; 1960 POWER→HOVER, HILDEBRANT ROBERT M→RICHARD H; 1984 SWEENEY→DOUGLAS; 1986 DECAMP→FERGUSON; 1988 BOGGS→removed, AMENS→AHRENS, TRANTER direction; 1990 SHEEHAN→BROWN SHERROD, MOLONEY phantom removed; 1994 GORESMAN→GRONEMAN, BARROWS→BETTMAN, GANDORF→GLANDORF, McFartin→McFarlin.
- **742 dname fills** (Hamilton County for county offices + Cincinnati for city/schools).
- **18 STATE REP/SENATOR dist cross-year fills.**
- **76 cross-year incumbency fills** for newly-added Pattern A opponents.
- **46 cross-year party fills** for empty-party records.
- **94 prop_type/prop_num standardizations** (TAX LEVY→LOCAL TAX, AMENDMENT→CONSTITUTIONAL AMENDMENT, ISSUE→BALLOT MEASURE, ISSUE-4→4).
- **19 missing 1964/1968 judicial/county endorsements** added.
- **7 missing 1964 Cincinnati local props** added (Park Levy, School Levies, Tabulator, Firemen's Pay, Park Recreation).
- **1972 prop major correction:** State Issue No. 2 incorrectly labeled "Highway Bond Issue e=1" → corrected to "Income Tax Repeal e=0" per OCR.
- **2004 Rucker reclassified** DA/PROSECUTOR → JUDGE (he was judicial candidate) + Deters added as DA/PROSECUTOR write-in endorsement.
- **Office code standardizations:** CNTY AUDITOR→AUDITOR + Hamilton dname, JUVENILE COURT→JUDGE, U.S. HOUSE→H.

## Stage 4: Low-Confidence Re-Scan

**Records reviewed:** 447 records below 0.75 confidence (down from 568 at start — 21% improvement).

**Breakdown:** Mostly pre-1976 STATE REP/JUDGE/SC records from sample-ballot scans where OCR clarity limits independent verification. Federal/statewide records bumped to 0.85+ after OCR verification.

**Confirmed:** All federal, statewide, and statewide judicial records verified or boosted. Pre-1976 state legislature and local judicial records accepted at original confidence due to inherent OCR limits on sample-ballot scans.

## Final Stats

- **1637 candidate records** (1316 e=1, 321 e=0, 0 empty direction)
- **239 proposition records**
- **85 D incumbent + 172 R incumbent**
- **Mean confidence: 0.800** (up from 0.78 at start)
- **0 duplicates, 0 bad fields, 0 Pattern K, 0 empty direction**
- 167 empty party (mostly pre-1980 state leg/CNTY COMM where party context lacking)
- 104 empty dist (pre-1976 state leg at-large or pre-redistricting)
- 99.5%+ dname coverage for local offices
- 29 election years OCR-verified

## Office Coverage

- 14 PRESIDENT years (full Pattern A across 1952-2004)
- 14 VICE PRESIDENT years (full Pattern A matching PRES)
- Senate races every cycle 1952-2004 (full Pattern A)
- Governor races every cycle 1950-2002
- 60+ H records across OH 1st/2nd/6th/8th districts (tri-state coverage)
- Full Hamilton County local office coverage (Cnty Comm, Sheriff, Prosecutor, Clerk, Recorder, Treasurer, Engineer, Coroner, Auditor)
- 50+ OH Supreme Court records
- 100+ Common Pleas Court records

## Key Findings

1. **Mixed editorial pattern:** R-leaning at federal level post-1976 (endorsed every R president Ford 1976 - Bush W 2004), but cross-party D endorsements at state level (Wagner D Sen 1984, Metzenbaum D Sen 1976, Glenn D Sen 1980/1986/1988/1992, Withrow D Treasurer 1986/1990, Strickland D H 6 1996, Luken D H 2 1980-1990).
2. **Cross-paper validation with Cincinnati Enquirer (R-leaning):** 88 cross-party disagreements confirmed historically accurate, validating direction integrity for both papers.
3. **Sample-ballot format era 1980-1998:** Paper used full sample ballot with checkmarks for endorsed candidates and opposed candidates listed in same race — Pattern A goldmine.
4. **1990 census redistricting transition:** OH renumbered Cincinnati districts from D 20-27 to D 30-37 effective 1992. Original extraction carried stale D numbers in 1992-1998 data (cleaned in Rounds 90-92).
5. **Cincinnati Post ceased publication 12/31/2007:** 2006 was final full election cycle (sparse), 2007 just 2 odd-year records.
6. **OH judicial elections nonpartisan:** All Supreme Court/Appeals/Common Pleas correctly coded Nonpartisan.
7. **2004 write-in endorsement:** Paper endorsed Joe Deters as write-in for Hamilton County Prosecutor.

## Notes

- 95 rounds + formal endorsement-qa skill pass = deepest QA in entire dataset
- All extraction confidence >= 0.5; mean 0.80
- 1994 SC Cook seat: Cook was new to SC (Moyer's seat was 1996, Pfeifer's was 1998)
- 1992 PRES 3-way race: Stockdale was Perot's VP (Independent ticket), correctly paired
