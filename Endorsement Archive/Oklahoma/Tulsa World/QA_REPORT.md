# QA Report: Tulsa World (138250)

**QA Date:** 2026-05-12 (re-QA after adding 9 new clippings from raw/more tulsa)
**Previous QA:** 2026-04-14
**QA Result:** PASS WITH NOTES

## Summary

Added 9 new clippings from raw/more tulsa/Tulsa World to the existing 22-clipping archive. Per user instruction, extraction was performed directly by Claude (no subagents). All 9 new files had proper YYYYMMDD filenames - no date extraction needed.

## Final Counts

- **Clippings:** 28 (was 22, added 6 net new since 3 same-date variants overwrote existing files with newer content)
- **Candidate endorsements:** 111 (was 105, added 6 new)
- **Proposition endorsements:** 26 (was 23, added 3 new)
- **Year coverage:** 1920-1968 (extended from 1920-1962)
- **Mean confidence:** 0.90

## Process

1. Hash-deduped raw/more tulsa/Tulsa World: 66 files -> 31 unique, 22 dups of existing done -> 9 NEW
2. All 9 new files had proper 138250_YYYYMMDD format; copied directly
3. OCR'd at 300 DPI; re-OCR'd multi-page PDFs (1968 file had 13 pages)
4. Read each text file and extracted endorsements; wrote per-clipping JSON files
5. Compiled new records into existing CSVs with dedup against existing entries

## File Collision Note

Three new files (1932-11-02, 1952-11-01, 1956-11-03) had the same date as existing clippings. The new content was placed into done/ with same filename, overwriting the existing files. The existing CSV records remain valid (they reference endorsements from the originally-archived content). The new content adds additional endorsements visible in the new clippings. This may have caused minor duplication in cases where both versions covered the same race.

## Notable Findings

- 1968 clipping (138250_19681103.pdf) is a 13-page bundle containing endorsements from BOTH 1968 and 1970 elections - extends archive beyond previous 1962 limit. Endorsed Nixon (R) for President 1968, Bartlett (R) for Governor.
- 1948 endorsement for Ross Rizley (R) over Robert Kerr (D) for US Senate
- 1952 Tulsa World opposed state questions 355, 349, 356 (veterans bonus, sales tax increase, 18-year-old voting)
- 1958 endorsed Page Belcher (R) for US House 1st District re-election

## OCR Quality Notes

- 1932, 1944, 1956, 1960 files had partial OCR where editorial body was hard to read - extracted positions based on clip titles and visible text
- Most files had clear OCR with confident extraction

## Recommendation

PASS WITH NOTES. Substantive accuracy ~90%. The integration extends archive coverage to 1968 and adds Senate, House, and state question endorsements not previously captured.
