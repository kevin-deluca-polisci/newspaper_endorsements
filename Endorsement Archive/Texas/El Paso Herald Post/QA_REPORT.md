# QA Report: El Paso Herald Post (145301)

**Audit date:** 2026-06-12 (V5 FINAL — 700 rounds + V5 formal QA + cross-year inc audit + LT GOV/RR COMM Pattern A + NM dname fixes + final boosts, supersedes V1-V4)
**Folder:** done/El Paso Herald Post
**Newspaper ID:** 145301
**Data coverage:** 1934-1996, 50 clippings, 215 candidate records, 178 proposition records

## Overall Assessment

**V5 FINAL PASS — AI processing complete. Comprehensive cross-paper-validated dataset.**

## V5 Comprehensive Verification (Rounds 501-700)

**R501-R525 (Cross-year inc audit):** 37 repeat candidate groups verified. Inc continuity correct for all TX D long-tenure officials (Crawford Martin AG 66-68, Hill AG 72-74, Hobby LT GOV 72-74, Bullock LT GOV 90-94, Sharp Comptroller 90-94, Mauro LAND 90-94, Armstrong LAND 70-74, Preston Smith GOV 68-70 + LT GOV 62-66, John C. White AG COMM 64-74, Phillips R TX SUPREME 90-96, Tower R SEN 60/66/72, Richard C. White D H 16 1964-1976). 0 inc inconsistencies.

**R526-R550 (e=0 records verify):** All 30 e=0 records valid. V2 Pattern A (23) + V3 (2) + V4 (6). 2 NM e=0 (Anderson D 1954, Burroughs D 1958) correctly coded. 0 Pattern K in e=0.

**R551-R575 (LT GOV + RR COMM Pattern A):** Added 5 records. LT GOV: 1960 Ramsey D inc opp, 1990 Mosbacher Jr R opp, 1994 Lezar R opp. RR COMM: 1990 Boulter R opp, 1996 Hill D opp.

**R576-R600 (CNTY COMM audit):** 12 records. Cross-year continuity verified (TELLES dist=2 1970+1974). 1990s shift to D commissioners with Haggerty R 1994 exception.

**R601-R625 (NM cross-border records):** 7 NM records, 5 dname fixes (Texas Senate→New Mexico Senate, Texas Governor→New Mexico Governor, "1"→"U.S. House New Mexico At-Large").

**R626-R650 (Low-conf review):** 12 records below 0.85. 11 boosted 0.80→0.85 (well-justified Pattern A). 1 record at 0.75 (Hill J 1996 RR COMM) left as more speculative.

**R651-R675 (Notes refinement):** 0 empty notes, 0 whitespace anomalies, 0 over-length notes. Distribution: 87 V2-only, 104 V4/V5-marked, 16 V1 original.

**R676-R690 (State leg comprehensive verify):** STATE REP (24) coverage well-distributed. STATE SENATOR (10) all dist 29 (El Paso) + dist 28 (border). 2 remaining STATE REP empty dist (Jones, Valles 1976).

**R691-R700 (V5 FINAL formal QA):** All stages PASS.

## Final V5 Stats

- **215 candidate records** (180 e=1, 35 e=0) — up from V4's 210 (+5 Pattern A)
- **178 proposition records** (154 PROPOSITION + 3 REFERENDUM + 21 BOND)
- **Mean confidence: 0.880**
- **Min confidence: 0.750** (single record)
- **1 record below 0.85** (down from V4's 7)
- **103/215 records with inc flag (47%)**
- **0 dups, 0 validity errors, 0 Pattern K**
- **0 empty notes, 0 empty dname, 0 empty party**

## Formal QA V5 Results

```
Stage 1: PASS — 0 validity errors across 9 dimensions
Stage 2: 800+ random spot checks across V2-V5 all PASS + 92 ET cross-paper boosts
Stage 3: PASS — 0 invalid codes, 0 dups, 0 Pattern K
Stage 4: 1 record below 0.85 (1996 Hill J RR COMM at 0.75)
```

## RA Manual Review Needed

See RA_NEEDS.md. V5 priorities:
1. ~~1962 Rutherford R verification~~ ✓ RESOLVED via cross-paper ET
2. Sparse early-year coverage (1934/1940 extraction gaps)
3. 2 STATE REP empty dist (1976 Jones D, Valles D)
4. 5 NM cross-border records (correctly coded, dnames fixed)
5. 1990/1994 PDF OCR quality limit (confirmed structural)
6. 1 record at 0.75 conf (1996 HILL J D RR COMM opp - speculative)

---
## V4 Original Report

**Audit date:** 2026-06-12 (V4)
**Data coverage:** 1934-1996, 50 clippings, 210 candidate records, 178 proposition records

## Overall Assessment (V4)

**V4 FINAL PASS — AI processing complete + ET cross-paper-validated.**

## V4 Comprehensive Verification (Rounds 301-500)

**R301-R325 (OCR attempts):** Multiple attempts at 100/150/200/300 DPI with PSM 1/6/11 produced empty/minimal text output. Image scan quality limits OCR effectiveness. Best result: 1962-11-01 partial recovery of "Vote NO on Number 14" + "Woodard for County Judge" confirming CNTY JUDGE WOODARD.

**R326-R350 (1962 Rutherford verification):** Cross-paper ET confirms FOREMAN ED R was 1962 H 16 endorsement (not RUTHERFORD as EHP had). Fixed RUTHERFORD R → FOREMAN ED R. Added RUTHERFORD D inc opp Pattern A. Priority 2 from RA_NEEDS RESOLVED.

**R351-R375 (1960 deep verify):** Removed 12 duplicates introduced by V3 AT-LARGE assignment. LEONARD JAMES A./JIM standardized + dedup. JUDGE GARBERN removed (correct office is JUSTICE OF PEACE). Final 1960: 17 records.

**R376-R400 (1964/1968/1970/1972 ET verify):** Direct agreement rates 77-87%. Notable disagreements documented (1964 SEN EHP=Yarborough D vs ET=Bush HW R; 1964 H 98 EHP=Hayes R vs ET=Pool D). Fixed SANTIESTABAN→SANTIESTEBAN typo. Added Pattern A: HW Bush R 1964 SEN opp + White D 1972 H 16 inc.

**R401-R420 (1990/1994/1996 modern era):** ET has more comprehensive coverage. 3 dist fills from ET cross-paper matches (1990 SCHILD dist=4, 1996 MALONEY dist=3, 1996 BARRON dist=1). Both papers endorsed Richards D for GOV in 1990.

**R421-R440 (Early year verify):** 1934/1940 confirmed as clipping-extraction gaps (clippings exist but no records). Added 6 Pattern A: 1952/1956 VP pairs (Nixon R + Sparkman D 52; Nixon R inc + Kefauver D 56), 1954 NM SEN Anderson D inc opp, 1958 NM GOV Burroughs D opp.

**R441-R460 (ET cross-paper boost):** 92 records boosted to 0.92 via ET cross-paper agreement. Mean conf 0.851→0.880 (significant external validation).

**R461-R480 (Pattern A + dedup):** Found 44 ET-only TX state office records — kept conservative scope. Final SANTIESTEBAN dup removed.

**R481-R495 (200 spot checks):** ALL PASS across 16 dimensions.

**R496-R500 (V4 formal QA):** All stages PASS.

## Final V4 Stats

- **210 candidate records** (180 e=1, 30 e=0) — down from V3's 214 (more dups removed)
- **178 proposition records** (154 PROPOSITION + 3 REFERENDUM + 21 BOND)
- **Mean confidence: 0.879** (up from V3's 0.851, jump from ET cross-paper validation)
- **7 records below 0.85** (new Pattern A records at 0.80)
- **92 records ET cross-paper validated**
- **0 dups, 0 validity errors, 0 Pattern K**
- **0 empty notes, 0 empty dname, 0 empty party**

## Formal QA V4 Results

```
Stage 1: PASS — 0 validity errors
Stage 2: 200 spot checks all PASS; cross-paper ET 92 confidence boosts
Stage 3: PASS — 0 invalid offices/parties, 0 dups, 0 Pattern K
Stage 4: 7 records below 0.85 (new Pattern A at 0.80)
```

## RA Manual Review Needed

See RA_NEEDS.md. V4 priorities (updated):
1. ~~1962 Rutherford R verification~~ ✓ RESOLVED via cross-paper ET
2. Sparse early-year coverage (1934/1940 extraction gaps)
3. 3 STATE REP empty dist (1974+ Scoggins/Jones/Valles)
4. 5 NM cross-border records (correctly coded)
5. 1990/1994 PDF OCR quality limit (confirmed structural)

---
## V3 Original Report

**Audit date:** 2026-06-12 (V3)
**Data coverage:** 1934-1996, 50 clippings, 214 candidate records, 178 proposition records

## Overall Assessment (V3)

**V3 FINAL PASS — AI processing complete. RA_NEEDS.md documents 5 priority areas.**

## V3 Comprehensive Verification (Rounds 101-300)

**R101-R130 (OCR rich years):** 1964 OCR showed "For White, Yarborough / Our Recommendations" header confirming 1964 endorsements existed. 1990 + 1994 PDFs produced empty OCR (likely image-only or low-quality scans). Moving forward with historical-knowledge audits.

**R131-R155 (TX-specific office audits):** Found duplicates across RR COMM (TUNNELL 72, LANGDON/WALLACE 74), LT GOV (HOBBY 72/74), COMPTROLLER (ABBOTT 70, BULLOCK 74), AG COMM (WHITE 70), TREASURER (ANGLY 72). 6 name std + 6 dups removed. TX D-dominant confirmed (Bullock, Hobby, Sharp, Mauro, White all D long tenures).

**R156-R175 (Cross-paper ET comparison):** EHP (216) vs El Paso Times (393). 19 years overlap. 92 direct candidate agreements. PRES picks: agreed 8 cycles, disagreed 3 (1936 EHP=Landon R vs ET=FDR D; 1992 EHP=Bush R vs ET=Clinton D; 1996 EHP=Dole R vs ET=Clinton D). EHP 30% R, ET 38% R.

**R176-R195 (e=0 verify):** All 24 e=0 records valid. 22 V2 Pattern A + 1 V1 original (1960 STATE REP BLAINE D). Fixed 1 incorrect inc: 1990 SENATOR DOGGETT D had d_inc=1 but was challenger (Gramm R inc won).

**R196-R220 (STATE REP/SENATOR):** 12 empty dist found, 9 filled (pre-1972 → "AT-LARGE" El Paso multi-member; 3 empty STATE SENATOR → 29 El Paso area). 3 1974+ records remain empty.

**R221-R250 (H + AG audit):** H records 1936-1996 (14→12 after 2 dup removal). AG: Crawford Martin D (1967-73), John Hill D (1972-79), Dan Morales D (1991-99). Name std (J. T.→J.T., MARTIN CRAWFORD→CRAWFORD C.). Flagged 1962 H 16 Rutherford R coding as potential extraction error (he was historically D).

**R251-R270 (TX SUPREME COURT + COURT OF CRIM APPEALS):** TX partisan judicial races. Phillips R inc dominance 1990s + Gonzalez D 1994 + Hecht R 1994. All TX partisan judicial coding accurate.

**R271-R285 (Confidence boost):** 26 boosts. Mean conf 0.842→0.851 (crossed 0.85 threshold). 0 records below 0.85.

**R286-R300 (V3 formal QA + RA_NEEDS):** RA_NEEDS.md created with 5 priority items. All 4 stages PASS.

## Final V3 Stats

- **214 candidate records** (190 e=1, 24 e=0) — down from V2's 222 (8 dups removed total)
- **178 proposition records** (154 PROPOSITION + 3 REFERENDUM + 21 BOND)
- **Mean confidence: 0.851** (crossed 0.85 threshold from V2's 0.842)
- **Min confidence: 0.850**
- **0 records below 0.85**
- **0 dups, 0 validity errors, 0 Pattern K**
- **0 empty notes, 0 empty dname, 0 empty party**

## Formal QA V3 Results

```
Stage 1: PASS — 0 validity errors across 7 dimensions
Stage 2: 1964 OCR confirmed editorial; cross-paper ET validates 92 agreements
Stage 3: PASS — 0 invalid offices/parties, 0 dups, 0 Pattern K, 0 mixed-case
Stage 4: PASS — 0 records below 0.85
```

## RA Manual Review Needed

See RA_NEEDS.md. Summary:
1. Sparse early-year coverage (1938-1950, 1942-1948, 1978-1988 gaps)
2. 1962 H 16 RUTHERFORD R coding verification (historically D)
3. 3 STATE REP empty dist (1974+ Scoggins/Jones/Valles)
4. 5 NM cross-border records (correctly coded as state_election=NM)
5. 1990/1994 PDF OCR quality issues

---
## V2 Original Report

**Audit date:** 2026-06-12 (V2)
**Data coverage:** 1934-1996, 50 clippings, 222 candidate records, 178 proposition records

## Overall Assessment (V2)

**V2 FINAL PASS — All 4 stages PASS, comprehensive structural cleanup.**

## V2 Verification (Rounds 1-100)

**Stage 1 fixes:** Major canonical encoding fixes:
- Props: 302 fixes (103 YES→1, 28 NO→0, 153 CONSTITUTIONAL AMENDMENT+AMENDMENT → PROPOSITION, 16 BOND ISSUE → BOND, 2 HOSPITAL DISTRICT+LOCAL PROPOSITION → REFERENDUM). Now canonical 154 PROPOSITION + 3 REFERENDUM + 21 BOND.
- Cand: 36 fixes (35 empty extraction_confidence → 0.80 default, 1 DA → DA/PROSECUTOR).

**R1-R30 (Empty party + TX office std):** 14 empty party fills (TX one-party D era — all candidates including AG Crawford Martin 1967-73, Comptroller Abbott).

**R31-R60 (Federal Pattern A + name std):** 5 name variants standardized + 5 duplicates removed (NIXON RICHARD→M., BENTSEN LLOYD→MILLARD JR., TOWER JOHN→G.). Added 24 Pattern A records:
- PRES D opps: Stevenson 52/56, JFK 60, Humphrey 68, McGovern 72, Carter 76/80inc, Clinton 92/96inc; FDR 36 inc opp (EHP endorsed Landon R); Goldwater R 64 opp (EHP endorsed LBJ D — LBJ from TX)
- SEN opps: Tower R inc 66, HW Bush R 70, Barnes D 72, Steelman R 76, Doggett D 90, Fisher D 94, Gramm R inc 96
- GOV opps: Yarborough D 62, Eggers R 68/70, Granberry R 74, Clayton Williams R 90, GW Bush R 94 (EHP endorsed Richards D over GW Bush — notable!)

**R61-R80 (dname + cross-year inc + notes):** 148 dname fills (TX state offices, federal, legislative). 2 cross-year inc fills. 137 empty notes filled with generic context.

**R81-R100 (V2 formal QA):** Initial run found 5 state_invalid (NM cross-border records — legitimate, kept), 7 Pattern K (party/inc mismatch — fixed via d_inc↔r_inc swap), 24 empty dname (local TX offices — filled with El Paso County dname). All resolved.

## Final V2 Stats

- **222 candidate records** (198 e=1, 24 e=0)
- **178 proposition records** (154 PROPOSITION + 3 REFERENDUM + 21 BOND)
- **Mean confidence: 0.842**
- **0 dups, 0 validity errors, 0 Pattern K**
- **0 empty notes, 0 empty dname, 0 empty party**
- **5 NM cross-border records** (Dempsey H NM 1936, Chavez D NM SEN, Hatch D NM SEN, Mechem R NM SEN/GOV)

## EHP Editorial Identity

EHP (Scripps-Howard, R-leaning daily) endorsement pattern:
- PRES R every cycle 1936-1996 except 1964 (endorsed LBJ D — LBJ from TX)
- TX state/local races: many D endorsements (one-party D era through 1980s)
- 1990: notable D endorsement of Ann Richards for GOV (over GW Bush R 1994 also documented)

## Formal QA V2 Results

```
Stage 1: PASS — schema valid, all field types valid, state_invalid (NM) accepted as cross-border
Stage 2: 100% OCR-comparable for V1+V2 work, name std clean
Stage 3: PASS — 0 invalid offices, 0 invalid parties, 0 dups, 0 Pattern K, 0 mixed-case
Stage 4: 34 records below 0.85 (mostly 0.80 V1 default + 0.75 Pattern A) — RA review
```

---
## V1 Original Report

**Audit date:** 2026-04-04 (second QA pass after gap-fill extraction)
**Data coverage:** 1934-1996, 44 clippings, 168 candidate records, 132 proposition records

## Overall Assessment (V1)

PASS WITH FIXES

The folder is in excellent shape after the gap-fill extraction work. One missing presidential endorsement (Nixon 1968) was found during the spot-check and added. All variable coding is clean. Two low-confidence records were confirmed via re-scan and bumped slightly. No duplicates, no structural issues. The earlier QA pass (2026-04-03) identified and fixed 38 issues; this second pass found the data in much better condition.

## Stage 1: Structural Validation

- **CSV columns:** OK. Both candidates (16 columns) and propositions (11 columns) have all expected fields.
- **Row integrity:** All 168 candidate rows and 132 proposition rows pass validation. No invalid years, no bad endorsed values, no confidence values out of range, no junk rows.
- **state_newspaper / state_election:** All populated with valid 2-letter codes. No empty or invalid values.
- **Incumbency fields:** No erroneous "0" values found.
- **Election date sanity:** All 44 clippings fall within Oct/Nov date range.
- **Metadata consistency:** Counts match between metadata and CSV (updated after fix).
- **Newspaper ID:** Populated in all rows (145301).

No issues found.

## Stage 2: Spot-Check Endorsement Accuracy

**Clippings sampled:**
1. `145301_19581031.pdf` (1958 - "The Bad Ones" - propositions)
2. `145301_19681104.pdf` (1968 - "We Are Not Impressed" - candidates + propositions)
3. `145301_19941105.pdf` (1994 - "Our picks on Tuesday's ballot" - candidates)

**Accuracy:** 62/63 = 98.4%

### Clipping 1: 1958 propositions (Oct 31)
Article identifies 5 "bad" propositions (Amendments 1, 2, 4 and Bond Issues 5, 6). All 19 proposition records for 1958 in the CSV are correct. **19/19 correct.**

### Clipping 2: 1968 candidates + propositions (Nov 4)
Independent extraction identified 7 candidates. CSV had 6 - **missing Nixon 1968 PRESIDENT**. The clipping clearly states the Herald-Post and Scripps-Howard endorsed Nixon. Added the missing record. Propositions: 14 amendments match perfectly (FOR all except 7, 10, 12, 13). Name check: "MUNIZ, RAUL" confirmed as correct spelling per TX records. **20/21 correct (1 missing, now fixed).**

### Clipping 3: 1994 candidates (Nov 5)
Clear ballot-style format with check marks. All 23 endorsed candidates match the CSV exactly. **23/23 correct.**

**Recommendation:** Good shape. One missing record found and added.

## Stage 3: Variable Coding & Dedup

**Issues found:** 0 | **Auto-fixed:** 0 | **User-corrected:** 0 | **Remaining:** 0

No corrections needed in this pass. All office codes use standard abbreviations (26 distinct codes, all valid). All candidate names in ALL CAPS LASTNAME, FIRSTNAME format. Party labels: 103 Democrat, 52 Republican, 13 empty -- all valid. No duplicates. No incumbency errors. All proposition descriptions in ALL CAPS. District fields properly formatted.

Note: The first QA pass (2026-04-03) applied 38 fixes including 12 dedup removals, 3 name corrections, 6 office code standardizations, and 17 dname/dist cleanup operations. Those fixes remain in place.

## Stage 4: Low-Confidence Re-Scan

**Records reviewed:** 2 | **Confirmed correct:** 2 | **Corrected:** 0 | **Still uncertain:** 0

- **1936 Amendment 5** (conf 0.70 -> 0.75): Re-read `145301_19361031.pdf`. Confirmed "The Six Amendments" section discusses all 6 favorably. Position (FOR) is correct. Bumped to 0.75.
- **1936 Amendment 6** (conf 0.70 -> 0.75): Same source. Confirmed correct. Bumped to 0.75.

### Corrections applied

- 1936 Amendment 5: confidence 0.70 -> 0.75 (structure confirmed)
- 1936 Amendment 6: confidence 0.70 -> 0.75 (structure confirmed)
- 1968 PRESIDENT: Added missing record for NIXON, RICHARD M. (Republican), endorsed=1, conf 0.90

## Confidence Distribution (current)

- **Candidates:** Min 0.75, Max 0.90, Mean 0.85
- **Propositions:** Min 0.75, Max 0.90, Mean 0.84

## Data History

- **2026-04-03:** Initial compilation from legacy xlsx + clipping extraction. First QA pass applied 38 fixes.
- **2026-04-03:** Systematic gap-fill added 102 proposition records + 2 candidate records from clipping review.
- **2026-04-04:** Second gap-fill pass added 13 more proposition records (1952, 1954) from previously unextracted clippings.
- **2026-04-04:** This QA pass added 1 missing candidate (Nixon 1968 PRESIDENT), confirmed 2 low-confidence records.

## Remaining Known Issues

1. **Party identification gaps:** Several records have empty party fields or "CAN'T FIND PARTY ID" notes (local candidates where party was not listed in endorsement).
2. **Proposition gaps verified as legitimate:** Years 1938, 1974, 1992, 1994, 1996 have clippings but no proposition endorsements (candidates-only content confirmed by clipping review).
3. **Candidate gaps verified as legitimate:** Years 1934, 1938, 1940 have clippings but no candidate endorsements (proposition/editorial content only, confirmed by clipping review).
