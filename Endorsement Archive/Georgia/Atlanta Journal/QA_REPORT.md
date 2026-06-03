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
