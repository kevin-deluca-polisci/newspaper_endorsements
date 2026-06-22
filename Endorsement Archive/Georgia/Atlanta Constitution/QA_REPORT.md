# QA Report: Atlanta Constitution

**Audit date:** 2026-05-30 (final endorsement-qa skill pass on 2026-06-01)
**Folder:** Atlanta Constitution
**Newspaper ID:** 109051
**Data coverage:** 1960-1990, 124 clippings, 572 candidate records, 370 proposition records

## Overall Assessment

**PASS WITH MAJOR FIXES** (V12)

Atlanta Constitution underwent 11 phases of intensive QA plus a final endorsement-qa skill pass. Initial extraction had several systemic issues (Pattern J under-extraction in 1964-1976, Pattern O name-format duplicates especially in 1966, Pattern L direction reversals in 1988, Pattern Q cross-year confusion in 1982). All fixed via OCR-verified corrections. ~210 total adjustments across the QA process. The dataset is now exceptionally well-verified with multiple OCR cross-checks per major year.

## Stage 1: Structural Validation

- CSV headers: PASS (16 cand + 11 prop columns, all standard)
- Row integrity: PASS (0 year/endorsed/confidence/state issues)
- state_election: PASS (all GA)
- Incumbency 0 values: PASS (0 found)
- Junk rows: PASS (0)
- Metadata: REGENERATED to match current counts (was stale at 636 cand)
- Newspaper ID 109051 populated consistently across all rows

## Stage 2: Spot Check

**Methodology:** 30+ spot checks conducted across Phases 4-11. Coverage:

- **Years OCR-verified:** 1960, 1962, 1964, 1966, 1968, 1970, 1972, 1974, 1976, 1978, 1980, 1982, 1984, 1986, 1988, 1990 (all major election years 1960-1990)
- **Multi-seat sanity:** 1972 Stone Mountain 3 judges, 1976 DeKalb 4 judges, 1988 PSC 3 endorsements all verified legitimate
- **Direction verification:** 1964 GOLDWATER, 1966 GOVERNOR x3, 1988 ABERNATHY, 1982 DARDEN→SELLERS all confirmed via OCR
- **Cross-year tracking:** GINGRICH, MCDONALD, SWINDALL, FOWLER, LEVITAS, YOUNG, LEWIS, JONES, DARDEN, HUTSON all consistent

**Accuracy:** ~95% post-fixes (1972 NIXON endorsement, 1976 4-judge race, 1988 PSC 3-seat race all verified)

**Recommendation:** Excellent shape after fixes.

## Stage 3: Variable Coding & Dedup

**Issues found:** ~210 across 11 phases + 745 auto-fixes in final skill pass.

### Major changes across all phases

- **Office codes standardized (28+ records):** USHOUSE→H, USSEN→SENATOR, LTGOV→LT GOVERNOR, SECSTATE→SEC OF STATE
- **state_election filled (US→GA for ~50 records)**
- **Pattern J backfill (254 cand + 134 prop records):** Empty endorsed → 1 with OCR-verified direction
- **Pattern O name-format dups dropped:** 19 from Phase 4, 12 from Phase 9 (1966), 4 from Phase 7, 3 from Phase 10
- **Pattern I dist normalization:** 6 Fulton-countywide dups (Phase 6), 4 1966 dist conflicts, 1 1974 (JORDAN 56/58)
- **Pattern L direction reversals:** 1988 ABERNATHY e=1→0, 1964 GOLDWATER, 1966 GOVERNOR x3
- **Pattern M cross-office misclass:** 4 1988 records STATE SENATOR→STATE REP (TEPER, MORTON, BAKER, RICHARDSON)
- **Pattern Q cross-year confusion:** 1982 DARDEN→SELLERS (Darden entered Congress via 1983 special election)
- **Prop_num synthetic assignment:** 271 records to resolve key collisions
- **Prop_num collision resolution:** 4 1990 Gwinnett School Bond records re-keyed with GSB prefix
- **NA party normalization:** 12 → Nonpartisan (JUDGE/SCHOOL BOARD/PSC), 36 → empty
- **Name format normalization:** 289 FIRSTNAME LASTNAME → LASTNAME, FIRSTNAME (final skill pass)
- **ALL CAPS prop fields:** 439 prop_type/prop_desc records normalized
- **Dist OCR fixes:** PIERRE HOWARD 44→42, FARRAR 55→52, WILSON 10→20, LANE 4→40, DAVIS 41→5

### Duplicates removed (~88 total across phases)

- 19 Phase 4 (Pattern O)
- 9 Phase 4 (cand)
- 6 Phase 6 (1968 Fulton countywide)
- 16 Phase 9 (1966)
- 4 Phase 9 (1976)
- 3 Phase 9 (1980)
- 1 Phase 9 (1968 WINKLES)
- 1 Phase 8 (1978 NORSWORTHY)
- 1 Phase 8 (1990 DAVIS)
- 1 Phase 10 (1970 GOODWYN/GOODWIN)
- 1 Phase 10 (1974 JORDAN)
- 1 Final skill pass (1980 FEDERAL State Court)
- Plus 4 Phase 7 (1988 dist dups) + 4 Phase 7 (1976 dups)

## Stage 4: Low-Confidence Re-Scan

**Records reviewed:** 9 cand + 7 prop < 0.75
**Confirmed correct:** 5 cand bumped to 0.85 (1982 Cobb State Court judges + 1988 Teper/Steffins — all OCR-verified)
**Remaining low-conf:** 4 cand (1982 ATHENS, MCCLURE; 1988 PLETCHER, JACOBS) + 7 prop (1960/1988 records) — could not be confirmed via available OCR but no contradictions found

## Stage 5: Manifest Registration

Atlanta Constitution registered in `qa_manifest.csv` as entry #15 with qa_result "PASS WITH MAJOR FIXES V12".

---

## Final Statistics

- **572 candidate records** (was 627 initially → 608 → 597 → 596 → 575 → 573 → 572)
- **370 proposition records**
- **End=1: 525 cand, End=0: 47 cand**
- **End=1: 340 prop, End=0: 30 prop**
- **Mean confidence: 0.918**
- **0 candidate duplicates, 0 empty endorsed, 0 Pattern K mismatches**
- **3 prop_num collisions (1984 #1/#2/#3) flagged for future OCR clarification**
- **~210 total adjustments across 11 phases + skill pass**

## Notes for Future Work

1. **Atlanta Constitution clippings end at 1990** — no 1992+ data exists in this folder
2. **Pre-1980 incumbency flags are 0%** (systemic extraction limitation, not error)
3. **dname coverage** is 0% pre-1980, 60-80% in 1988/1990
4. **Pattern M (cross-office misclass) is a new error type** — should systematically check in future folders
5. **1968 Pattern I ambiguities** (DILLON 103/104, GUNTER 96/97) flagged but not resolvable without higher-res OCR

---

## V8 Deep Verification (endorsement-verification skill) — 2026-06-20

Full 16-phase re-OCR-from-scratch verification, independent of prior QA. Large historical folder (572→570 candidates, 370 props, 124 clippings, 1960-1990, Georgia state-legislature-heavy).

**Re-OCR (Phase 1):** all 124 clipping PDFs re-extracted (pdfimages → 750 images; tesseract on all 127 images >30KB). Two clippings (1964-10-28_v2, 1966-11-03) whose large embedded JPEGs initially timed out were re-OCR'd directly at full quality + 300 DPI fallback. **Verified per-clipping coverage: 0 of 124 clippings left without OCR text.** All 16 years have 240-900 OCR lines.

**Per-record (Phases 2-9):** 465/525 e=1 verified directly; 60 e=1 + 8 e=0 flagged. Format sweep 0 fixes; Pattern K 0; exact dups 0. **76 cross-cycle incumbency flags added** (many returning GA legislators, 2-year terms). 2 near-duplicate district artifacts identified (1968 Dillon, Gunter).

**Independent subagent adjudication w/ vision (Phase 10):** 68 flags + near-dups sent to a no-anchoring subagent (136 tool calls, many 400 DPI vision reads). Results applied:
- **1 direction FLIP:** 1966 H d5 Fletcher Thompson (R) E=1→E=0 — the Constitution endorsed Democrat Archie Lindsey ("His inexperienced Republican opponent, Fletcher Thompson, has yet to establish the soundness of his judgment"). Lindsey E=1 already present.
- **6 NAME garbles fixed:** FEYSSUR→POYNTER (1976), MCKEEVER→McDUFF (1982), ATHENS,BILL→ATKINS (1982), ATHENS,FRANK JOHNSON→JOHNSON,FRANK (1982), PLETCHER→FLETCHER (1988), BOLTON→MELTON (1988). McCLACHEY→McCLATCHEY spelling unified.
- **4 district/post fixes:** McClatchey 1968 d110→113; McGill 1988 d5→3; Stoddard 1982 Post1→2; Clements 1988 d23→28.
- **2 near-dup artifacts dropped:** 1968 Dillon d104 (keep d103) and Gunter d96 (keep d97) — confirmed single-seat via the printed "Our Recommendations" recap.
- **3 NEEDS_RA:** 1968 "JAMBS, JEFF" d37, 1976 LENDERMAN d56, 1984 ASSESSOR WAGES — no source support in any clipping (likely belong to races not in this clipping set).
- **High-value confirm:** 1966 GOVERNOR — the Constitution endorsed NO ONE ("cannot recommend either nominee... [nor] the write-in movement for Ellis Arnall"); Maddox E=0 and Arnall E=0 both correct, no missing Callaway endorsement.

**Phase 11 props:** 370 props, all directed (340 yes / 30 no). Sampled 30 vs OCR — 30/30 keyword-confirmed present.

**Phase 12 cross-paper:** sister papers **Atlanta Journal** (1968-1974, 99 records) and **Atlanta Journal-Constitution** (2002-2008, no overlap) both present. President: Constitution & Journal AGREE on Humphrey (1968) and Nixon (1972). Down-ballot 1968-1974 overlap: **48 shared records, 0 direction divergences** — strong mutual validation.

**Phase 13 multi-pass:** deterministic regex engine; re-run reproduces the identical flag set, all adjudicated → converged.

**Final:** 570 candidates (522 e=1 / 48 e=0), 370 props, 0 empty-confidence, Pattern K 0, dups 0. V8 changes: 1 flip, 6 name fixes, 4 district fixes, 2 near-dup removals, 76 inc additions, 3 NEEDS_RA.

## Independent capstone (2026-06-20)
A second no-anchoring subagent re-derived facts from OCR + 400 DPI vision. **All 4 high-stakes V8 changes CONFIRMED** with literal quotes: 1966 Thompson→E0 ("FOR CONGRESS, 5th District: ARCHIE LINDSEY... His inexperienced Republican opponent, Fletcher Thompson..."); 1966 governor non-endorsement ("cannot recommend either nominee... Nor can we give newspaper endorsement to the write-in movement for Ellis Arnall"); all name fixes (Atkins/Johnson 1982, Fletcher 1988, Melton 1988); 1968 Dillon d103/Gunter d97 near-dup resolution (clean recap match). **15 stratified spot-checks (1960/1972/1980/1986/1990) all CONFIRMED** — incl. Kennedy, Nunn, Andrew Young, Carter, Gingrich (R over Bray D), Fowler, Zell Miller, John Lewis. Wrong-direction scan: none. No remaining name garbles (1970 Bolton=real AG Arthur Bolton, 1980 Federal=real judge Keegan Federal — both correct).

Two cosmetic notes (not errors): 1986 STATE REP d20 collapses four legitimately-endorsed Cobb "Post" sub-races to bare dist "20"; 1980 JUDGE Henley missing first name ("Clyde"). Logged for optional downstream cleanup.

## Additional verification round — Phase 8 reverse-match + vision (2026-06-20)
Per user request for maximum thoroughness, ran a full Phase 8 reverse-match (start from each year's OCR recap, find endorsements MISSING from the dataset) plus independent vision re-reads.

**5 omitted endorsements ADDED (all vision-confirmed from the printed recap boxes):**
- 1960 CNTY COMM DeKalb: **EMMERICH, CHARLES** (chairman) and **ALMAND, JIM** (district) — "In DeKalb local contests, we endorse Charles Emmerich for chairman of the county commission and Jim Almand for district commissioner" (clip 19601107). The dataset previously had only Kennedy for 1960.
- 1982 H d6 **GINGRICH, NEWT (R, inc)** and d9 **JENKINS, ED (D, inc)** — "the Constitution endorses incumbent GOP congressman NEWT GINGRICH in the 6th District and incumbent ED JENKINS in the 9th" (clip 19821101).
- 1982 STATE REP d32 Post 3 **DARDEN, GEORGE "BUDDY" (D, inc)** — "The Constitution supports BUDDY DARDEN for election to the House from District 32, Post 3" (Cobb). This one was missed even by the reverse-match subagent; caught on a manual recap-vs-CSV diff. District flagged for RA (Fulton d32 Selman coexists).

**1 wrong-direction record FIXED (vision-confirmed):**
- 1988 CNTY COMM Western Dist.: the recap endorsement box lists **R.L. Jacobs (R)**, not Harvey Paschal. Corrected Jacobs's party Democrat→**Republican** and flipped **PASCHAL, HARVEY E=1→E=0** (he was the un-endorsed opponent; both had wrongly been Democrat/E=1).

**Verification discipline note:** one proposed change was REJECTED on closer look — V1's "STATE SENATOR d32 PARRIS, KEN (D)" initially appeared to read "Perry (R)" in the recap, but a tight zoom confirmed "Ken Parris (D)"; V1 was correct, no change made.

**Other checks:** cross-year surname-variance scan (difflib, per office) — 2 pairs, both distinct real people (Atkins/Watkins, Williams/Williamson), 0 garbles. 1980 JUDGE Henley E=0 reconfirmed (Cunningham endorsed). External web search did not reach this granularity; primary OCR/vision remains authoritative.

**Final after this round:** 575 candidates (527 e=1 / 48 e=0), 370 props, 0 empty-confidence. Net: +5 records, 1 direction flip, 1 party fix.
