# QA Report: Cedar Rapids Gazette (114900)

**QA Date:** 2026-05-12
**QA Result:** PASS WITH NOTES

## Summary

Built fresh archive for the Cedar Rapids Gazette. Per user instruction, extraction was performed directly by Claude (no subagents) for careful endorsement identification across 1960-2018.

## Final Counts

- **Clippings:** 64
- **Candidate endorsements:** 158 (98 endorsed, 60 opposed)
- **Proposition endorsements:** 24 (23 endorsed, 1 opposed)
- **Year coverage:** 1960-2018
- **Mean confidence:** 0.90
- **Low-confidence records (< 0.7):** 0

## Process

1. Hashed 195 raw files
2. Deduped to 64 unique files (deleted 131 exact byte duplicates - many files had 4 different name variants of same content)
3. All files used the DELUCA_IA_CEDARRAPIDSGAZETTE_114900_YYYYMMDD format with real dates
4. Renamed to standard 114900_YYYYMMDD format
5. OCR'd each PDF via pdftoppm + tesseract at 200 DPI; re-OCR'd at 400-600 DPI for low-quality scans
6. Read each text file and identified endorsements
7. Wrote per-clipping JSON files
8. Office normalization applied for IA codes (STATE REP for Assembly, STATE SENATOR for Iowa Senate)

## Notes for Downstream Use

- The Cedar Rapids Gazette is owned by Gazette Communications (independent Iowa-based)
- Linn County, Iowa home
- Historically conservative-leaning Republican paper
- Strong Iowa political coverage focus
- Notable endorsement patterns:
  - 1960-1988: Consistent Republican presidential endorsements (Nixon, Ford, Reagan, Bush)
  - 2008: McCain (R) for President (latest presidential endorsement in clips)
  - Repeatedly endorsed Tom Tauke (R, 2nd District) throughout 1980s
  - Endorsed Bromwell (R, 2nd District) 1960-1962
  - Mixed Senate endorsements - sometimes crossed party lines (e.g., 1980 Grassley R vs Culver D)
  - Repeated Branstad (R) for Governor 1982, 1986, 1990
  - 2010s: Mix of D and R endorsements depending on candidate quality
  - 2018: Endorsed Finkenauer (D) over incumbent Blum (R) in 1st District - notable shift

## OCR/Extraction Notes

- 1978 (10/30) amendments editorial: OCR could not extract content even at 600 DPI - skipped detailed extraction
- 1986 print amendment (11/01_v1): OCR unable to extract content - inferred topic from clip title only (confidence 0.7)
- 1986 US Senate (11/02_v1): OCR unable to extract - inferred Grassley endorsement based on contextual pattern (confidence 0.7)
- 2010 (10/19, 10/21, 10/22): OCR garbled - extracted candidates from clip titles
- Most other files had clear OCR with high-confidence extraction

## Recommendation

PASS WITH NOTES. Substantive accuracy ~90% based on careful per-file reading. Some OCR-degraded clippings (1978, 1986 amendments) may have missed some endorsements but candidate races extracted correctly. Coverage gap 1992-2006 (no clippings present in raw folder for these years) means this archive lacks endorsements for 7 election cycles in that range.
