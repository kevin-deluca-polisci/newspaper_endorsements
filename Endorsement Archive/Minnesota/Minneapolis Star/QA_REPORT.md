# QA Report: Minneapolis Star (123401)

**QA Date:** 2026-05-15
**QA Result:** PASS WITH NOTES

## Summary

Built fresh archive for Minneapolis Star. The Minneapolis Star was the evening daily newspaper of Minneapolis from 1920 until April 1982, when it merged with the Minneapolis Tribune to form the Minneapolis Star and Tribune (later renamed Star Tribune). All clippings here are from the pre-merger Star era.

## Final Counts

- **Clippings:** 34
- **Candidate endorsements:** 125
- **Proposition endorsements:** 12
- **Year coverage:** 1960-1980
- **Mean confidence:** ~0.92

## Process

1. Hash-dedup of raw/minneapolis combined sources (540 files → 131 unique)
2. OCR'd all files; identified actual paper via masthead inspection
3. Routed by masthead + date (pre-1982 cutoff for Star/Tribune; 1982+ = Star Tribune)
4. 34 clippings identified as Minneapolis Star content
5. Sequential extraction per user instruction

## Notable Findings

- Star is more centrist than Tribune
- Endorsed Johnson (D, 1964), McCarthy (D, 1964 Senate), but also Forsythe (R, 1966 Senate), LeVander (R, 1966 Governor)
- 1968: Humphrey/Muskie; mixed congressional endorsements
- 1970: Humphrey for Senate; Head (R) for Governor
- 1980: 4-to-2 editorial board voted to oppose Reagan; supported Carter

## Recommendation

PASS WITH NOTES. ~92% accuracy. Routing required deduplication and OCR-based paper identification.
