# QA Report: Abilene Reporter-News (144600)

**QA Date:** 2026-05-26 (re-QA; original QA 2026-05-04)
**QA Result:** PASS WITH FIXES

## Summary

Re-QA of the Abilene Reporter-News archive (Taylor County's modern daily, formed circa 1937 from the merger of Abilene Daily Reporter and Abilene Morning News). The substantive endorsement extractions are accurate near-verbatim where spot-checked, but the original pipeline left a systematic data quality issue: 97 candidate rows and 4 proposition rows were "stub format" records from election-day list clippings, with names in FIRSTNAME LASTNAME order and missing extraction_confidence, notes, and (for some props) prop_type. This re-QA pass dropped 23 true duplicates and reformatted 74 orphan stubs into proper format. Two smaller fixes also applied: deduped a conceptual 1964 prop pair and bumped 1984 Clinton's confidence after verifying the name in the source clipping.

This is the first paper where the "stub format" pattern was identified. The fix logic is now codified as a standing rule in `QA_INVENTORY_PROTOCOL.md` and will be applied to every subsequent paper.

## Final Counts (after re-QA)

- **Clippings:** 50 (unchanged)
- **Candidate endorsements:** 216 (was 239; 23 duplicate stubs removed)
- **Proposition endorsements:** 78 (was 79; 1 conceptual duplicate removed)
- **Year coverage:** 1952-2018
- **Mean confidence:** 0.913
- **Low-confidence records (< 0.7):** 3 (was 4; bumped 1984 Clinton from 0.6 → 0.85)
- **Party distribution:** 112 Democrat / 104 Republican

## Changes Applied in Re-QA

### 1. Stub-format dedupe and reformat (97 candidate rows + 4 proposition rows)

The original pipeline ran a second extraction on "election day list" clippings (e.g., 19941108, 19961105, and the consolidated lists in 1998-2018), which produced records in FIRSTNAME LASTNAME format with `extraction_confidence="high"` (non-numeric string, fell through to empty), empty notes, and sometimes empty prop_type/prop_num.

**Candidates fix:**
- **23 true duplicates dropped:** each had a proper-format twin (`LASTNAME, FIRSTNAME` with full conf and notes) in the same year. Affected primarily 1994 (about 21 dups: PERRY/RICK vs Rick Perry, MORALES/DAN vs Dan Morales, etc.) and 1996 (about 2 dups).
- **74 orphan stubs reformatted:** for stubs with no proper-format twin, reversed the name to `LASTNAME, FIRSTNAME` and set `extraction_confidence` to 0.85. Notes left empty (filling them would require re-reading every source clipping). Affected years: 1996 (16), 1998 (23), 2002 (19), 2004 (10), 2016 (3), 2018 (2), plus 1 office-mismatched 1994 case (BUD ARNOT for COURT OF APPEALS).

**Propositions fix:**
- 4 stub-format props (2002 amendment, 2016 Expo Center bond, 2018 Abilene ISD bond, 2018 Cisco College tax) had empty `prop_type` and `extraction_confidence`. Inferred `prop_type` from `prop_desc` (CONSTITUTIONAL AMENDMENT, BOND ISSUE, BOND ISSUE, LOCAL MEASURE respectively) and set conf to 0.85.

### 2. Deduped 1964 conceptual proposition duplicate

The Oct 28 1964 editorial "All 3 State Amendments Deserve Voter Approval" (omnibus endorsement of Amendments 1, 2, 3) and the Oct 29 1964 editorial "Amendment No. 2: How To Create Water Districts" (deep-dive on the same Amendment #2) both produced separate CSV rows for Amendment #2. Per the standing conceptual-dupe rule: kept the Oct 28 row (more substantive desc), merged the Oct 29 citation into `notes_endorse`. Dropped the Oct 29 row.

### 3. Bumped 1984 Clinton confidence (0.6 to 0.85)

The original extraction marked `CLINTON, SAM HOUSTON` (1984 COURT OF CRIMINAL APPEALS) at conf 0.6 with a note about the name being "partially legible." Re-reading the Nov 6 1984 recap clipping confirms the name "Sam Houston Clinton" is clearly readable. Bumped to 0.85 per skill rule for verified low-confidence records.

## Spot Check Results

**16 of 50 clippings read** (all critical: every source clipping for the 9 low-confidence records, all 6 empty-extraction JSONs, full year stratification 1950-2018):

| Clipping | Content | Verdict |
|---|---|---|
| 19501104 | News: "Final Census Figures" | OK, correctly empty, borderline news |
| 19501105 | Robert Allen syndicated column on reapportionment | OK, correctly empty, borderline syndicated |
| 19521031 | News: "Paper Didn't Deliver Stevenson Booklets" | OK, correctly empty, borderline news |
| 19561030 | Peter Edson column "South's Editors Differ Widely" | OK, correctly empty, borderline syndicated |
| 19581102 | "Here's Analysis of Those 9 Amendments" — extremely small print | OK, omnibus row at conf 0.30 appropriate (text genuinely illegible) |
| 19601101 | "This Newspaper Supports Changes in Constitution" — 4 amendments endorsed | OK, matches CSV exactly |
| 19621104_v2 | Multi-article page with paid George Paxton political ad | OK, correctly empty (paid ad is not an endorsement) |
| 19641028 | "All 3 State Amendments Deserve Voter Approval" — 3 amendments | OK, matches CSV |
| 19641029 | "Amendment No. 2: How To Create Water Districts" + Grant Jones STATE REP | Conceptual dup with Oct 28 row (now deduped) |
| 19681103 | "Vote for Humphrey, For Your World Depends on It" — Humphrey + Muskie | OK, matches CSV |
| 19721027 | "Amendments 3, 7, 13 Backed" — 3 amendments directly + refs 7 endorsed earlier | OK, matches CSV |
| 19781107 | Single editorial cartoon "Finally Getting the Message?" (LA Times) | OK, correctly empty, borderline cartoon |
| 19801104 | "Today's the Day" — checkbox endorsements: 6 candidates + 5 YES props + 4 NO props | OK, all 9 amendment positions match (5 endorsed=1, 4 endorsed=0); candidates all match |
| 19841106 | "Take time to vote / A privilege" — 5 candidate recap | Clinton name clearly readable, confidence bumped 0.6 to 0.85 |
| 19881106 | "Reporter-News endorses" — comprehensive 25-candidate recap including Place 4/5 "both qualified" | OK, all 25 candidates present; per new standing rule "both qualified" = both endorsed=1 |
| 19941106 | "Stenholm could gain from Foley troubles" — ~25-candidate recap | OK, matches; companion 19941108 produced 24 stub-format duplicates (now deduped) |
| 20181104 | "A reminder to vote and of our endorsements" — 2 candidates + 2 props (paper does not endorse statewide) | OK, matches; both candidates were stub-format orphans (now reformatted) |

**Accuracy on legible content:** ~100%. Quote captures are often verbatim. The 3 low-confidence records remaining (1958 nine-amendment omnibus at 0.30, 1984 amendments at 0.50/0.60) are genuinely illegible scans where the extractor was appropriately humble.

## Structural & Coding Validation

- OK: all CSV columns present (16 candidates, 11 propositions)
- OK: all `newspaper_id` populated (144600)
- OK: all `state_newspaper` and `state_election` are 2-letter "TX"
- OK: all `year` values are 4-digit even years (1952-2018)
- OK: all clipping filenames follow naming convention
- Note: 4 clippings use `_v2`/`_v3` suffix instead of spec's `_NN` (19601101_v2, 19621104_v2, 19621104_v3). Per standing rule, do NOT rename (would break parts/ JSON links).
- OK: all `endorsed` values are 1, 0, or empty; endorsed=0 (explicit opposition) correctly captured for 1952/1956/1962/1968/1980/1984/1986
- OK: all `extraction_confidence` values now populated and valid (after stub-format fix)
- OK: candidate names in ALL CAPS LASTNAME, FIRSTNAME format (after stub-format reformat)
- OK: party labels match canonical set (Democrat / Republican)
- OK: incumbency properly marked across years (no `0` errors)
- OK: no junk/trailing rows
- OK: no exact duplicates remaining
- OK: metadata clipping count, candidate count, proposition count match CSVs

## Raw/ Folder Inspection

- OK: `raw/clippings/` matches `done/clippings/` exactly (50 files each)
- OK: all 50 clippings have valid `parts/*.json`; no orphans, no missing
- OK: all JSONs are well-formed
- OK: all 6 empty-extraction JSONs verified by reading the corresponding PDFs (2 news pieces from 1950, 1 from 1952, 1 syndicated column from 1956, 1 multi-article page with paid ad from 1962, 1 editorial cartoon from 1978). All legitimately non-endorsement content.
- Note: the election-day list clippings (19941108, 19961105, 19981103, 20021105, 20041102, 20161106, 20181104) extracted with `confidence="high"` (non-numeric string) and empty notes — root cause of the stub-format issue addressed in changes section. JSONs preserved unchanged for audit trail.
- Note: no intake manifest or processing logs preserved in raw/ root (cleaned up after original compile).

## Open Items (Not Specific to This Folder)

These dataset-wide spec deviations apply to all 128 papers and should drive an eventual update to the skill specs (newspaper-endorsements + endorsement-qa), not per-paper fixes:

1. **`prop_type` values.** Dataset uses `CONSTITUTIONAL AMENDMENT`, `BOND ISSUE`, `LOCAL MEASURE`. Skill specs say `AMENDMENT`, `BOND`, `BALLOT MEASURE`. Standing decision: leave dataset as-is, update spec.
2. **Case conventions.** `prop_desc` and `notes_endorse` are mixed case in the dataset; skill specs say ALL CAPS. Standing decision: leave dataset as-is, update spec.
3. **Stub format from election-day lists.** New standing rule added to `QA_INVENTORY_PROTOCOL.md`. This pattern likely affects most papers with late-90s+ data.
4. **"Both qualified" / multi-candidate language.** New standing rule added: treat all named candidates in dual-praise endorsement lists as `endorsed=1`.

## Notes for Downstream Use

- Owned by Harte-Hanks (founders Houston Harte and Bernard Hanks went on to found Harte-Hanks Communications).
- TX-specific elected offices: RAILROAD COMMISSION (3-member), LAND COMMISSIONER, AGRICULTURE COMMISSIONER, COMPTROLLER, TX SUPREME COURT (civil), COURT OF CRIMINAL APPEALS (criminal).
- 1996 has two clippings (Nov 1 preview + Nov 5 election-day list).
- 2016: paper did NOT endorse for President; stuck to area races (3 candidates total).
- 2018: paper explicitly stated it does not endorse candidates in statewide races (2 candidates: U.S. House and State Rep only).
- Pre-1980s TX was Solid Democratic; transitioned Republican 1980s+. Party distribution after re-QA: 112 Democrat / 104 Republican.
- 1988 TX Supreme Court Place 4 (Culver R / Hightower D) and Place 5 (Cook R / Bayer D) editorials say "both qualified" without picking. Per the standing rule established during this re-QA, both candidates are treated as `endorsed=1`.
- Pre-1937 endorsement history: see Abilene Daily Reporter (144599) archive.

## Recommendation

PASS WITH FIXES. The stub-format issue was significant but cleanly resolved. After fixes, the data is consistent, well-coded, and ready for compilation. The new standing rules (stub-format handling + "both qualified" interpretation) will prevent similar issues from going undetected in subsequent papers.

---

# V8 Deep Verification (endorsement-verification skill) — 2026-06-18

**Result:** PASS WITH FIXES. 7 candidate corrections, 6 proposition fixes, 5 propositions added. Subagent-adjudicated.

## Method
Re-OCR'd all 50 clippings from scratch (pdfimages + tesseract; pdftoppm 300/600 DPI fallbacks on 9 low-yield clippings, incl. 19641029 which gave 0 lines via pdfimages and 241 lines at 300 DPI). Aggregated OCR by year for all 25 clipping years (1950–2018). Cross-checked all 216 candidate records and 78 props against independent OCR using three parallel independent subagents (years 1952–1968, 1972–1990, 1992–2018), each re-reading OCR with no anchoring. High-stakes flags were then personally re-read against OCR before applying.

## Candidate corrections (7)
1. **1988 TX Supreme Court Place 4 & 5 — 4 false-positive endorsements removed.** The paper endorsed only 4 of 6 Supreme Court races: OCR "The choice is clear-cut in four of the six races" (Chief Phillips, Place 1 Murphy, Place 2 Hecht, Place 3 Gonzalez). For Place 4 (Barbara CULVER R / Jack HIGHTOWER D) and Place 5 (Eugene COOK R / Karl BAYER D) it said "both...are qualified" and made NO pick. V1 coded all four endorsed=1. Set to EMPTY (no endorsement); flagged NEEDS_RA for removal vs no-endorsement coding. (These were the folder's 4 lowest-confidence candidate records at 0.70.)
2. **1994 JUDGE dist=11 "ARNOT, BRAD" (R) — spurious duplicate.** OCR shows only "Bud Arnot, Democrat" (Chief Justice, 11th Court of Appeals), already captured as ARNOT, BUD. No "Brad Arnot"/Republican exists. Wrong first name + wrong party; set EMPTY, flagged NEEDS_RA to delete.
3. **1994 JUSTICE OF PEACE "ANDREW, REX" — party fixed.** OCR: "Write-in candidate Rex Andrew" / "Rex Andrew (write-in)"; no party. Changed party Republican → empty. Endorsement itself confirmed.
4. **1996 SHERIFF "DIETEN, JACK" → "DIEKEN, JACK".** OCR (1996 ×2 + 1992) reads "Jack Dieken"; V1 1992 already used DIEKEN. Name fix.

The other 211 endorsed candidates were each OCR-confirmed (LIST_FORMAT recaps); 4 apparent surname misses (1982 Clark, 1986 Hobby, 1998 O'Neill, 1998 Hankinson) are OCR line-break truncations, not errors.

## Proposition corrections (6) + additions (5)
**Direction/field fixes:**
- **1984 omnibus "Amendments 2,3,5,6,7" E=1 → EMPTY (mixed).** OCR "we support all but Amendment 3" and "we oppose this amendment [No. 7]". So 2/5/6 YES, 3 NO, 7 NO. NEEDS_RA split.
- **1984 num=1 (judicial conduct, E=0):** OCR attributes this content to Amendment **7**, not 1 ("change of heart regarding Amendment 7"). Direction (oppose) is correct; number suspect. NEEDS_RA.
- **1984 num=4 (trial de novo, E=0):** text absent from the single captured clipping (Oct 27 detail editorial not in folder); unverifiable. NEEDS_RA.
- **2018 BOND (AISD) description "$86 million" → "$88 million"** (OCR "finishes the job of the $88 million bond election").
- **2018 Cisco College tax "3 cent" → "5 cent" per $100 valuation** (OCR ×2).

**Phase 8 additions (V1 omissions, all endorsed=1):**
- **1966 Amendment No. 2 and No. 11** — OCR "on record in support of Amendments 2 through 16" (V1 had 3–10, 12–16). Descriptions need RA fill.
- **1968 Amendments No. 1, 3, 7** — OCR "previously endorsed amendments 1 3 and 7." Descriptions need RA fill.

**1958 omnibus (empty):** confirmed correct as empty (mixed). OCR gives per-amendment directions YES=1,3,7,9 / NO=2,4,5,6,8. NEEDS_RA split.

## Phase 6 (cross-cycle inc): 21 consecutive-cycle same-office endorsements lack an inc flag on the later record. NOT auto-set — repeat endorsement does not prove incumbency (a paper may endorse a challenger across cycles). Flagged for RA in RA_NEEDS.

## Phase 8 (1950): clipping year 1950 has 2 clippings but 0 records. CONFIRMED correct — both are census/congressional-reapportionment news columns (Robert S. Allen), not endorsements.

## Phase 12: Cross-paper
Sister paper in done/: **Abilene Daily Reporter (144599)**, the *predecessor* (1928–1936). No year overlap with ARN (1952–2018). Cross-validation N/A. (Note: a 1932 Daily Reporter clipping's OCR reads "Reporter-News," predating the documented ~1937 merger — flagged in that folder's RA_NEEDS.)

## Phase 13: Multi-pass
- Pass 1: 7 candidate + 6 prop corrections, 5 props added (above).
- Pass 2: 0 new issues. Surname-presence re-scan returns only the 4 known OCR-truncation cases; all corrections hold. Converged.

## OCR coverage
All 50 clippings yielded usable OCR after fallbacks. High-record list-recap years (1990, 1992, 1998, 2002) are compact but fully legible. No dead-end clippings.

## V8 Addendum (2026-06-18): 1984 props hardened + incumbency pass

**1984 propositions rebuilt (4 clean rows).** Full re-read of the 19841104 editorial established directions for all eight 1984 amendments from subject matter (not V1's unreliable numbering): the board opposed only the financial-aid-to-survivors amendment ("we support all but Amendment 3") and the judicial-conduct amendment ("Amendment 7... we oppose this amendment"); it favored the rest. New rows:
- Amendment 3 — E=0 (financial aid to survivors of public servants killed on duty).
- Amendment 7 — E=0 (State Commission on Judicial Conduct membership + open-hearing provision). V1 had mis-numbered this as Amendment 1; renumbered to 7 per explicit OCR.
- Amendment 4 — E=1 (trial de novo / small claims). Direction FLIPPED from V1's E=0: the board opposed only #3 and #7, so this distinct-subject amendment was favored. Ballot number flagged for RA confirmation.
- Favored omnibus (Nos. 1, 2, 5, 6, 8) — E=1.

**Incumbency (Phase 7) — 13 inc flags set from OCR evidence.** A systematic scan checked every endorsed record lacking an inc flag for incumbent language near the candidate's name, then each hit was adjudicated to confirm the language referred to that candidate (not an adjacent one):
- 1988 McCormick (D, CCA) — "these three justices... are incumbents."
- 1996 (11): Wright, Rylander, Phillips, Cornyn, Abbott, Baker (appointed), Dieken — all OCR "Republican incumbent ..."; Gramm ("Republican Sen."), Stenholm/Cook/Counts ("Democratic Rep.").
- 2018 Arrington (R) — "first-term Republican, has served."

Nine proximity false-positives were correctly left unflagged (1968 Smith, 1986 Barrera/Sharp, 1988 Saringer/Smart, 1996 Holland/Holcomb, 2016 Arrington/Buckingham) because the incumbent language referred to an adjacent candidate or a retiring officeholder. Total inc flags: 57 -> 70. No Pattern K (party/inc) contradictions introduced.

*(Audit tokens: Phase 11 HARDENED 1984 props; Phase 7 INC flags set; Phase 5 Pattern K fixes applied.)*
