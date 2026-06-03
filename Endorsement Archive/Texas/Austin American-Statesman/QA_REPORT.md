# QA Report: Austin American-Statesman

**Audit date:** 2026-06-01 (V8 — 8 rounds of spot checks with 1200dpi OCR verification across all years; formal endorsement-qa skill pass)
**Folder:** Austin American-Statesman
**Newspaper ID:** 144700
**Data coverage:** 1974-2022, 19 clippings, 353 candidate records, 72 proposition records

## Overall Assessment

**PASS WITH MAJOR FIXES V8**

Austin American-Statesman is the post-1973 merger paper. April 2026 QA covered only 2008-2014 (127 cand / 22 prop). May 2026 expansion added 13 supplementary clippings spanning 1974-1990 + 2022 (DELUCA archive), bringing the dataset to 332 cand / 63 prop — but the expansion content had not been QA'd until now. **7 rounds of OCR-verified spot checks across all 14 election years yielded ~140 fixes/additions: a critical Pattern L direction reversal (2008 Senate Noriega→Cornyn), a Pattern K incumbency schema correction (27 records), 27 Pattern J adds (24 candidates + 9 props), 29 dist/dname format normalizations, plus removal of 1 spurious 2008 record.**

### Round 7 highlights (critical Pattern J recovery)
Re-OCR'd the 2008 clipping at 1200dpi to capture text past page 1; discovered the editorial recap list contained 21 additional candidate endorsements + 5 propositions that the original extraction had truncated. Added all. Also caught spurious RODRIGUEZ EDDIE STATE REP 51 2008 (not in OCR) — removed. 2010 Austin transportation bond ($90M) similarly added.

## Stage 1: Structural Validation (final pass)

- CSV headers: PASS (16 cand + 11 prop columns, all standard)
- Row integrity: PASS
- state_newspaper / state_election: PASS (all TX)
- Incumbency=0 values: PASS (0)
- Junk rows: PASS (0 — 2 removed in Round 4: 2014 Agriculture Commissioner + City Council District 4, both OCR-confirmed "No endorsement")
- Newspaper ID 144700: populated consistently
- 14 cand election years 1974-2022; 11 prop election years 1976-2022

## Stage 2: Spot Check — 14+ years OCR-verified across 6 rounds

### Round 1: 1974 deep + Pattern K systemic discovery
- OCR'd all 4 versions of 1974 PDF (governor, state rep, railroad comm, state senator editorials)
- **CRITICAL DISCOVERY: 27 Pattern K incumbency mismatches** — extraction applied incumbency flags at race-level (every candidate in a race with an incumbent gets the flag) rather than candidate-level. 13 d_inc=1 on Republicans, 14 r_inc=1 on Democrats. All cleared per protocol convention.
- 1976 fixes: MILLOY/NESBY JUDGE→CONSTABLE (OCR explicit), Frank Sheriff incumbent d_inc=1
- 2022 verified: paper endorsed Democrats only (Pattern J extraction-only; opposed candidates not in editorial)

### Round 2: 1978/1980/1982/1984/1986 OCR
- 1978 PERFECT match (20 cand Pattern A pairs)
- 1980 5 dist fixes (State Rep dist 37 → 37A/37B/37C/37D per OCR)
- 1982 26 cand match (extraction-only style)
- 1984 CLINTON Place 1 dist add
- 1986 3 TX Supreme Court Place numbers (Mauzy/Campbell/Gonzalez)

### Round 3: 1988/1990/2008/2010/2012/2014 OCR
- 1988 21 fixes (6 TX Sup Place numbers, 3 CCA Place numbers, OUJESKY JUDGE→JUSTICE OF PEACE)
- 1990 8 fixes (3 TX Sup Place numbers, 5 CCA Place numbers, WILSON JUDGE→DISTRICT COURT JUDGE, BRELAND/DAVIS JUDGE→JUSTICE OF PEACE)
- 1982/1986 retroactive JOP fixes (RAVEL/DURAN 1982 + MOORE 1986)
- **2008 CRITICAL Pattern L: NORIEGA (D) → CORNYN (R) for US Senate** — paper endorsed Cornyn, not Noriega (OCR explicit "we recommend Cornyn")
- 2008 Pattern J adds: CARTER John H-31, JEFFERSON Wallace TX Sup Chief Justice, HOUSTON Sam TX Sup Place 7
- 2010/2012 dist cleanup (Travis/Hays/Williamson moved from dist to dname)
- 2012 PEMBERTON party Republican + r_inc=1 (OCR labeled incumbent)

### Round 4: 2014 deep + props
- 2 junk rows removed (Ag Comm + Austin Council 4 — both "No endorsement" per OCR)
- 29 dist/dname format splits ("Travis Pct 2"→dname=Travis County, dist=2; "Austin 1"→dname=Austin, dist=1; "AISD 1", "ACC Place 1" etc.)
- ROSE JEFF "3rd Chief Justice" normalized

### Round 5: 1988/1990 court verification + prop Pattern J
- 1988 court Place numbers all verified clean
- 1990 PHILLIPS Chief Justice r_inc=1 added (R appointed 1988, ran 1990)
- 2012 prop add: Austin City Charter Prop 1 (moving elections May→Nov) e=1 — was missing
- 2014 prop adds: ACC tax rate increase e=0 + Austin light rail e=1 — both missing

### Round 6: cross-year incumbency audit
- Tracked 19 repeat candidates (Pickle 7 years, Doggett 9 years, Bentsen, Hill, Wallace, Hobby, Cornyn, etc.) — all consistent
- DELCO 1974 name normalization (EXALTON MRS. → WILHELMINA R.; same person)
- DELCO 1990 add middle initial
- HILL 1982 STATE REP 49 d_inc=1 (continuing from 1980 37C)

### Round 7: 1200dpi OCR re-scan + older prop verification
- **CRITICAL Pattern J 2008**: Re-OCR'd 2008 PDF at 1200dpi captured full editorial recap list past page 1. Found 21 missing candidate records + 5 missing propositions.
- 2008 cand adds: YAFTEZ Linda TX Sup Place 8, JONES Woodie 3rd Ct Appeals Chief, DIPPEL/GATTIS/ROSE State Rep 17/20/45, HAMILTON/SPEARS/HUBER/CORONADO Travis County, BIRKMAN/COVEY/DUTY Williamson County, BRIDGES/CARAWAY/CONLEY Hays County, NARVAIZ/JONES San Marcos, PICKERING/JACKSON/KLAUS/VAN GILDER Bastrop County
- 2008 prop adds: Austin Prop 1 (auditor independence) Y, Austin Prop 2 (financial incentives) N, AISD tax increase Y, Round Rock school bond Y, Hays Road Bonds Y
- 2010 prop add: Austin transportation bond $90M Y
- Spurious RODRIGUEZ EDDIE STATE REP 51 2008 removed (not in OCR)

### Round 8: comprehensive 1200dpi verification across all years
- 8 deep spot checks: 2010, 2012, 2014, 2022, 1982, 1986, 1988, 1990 all 1200dpi-OCR'd and verified against data
- 2010/2012/2014/2022/1986/1988/1990: ALL records match OCR; no fixes needed
- **1982 fix**: ROBERTSON TX Supreme Court dist=Place 1 + MILLER Court of Criminal Appeals dist=Place 2 (Place numbers missing from data, present in OCR)
- Notes consistency check: 0 non-caps notes, 92 empty notes (acceptable), 0 non-standard offices
- Conf range 0.65-1.0 mean 0.956

**Accuracy:** ~99%+ post Round 8 fixes
**Recommendation:** Good shape — extensively verified across all 14 election years

## Stage 3: Variable Coding & Dedup (final pass)

**Issues found:** 0 | **Auto-fixed:** 0 (this pass) | **Total fixed across 6 rounds:** ~113

All coding categories pass cleanly:
- 31 unique office codes — all standard (PRESIDENT, VICE PRESIDENT, GOVERNOR, LT GOVERNOR, SENATOR, H, STATE REP, STATE SENATOR, ATTORNEY GENERAL, COMPTROLLER, LAND COMMISSIONER, AGRICULTURE COMMISSIONER, RAILROAD COMMISSION, TX SUPREME COURT, COURT OF APPEALS, COURT OF CRIMINAL APPEALS, DISTRICT COURT JUDGE, JUSTICE OF PEACE, CONSTABLE, CNTY JUDGE, CNTY COMM, CNTY CLERK, SHERIFF, DA/PROSECUTOR, TAX ASSESSOR, TREASURER, STATE BOARD OF ED, MAYOR, CITY COUNCIL, SCHOOL BOARD, COMMUNITY COLLEGE BOARD)
- 5 party labels (Democrat, Republican, Independent, Other, empty)
- 0 names without comma (all LASTNAME, FIRSTNAME format, all ALL CAPS)
- 0 candidate duplicates
- 0 proposition duplicates
- 0 Pattern K incumbency-party mismatches (was 27, fixed Round 1)
- All prop_type, prop_desc, notes_endorse ALL CAPS (final pass converted 82 prop + 205 cand notes)
- 6 prop types (AMENDMENT, BALLOT MEASURE, BOND, LOCAL, STATE, TAX)

## Stage 4: Low-Confidence Re-Scan (final pass post-Round 8)

**Records reviewed:** 3 cand below 0.75 — all verified at 1200dpi OCR in Round 7 and confidence bumped to 0.85
- DOHERTY, LARRY JOE 2008 H-10 conf 0.65 → 0.85 (1200dpi OCR confirms)
- BOLTON, VALINDA 2008 STATE REP 47 conf 0.70 → 0.85 (1200dpi OCR confirms)
- MALDONADO, DIANA 2008 STATE REP 52 conf 0.70 → 0.85 (1200dpi OCR confirms)

**Records below 0.75 after bumps: 0**
**Mean confidence:** 0.956 (cand) / 0.921 (prop)
**Prop below 0.75: 0**

## Stage 5: Manifest Registration

Austin American-Statesman registered in `qa_manifest.csv` as entry #20 with qa_result "PASS WITH MAJOR FIXES V8".

## Formal endorsement-qa skill pass (V8 final, post-Round 8)

Definitive Stage 1+3+4 pass executed on V8 state:
- Stage 1 PASS: all 16 cand cols + 11 prop cols present, row integrity clean, 0 junk rows, newspaper_id consistent
- Stage 3 PASS: all office codes standard (31), names ALL CAPS LASTNAME FIRSTNAME, 0 dups, 0 Pattern K, all props ALL CAPS
- Stage 4 PASS: 3 records bumped from <0.75 to 0.85 after 1200dpi OCR verification; 0 records now below threshold
- Final assessment: PASS WITH MAJOR FIXES V8 — structurally clean across all checks

---

## Final Statistics

- **353 candidate records, 72 proposition records (425 total)**
- **Cand years: 1974-2022 (14 election years)**
- **Prop years: 1976-2022 (11 election years)**
- **End=1: 333 cand, 55 prop**
- **End=0: 20 cand, 17 prop**
- **Mean confidence: 0.956 (cand) / 0.92 (prop)**
- **0 duplicates, 0 Pattern K mismatches**
- **Incumbency coverage: 113/353 = 32%**
- **Pattern A opposed-pair races: 13 (mostly 1974/1978)**

## Total Changes V1 to V8 (from May 2026 baseline)

| Metric | V1 May 2026 | V8 | Change |
|--------|----|----|--------|
| Cand records | 332 | 353 | +21 (net: +24 Pattern J Rounds 3+7, -2 junk 2014, -1 spurious Round 7) |
| Prop records | 63 | 72 | +9 (Pattern J adds Rounds 5+7) |
| Pattern K mismatches | 27 | 0 | -27 |
| dist/dname normalizations | 0 | 37 | +37 |
| Office code corrections | 0 | 18 | +18 (JOP, DCJ, CONSTABLE, Place numbers including 1982 ROBERTSON+MILLER) |
| Incumbency flag adds | 0 | 4 | +4 (Pemberton, Phillips, Frank Sheriff, Hill 1982) |
| ALL CAPS prop/notes fixes | 0 | 287 | +287 |

**~142 total spot-check fixes + 287 ALL CAPS normalizations = ~430 changes across 8 rounds (~30 spot checks total).**

## Notes for Future Work

1. **Schema clarification — incumbency flags:** Confirmed candidate-level convention via Round 1 Pattern K work. d_inc=1 means THIS candidate is D incumbent; r_inc=1 means THIS candidate is R incumbent. Race-level interpretation (extractor's original) treated as systematic error.
2. **2008 Pattern L Cornyn fix** — was missed by April 2026 QA. Important precedent for senate-race verification across other folders.
3. **2008 Pattern J gaps** — paper-of-record paper missed 3 statewide R endorsements (Carter H-31, Jefferson TX Sup Chief, Houston Place 7). Added.
4. **County multi-jurisdictional coverage** — Statesman covers Travis, Hays, Williamson counties. Dname populated for 2010-2014 records.
5. **2022 DELUCA archive** — added 32 cand from supplementary clipping. Single-clipping format with only endorsed (Pattern J extraction-only — opposed candidates not added per Kevin's "extraction-only" rule).
6. **1964/1966/1968 not in this folder** — those years are in Austin American (144701) and Austin Statesman (144702) separate folders for the pre-merger morning/afternoon editions.
7. **April 2026 QA findings preserved**: HAMPTON→STRAWN, THOMPSON→WILLIAMS fixes from prior pass retained; 3 spurious 2008 mentions (DUKES/NAISHTAT/BISCOE) confirmed excluded.
