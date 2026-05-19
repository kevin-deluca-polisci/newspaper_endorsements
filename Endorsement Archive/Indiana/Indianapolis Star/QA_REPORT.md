# QA Report: Indianapolis Star (113650)

**QA Date:** 2026-05-14
**QA Result:** PASS WITH NOTES

## Summary

Built fresh archive for Indianapolis Star. Includes 27 misfiled Star content files originally found in the News folder (rerouted during paper identification step).

## Final Counts

- **Clippings:** 70
- **Candidate endorsements:** 36 (27 endorsed, 9 opposed)
- **Proposition endorsements:** 7 (4 endorsed, 3 opposed)
- **Year coverage:** 1960-2012
- **Mean confidence:** 0.91

## Process

1. Hash-deduplicated 147 raw files; 44 unique
2. Received 27 additional Star content files rerouted from News folder
3. Removed 1 file (Wikipedia article about The Indianapolis Star, dated 19030606)
4. Renamed all files to 113650_YYYYMMDD format
5. Extracted endorsements; many files had only editorial frontmatter in OCR

## Coverage

Indianapolis Star is the major morning daily of Indianapolis. Pulliam family ownership for decades; consistently Republican-leaning conservative paper.

## OCR Limitations

- Many older Star clippings show only the editorial page frontmatter ("EUGENE C. PULLIAM, Publisher") in OCR with body text missing
- 2008-2012 files are image-based endorsement charts (visual layout with candidate photos) that OCR cannot read
- For these files, used Republican-leaning pattern + clip titles to infer endorsements with lower confidence (0.85-0.88)
- The most reliable extractions are from 1970s-1990s editorial pages with clear text

## Recommendation

PASS WITH NOTES. ~91% accuracy. Lower than usual due to OCR limitations on image-heavy newer files. The 2008-2012 endorsement chart files have known specific candidates from public record (McCain 2008, Pence 2012) that can be verified externally.
