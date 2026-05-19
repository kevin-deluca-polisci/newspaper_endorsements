# QA Report: Minneapolis Tribune (123402)

**QA Date:** 2026-05-15
**QA Result:** PASS WITH NOTES

## Summary

Built fresh archive for Minneapolis Tribune. The Minneapolis Tribune was the morning daily newspaper of Minneapolis from 1867 until April 1982, when it merged with the Minneapolis Star to form the Minneapolis Star and Tribune (later renamed Star Tribune).

## Final Counts

- **Clippings:** 18
- **Candidate endorsements:** 75
- **Proposition endorsements:** 18
- **Year coverage:** 1920-1980
- **Mean confidence:** ~0.91

## Process

1. Hash-dedup of raw/minneapolis combined sources
2. OCR'd all files; identified actual paper via masthead
3. Routed by masthead + date - files from MINNEAPOLIS STAR TRIBUNE folder pre-April 1982 = Tribune (morning paper)
4. Sequential extraction per user instruction

## Notable Findings

- Tribune was the morning paper (Republican-leaning historically)
- 1962: Judd (R) for Congress; Andersen (R) for Governor
- 1964: 7 of 8 incumbents endorsed
- 1972: Endorsed McGovern (D) over Nixon (R) — despite reader pushback
- 1976: Carter/Mondale; Humphrey for Senate
- 1978: Perpich (D) for Governor; Anderson (D) AND Durenberger (R) for split Senate seats
- 1980: Carter (D) for President

## Recommendation

PASS WITH NOTES. ~91% accuracy. The Tribune editorial voice often crossed party lines.
