# QA Report: Atlanta Journal-Constitution

**Audit date:** 2026-06-01 (V6 — final formal endorsement-qa skill pass after 6 rounds of spot checks)
**Folder:** Atlanta Journal-Constitution
**Newspaper ID:** 109050
**Data coverage:** 2002-2012, 7 clippings, 190 candidate records, 30 proposition records

## Overall Assessment

**PASS WITH FIXES V6** — Atlanta Journal-Constitution is the post-2001 merged paper. Initial formal QA + 6 rounds of spot checks (30 total spot checks) yielded ~40 fixes across Pattern M, Pattern J, Pattern Q, Pattern L, name normalization, incumbency, and office code categories.

## Stage 1: Structural Validation (final pass)

- CSV headers: PASS (all standard columns)
- Row integrity: PASS (0 year/endorsed/conf issues)
- state_election: PASS (all GA)
- Incumbency=0 values: PASS (0)
- Junk rows: PASS (0)
- Newspaper ID 109050: populated consistently
- 0 empty endorsed records

## Stage 2: Spot Check (30 total across 6 rounds)

### Round 1 (initial formal QA Stage 2)
1. 2012 Charter School Amendment matches OCR
2. CRITICAL Pattern M find: 2002 THURMOND/IRVIN office swap (AGRICULTURE/LABOR commissioners)
3. 2006 deep verification with OCR
4. 2004 records + ELLIS BOB anomaly flagged
5. 2008 records verified

### Round 2 (spot checks 5-9)
5. ELLIS BOB 2004 conf 0.95→0.50 flagged
6. 2004 props verified
7. 2006 Pattern J caught — added Amendments 2 and 3 as e=0
8. 2008 v2 PDF: no new records
9. LEWIS 2006 H-5 Pattern J fill added

### Round 3 (spot checks 10-15)
10. 2006 Pattern A pairs added (Perdue Gov, Wise PSC, Burgess PSC)
11. 2002 Stoner career transition verified (STATE REP→STATE SENATE)
12. CNTY COMM AT-LARGE designations clean
13. dname coverage verified (federal/statewide empty correct)
14. Cross-year perennial tracking
15. Office code standardization

### Round 4 (spot checks 16-20)
16. 2002 STATE REP CRITICAL Pattern M: ADELMAN STATE REP→STATE SENATOR + STANLEY-TURNER dist 42→44 + 4 Post numbers
17. 2008 Court of Appeals 4-judge sanity
18. Cross-year party validation (0 mismatches)
19. Incumbency 0%→9% via 2002 (I) markers
20. Pattern K after fills (0)

### Round 5 (spot checks 21-25)
21. 2004 incumbency flags (3 added)
22. 2006 incumbency flags (18 added) — total 19% coverage
23. THOMAS/MORGAN ALISHA same person verified
24. 2008 BOND/REFERENDUM/TAX props clean
25. JUDGE+dist=COURT OF APPEALS → office=COURT OF APPEALS (6 normalizations)

### Round 6 (spot checks 26-30)
26. 2002 US House all 13 districts verified
27. 2006 STATE REP all 12 records match OCR
28. 2002 dname coverage verified clean
29. Confidence distribution healthy 0.929-0.950
30. Final structural sanity 0 issues

**Accuracy:** ~98% post all fixes
**Recommendation:** Good shape

## Stage 3: Variable Coding & Dedup (final pass)

**Issues found:** 0 | **Auto-fixed:** 0 | **Remaining:** 0

All coding categories pass cleanly:
- 22 unique office codes (all standard)
- 5 party labels (all standard)
- 0 names without comma (all LASTNAME, FIRSTNAME)
- 0 cand duplicates, 0 prop_num collisions
- 0 Pattern K incumbency-party mismatches
- All prop_type, prop_desc ALL CAPS

## Stage 4: Low-Confidence Re-Scan (final pass)

**Records reviewed:** 2 (both intentionally flagged for future OCR verification)
- 2004 H ELLIS, BOB at conf 0.50 — OCR doesn't support, possible misextraction
- 2006 H LEWIS, JOHN at conf 0.60 — Pattern J fill, OCR garbled at D-5

**Mean confidence:** 0.940

## Stage 5: Manifest Registration

Atlanta Journal-Constitution registered as entry #17 with qa_result "PASS WITH FIXES V6".

---

## Final Statistics

- **190 candidate records, 30 proposition records**
- **Years: 2002, 2004, 2006, 2008, 2012**
- **End=1: 187 cand, 20 prop**
- **End=0: 3 cand, 10 prop**
- **Mean confidence: 0.940**
- **0 duplicates, 0 Pattern K mismatches**
- **Incumbency coverage: 35/187 = 19% (was 0% pre-V4)**
- **22 unique office codes (all standard)**
- **2 low-conf records flagged for future review**

## Total Fixes Across All Rounds (~40)

- Pattern M cross-office: 2 (THURMOND/IRVIN swap; ADELMAN STATE REP→SENATOR)
- Pattern J fills: 3 (2006 Amendments 2/3 + Lewis 2006)
- Pattern A opposed records: 3 (Perdue/Wise/Burgess)
- Pattern I dist: 2 (Parsons 29→28, Stanley-Turner 42→44)
- Post number additions: 4 (D-42 Post 1-4)
- Office code normalization: 7 (Agriculture commissioner + 5 Court of Appeals + 1 Supreme Court)
- Synthetic prop_num: 10 (county-level props)
- Incumbency flags: 35 (was 0)
- ALL CAPS prop fixes: 50 records normalized

## Notes for Future Work

1. **AJC editorials list only endorsements** (no opposed candidates) — extraction style
2. **2008/2010/2012 lack US House records** — archive limitation, not extraction error
3. **2 records flagged for future OCR**: ELLIS BOB 2004 H-9 + LEWIS 2006 H-5
4. **Predecessor papers:** Atlanta Constitution (109051) 1960-1990; Atlanta Journal (109052) 1968-1974
5. **Pattern M (cross-office)** discovered as a systematic error type — should check in future folders

---

## V8 Deep Verification (endorsement-verification skill) — 2026-06-20

AJC (merged paper), 190 candidates (187 e=1 / 3 e=0) + 30 props, years 2002/2004/2006/2008 (+1 2012 prop). 7 clippings.

**Re-OCR (Phase 1):** all 7 clippings via pdfimages+tesseract; per-image year-header check confirms NO multi-year bundling (each clipping = its filename year). All years 72-207 OCR lines.

**Phases 2-9:** 153/187 e=1 verified directly; 34 flagged. Format 0 fixes; Pattern K 0; dups 0; 19 cross-cycle inc added.

**Phase 10 — independent subagent adjudication:** 31 CONFIRMED, plus:
- **1 NAME garble fixed:** 2002 CNTY COMM d1 "GOREMAN, HELEN" → **GOREHAM, HELEN** (Cobb Commission D1, R).
- **Resolved an apparent duplicate:** 2006 CNTY COMM d1 "Tim Lee" and "Lee Morris" are NOT duplicates — Tim Lee = **Cobb** County, Lee Morris = **Fulton** County (distinguished by dname); both correctly endorsed.
- **1 SPURIOUS record flagged (NEEDS_RA):** 2006 H d5 "LEWIS, JOHN" E=1 has no source support — the 2006 congressional recap lists districts 1-4, 6-11, 13 but **skips District 5 entirely**, and "Lewis" appears nowhere (he ran unopposed in GA-5). Confidence lowered to 0.5; RA should remove or recode. No other paper-side support.
- Verified real GA delegation: 2004 US House slate (Gingrey, Barrow, Bishop, Marshall, McKinney, Westmoreland, Ellis) all confirmed; 2006 Oxendine, Eaton-over-Burgess, Court of Appeals (Doyle/Edenfield/Meyer von Bremen) confirmed.

**Phase 11 props:** 30 props (20 yes / 10 no); 28/30 keyword-confirmed in OCR. 2002 statewide cross-check (Barnes/Cleland/Cox/Baker/Thurmond/Stancil/Christmas) all captured — no omissions.

**Phase 12 cross-paper:** sister papers Atlanta Constitution (ends 1990) and Atlanta Journal (ends 1974) exist but have **NO year overlap** with the AJC (2002-2008) — the AJC is the post-merger paper. N/A by date.

**Final:** 190 candidates (187 e=1 / 3 e=0), 30 props, 0 empty-confidence, self-audit PASS. V8 changes: 1 name fix, 1 spurious-flag, 19 inc additions, 0 flips.

## Independent capstone (2026-06-20)
A second no-anchoring subagent re-derived from OCR + 400-DPI vision and ran 12 stratified spot-checks (2002/2004/2006/2008), all CONFIRMED (Barnes, Cleland, Kerry, Westmoreland, Bernes, 2006 Taylor/Kingston/Hunstein, 2008 Obama/Martin/Powell). It confirmed the 2006 Lewis spurious flag, the Tim Lee (Cobb) / Lee Morris (Fulton) two-county distinction, and the Eaton-over-Burgess PSC direction. No wrong-direction errors, no omissions.

**The capstone caught and reversed two errors (both vision-verified by me at 400 DPI):**
- 2002 CNTY COMM d1: the Phase-10 "GOREMAN → GOREHAM" name fix was WRONG — the clipping prints "Helen **Goreman** (R)". Reverted to GOREMAN (the original V1 value). The Phase-10 change had come from garbled OCR; vision is decisive.
- 2002 STATE REP Don Parsons: coded d28 with a prior-QA note "29→28 per OCR," but the source clearly reads "District **29**: Don Parsons (R)(I)." Corrected back to **d29** (the prior change was unsupported).

This is the capstone working as designed — a vision recheck overturning two OCR-driven errors. Final: 190 candidates (187 e=1 / 3 e=0), 30 props, 0 empty-confidence, self-audit PASS.

## Deep audit round — complete vision reverse-match + prior-edit audit (2026-06-20)
Per request for maximum thoroughness. A dedicated subagent vision-read all four clippings (every column) for a COMPLETE recap-vs-CSV diff, and audited every prior-QA district/name edit against the images. External web checks corroborated notable races.

**2 records corrected (both vision-verified by me at high zoom):**
- **REMOVED 2006 H d5 "LEWIS, JOHN" (E=1)** — definitively spurious. The 2006 congressional editorial reads "District 4, Hank Johnson... District 6, Tom Price" — **District 5 is skipped entirely** and John Lewis is named nowhere (he ran unopposed in GA-5). The record had been a prior-QA "Pattern J fill" inference, not a real endorsement. Candidate count 190→189.
- **FIXED 2002 STATE REP Stanley-Turner: dist "44" → "43 Post 2" (Fulton)** — a SECOND erroneous prior-QA district edit (the note claimed "42→44 DeKalb Post 5"; the image clearly shows "District 43, Post 2: Lanette Stanley-Turner (D)(I)" under Fulton). 

**Prior-QA edits AUDITED and CONFIRMED correct:** 2002 Adelman STATE REP→STATE SENATOR d42 (image: DeKalb State Senate D-42); 2002 Labor=Thurmond / Agriculture=Irvin office assignments (image confirms both); the Court of Appeals / Supreme Court office-code normalizations.

**Complete reverse-match results:** 2002 clean (only the Stanley-Turner district error); 2004 clean (full slate incl. Kerry, Isakson, Baker, House delegation — Bob Ellis D in GA-9 externally confirmed as Norwood's real 2004 challenger); 2006 clean apart from the removed Lewis row; 2008 genuinely limited to 8 candidate races (Obama, Martin, Powell, Jackson, 4 Court of Appeals) — the rest of that clipping is propositions, so NO omissions. _v2 clippings are duplicate pages, no extra content.

**Final after deep round:** 189 candidates (186 e=1 / 3 e=0), 30 props, 0 empty-confidence, self-audit PASS. This round: 1 spurious removal, 1 district fix; combined with the capstone (Goreman revert, Parsons d29) the folder had **3 erroneous prior-QA edits corrected** plus 1 fabricated record removed.

## Field-level vision sweep — district/post/party/incumbency (2026-06-20)
Most thorough pass yet: a subagent vision-read all four recaps to verify the DISTRICT, POST, PARTY, and INCUMBENCY of every record (not just names — the two district errors above had passed because their names matched). The AJC recaps print "District N, Post M: Name (Party)(I)", enabling field-level checks. Every flagged item was re-verified by me at high zoom before applying.

**1 PARTY error fixed (my own 400-DPI vision-confirmed):** 2002 STATE REP d15 Cherokee — Jerry Moore was coded Republican but the recap clearly prints "District 15: Jerry Moore (D)". Corrected to **Democrat**.

**13 incumbency flags added** from the recap's "(I)" tags / "incumbent" language: 2002 — Thurmond (Labor), Kenn (Fulton chair), Stanley-Turner, Gene Callaway, Golick, Dodson, Mike Barnes; 2006 — Tom Price, Mumford, Everson, Kenerly, Cooper, Jan Jones. **1 incumbency flag removed:** 2006 Jan Hackney (image says "Democratic challenger," not incumbent) — her d_inc was wrong.

**15 Post numbers added** to 2002 multi-member GA House/At-large records that printed a Post but had only the bare district (districts 33, 34, 56, 59, 61, 69, 70, 84 and Robb Pitts At-large Post 2) — completeness improvement, vision-sourced.

Post-change integrity: 0 exact duplicates, 0 Pattern K (no inc flag on the wrong party side), self-audit PASS. 2004/2008 recaps print no "(I)" tags so incumbency there is left as-is; all their districts/parties matched. The single 2012 prop (charter-school amendment, E=0) confirmed against the editorial ("the editorial board's opinion... focus on bettering K-12").

**Final after field sweep:** 189 candidates (186 e=1 / 3 e=0), 30 props, 68 inc-flagged, 0 empty-confidence, self-audit PASS. This round: 1 party fix, 13 inc additions, 1 inc removal, 15 Post additions.

## Exhaustive independent full transcription + complete props audit (2026-06-20)
A fresh subagent transcribed the entire 2002 and 2006 candidate recaps column-by-column (every record, every field) and audited all 30 prop directions against the images. 2002 and 2006 candidates: full match on name/district/post/party/incumbency/direction, confirming the prior corrections (Jerry Moore (D), Stanley-Turner d43 Post 2, Parsons d29, no Lewis d5). Props: 29/30 confirmed; 2012 charter-school amendment verified via headline "No on Amendment One" (E=0).

**2 final corrections applied:**
- 2002 CNTY COMM Clayton d1 Carl Rhodenizer (D): added **d_inc=1** (image "(I)") — last missing incumbency flag.
- 2002 Barbara Christmas: office **STATE BOARD OF ED → SUPERINTENDENT** (image "State school superintendent: Barbara Christmas (D)"; the record's own dname said "State School Superintendent" and the 2006 Kathy Cox record codes the same office as SUPERINTENDENT — an internal inconsistency now resolved).

**1 item noted, not changed:** 2004 Amendment 2 (Supreme Court jurisdiction) prints no explicit yes/no in the recap (only Amendment 1's "No" is marked); CSV "Yes" follows the list convention and is plausible but unverifiable from this clipping.

After 4 independent vision passes (capstone, deep reverse-match, field sweep, full transcription) every candidate field — name, party, district, post, incumbency, office, direction — has been checked against the source images. Remaining gaps (2004/2008 incumbency, 2004 Amd 2 direction) are genuinely not printed in the available clippings; external GA-records cross-validation is pending (web search currently unavailable).

**Final:** 189 candidates (186 e=1 / 3 e=0), 30 props, 69 inc-flagged, 0 empty-confidence, 0 dups, 0 Pattern K, self-audit PASS.
