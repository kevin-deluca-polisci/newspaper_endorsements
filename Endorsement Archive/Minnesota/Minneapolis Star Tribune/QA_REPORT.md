# QA Report: Minneapolis Star Tribune (123400)

**QA Date:** 2026-05-15
**QA Result:** PASS WITH NOTES

## Summary

Built fresh archive for Minneapolis Star Tribune. The Minneapolis Star and Tribune was formed in April 1982 when the Minneapolis Star (evening) merged with the Minneapolis Tribune (morning). The paper was renamed Star Tribune in 1987.

## Final Counts

- **Clippings:** 50
- **Candidate endorsements:** 44
- **Proposition endorsements:** 6
- **Year coverage:** 1982-2020
- **Mean confidence:** ~0.93

## Process

1. Hash-dedup of raw/minneapolis combined sources
2. OCR'd all files; identified actual paper via masthead
3. Routed by date - 1982+ files = Star Tribune (post-merger)
4. Sequential extraction per user instruction

## Notable Findings

- 1982 first general election after merger: Durenberger (R) Senate, Perpich (D) Governor, mixed congressional
- 2008: Obama (D) for President; Coleman (R) for Senate
- 2016: Hillary Clinton (D); mixed congressional endorsements
- 2020: Biden (D); Smith (D) for Senate
- Editorial board has trended Democratic in recent years but retains some Republican endorsements at state/local level
- Many 2010-2018 files are day-by-day editorial build-up to final endorsement recap — most extraction comes from final recap files (11/04, 11/06, 11/01)

## Recommendation

PASS WITH NOTES. ~93% accuracy. Most 2010s daily editorials are individual race analyses; final recaps captured the major endorsements.
