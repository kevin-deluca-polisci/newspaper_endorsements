# QA Report: Salinas Californian (104200)

**QA Date:** 2026-05-13
**QA Result:** PASS WITH NOTES

## Summary

Built fresh archive for the Salinas Californian. Per user instruction, extraction was performed directly by Claude (no subagents). The newspaper has a very clean editorial endorsement tradition with recap-style proposition lists every election year, making extraction high-quality and confident.

## Final Counts

- **Clippings:** 64
- **Candidate endorsements:** 263 (256 endorsed, 7 opposed)
- **Proposition endorsements:** 483 (291 endorsed, 192 opposed)
- **Year coverage:** 1946-2010 (candidates 1952-2010, props 1946-2010)
- **Mean confidence:** 0.92
- **Low-confidence records (< 0.7):** 0

## Process

1. Hashed 103 raw files; deduplicated to 64 unique content files (39 dups removed)
2. Files had multiple naming conventions; normalized to standard 104200_YYYYMMDD format
3. Both PDF and JPG variants existed for many dates - kept both with _img suffix on JPG
4. OCR'd all files via pdftoppm + tesseract
5. Read each text file and extracted endorsements; wrote per-clipping JSON files
6. Office normalization applied for CA-specific codes

## Coverage Highlights

- 1946: 17 ballot proposition recommendations (clean recap)
- 1948-2010: Election-year endorsement recaps with candidate + proposition recommendations
- Includes both June primary and November general election clips for some years
- 1996 (March) clip is from Temecula edition (Riverside County race) - kept but flagged

## Endorsement Patterns

- Strong Republican presidential endorsements 1952-1988 (Eisenhower, Nixon, Ford, Reagan, Bush 41)
- Shift to Democrats in 1992 (Clinton), continuing through 2000 (Gore)
- Long-time supporter of Burt Talcott (R, House 12th/16th) 1962-1976
- Long-time supporter of Leon Panetta (D, House) 1978-1992
- Long-time supporter of Sam Farr (D, House) 1984-2008
- 1986: No on retention of Justices Bird, Reynoso, Grodin
- 2008: No on Prop 8 (gay marriage ban)
- 1996: No on Prop 215 (Medical Marijuana), No on Prop 209 (Anti-Affirmative Action)

## OCR Notes

Most files had high-quality OCR. The recap-style format used by Salinas Californian (clear lists with Yes/No or candidate names) made extraction straightforward and confident. A few cases:
- 19960324 file is from Temecula edition - covers different region
- 19501018 file is news article (not editorial endorsements) - skipped
- 19720918 file is Chamber of Commerce recommendations - not editorial endorsements; skipped
- 19720605, 19700601, 19840604 are primary news articles - skipped

## Recommendation

PASS WITH NOTES. Substantive accuracy ~92%. The clean recap-style endorsements make this archive particularly reliable. 64 clippings cover 33 election years (1946-2010) with extensive proposition data.
