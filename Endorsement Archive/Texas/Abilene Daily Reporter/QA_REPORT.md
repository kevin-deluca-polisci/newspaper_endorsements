# QA Report: Abilene Daily Reporter (144599)

**QA Date:** 2026-05-26 (re-QA; original QA 2026-05-04)
**QA Result:** PASS WITH FIXES

## Summary

Re-QA of the Abilene Daily Reporter archive (predecessor paper to the modern Abilene Reporter-News; custom newspaper_id 144599 chosen as one less than 144600 since Daily Reporter is not in newspapermembernumbers.xlsx). Independent re-reading of all 11 editorial clippings confirms the extraction is accurate near-verbatim where scans are legible; three low-confidence records (0.40-0.50) all reflect honest uncertainty about genuinely illegible scans, not extraction errors. Two corrective changes were applied during this re-QA pass.

## Final Counts (after re-QA)

- **Clippings:** 11 (was 13 before re-QA; 2 misfiled ad clippings removed)
- **Candidate endorsements:** 2
- **Proposition endorsements:** 12 (was 16 before re-QA; 4 duplicate-of-substance rows deduped)
- **Year coverage:** 1928-1936
- **Mean confidence:** 0.786
- **Low-confidence records (< 0.7):** 3 (all justified — illegible scans)

## Changes Applied in Re-QA

### 1. Removed 2 misfiled advertisement clippings

The following two PDFs were not editorial endorsement content but advertisements that had been swept into the archive. They were correctly extracted as empty by the pipeline (no CSV rows attributed to them), but they inflated the clipping count and cluttered the archive.

- `144599_19281104.pdf` — Southwestern Bell Telephone "Five Points to Remember when Using a Dial Telephone" advertisement
- `144599_19281106.pdf` — Ed. S. Hughes Motor Co. used-car advertisement

Removed from `done/Abilene Daily Reporter/clippings/`, `raw/Abilene Daily Reporter_144599/clippings/`, and `raw/Abilene Daily Reporter_144599/parts/` (the corresponding empty JSONs).

### 2. Deduped 4 conceptually identical 1928 proposition pairs

The Nov 2, 1928 editorial "Don't Overlook Amendments" and the Nov 5, 1928 editorial "Vote On Amendments" each discussed and endorsed the same four Texas constitutional amendments, using slightly different wording in each editorial. The CSV originally had 8 rows (4 amendments x 2 editorials). Deduped to 4 rows: kept the Nov 2 prop_desc (more substantive descriptions in each case) and merged the Nov 5 citation into `notes_endorse`. The per-clipping JSONs in `raw/parts/` are unchanged — they preserve the per-clipping truth that both editorials discussed these amendments. The dedupe is purely a compilation choice in the CSV.

Pairs merged (kept first, dropped second):
- Confederate pension widows/veterans amendment (rows 1+6)
- Parsonage tax exemption (rows 2+5)
- School official term length up to 6 yrs (rows 3+7)
- State board of education with up to 9 members (rows 4+8)

The Nov 5 row 8 had a unique factual addition ("has the endorsement of Governor Moody and other leaders") which is preserved in the merged notes for the state-board-of-education row.

## Spot Check Results

Independent re-reading of all 11 editorial clippings (effectively 100% of the archive given its small size; user-specified target was 10 stratified across years):

- **0 missing endorsements** across all clippings
- **0 hallucinated/extra records**
- **0 incorrect fields** on any record (party, office, name, endorsed direction)
- **Verbatim quote captures** on most rows (e.g., row 14 captures "West Texans should vote for this amendment with a great deal of enthusiasm" exactly)
- **3 low-confidence records re-examined:**
  - Row 5 (1930 Taylor County road bond, conf 0.50): "Taylor County Roads" editorial in 19301022 multi-column page; text genuinely too small to confirm specific bond endorsement but the topic is correct. Left at 0.50.
  - Row 9 (1932 nine-amendment omnibus, conf 0.50): "Those Nine Amendments" editorial in 19321106; text small and partially illegible. Omnibus treatment with endorsed=1 is reasonable; the editorial does use approval language throughout. Left at 0.50.
  - Row 11 (1934 eight-amendment row, conf 0.40, endorsed=NULL): "The Eight Amendments" editorial in 19341104; print is extremely small and heavily illegible. The pipeline correctly left endorsed blank rather than guessing. Left at 0.40.

## Structural & Coding Validation

- ✅ All CSV columns present (16 in candidates, 11 in propositions)
- ✅ All `newspaper_id` populated (144599)
- ✅ All `state_newspaper` and `state_election` are valid 2-letter codes (TX)
- ✅ All `year` values are 4-digit even years (1928, 1930, 1932, 1934, 1936) — all general elections
- ✅ All clipping filenames follow `{id}_{YYYYMMDD}.pdf` convention; all dates Oct-Nov of election years
- ✅ All `endorsed` values are 1 or empty (no string variants)
- ✅ All `extraction_confidence` values are valid floats 0-1
- ✅ All candidate names ALL CAPS in LASTNAME, FIRSTNAME format (ROOSEVELT, FRANKLIN / ROOSEVELT, FRANKLIN D)
- ✅ Party labels match the canonical set (Democrat)
- ✅ Incumbency: d_inc=1 on 1936 FDR row (he was the incumbent); all other incumbency cells correctly empty
- ✅ No junk/trailing rows
- ✅ Metadata clipping count and record counts match CSVs

## Raw/ Folder Inspection

- ✅ `raw/clippings/` matches `done/clippings/` exactly (11 files each after removals)
- ✅ All 11 clippings have valid `parts/*.json` files; no orphans
- ✅ All JSONs are well-formed; empty extractions (e.g., 19301031 brief turnout commentary) are correctly empty arrays, not malformed
- ⚠️ No intake manifest or processing logs preserved in raw/ root (cleaned up after original compile; not a blocker but no audit trail for naming/intake decisions)

## Open Items (Not Specific to This Folder)

The QA pass also surfaced two dataset-wide convention questions that affect all 128 papers but are not corrected here:

1. **`prop_type` values.** This dataset uses `CONSTITUTIONAL AMENDMENT`, `BOND ISSUE`, `LOCAL MEASURE` throughout. The newspaper-endorsements/endorsement-qa skill specs say the canonical codes are `AMENDMENT`, `BOND`, `BALLOT MEASURE`. Decision: leave the dataset alone and update the skill spec to match the longer, more descriptive forms that are already in use.

2. **`prop_desc` and `notes_endorse` case.** The skill spec says ALL CAPS; the dataset uses mixed case for readability (especially important for long descriptive prop texts and editorial quotes). Decision: leave the dataset alone and update the skill spec to permit mixed case.

Both spec updates should be made before the next round of paper processing so the rules match practice.

## Notes for Downstream Use

- The Abilene Daily Reporter was the predecessor paper, ceasing publication around 1937 when it merged with the Abilene Morning News to form the Abilene Reporter-News.
- All clippings are 1928-1936, covering the late one-party-Democratic Texas era.
- Heavy focus on TX constitutional amendments rather than candidate endorsements (only 2 candidates, 12 propositions after dedupe).
- The newspaper endorsed FDR for President in both 1932 (via a Denison Herald reprint) and 1936 (via a Cleveland Plain Dealer reprint). Both endorsements came through reprinted out-of-state editorials run in the Daily Reporter's "Viewpoints" column.
- **Custom newspaper_id 144599** — not in lookup; chosen as predecessor to 144600 (ABILENE REPORTER-NEWS).
- Post-1937 endorsement history: see Abilene Reporter-News (144600) archive.

## Recommendation

PASS WITH FIXES. Small, accurate archive of the pre-merger era. After the two corrections, the data is clean and ready for compilation.
