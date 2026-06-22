# QA Report: Boston Globe

**Audit date:** 2026-06-03 (V2 — Round 1 re-QA after May 2026 PASS)
**Folder:** done/Boston Globe
**Newspaper ID:** 119300
**Data coverage:** 1964-2018, 45 clippings, 141 candidate records, 73 proposition records

## Overall Assessment

**PASS WITH MAJOR FIXES V2**

## V2 Critical Fixes (100+ records)

| Fix | Count |
|-----|------:|
| Party "G" → "Green" (3 records: Stein 2010, Jackson 2014, Stamas 2018) | 3 |
| 1974 SHERIFF BUCKLEY empty party → Democrat | 1 |
| prop_type "BALLOT QUESTION" → "BALLOT MEASURE" (skill convention) | 54 |
| 1964 prop dedup (amendments 2-7 each had 2 records w/ conflicting prop_types) | 6 |
| Empty endorsed → 0 (Pattern A — paper listed as alternatives/opponents) | 36 |
| **~100 total fixes V2** | |
| Round 2 cross-state state_election fixes (2008+2016 NH Senate races) | 3 |
| Round 3 clean verification | 0 |
| Round 4 MARKEY name standardization (cross-year) | 2 |
| Round 5 clean verification | 0 |
| Round 6 deep 2014 verification | 0 |
| **~105 total fixes V6** | |

## Stage 2: Spot Check — Round 6 (deep 2014 verification — highest record-count year)

22 cand + 4 prop records — all OCR-verified across multiple 2014 clippings:
- **2014-10-22 OCR:** Ballot Question Endorsements (4 props all correct directions ✓)
- **2014-10-24 OCR:** Congressional Endorsements (Tsongas/Wofford, Keating/Chapman, Moulton/Tisei pairs ✓)
- **2014-10-27 OCR:** Election Endorsement (gubernatorial Baker over Coakley + 3 Inds ✓)
- **2014-10-29 OCR:** Markey D Senate endorsement ✓
- **2014-11-04 OCR:** Final recap

All 9 races have complete Pattern A pairs (22 cand: Senator + Governor + AG + Treasurer + Auditor + SecState + 3 House + 3 Independent Gov + 1 Green Treasurer). All endorsement directions match OCR.

**Round 6 fixes:** 0 (clean verification).

## Official endorsement-qa skill final pass (V6 — 2026-06-03)

All 5 stages PASS:
- **Stage 1 — Structural Validation:** PASS. Cand 16-col archive format; Prop 11-col. 141 cand + 73 prop, 0 row-level issues. All years even, all MA state_newspaper, 3 NH state_election (cross-state Hassan/Ayotte 2016, Shaheen 2008), all incumbency in {1,empty}, all endorsed in {1,0,empty}.
- **Stage 2 — Spot Check:** PASS. 6 rounds + ~35 spot checks across all 13 cand election years + 14 prop years. OCR-verified all major eras.
- **Stage 3 — Variable Coding & Dedup:** PASS. 13 standard office codes (PRESIDENT, VICE PRESIDENT, GOVERNOR, LT GOVERNOR, SENATOR, H, STATE SENATOR, STATE REP, ATTORNEY GENERAL, SEC OF STATE, TREASURER, AUDITOR, SHERIFF), 5 standard parties (Democrat 86, Republican 45, Independent 6, Green 3, Libertarian 1), 3 standard prop_types (BALLOT MEASURE 53, AMENDMENT 17, REFERENDUM 3), 0 non-ALL-CAPS names, 0 exact duplicates.
- **Stage 4 — Low-Confidence Re-Scan:** PASS. 0 cand below 0.75 (all 0.95); 0 prop below 0.75 (all 0.95). Uniform high quality across folder.
- **Stage 5 — Manifest Registration:** Registered as entry #29 in `qa_manifest.csv` with qa_result "PASS WITH MAJOR FIXES V6", qa_date 2026-06-03.

## Stage 2: Spot Check — Round 5 (deep audits)

| Check | Finding |
|------|---------|
| **6 Independent records** | All legitimate Independent candidates ✓: 2010 Cahill (state treasurer running Ind for Gov), 2012 Magliocchetti (Ind State Senator — paper endorsed him over both major parties!), 2014 Lively + Falchuk + McCormick (3 Ind Gov candidates), 2018 Ayyadurai (Ind Senate) |
| **1 Libertarian record** | 2018 Fishman for Auditor — paper endorsed Libertarian over D/R/Green ✓ |
| **3 empty-endorsed prop records** | All legitimate "no position": 1964 #7 Liquor (local-option), 1968 #5 Liquor (local-option), 2012 #1 Right to repair (paper said "skip it"). Should remain as e='' per skill convention. ✓ |
| **All 13 office codes** | All standard per skill convention ✓ |
| **Confidence by year** | All 141 records at exactly 0.95 — uniform high quality across all years ✓ |
| **state_election cross-state** | 3 NH records (Shaheen 2008, Hassan + Ayotte 2016) — correctly tagged ✓ |
| **Prop coverage by year** | 73 props across 14 years (1964-2018); most years have 3-9 props matching ballot questions |

**Round 5 fixes:** 0 (clean verification round).

## Stage 2: Spot Check — Round 4 (Pattern J probe + cross-year audit)

| Check | Finding |
|------|---------|
| **Years with no cand records** | 1964/1968/1976/1978 have ballot question clippings only — no presidential/Senate/Gov endorsement clippings in collection. Paper likely endorsed in these years (LBJ 1964, Humphrey 1968, Carter 1976, etc.) but those editorials aren't in our 45 clippings. **Not data errors — clipping coverage gaps.** |
| **Cross-year name consistency** | MARKEY name varied: 1982/1984/2008 used "EDWARD J.", 2012 used "EDWARD", 2014 used "ED". **Standardized to "MARKEY, EDWARD J." across all 5 records.** |
| BAKER CHARLIE | Consistent across 2010/2014/2018 (R, with r_inc=1 in 2018) ✓ |
| BUMP SUZANNE | Consistent across 2010/2014/2018 (D, d_inc=1 in 2014/2018) ✓ |
| FRANK BARNEY | Consistent (D incumbent across 1982/1984/2008) ✓ |
| 1964 OCR check | All 5 1964 clippings are about ballot questions only — none cover presidential. Paper's LBJ endorsement (if any) not in collection. |

## Stage 2: Spot Check — Round 3 (1966/1978/1988/2010 + audit)

| Year | Findings |
|------|----------|
| **1966** | Famous Brooke vs Peabody Senate race — paper endorsed BROOKE R (first popularly elected Black US Senator). OCR explicit endorsement. ✓ matches data |
| **1978** | OCR is referenda only (7 amendments). No cand records. Acceptable. |
| **1988** | Dukakis/Bentsen D PRES + Kerry D SEN + 4 referendum questions ✓ matches data |
| **2010** | 18 cand records — Coakley D + McKenna R Pattern A, Grossman D + Polito R, Connaughton R + Bump D, Patrick D, Stein Green (e=0). All Pattern A pairs complete ✓ |

**Structural Audit (Round 3 verification):**
- 141 cand / 73 prop
- 0 cand dups, 0 prop dups, 0 non-CAPS names, 0 empty critical fields
- **13 distinct office codes** (all standard)
- **5 standard parties** (Democrat 86, Republican 45, Independent 6, Green 3, Libertarian 1)
- **3 standard prop_types** (AMENDMENT 17, REFERENDUM 3, BALLOT MEASURE 53)
- **Confidence all 0.95** (cand + prop) — uniformly high quality
- **3 Green Party records** all correctly opposed (Stein 2010 GOV, Jackson 2014 TREASURER, Stamas 2018 AUDITOR)

**Round 3 fixes:** 0 (clean verification round).

## Stage 2: Spot Check — Round 2 (1968/1976/1982/1984/2012/2014/2016)

| Year | Findings |
|------|----------|
| **1968** | OCR is ballot questions only (6 amendments). No cand records — paper may not have endorsed presidential race in this clipping. |
| **1976** | OCR is referenda review only — no cand records in this clipping. |
| **1982** | Kennedy + Dukakis + Frank + 5 others ✓ — all match data. |
| **1984** | Mondale/Ferraro + Kerry + 8 House (Conte R, others D) ✓ — all match |
| **2012** | Obama + Warren D + opposed BROWN R + endorsed TISEI R over TIERNEY D incumbent (cross-party!) ✓ |
| **2014** | Baker R for GOV opposing Coakley D + Independent candidates. All Pattern A pairs in data ✓ |
| **2016** | Endorsed HASSAN D for NH Senate over AYOTTE R. **Cross-state finding — state_election should be NH not MA.** Fixed. Also fixed 2008 SHAHEEN NH same way. |

**Round 2 finding:** Boston Globe cross-state endorsements — Globe occasionally endorsed in NH races. state_election field corrected for 3 records (HASSAN+AYOTTE 2016, SHAHEEN 2008).

## V2 Round 1 OCR Verification (6 spot checks)

| Year | OCR finding | Data match |
|------|-------------|-----------|
| 1964 | 7 ballot questions; cleaned up duplicates; directions match | ✓ |
| 1974 | Sargent R + Spaulding R + Guzzi D + Tsongas D + Buckley D — all 5 match | ✓ |
| 1986 | Full Dukakis D slate + 6 ballot questions | ✓ |
| 1990 | Kerry D + Weld/Cellucci R + Harshbarger D + Ahearn R + Malone R + DeNucci D | ✓ |
| 2008 | Obama/Biden D, Kerry D, 4 House D, multiple state-level | ✓ |
| 2018 | 2018-11-01 clipping is RI editorial (Raimondo); MA data is from other clippings | n/a |

**Editorial line:** Strongly Democratic-leaning but with notable cross-party endorsements:
- Sargent R 1974 (rare GOP endorsement)
- Weld R 1990 + 2014 + Baker R 2018 (Republican governors)
- Auditor 2018: endorsed Libertarian (Fishman) over D/R/Green options

## Original PASS

NEW paper added to dataset. Major New England daily covering Boston and the Massachusetts/New England region. Taylor family ownership through 1993, NYT Co 1993-2013, then Boston Globe Media (John Henry) 2013-present. Strongly Democratic-leaning editorial board.

## Stage 1: Structural Validation
- CSV headers: OK
- Row integrity: 141 cands, 79 props, 0 issues
- All newspaper_id=119300, state=MA/MA
- Incumbency fields clean

## Stage 2: Spot Check
Verified across both batches. Notable confirmed endorsements:
- 1974: Sargent (R-Gov, incumbent) — rare GOP endorsement
- 1986: Full Dukakis statewide slate
- 1988: Dukakis for President
- 1990: Weld/Cellucci (R) for Gov/LG split with Democrats elsewhere
- 2010: Patrick (D-Gov) re-elect
- 2014, 2018: Baker (R) for Governor — notable cross-party
- 2018: Warren (D) for Senate

## Stage 3: Variable Coding
- All office codes standard (no non-standard codes)
- Office distribution: H (36), SENATOR (17), GOVERNOR (17), STATE REP (16), STATE SENATOR (12), AUDITOR (10), TREASURER (9)
- 3 cross-clipping duplicates merged
- Note: 36 candidate records and 4 prop records have empty `endorsed` field — these are opposing candidates explicitly listed in the editorial (not endorsed, but recorded for completeness) plus non-endorsement decisions

## Stage 4: Low-Confidence Re-Scan
- 0 records below 0.75 confidence
- Mean confidence: 0.95

## Notable Editorial History

**Format evolution:**
- 1964-1990: Mix of single-issue editorials (1964 had 5 separate ballot-question clippings) and summary recaps
- 2008+: One-race-per-clipping individual editorials (industry trend; 2010/2014/2018 each have 8 single-race files)

**Endorsement patterns:**
- Strongly Democratic for federal/state (Kennedy, Kerry, Warren, Dukakis, Patrick, Obama)
- **Notable Republican gubernatorial endorsements**: Sargent 1974, Weld 1990, Baker 2014/2018
- **2010**: Endorsed several Republican state legislative challengers (to balance Democratic supermajority)
- **Cross-state endorsements**: Globe endorses in NH and RI races (NH Shaheen 2008/2014, NH Hassan 2016, RI Raimondo 2018) — included in this dataset

**Rare third-party endorsement:** 2018 Auditor — Daniel Fishman (Libertarian) over Bump (D incumbent)

## Notes
- Batch A used non-standard `endorsed: -1` for ~4 propositions where Globe declined to recommend (e.g., 1964 Q7 local-option liquor); converted to empty endorsed field per pipeline standards

---

# V9 Single-Pass Deep Verification — 2026-06-21

**Scope:** 45 clippings (1964–2018), 141 candidates / 73 props. All clippings independently re-OCR'd; 2008–2018 (98 records) field-verified by an independent OCR-reading subagent; earlier years and props checked directly.

**Result: 2 corrections; data otherwise excellent.**

### Candidate corrections
- **2018 GOVERNOR Raimondo + Fung → state_election RI** (was MA). This is the **Rhode Island** governor race the Globe endorsed across the state line ("the right choice for Rhode Island"), parallel to its NH Senate endorsements. Fixed.
- **1974 SHERIFF Buckley — note corrected:** external check (Wikipedia/Harvard Crimson) confirms John J. Buckley was the **Middlesex** County Sheriff (1970–1980, elected 1974 over Walter Sullivan), so dname=Middlesex is CORRECT; the prior QA note erroneously said "Suffolk" — note fixed, no field change.

### Verification highlights (no changes)
- **2008–2018 (98 records): fully consistent** per independent subagent — all directions, parties, US House districts (incl. the correct Markey 7th→5th 2010-redistricting renumbering), and cross-state endorsements (2008 NH Shaheen; 2016 NH Hassan/Ayotte; 2018 RI Raimondo/Fung) verified. The Globe's unusual non-Democrat picks are all correctly captured: Connaughton (R) 2010 auditor, Saint Aubin (R) 2014 auditor, **Fishman (Libertarian) 2018 auditor**, Magliocchetti (Ind) 2012, the 2010 Republican legislative slate, and Baker (R) governor 2014/2018.
- **Earlier years confirmed vs OCR:** 1966 Brooke (R) over Peabody (D); the notable 1990 mixed slate (Kerry-D Senate; Weld/Cellucci/Ahearn/Malone-R; Harshbarger-D; DeNucci-D) matches the printed recap exactly.
- **Candidate gap years (1964/1968/1976/1978) are genuine** — those clippings are ballot-question/referendum editorials, not candidate endorsements (consistent with the Globe's late start on presidential endorsements; earliest in the data is 1984 Mondale).
- **Props:** well-balanced FOR/AGAINST every year; no all-one-direction bug.

### Cross-paper & integrity
No other MA paper in `done/` (cross-paper N/A). 141 candidates / 73 props; 0 exact duplicates, 0 Pattern K, 0 empty names, 0 empty confidence. state_election now 136 MA / 3 NH / 2 RI. Metadata regenerated; archive md5-synced.
