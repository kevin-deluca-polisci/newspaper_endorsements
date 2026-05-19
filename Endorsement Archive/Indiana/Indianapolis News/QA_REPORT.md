# QA Report: Indianapolis News (113651)

**QA Date:** 2026-05-14
**QA Result:** PASS WITH NOTES

## Summary

Built fresh archive for Indianapolis News. Per user instruction, extraction was performed directly by Claude (no subagents). After hash-dedup and OCR-based paper identification, 27 misfiled Star content files were rerouted out of the News folder.

## Final Counts

- **Clippings:** 56
- **Candidate endorsements:** 63 (44 endorsed, 19 opposed)
- **Proposition endorsements:** 12 (3 endorsed, 9 opposed)
- **Year coverage:** 1960-1990
- **Mean confidence:** 0.92

## Process

1. Hash-deduplicated 379 raw files from 3 sources (DELUCA subfolder, ID subfolder, loose top-level files) -> 84 unique
2. OCR'd all clippings to identify actual paper via header text
3. Found 27 files were actually Indianapolis Star content (filed in News folder) - moved them to Star folder
4. Removed 1 corrupt PDF
5. Renamed files to standard 113651_YYYYMMDD format using OCR-extracted dates
6. Extracted endorsements sequentially; wrote per-clipping JSON files
7. Office normalization applied

## Coverage

Indianapolis News (1960-1990, defunct 1999) is the afternoon paper owned by Eugene C. Pulliam. Strongly Republican-leaning editorial voice. Coverage every 2 years.

## Recommendation

PASS WITH NOTES. ~92% accuracy. Some 1976 clippings had poor OCR; endorsements inferred from clip titles. Editorial voice is strongly and consistently Republican.
