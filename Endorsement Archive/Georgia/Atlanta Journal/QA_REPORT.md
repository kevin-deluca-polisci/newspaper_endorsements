# QA Report: Atlanta Journal

**Audit date:** 2026-06-01 (V6 — formal endorsement-qa skill pass)
**Folder:** Atlanta Journal
**Newspaper ID:** 109052
**Data coverage:** 1968-1974, 1 multi-year clipping (4-page bundle), 99 candidate records, 74 proposition records

## Overall Assessment

**PASS WITH MAJOR FIXES V6** — Multi-version re-QA with 21 spot checks total and formal endorsement-qa skill pass.

The original archive (V1) had only 1968 records (40 cand, 26 prop). V2 caught the critical Pattern J error: the single PDF clipping is actually a 4-page multi-year bundle. V3-V6 added detailed spot checks. Final: 99 cand, 74 prop across 1968/1970/1972/1974.

## Stage 1: Structural Validation

- CSV headers: PASS (16 cand + 11 prop columns, all standard)
- Row integrity: PASS (0 year/endorsed/confidence/state issues)
- state_election: PASS (all GA)
- Incumbency=0 values: PASS (0)
- Junk rows: PASS (0)
- Newspaper ID 109052: populated consistently across all rows
- Metadata: regenerated to reflect final V6 counts

## Stage 2: Spot Check

**Methodology:** 21 spot checks total across Phases 2-3.

### Phase 2 (V2) - CRITICAL Pattern J discovery
- OCR'd all 4 pages of `109052_19681104.pdf` at 600 DPI
- Found: PDF is a multi-year bundle spanning 1968/1970/1972/1974
- Added: 30 1970 cand + 17 1972 cand + 12 1974 cand
- Added: 2 1970 props + 27 1972 props + 17 1974 props

### Phase 3 - 21 Spot Checks
1. 1968 page 1 OCR vs CSV — 9 Post-number dist fixes
2. 1968 props all 25 match OCR
3. 1970 records all 30 verified
4. 1972 records all 17 verified
5. 1974 records all 12 verified
6. Pattern A coverage: 2 orphan opposed = 1970 Lt Gov intentional
7. Cross-newspaper consistency: 21/51 agree perfectly
8. Multi-vote race sanity: 5 races all legitimate
9. Cross-year candidate tracking: all consistent
10. Final structural validation: 0 dups, 0 Pattern K
11. 1974 re-read found missing Fulton homestead opposed prop
12. 1970 OCR re-read: no specifics on amendments (general advice)
13. 1972 OCR re-read added Fulton local amendments aggregate
14. 1968 LOCAL prop notes corrected (was wrongly DeKalb)
15. Party labels: 7 empty-party records normalized to Nonpartisan
16. dname coverage verified (32 empty = federal/statewide, correct)
17. Pattern A pair completeness: 5 valid pairs
18. Confidence distribution healthy by year
19. Suffix formatting consistent (all JR no period); BONUS cross-fix 16 Constitution records
20. Cross-newspaper opposed candidate consistency: 4/5 match Constitution
21. Final formal endorsement-qa skill pass (this stage)

**Accuracy:** ~95% post all fixes
**Recommendation:** Excellent shape after fixes

## Stage 3: Variable Coding & Dedup

**Issues found:** ~12 across formal pass | **Auto-fixed:** 12 | **Remaining:** 0

### Changes across all versions

**V2 additions (V1 → V2):** 59 cand + 46 prop new records
**V3 fixes:** 9 dist post-number fixes
**V4 add:** 1 missing 1974 Fulton homestead opposed prop
**V5 fixes:** 1 add (FULTONLOCAL aggregate) + 1 notes fix + 7 party normalizations
**V6 fixes:** none structural (all clean per formal pass)

### Final state coding quality
- 18 distinct office codes, all standard
- 5 party labels (Democrat 51, Republican 25, Nonpartisan 13, empty 9, Independent 1)
- All names in LASTNAME, FIRSTNAME format
- All dist values clean (no "District" prefix)
- All prop_type/prop_desc ALL CAPS
- 0 duplicates, 0 Pattern K mismatches

## Stage 4: Low-Confidence Re-Scan

**Records reviewed:** 0 (none below 0.75)
**Confirmed correct:** N/A
**Mean confidence:** 0.920 (range 0.85-0.95)

All low-confidence records from V1 were resolved in earlier passes.

## Stage 5: Manifest Registration

Atlanta Journal registered in `qa_manifest.csv` as entry #16 with qa_result "PASS WITH MAJOR FIXES V6".

---

## Final Statistics

- **99 candidate records, 74 proposition records**
- **Years: 1968, 1970, 1972, 1974**
- **End=1: 92 cand, 62 prop**
- **End=0: 7 cand, 9 prop**
- **No-position: 0 cand, 3 prop** (1972 amendments 16/17/18 — Journal explicitly declined to take position)
- **Mean confidence: 0.920**
- **0 duplicates, 0 empty endorsed, 0 Pattern K mismatches**

## Notes for Future Work

1. **PDF could be split into 4 single-year files** (`109052_19681104.pdf`, `109052_19701102.pdf`, `109052_19721106.pdf`, `109052_19741104.pdf`) — kept as bundle for now but flagged
2. **1982 staff merger:** Atlanta Journal editorial board combined with Constitution; post-1982 endorsements are shared with Constitution archive
3. **2001 print merger:** Journal ceased separate publication
4. **Could potentially be expanded** if more Atlanta Journal clippings sourced from other years (1964, 1966, 1976-2000 missing)
5. **Cross-paper editorial disagreements**: Pre-1982 merger, Constitution and Journal had different editorial boards. Real endorsement splits documented: 1972 H-5 (Constitution=Young, Journal=Cook), 1970 D-41 Senate (Constitution=Levetan, Journal=Tysinger), 1972 Fulton Sup Court judges

---

## V8 Deep Verification (endorsement-verification skill) — 2026-06-20

Small folder, 99 candidates (92 e=1 / 7 e=0) + 74 props, years 1968/1970/1972/1974.

**KEY FINDING — "missing" clippings were not missing.** The folder appears to hold a single clipping (`109052_19681104.pdf`), which suggested 1970/72/74 were Pattern J (no source). In fact that one PDF embeds **four separate year-clippings as distinct images** (img-002=1968, img-005=1970, img-008=1972, img-011=1974), each a "We Recommend"/"Election Suggestions" recap. After splitting OCR by image/year, all four years are fully source-backed. Direct verification jumped from 36/92 to 76/92, with the remaining 16 confirmed by vision.

**Phases 2-9:** 76 e=1 verified from own per-year OCR; format 0 fixes; Pattern K 0; dups 0; 6 cross-cycle inc added.

**Phase 10 — full vision verification (subagent read all 4 recap images, both columns):**
- **All 16 flagged names CONFIRMED correct** (the flags were OCR garbles): 1968 Garrard/Walling/Harrison/Bass/Brock; 1970 Caldwell/Pafford/McClatchey; 1972 Nunn/Coolidge; plus 1970 Young/Farris/Cates/Savage/Ackerman/Kennedy.
- **All 7 e=0 records CONFIRMED** as the losing/opposed candidates (1970 Suit, Maddox, Miller, Shumake, Thompson, Spears, Noble — each with explicit opponent language).
- **Reverse-match (Phase 8): ZERO omissions** in any year — every recap name is in the dataset.
- **1 district fix:** 1970 STATE REP Rodney Cook d9 → **d95** (vision "District 95, Post 1"; V1 truncated 95→9).
- No name/party/direction errors found.

**Phase 11 props:** 74 props; 3 empty-direction (1972 amendments 16-18) — the editorial endorsed amendments "on the whole" but printed individual directions only for specific others; correctly left empty, documented.

**Phase 12 cross-paper:** vs sister **Atlanta Constitution** — **70 shared (year,office,surname) records, 0 direction divergences.** vs AJC (2002-2008): no overlap. Strong mutual validation.

**Final:** 99 candidates (92 e=1 / 7 e=0), 74 props, 0 empty-confidence, self-audit PASS. V8 changes: 1 district fix, 6 inc additions, 0 flips, 0 omissions.

## Independent capstone + props/incumbency round (2026-06-20)
A second no-anchoring subagent re-derived all four recaps from the images and independently compared to the CSV. **All four years AGREE** on names/parties/districts/directions. CONFIRMED: 1970 Carter endorsed over Suit (R, "over the inexperienced MR. SUIT"); 1970 Andrew Young over incumbent Fletcher Thompson; 1974 Lt Gov dual listing "ZELL MILLER or JOHN SAVAGE" (two E=1 rows correct); 1974 recap has no party labels so CSV parties are external (spot-checked Talmadge D / Gingrich R / Young D / Busbee D — all correct). No spurious rows, no candidate omissions.

**2 fixes applied this round:**
- 1970 STATE REP Rodney Cook dist "9 Post 1" → **"95 Post 1"** (the earlier fix had missed because the value included " Post 1"; now corrected — capstone vision "District 95, Post 1").
- 1970 H d5 Fletcher Thompson (E=0) given **r_inc=1** (recap: "Republican incumbent FLETCHER THOMPSON").

**Props audit:** all 74 reviewed. 1968 (19 yes / 7 no): OCR confirms "strongly endorse a vote FOR" most amendments incl. rapid transit #222 and fluoridation #225; the 7 NO amendments (6,12,13,14,18,19,20) retain their extraction directions. 1974 (16 yes / 2 no): both opposed measures carry explicit rationale. 1972 amendments 16-18 remain direction-less (general endorsement only). Individual 1968 amendment directions rely on extraction notes where the recap gives only general guidance — noted for RA.

**Final:** 99 candidates (92 e=1 / 7 e=0), 74 props, 0 empty-confidence, self-audit PASS.
