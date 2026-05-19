# QA Report: Pittsburgh Post-Gazette (141250) — Re-QA

**QA Date:** 2026-05-01
**QA Result:** PASS WITH FIXES (V2)

## Summary

Augmented archive with 36 new clippings from raw/more pittsburgh, plus 9 misfiled clippings discovered in the Pittsburgh Press folder that were actually Post-Gazette content (verified by masthead inspection). One Scranton Tribune file was also identified and removed from the PG archive.

## Final Counts

- **Clippings:** 58 (was 14)
- **Candidate endorsements:** 691 (was 108)
- **Proposition endorsements:** 29 (was 2)
- **Year coverage:** 1940-2022
- **Mean confidence:** ~0.87
- **Low-confidence records (< 0.7):** ~10

## Process

1. Hash-deduped 130 PG-folder files in raw/more pittsburgh against existing 14 → 36 new unique
2. Extracted via parallel agent → 36 parts JSONs
3. Spot-check revealed 9 misfiled Press files were actually PG content; moved them to PG with renamed files (collision-aware versioning)
4. Removed 1 Scranton Tribune file (141250_19781101.pdf) that was incorrectly attributed to PG
5. Reset CSVs to original 108 records, then re-merged with corrected attribution
6. Applied office normalization (SUPERIOR COURT → COURT OF APPEALS, AUDITOR GENERAL → AUDITOR, etc.)
7. Aggressive fuzzy dedup pass removed 42 spelling-variant duplicates

## Stage 2 Spot-Check Results

- **141250_19601107.pdf (1960):** Heavy duplication detected initially, resolved by fuzzy dedup. Final: ~98% accuracy.
- **141250_20081102.pdf (2008):** 25/25 records correct, ballot question correctly captured.
- **Misfiled file 141250_19681104_v3.pdf (originally 400071_19681104.pdf):** Confirmed PG content per masthead, properly moved.

Substantive accuracy: ~95%.

## Notes for Downstream Use

- The PG endorsement record now spans 8 decades, capturing Eisenhower-era moderate-Republican origins, the 1960s-1990s Democratic shift, and the recent rightward turn (Toomey 2016, Wagner 2018, Oz 2022)
- Office normalization: PA-specific Superior Court and Commonwealth Court mapped to COURT OF APPEALS; AUDITOR GENERAL to AUDITOR; Common Pleas to JUDGE
- Some 1968 content appears in both 141250_19681104.pdf (canonical) and v2/v3 versions (alternate clippings of the same election day)
