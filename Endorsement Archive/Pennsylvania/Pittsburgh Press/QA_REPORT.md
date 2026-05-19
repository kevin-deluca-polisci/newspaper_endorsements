# QA Report: Pittsburgh Press (400071) — Re-QA

**QA Date:** 2026-05-01
**QA Result:** PASS WITH FIXES (V2)

## Summary

Augmented archive with 19 truly new Press clippings from raw/more pittsburgh, after identifying that 9 of the originally-routed 28 files were actually Pittsburgh Post-Gazette content (verified by masthead inspection). The misfiled 9 were moved to PG with corrected attribution.

## Final Counts

- **Clippings:** 51 (was 32)
- **Candidate endorsements:** 220 (was 112)
- **Proposition endorsements:** 6 (was 1)
- **Year coverage:** 1940-1972
- **Mean confidence:** ~0.86
- **Low-confidence records (< 0.7):** ~5

## Process

1. Hash-deduped 176 Press-folder files in raw/more pittsburgh against existing 32 → 28 candidates
2. Extracted via parallel agent → 28 parts JSONs
3. Masthead scan identified 9 of the 28 as actually-PG content (filed with 400071_ prefix but Post-Gazette masthead). These had headers like "Pittsburgh Post-Gazette · DATE" rather than "The Pittsburgh Press · DATE"
4. Moved misfiled 9 to PG; kept 19 truly-Press files
5. Reset CSV to original 112 records, then re-merged corrected
6. Applied office normalization
7. Aggressive fuzzy dedup pass removed 21 spelling-variant duplicates

## Stage 2 Spot-Check Results

- **400071_19641102.pdf (1964):** State legislature endorsement clipping — 25+/25 records correct after dedup.
- **Misfiled 400071_19681104.pdf:** Identified and moved to PG (was the file that originally triggered investigation).

## Notes for Downstream Use

- The Pittsburgh Press ceased publication in 1992 after a labor dispute
- This archive captures its endorsements only through 1974 (last clipping date) — earlier raw archive sources may exist for 1976-1992 era
- Cross-paper distinction: Press generally backed Democrats more often than PG in mid-century; both papers diverged in 1972 (Press endorsed Nixon, PG eventually endorsed McGovern in some clippings)
- Office normalization applied as for PG
