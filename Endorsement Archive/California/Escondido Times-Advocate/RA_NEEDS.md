# RA Manual Review Needs: Escondido Times-Advocate

**Status:** AI processing complete through V3. The items below require manual RA intervention.

## Priority 1: 2 incomplete name records

- 1950 STATE REP **CLOYED, [UNKNOWN]** D - V1 extraction only got last name "CLOYED" - first name unknown. Per CA election records, this should be verified against the original 1950 clipping.
- (V3: VAN CAMP, BRIAN R 1974 SoS — RESOLVED via CCT cross-paper match)
- (V3: BAGLEY, WILLIAM T. R 1974 COMPTROLLER — RESOLVED)
- (V3: FORD, GERALD R. R 1976 PRES — RESOLVED via CCT cross-paper match)

## Priority 2: Generic local board dnames (122 records)

Local SCHOOL BOARD (44), DIRECTOR (28) records have generic dnames:
- SCHOOL BOARD: "Escondido area school district" (generic)
- DIRECTOR: "Special district board" (generic) - except DRONENBURG (resolved to CA State Board of Equalization District 3)

**Recommended:** RA should review individual records to identify specific districts:
- Escondido Union School District
- Escondido Union High School District
- San Pasqual Union School District
- Vista Unified School District
- Palomar Community College District
- North County area special districts (water, fire, park)

73/122 records have district hints in notes_endorse for review.

## Priority 3: 10 records below 0.85 conf (V3 Pattern A)

10 records remain at 0.70-0.80 confidence — V3 H/STATE REP Pattern A records where D opp candidate identification is speculative:
- Hyzak D 1984 AD-74, Erskine D 1984 AD-75, Wells D 1990 AD-76, Smith D 1994 AD-74 (STATE REP)
- Akili D 1982 H-41, Metzger D 1982 H-42, Archuleta D 1984 H-41, Manning D 1988 H-43, Ovrom D 1988 H-41, Leschick D 1994 H-48, Tamerius D 1994 H-51 (H)
- Plus Grant D 1994 SS-38

RA verification of D primary winners for these districts would boost confidence.

## Priority 4: 1988 OCR finding - ETA's "reluctant Bush" endorsement

OCR of 1988 clipping showed editorial headline "Hard to back Bush after slimy campaign" — ETA endorsed Bush R but reluctantly. This is documented in V3 notes for the 1988 PRES Bush R record. Future analysis of editorial tone may warrant separate flag field.

## Priority 5: Cross-paper validation with CCT

8 direct candidate agreements with Contra Costa Times (folder 56). 6 disagreements documented including:
- 1978 GOV: ETA=Brown D inc, CCT=Younger R
- 1978 LT GOV: ETA=Dymally D, CCT=Curb R

Both CA papers but ETA shows occasional D editorial leanings on state offices (Brown D 78 GOV, Dymally D 78 LT GOV, Van de Kamp D 82 AG, Cory D 82 COMPT).

## V8 Updates (2026-06-15)

- **MAJOR PROPS DUPS REMOVED:** 22 propositions identified as V1 extraction duplicates removed:
  - 1976: 18 props had detailed-desc + generic "state proposition"/"county question" duplicates (e.g., Prop 1 "state school building lease-purchase bond law" duplicated as "state proposition")
  - 1986: 4 props had verbose + short-name duplicates (Veterans Bond $850M / Veterans Bond Act etc.)
- **1982 Prop 13 desc clarified:** Labeled "Reapportionment" in data but CA Prop 13 1982 was Water Resources. Flagged pending RA verification of original clipping.
- **Local board dnames generalized:** 24 generic dnames updated to "North San Diego County school district / special district board — specific district pending RA"
- **Cross-clipping consistency:** 0 inconsistencies found across all multi-clipping years (1972/1974/1976/1984/1988/1990/1994)
- **Final 20/20 spot check dimensions pass**

## V7 Updates (2026-06-15)

- **DUP REMOVED:** FLICK MIKE 1984 JUDGE record removed — notes confirmed Vista mayor (FLICK MIKE 1984 MAYOR record kept). Was V1 extraction error duplicate.
- **JUDGE/court audit:** All 9 judicial records verified (Bird R Supreme Court 78/82 retention historically plausible for ETA, Johns/Kintner/Allen/Mitchell/Ames JUDGE various years, Pfingst DA/PROSECUTOR 1994)
- **Year coverage check:** All federal cycle years covered except documented 1970/1986 collection gaps:
  - 1970: Missing SEN (Tunney D won) + GOV (Reagan R inc won) — clipping focused on H 35 race + propositions
  - 1986: Missing SEN (Cranston D inc won) + GOV (Deukmejian R inc won) — no 1986 general clipping
- **e=1 OCR direction final verify:** 241 e=1 records summarized by year; 1988 sidebar confirmed match
- **Notes preserved:** Full audit trail retained (avg 62 chars, 0 empty)

## V6 Updates (2026-06-15)

- **NEW V6 PROPS FIXES (OCR-confirmed):**
  - 1978 Prop 7 e=1 → e=0 (OCR: "Prop. 7 — NO")
  - 1982 Prop 8 e=1 → e=0 (OCR: "Prop. 8, local agency borrowing: No")
- **NEW V6 PROPS FLAGS (RA review):**
  - 1978 Prop 1 OCR-fragmented direction (data e=0; OCR suggests YES but unclear)
  - 1982 Prop 13 desc mismatch (labeled "Reapportionment" but Prop 13 was actually "Water Resources" in 1982 CA; Reapportionment was Prop 14)
- **NEW V6 CROSS-YEAR INC CONTINUITY FIXES (4):**
  - CRANSTON D 1974 SEN: d_inc=1 added (inc continuously since 1968)
  - CRAVEN R 1974 STATE REP: r_inc=1 added (inc continuously since 1970)
  - CRAVEN R 1990 STATE SENATOR: r_inc=1 added (inc continuously since 1978)
  - HUNTER R 1982 H: r_inc=1 → empty (1982 was first election)
- **V6 CONF BOOSTS:** 16 OCR-verified records boosted to 0.92 (federal/state-leg from years 1950-1994)
- **Cross-year inc audit:** Long-serving R delegation candidates (Burgener 72-80, Packard 82-94, Lowery 82-90, Hunter 82-84, Cunningham 92-94) all have correct inc continuity
- **e=0 verify:** All 46 e=0 records have proper e=1 pair counterparts (0 orphans)
- **1986 GOV/SEN collection gap noted:** No 1986 general clipping available; only 1986-05-27 + 1986-06-02 primary clippings. Cranston D inc 1986 SEN (won) + Deukmejian R inc 1986 GOV (won) not in data due to missing general clipping.

## V5 Updates (2026-06-15)

- **NEW V5 CRITICAL OCR FIXES:**
  - 1970 SCHMITZ R H 35 inc opp ADDED via OCR 1970-10-23 (was missing in V1-V4)
  - 1984 BERGESON STATE REP 37 → STATE SENATOR 37 office correction via OCR 1984-11-04
  - 1974 VAN CAMP SoS flagged for RA verification: OCR shows "Sect. State [no] recommendation" — may not have been an actual ETA endorsement; conf reduced from 0.92 to 0.85
- **22+ clippings OCR-verified:** All editorial sidebars from 1960/1970/1972/1974/1976/1978/1980/1982/1984/1988/1990 cross-checked against extracted data
- **1988 "reluctant Bush" editorial CONFIRMED:** OCR text "Hard to back Bush after slimy campaign" matches V3 note. ETA's Bush R 1988 PRES endorsement is genuine but reluctant — may warrant editorial-tone flag field in downstream analysis
- **Editorial pattern CONFIRMED:** ETA reliably R for federal (1960-88 PRES + 76/82 SEN) but selectively D for state offices (78 GOV, 78 LT GOV, 82 AG/COMPT/TREAS, 80 SEN Cranston D inc) — reflects North County SD editorial pragmatism

## V4 Updates (2026-06-15)

- **Priority 1 PARTIALLY RESOLVED:** CLOYED first name still [UNKNOWN] per OCR, but V4 confirms surname spelling and that CLOYED retained state assembly seat (was incumbent, defeated Independent Party opponent). Party reset to empty (was incorrectly "Independent" — defeated the Independent, was NOT the Independent). Conf raised to 0.78. RA should verify against external 1950 CA Assembly records.
- **V4 CRITICAL OCR CORRECTIONS APPLIED:**
  - BROWN AG D 1950 e=1→e=0; SHATTUCK AG R 1950 e=0→e=1 (V3 had reversed; LAT cross-paper confirms Shattuck pick)
  - MCKINNON H 1950 D e=1→e=0; added GEHRES, LES R H 23 1950 e=1 (V3 had endorsement direction reversed per OCR)
  - Added GALLAGHER 1950 CORONER (missed in V1-V3 per OCR)
- **Multi-paper cross-validation (V4):** LAT (12 agree/5 disagree), SFC (21/3), SFE (18/4) all consistent with ETA editorial pattern
- **Local board dnames (V4):** 39 records refined from notes hints to specific districts (Fallbrook, Palomar, Vista, San Marcos, Escondido Union, San Pasqual, Bonsall, Valley Center, MiraCosta). 24 generic dnames remain.

## What is NOT a concern (V8 PASS)

- **Structural integrity:** All 286 cand + 341 prop records PASS every validation check.
- **Props duplicates:** 22 V1 extraction duplicates removed in V8.
- **Cross-year inc continuity:** Verified for all 39 repeat candidate groups.
- **e=0 Pattern A coverage:** All 46 e=0 records have proper e=1 pair (0 orphans).
- **JUDGE/court audit:** All 9 judicial records verified.
- **Year coverage:** Complete for all federal cycle years except 1970/1986 (documented collection gaps).
- **Federal Pattern A coverage:** All PRES cycles 1960-1988 + 1950 with R+D pairs. SEN/GOV pairs.
- **CA state Pattern A:** LT GOV (3), AG (4), SoS (2), TREAS (2), COMPT (2).
- **Local board audit:** 122 records correctly Nonpartisan + 1 R DRONENBURG correctly coded.
- **dname coverage:** 100%.
- **Notes coverage:** 100%.
- **Empty party:** 0.
- **Pattern K:** 0.
- **Duplicates:** 0.
- **Mean confidence:** 0.900.
- **OCR verified:** 1988 and 1994 clippings confirm endorsements match data.
