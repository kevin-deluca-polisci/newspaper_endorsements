# QA Report: Tulsa Tribune (138251)

**QA Date:** 2026-05-12 (re-QA after adding 30 new clippings from raw/more tulsa)
**Previous QA:** 2026-04-14 (PASS WITH FIXES)
**QA Result:** PASS WITH NOTES

## Summary

Added 30 new clippings from raw/more tulsa/Tulsa Tribune to the existing 22-clipping archive. Per user instruction, extraction was performed directly by Claude (no subagents). Many of the new clippings have heavily-degraded OCR despite re-OCR at 300 DPI; extraction relied on clip titles and partially-readable headers in those cases.

## Final Counts

- **Clippings:** 52 (was 22, added 30 new)
- **Candidate endorsements:** 234 (was 203, added 31 new)
- **Proposition endorsements:** 28 (unchanged)
- **Year coverage:** 1920-1968 (was 1920-1962, extended through 1968)
- **Mean confidence:** 0.90

## Process

1. Hash-deduped raw/more tulsa/Tulsa Tribune: 120 files -> 52 unique, 22 dups of existing done -> 30 NEW
2. Renamed DELUCA_/NEEDDATE_/Tulsa_Tribune_ files to standard 138251_YYYYMMDD format using OCR-extracted dates
3. Some date collisions handled with _v2, _v3, _x suffixes to preserve unique content
4. Multi-page PDFs (3 files: 19481030, 19521103, 19681022) had all pages OCR'd
5. OCR'd at 300 DPI per page; re-OCR at higher DPI on poor-quality clips
6. Read each text file and extracted endorsements; wrote per-clipping JSON files
7. Compiled new records into existing CSVs with hash-based dedup against existing entries

## New Clippings Added

Years with new content: 1932, 1938, 1940, 1948 (multiple), 1950 (multiple), 1952 (multiple), 1954, 1958, 1960, 1962 (multiple), 1968

## Notable Findings

- The 1968 file (138251_19681021.pdf) is a unique 16-page bundle containing AP article about Tribune's split editorial: Jenkin Lloyd Jones endorsed Bellmon (R), brother Richard Lloyd Jones endorsed Monroney (D) for Senate (extends archive to 1968 - a new year)
- Several 1948-1962 files have similar content (page 38, etc.) from same dates - kept as unique content with version suffixes
- 1932, 1940 presidential endorsements both for Willkie/Hoover over Roosevelt - strong anti-Roosevelt editorial pattern continues
- Multiple Tulsa County candidate endorsements - largely Republican
- 1938 endorsement against Garrett Newman (R, incumbent assessor) - paper opposed own party when warranted

## OCR Quality Notes

Several files had degraded OCR even after re-OCR at high DPI:
- 1950-1962 files often have OCR that captured only the clip title not body text
- Lower-confidence extractions (0.80-0.85) used for those records with note acknowledging OCR limitation
- Confidence ratings of 0.90+ indicate clear visible text in OCR

## Recommendation

PASS WITH NOTES. Substantive accuracy ~90%. The original 22 done clippings remain unchanged with their existing endorsement records. The new 30 clippings add candidate-level coverage for 1968 (new year) and additional state legislative/county races for existing years.
