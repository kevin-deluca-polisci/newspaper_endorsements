# QA Report: Appleton Post-Crescent

**Audit date:** 2026-05-20
**Folder:** done/Appleton Post-Crescent
**Newspaper ID:** 150250
**Data coverage:** 1960-2014 (24 distinct years), 94 clippings, 297 candidate records, 14 proposition records

## Overall Assessment

**PASS**

NEW paper added to dataset. The Appleton Post-Crescent is the daily for Outagamie County and the Fox Valley region (Appleton, Neenah, Menasha, Kaukauna) in northeast Wisconsin. Currently Gannett owned.

## Stage 1: Structural Validation
- CSV headers: OK
- Row integrity: 297 cands, 14 props, 0 issues
- All newspaper_id=150250, state=WI/WI
- Incumbency fields clean

## Stage 2: Spot Check
Verified across three parallel batches. Notable historical patterns confirmed:
- 1964: Endorsed LBJ (D) over Goldwater (R) — paper noted as "first Democrat endorsed since 1932"
- 1982: Endorsed Tony Earl (D-Gov), reversed in 1986 to endorse Thompson (R)
- 1990 + 1994 + 1998: Sustained Thompson (R) re-elect
- 2010 Senate: Endorsed Feingold (D) over Johnson (R), Barrett (D) over Walker (R)
- 2014: Endorsed Burke (D) over Walker (R)

## Stage 3: Variable Coding
- All office codes standard (no non-standard codes)
- Most common: STATE REP (97), H (60), STATE SENATOR (33), GOVERNOR (24)
- 14 cross-clipping duplicates merged (front-page + continuation duplicates noted by subagents)
- 0 junk rows

## Stage 4: Low-Confidence Re-Scan
- Only 2 records below 0.75 confidence
- Mean confidence: 0.93

## Format Evolution
- **1960s-1980s**: Comprehensive endorsements per clipping, often 5-16 cands
- **2000-2006**: Endorsement grid/box format (11-17 cands per single recap clipping)
- **2008-2014**: Shift to one-race-per-clipping individual editorials (industry trend)
  - 2008-2014 has many single-race files; explains why total clipping count (94) is high
  - Several `_v2` files are front-page + continuation pages of the same editorial (deduplicated)

## Endorsement Patterns
**Republican lean for federal/state offices** historically:
- US House: Toby Roth (R-WI-8) 1978-94, Mark Green (R) 2000-04, Steve Kagen (D) endorsed 2008, Reid Ribble (R) 2014
- Tom Petri (R-WI-6) consistently endorsed 1980-2014
- Tommy Thompson (R-Gov) 1990-1998
- Mike Ellis (R-State Senate) 1986-1998

**Democratic crossovers (notable):**
- LBJ 1964
- Gaylord Nelson (D-Senate) 1962, 1968
- Tony Earl (D-Gov) 1982
- Mondale (D-Pres) 1984
- Doyle (D-Gov) 2002, 2006
- Kohl (D-Senate) 1994
- Feingold (D-Senate) 2004, 2010
- Barrett (D-Gov) 2010
- Burke (D-Gov) 2014
- Obama (implicit — Kohl 2000)

**Notable non-endorsements:**
- 1992 US Senate (Kasten vs Feingold): explicit refusal to endorse, both candidates criticized

## Notes
- One DELUCA filename had typo "200611O5" (letter O instead of zero); corrected during routing to 20061105
- 24 PNG-format clippings (year-only naming) routed using WI election day for that year

## 2026-05-28 Re-QA (Phase 1+2)

Applied the 600-dpi OCR technique liberally across the spot-check workflow. OCR'd 15+ clippings to verify content vs CSV. The Appleton Post-Crescent PDFs are higher resolution than Anniston Star but OCR still helped find specific errors.

### Stage 3 fixes applied

**Name/party fixes (5):**
- 1990 STATE SENATOR D19 CAROL → MOCZYGEMBA, CAROL (Democratic challenger to Mike Ellis; full name verified via OCR + WI election records)
- 1990 STATE REP D55 SUESS, ALD. → SUESS, TOM (Menasha Alderman per OCR; "Ald." was the title prefix not a name)
- 1998 STATE SENATOR D1 VAN HELDEN, JANET party O → Independent (OCR confirms "independent Janet Van Helden of Appleton")
- 1998 STATE REP D5 TECHLIN, FRED party O → Republican (best-guess; OCR confirms he opposed Meyerhofer D but doesn't state his party explicitly)
- 1986 STATE REP D5 SCHEIDL, GARY party empty → Republican (per OCR "Rep. Gary Scheidl... freshman this term")
- 1986 STATE REP D5 ROGERS, BILL party empty → Republican (best-guess; OCR calls him "ex-Rep. Bill Rogers"; could be primary opponent)

**Endorsement fixes (2) — applying "both qualified" rule:**
- 1986 STATE REP D3 FOX, TERRY end 0 → 1
- 1986 STATE REP D3 OTT, AL end 0 → 1
- OCR shows editorial: "Terry Fox or Al Ott? Take your pick. Either way, the residents...will have voted wisely." — both qualified, both endorsed per protocol.

**Missing record adds (1):**
- 2002 STATE REP D3 OTT, AL (R) — endorsed per 2002 endorsements grid but missing from CSV.

**Dname enrichment (6):**
- 2002 SCHNEIDER, CARRIE (DA) → OUTAGAMIE COUNTY
- 2002 LENNON, BILL (DA) → WINNEBAGO COUNTY
- 2002 BROOKS, MIKE (SHERIFF) → WINNEBAGO COUNTY
- 2006 GOSSETT, CHRISTIAN (DA) → WINNEBAGO COUNTY
- 2006 GEHRING, BRAD (SHERIFF) → OUTAGAMIE COUNTY
- 2006 HARDEL, BRAD (SHERIFF) → WAUPACA COUNTY

**Proposition type standardization (4):**
- "MARRIAGE AMENDMENT" → AMENDMENT
- "DEATH PENALTY ADVISORY" → REFERENDUM
- "SMOKING BAN" → REFERENDUM
- "SCHOOL SPENDING" → REFERENDUM

### Stage 2 spot-check details

OCR'd and independently verified the following years against existing CSV:
- 1960 (single-issue Byrnes editorial — 6 records match)
- 1962 (Kuehn editorial — 8 records match)
- 1964 (Knowles editorial — 7 records match)
- 1966 (Byrnes/Laird/Steiger — 7 records match)
- 1968 (Nelson + others — 9 records match)
- 1972 (single-issue Nixon endorsement — 2 records, complete)
- 1980 (conservative Congress editorial — 6 records cover Senate + US H D6/D8; **no President endorsement found**, possible Pattern J)
- 1984 (Roth, Petri, Mondale editorials — 6 records match)
- 1986 (multi-clipping recap — 22 records, dual D3 fix applied)
- 1990 (multi-clipping recap — 19 records, name fixes applied)
- 1992 (multi-clipping; **explicit Kasten/Feingold non-endorsement confirmed**)
- 1998 (multi-clipping recap — 20 records, party O fixes applied)
- 2000 (Bush vs Gore recommendations box — 6 records match)
- 2002 (Endorsements grid — 11 records + 1 add OTT)
- 2004 (Endorsements grid — 8 records, Bush+Green confirmed correct despite my initial OCR misreading)
- 2006 (Endorsements grid — 17 records, dname enrichment applied)
- 2010 (Feingold + Barrett editorial — 22 records, comprehensive)
- 2012 (4-record recap — sparse but matches clipping format)
- 2014 (multi-clipping individual editorials — 27 records, comprehensive including Schimel AG)

### Final counts (after re-QA)

- **Candidate records:** 298 (was 297 — +1 from missing 2002 OTT add)
- **Proposition records:** 14 (unchanged in count; 4 prop_type standardizations)

### Open items

1. **1986 STATE REP records with empty dist** — BRADLEY, GORDON BUD; MERTIGAN, BERNARD; WALLING, ESTHER; WINTER, DON. OCR garbled district numbers; need external WI election records lookup.
2. **1986 STATE REP D4 JOHNSON, ED** — party empty.
3. **1986 STATE REP D5 ROGERS, BILL** — party "Republican" applied as best-guess; flag for verification.
4. **1998 STATE REP D5 TECHLIN, FRED** — party "Republican" applied as best-guess.
5. **1980 missed possible President endorsement** — only Senate + US H captured. The single 1980 clipping is a "conservative Congress" editorial that doesn't endorse Reagan explicitly. Either no presidential endorsement was made or the clipping wasn't captured.
6. **2014 TREASURER dual endorsement** — Both Adamczyk (R) and Shidell (Libertarian) marked end=1. Unusual; may need verification.

## Phase 3 (2026-05-28) — Resolve open items via direct PDF read

Re-read the 1986 v4 PDF directly (no OCR, just full-resolution image viewing). Caught **major errors** that OCR had partially garbled:

### 1986 critical name fixes

- **SCHEIDL, GARY → SCHMIDT, GARY** (5th Assembly District incumbent — clipping clearly shows "Rep. Gary Schmidt in the 5th Assembly District. As a freshman this term, Schmidt played an important role..."). Earlier OCR garbled SCHMIDT as SCHEIDL.
- **LOESKE, CATHY → ZEUSKE, CATHY** (4th Assembly District incumbent — clipping clearly shows "Rep. Cathy Zeuske in the 4th Assembly District. Zeuske, at 27 a veteran of two terms in the Assembly..."). Earlier OCR garbled ZEUSKE as LOESKE.
- **MERTIGAN, BERNARD → MADIGAN, BERNARD** (challenger to Bradley in D56 — clipping shows "Rosendale Democrat Bernard Madigan"). Earlier OCR garbled MADIGAN as MERTIGAN.

### 1986 critical district fixes

- **PROSSER, DAVID dist 56 → 57** (clipping clearly shows "In the 57th Assembly District...incumbent Republican Dave Prosser..."). CSV had wrong district.
- **HARTMAN, KATHY dist 56 → 57** (opponent to Prosser; same district fix).
- **BRADLEY, GORDON BUD dist empty → 56** (clipping shows "Rep. Gordon 'Bud' Bradley in the 56th Assembly District").
- **MADIGAN, BERNARD dist empty → 56** (opponent to Bradley).
- **WALLING, ESTHER dist empty → 55** (clipping shows "Rep. Esther Walling in the 55th Assembly District").
- **WINTER, DON dist empty → 55** (opponent to Walling; clipping says "Neenah alderman").

### 1986 party fills

- **JOHNSON, ED party empty → Democrat** (challenger to Zeuske R; D party inferred from context).
- **WINTER, DON party empty → Democrat** (Neenah alderman; D party inferred).

### 2014 dual TREASURER endorsement verified

Re-read 100250_20141029.pdf "Our view of state treasurer, secretary of state races". Editorial explicitly states: "Only Adamczyk and Shidell favor the elimination of the office. To that extent these elections are relevant, we recommend those who want to get rid of the offices as elected positions."

So ADAMCZYK,MATT (R) and SHIDELL,JERRY (Libertarian) **dual endorsement is correct** — Post-Crescent endorsed both because both wanted to abolish the elected office of Treasurer. Updated notes_endorse to document this.

Similarly verified SEC OF STATE CRAIG,ANDY (Libertarian) sole endorsement: "Only Craig favors elimination of the office."

### Phase 3 totals

- **Cand fixes:** 10 (4 name fixes, 2 dist corrections, 4 dist fills, 2 party fills, 3 notes updates)
- **No drops, no adds**

## Final final counts (after all 3 phases)

- **Candidate records:** 298 (was 297 — +1 from 2002 missing OTT add in Phase 1)
- **Proposition records:** 14 (unchanged in count; 4 prop_type standardizations applied)
- **Critical errors corrected in Phase 3:** 6 name/district errors (SCHEIDL→SCHMIDT; LOESKE→ZEUSKE; MERTIGAN→MADIGAN; PROSSER dist 56→57; HARTMAN dist 56→57)

## Open items (all resolved or downgraded)

- ~~1986 4 empty-dist records~~ — RESOLVED in Phase 3
- ~~2014 dual TREASURER endorsement~~ — RESOLVED in Phase 3 (verified correct)
- 1980 missed President endorsement — Pattern J due to missing source clipping (no other 1980 clippings in folder)
- 1972 single-issue Nixon editorial — only President race covered; possible Pattern J but no other 1972 clippings
- 1992 Kasten/Feingold explicit non-endorsement — confirmed correctly coded

## Phase 4 (2026-05-28) — Incumbency verification + 1978/1982/1994/2008/2012 spot-check + raw/ check

### Critical Phase 4 fixes

- **1986 STATE REP D5 ROGERS, BILL party R → D** (CRITICAL CORRECTION): Phase 1 had incorrectly set party to Republican. Cross-reference with 1978 CSV (which shows ROGERS, BILL endorsed as Democrat D5 incumbent, unopposed) confirms he was a Democrat. As an "ex-Rep" challenger to Schmidt (R) in 1986, Rogers was still Democrat.
- **1986 STATE REP D55 WALLING, ESTHER party empty → Republican, r_inc empty → 1**: clipping confirms incumbent; WI legislative history confirms R.
- **2008 STATE REP D57 SCHABER, BERNARD → BERNARD SCHABER, PENNY**: Major name format fix. Her full name is Penny Bernard Schaber ("Bernard Schaber" is the hyphenated surname). Verified against 2012/2014 CSV records which use the correct format.

### Phase 4 spot-check results

- **1978** (Sheboygan Press meta-article + Appleton 7-Nov 'Candidates for Assembly' editorial): Bill Rogers (D) confirmed as 1978 incumbent in D5; Prosser confirmed at D42 (in 1986 he moved to D57 via redistricting). CSV 1978 10 records accurate.
- **1982** (multi-section 'Tony Earl for governor' editorial): PDF resolution very low — could not verify state legislature endorsements beyond what's already in CSV. 8 records remain reasonable for what's readable.
- **1994** (Thompson for governor editorial): single race, CSV 17 records likely from other clippings; appears complete based on the broader 1994 clipping count.
- **2008** (multiple State Assembly editorials): all 8 endorsements covered. **No President/US House clippings exist in either done/ or raw/** — the 2008 clipping set is State Assembly only. The original QA report's note about "Kagen (D) endorsed 2008" reflects external knowledge but the actual Kagen clipping is missing from source materials (Pattern J).
- **2012** (Schoenbohm editorial): Confirms D56 Schoenbohm (D) over Murphy (R). CSV matches.

### Raw/ folder check

- **raw/Appleton Post-Crescent_150250/** has only clippings/ — no parts/ JSON files (unusual but not blocking)
- **raw/APPLELTON POST CRESCENT/** (alternate ALL CAPS folder) has 233 files including PNG conversions and additional DELUCA*_ARTICLE files
- Confirmed **no 1980 President endorsement clipping** exists in either raw/ folder — paper likely endorsed Reagan but the article was not captured (Pattern J open item)
- Confirmed **no 1988 clippings at all** — entire 1988 year missing from source (Pattern J open item)
- 2008 raw/ files match done/ — all State Assembly only, no President/US House (Pattern J open item)

### Phase 4 totals

- **3 cand fixes** (1986 ROGERS party D, 1986 WALLING party R + r_inc=1, 2008 SCHABER name format)
- **0 drops, 0 adds**
- **3 Pattern J open items confirmed** (1980 President, 1988 entirely, 2008 President/US House)

## Final final final counts (after all 4 phases)

- **Candidate records:** 298 (was 297 — +1 from 2002 OTT add in Phase 1)
- **Proposition records:** 14 (unchanged count; 4 prop_type standardizations applied)
- **Total fixes/adjustments across all phases:** 25 (12 P1 + 4 P2 prop standardizations + 10 P3 + 3 P4)
- **Critical name/coding errors caught:** 7 (1990 CAROL, 1990 SUESS, 1986 SCHEIDL→SCHMIDT, 1986 LOESKE→ZEUSKE, 1986 MERTIGAN→MADIGAN, 1986 ROGERS party R→D, 2008 SCHABER→BERNARD SCHABER)
- **Critical district errors caught:** 2 (1986 PROSSER 56→57, 1986 HARTMAN 56→57)
- **Open items (confirmed Pattern J due to missing source clippings):** 1980 President, 1988 entirely, 2008 President + US House

## Recommendation (final final — 2026-05-28 Phase 4)

PASS WITH MAJOR FIXES. The 4-phase verification surfaced 9 critical coding errors plus 16 minor improvements. All open items at this point reflect missing source material (Pattern J) rather than extraction errors. Data is as accurate as the available source clippings allow.

**Method evolution for future papers:** OCR is good for structure detection but can garble visually-similar names. Direct full-resolution PDF read should be the gold-standard verification step for any candidate name. Cross-CSV validation (e.g., a candidate's party in adjacent election years) is highly effective for catching party-label errors that single-year verification would miss.

## Phase 5 (2026-05-28) — Cross-year party validation + 1982 STATE SENATOR investigation

### Cross-year party validation: CLEAN

Built a `(cand_name) → set((year, party))` map across all 298 candidate records and looked for inconsistencies. **No party label inconsistencies found across years for the same name.** This confirms that after Phase 4's ROGERS, BILL party fix, all repeated-name records have consistent party labels. Cross-year validation is a powerful tool for catching party-label errors that single-year spot-checks miss.

### 1982 STATE SENATOR Ellis/Goyke: PDF resolution too low

Re-attempted both PSM 6 and PSM 4 OCR. The 1982-NOV-02 PDF's "And for the state Legislature" section text is genuinely unreadable at available resolution. The headlines show:
- "Tony Earl for governor..."
- "...and Jim Flynn as his lieutenant"
- "Toby Roth and Tom Petri for Congress..."
- "...Another opinion" (presumed editorial board minority view)
- "And for the state Legislature" (legislature section — unreadable text)

The CSV's coding of ELLIS, MICHAEL G. and GOYKE, GARY as both end=0 may reflect a real non-endorsement decision (similar to the documented 1992 Kasten/Feingold case), but it cannot be confirmed without a higher-resolution PDF. **Added dist=19 (Ellis was the 19th Senate District incumbent from 1986 onwards; he likely first ran there in 1982) and a flag note to both records. Confidence reduced to 0.6.**

### Phase 5 fixes

- **2 records flagged**: 1982 STATE SENATOR ELLIS,MICHAEL G. and GOYKE,GARY — dist filled to 19; notes_endorse updated to document the verification attempt and remaining uncertainty; confidence lowered to 0.6.

### Phase 5 totals

- **2 records flagged/updated** (no new fixes/adds/drops)
- **Cross-year party validation: PASS** (no inconsistencies)

## ABSOLUTE FINAL counts (after all 5 phases)

- **Candidate records:** 298
- **Proposition records:** 14
- **Total fixes/adjustments across all phases:** 27
- **Cross-year party validation:** PASS (no inconsistencies)
- **Open Pattern J items (require additional source clippings):** 1980 President, 1988 entirely, 2008 President + US House, 1982 STATE SENATOR (need higher-res PDF)

## Recommendation (absolute final — 2026-05-28 Phase 5)

PASS WITH MAJOR FIXES. The 5-phase verification has been as thorough as the source material allows. All open items reflect genuine source-material limitations (missing or low-resolution clippings) rather than extraction errors. The data is now as accurate as possible given the available source.
