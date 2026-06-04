# QA Report: Charlotte News (NC)

**Newspaper ID:** 132301
**Audit date:** 2026-06-04 (V2 — 23 rounds re-QA + formal endorsement-qa skill pass)
**Folder:** Charlotte News
**Data coverage:** 1960-1984 (13 election years), 14 clippings, 383 candidate records, 28 proposition records

## Overall Assessment

**PASS WITH MAJOR FIXES V2**

By far the most extensive folder QA of the project so far — ~308 fixes across 22 rounds, including major direction reversals, phantom record deletions, missing endorsements, wrong-office records, ~100+ Pattern A pairs, and ~50+ cross-year incumbency fills.

## V2 Fix Summary (~308 fixes total)

### Round 1: 1980 list-format extraction (37 fixes)
- 1980 BYNUM party R→D (OCR explicit "Democrat")
- 1980 BISSELL endorsement added (paper endorsed 6 CntyComm; data had only 5)
- 35 alternative candidates added as e=0 from 1980 "Other candidates and party affiliation" lists

### Round 2: 1982/1984 alternatives + name fixes (48 fixes)
- 1982 BEGIN→EAGLES (Court of Appeals)
- 1984 EURE-LACY-THORNBURG concatenation → THORNBURG, LACY H.
- 1984 INSURANCE MORGAN→LONG, JIM
- 25 1982 alts + 20 1984 alts

### Round 3: 1978 CRITICAL FIXES (28 fixes)
- **CRITICAL: 1978 SEN INGRAM D direction reversed e=1→0** (OCR: Helms had bullet, not Ingram)
- **CRITICAL: 1978 SEN HELMS, JESSE R e=1 r_inc=1 ADDED** (entire endorsement missing!)
- **CRITICAL: 1978 STATE REP TODD D→0; TISON D=1 added** (data had wrong endorsement)
- **CRITICAL: 1978 KIRKMENDALL PHANTOM deleted** (OCR misread of WESTMORELAND)
- 1978 BRADFORD→BRAFFORD; SCHOOL BOARD→DIRECTOR (Soil Board)
- 21 1978 alternative candidates added

### Round 4-5: Older year fixes (8 fixes)
- 1968 H MOORE→STATE SENATOR (wrong office)
- 1976 CNTY COMM HAIR party R→D + name spelling
- 1970 DA/PROSECUTOR MOORE party D→R
- 1966 STATE REP 3 R alternatives (Carson/Calvert/Reimler GOP trio)

### Round 6: Name std + cross-year incumbency (16 fixes)
- JONAS, CHARLES R. → CHARLES RAPER std
- 13 incumbency flags (Jonas 1962-70, Ervin 1962, Jordan 1966+72, Hunt 1980, etc.)

### Round 7: Mass incumbency sweep (56 fixes)
- 56 cross-year incumbency fills via Python-based detection

### Round 8: 1970 fixes (22 fixes)
- 1970 STATE REP GUDGER→HICKS (name correction)
- 1970 STATE REP LAWING added
- 1970 STATE SEN KNOX + BAUGH added
- 17 empty-party fills + 1 name fix

### Round 9-10: Empty party + verification (2 fixes)
- Final structural sweep clean

### Round 11: 1964 Pattern A (8 fixes)
- 1964 PRES GOLDWATER R e=0 + VP HUMPHREY D e=1 + VP MILLER R e=0
- 1964 5th-seat CntyComm suggestions (Hood D, Small R, Strong R)

### Round 12: 1968 deep (5 fixes)
- 1968 7th seat STATE REP commendations (Campbell, Ross, Wheeler)
- **MAJOR: 1968 SEN ERVIN SAM J. JR. D e=1 d_inc=1 ADDED** — famous Watergate Senator's endorsement was missing!

### Round 13: Final structural sweep (0 fixes)

### Round 14: 1968 office/name corrections (9 fixes)
- 1968 SUPREME COURT → JUDGE (Collier+Ervin III were Superior Court)
- 3 District Judge name fixes (WALKER→STUKES, BRACKEN→BEACHUM, WATKINS L→E)
- 1968 incumbency fills

### Round 15: Statewide incumbency + 1984 VP (12 fixes)
- 1964/1976 statewide D incumbents (Lanier/Gill/Graham/Phillips/Bridges/Eure)
- **MAJOR: 1984 VP BUSH GEORGE R e=1 r_inc=1 ADDED** + FERRARO D e=0 (first female major-party VP)

### Round 16: Name standardization (24 fixes)
- BOYLES, BRIDGES, GRAHAM, HUNT, BLACK, WALTON, BISSELL, LAWING all standardized

### Round 17: Mass incumbency Python sweep (31 fixes)
- 31 missed incumbencies auto-detected

### Rounds 20-22: Final structural sweep (0 fixes, clean)

### Round 23: Office-switch incumbency corrections (3 fixes)
- **MARTIN 1984 GOVERNOR r_inc=1 → cleared** (was H incumbent but ran for GOV — different office)
- **HUNT 1984 SENATOR d_inc=1 → cleared** (was Gov incumbent but ran for Senate — different office)
- **BISSELL 1980 CNTY COMM r_inc=1 → cleared** (was State Rep incumbent but switched to CntyComm — first run)
- **Lesson**: Mass incumbency sweeps must check office-switches, not just (name, office) tuples; person changing offices is NOT incumbent in the new office

## Stage 2: Spot Check (formal pass)

**Clippings sampled:** 3 (1964 v2, 1980, 1978)
**Accuracy:** 100% — all critical Round 1-3 fixes visually confirmed by PDF inspection

## Stage 3: Variable Coding & Dedup

**Issues found:** 0
- All 25 office codes canonical
- All party labels canonical
- All prop_types canonical (AMENDMENT/BOND/REFERENDUM)
- All names ALL CAPS
- 0 duplicates, 0 incumbency '0' errors

## Stage 4: Low-Confidence Re-Scan

**Records reviewed:** 18 (12 cand + 6 prop) all <0.75 conf
- All have documenting notes (mostly 1972/1974 garbled OCR + 1968 NC judicial)

## Outstanding Notes

- **8 empty-party records** — all 1968 NC judicial races (Supreme Court + District Court Judges); OCR didn't capture partisan labels (paper relied on bar association advice without listing party)
- **Pattern A gap years**: 1960/62/68/70/72/74/76 still 0 opposed records — paper used article-format or compact-endorsement-only style in these years
- **NC list-format era** (1978-1984): paper printed BOLD endorsement + all alternatives — enabled extensive Pattern A coverage for these years

## Notes for Downstream Use

- **PM sister paper to Charlotte Observer (AM)** — separate editorial boards, frequently endorsed different candidates
- Editorial line: D-leaning at presidential level (LBJ 1964; Carter 1980) but cross-party at congressional level (Nixon R 1968+1972; Ford R 1976; James Martin R 1972-1984; Helms R 1978 SEN over Ingram D)
- 1984 historic Helms-Hunt race: paper backed Hunt D (switched from 1978 Helms endorsement)
- Editorial format shifted: article (1960s-70s) → compact list (1972-76) → BOLD+ALL-CANDIDATES (1978-84)
- Paper ceased publication 1985 (absorbed by sister paper Charlotte Observer)
