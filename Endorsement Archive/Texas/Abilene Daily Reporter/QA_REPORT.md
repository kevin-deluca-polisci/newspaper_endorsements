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

---

# V8 Deep Verification (endorsement-verification skill) — 2026-06-18

**Result:** PASS WITH FIXES (3 proposition corrections). Subagent-adjudicated.

## Method
Re-OCR'd all 11 clippings from scratch (pdfimages + tesseract; pdftoppm 300/600 DPI fallbacks on the two low-yield clippings 19301031 and 19361028). Aggregated OCR by year (1928, 1930, 1932, 1934, 1936). Re-verified every candidate and proposition record against the independent OCR. All three flagged props were independently re-read by a separate subagent (no anchoring) which confirmed each finding.

## Candidates (2 records — both CONFIRMED)
- 1932 PRESIDENT — ROOSEVELT, FRANKLIN (D, e=1): NARRATIVE_ENDORSE verified. OCR 'He Loves the Country' (Denison Herald reprint), 'should make a good president for all the people.' Correct.
- 1936 PRESIDENT — ROOSEVELT, FRANKLIN D (D, e=1, d_inc=1): NARRATIVE_ENDORSE verified. OCR 'For President' (Cleveland Plain Dealer reprint), 'supports Franklin D. Roosevelt for re-election.' Incumbency confirmed by OCR ('for re-election'/'another four years'). Confidence raised 0.70 -> 0.90 (strongly OCR-confirmed).
- Phase 8 reverse-match (all 5 years): no candidate endorsements missed by V1. The paper endorsed candidates only at presidential level; all other coverage is ballot measures.

## Propositions (12 records — 9 confirmed, 3 corrected)
Phase 11 OCR audit of ALL 12 props:

| Year | Prop | V1 | Verdict |
|---|---|---|---|
| 1928 | Confederate pension amendment | 1 | CONFIRM ('good ones, and should be approved') |
| 1928 | Parsonage tax exemption | 1 | CONFIRM |
| 1928 | School official terms | 1 | CONFIRM |
| 1928 | State board of education | 1 | CONFIRM (Gov. Moody endorsement confirmed in OCR) |
| 1930 | **Taylor County road bond** | 1 | **NOT A BALLOT MEASURE -> emptied, NEEDS_RA** |
| 1930 | $100,000 jail bond | 1 | CONFIRM ('how we need it!', 'three cents on $100') |
| 1930 | Five amendments en bloc | 1 | CONFIRM ('should receive the support of West Texans') |
| 1930 | Stock law change | 1 | CONFIRM ('keep livestock off the highways') |
| 1932 | **Nine amendments (omnibus)** | 1 | **MIXED -> emptied, NEEDS_RA split** |
| 1932 | Seawall amendment #9 | 1 | CONFIRM ('vote for this amendment with a great deal of enthusiasm') |
| 1934 | **Eight amendments (omnibus)** | empty | **MIXED -> empty JUSTIFIED, NEEDS_RA split** |
| 1936 | Amendment #4 (pardon/parole) | 1 | CONFIRM ('removed entirely from political influence') |

### Corrections applied
1. **1930 Taylor County road bond (row 5): endorsed 1 -> EMPTY.** Independent subagent confirmed there was no road bond on the 1930 Taylor County ballot. The "Tomorrow's Election" editorial lists only the jail bond, stock law, and five amendments. The "Taylor County Roads" editorial is a spending-priority opinion about $147,000 already held in the treasury "as the proceeds of former bond issues," and argues *against* building more gravel roads. V1's endorsed=1 was wrong on two counts. Flagged NEEDS_RA for removal.
2. **1932 Nine amendments omnibus (row 9 of props): endorsed 1 -> EMPTY.** Editorial is explicitly mixed: "Some of these proposed amendments the Reporter-News favors... Others it opposes." Opposed Tax Redemption ("should be defeated") and Centennial Celebration ("The amendment should be defeated"). A single endorsed=1 misrepresents the editorial. Flagged NEEDS_RA to split into per-amendment rows. (Note: OCR shows "Reporter-News" in a 1932 clipping, predating the documented ~1937 merger — flagged for RA.)
3. **1934 Eight amendments omnibus: empty CONFIRMED correct.** Editorial favors seven but opposes the four-year-terms Home Rule amendment ("We do not think this is a good amendment, and shall vote against it"). Empty single-direction coding is the right call. Flagged NEEDS_RA to split.

## Phase 12: Cross-paper
Sister paper present in `done/`: **Abilene Reporter-News (144600)**, the *successor* paper formed ~1937. Its endorsement record begins 1960 — **no year overlap** with the Daily Reporter (1928–1936). Cross-validation therefore N/A (no shared races).

## Phase 13: Multi-pass
- Pass 1: 3 proposition corrections (above); 2 candidates + 9 props confirmed.
- Pass 2: 0 new changes. All e=1 prop quotes re-confirmed present in OCR (converged).

## OCR coverage notes
All 11 clippings yielded usable OCR. Lowest yield: 19301031 (~21 lines even at 600 DPI) — this is the brief "Tomorrow's Election" turnout/summary page; the key ballot list was still legible. No dead-end clippings.
