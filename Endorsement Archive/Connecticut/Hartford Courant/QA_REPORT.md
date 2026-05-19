# QA Report: Hartford Courant (106450)

**QA Date:** 2026-05-19
**QA Result:** PASS WITH NOTES

## Summary

Built fresh archive for Hartford Courant. Connecticut's oldest newspaper (est. 1764),
the Hartford Courant has a long Republican-leaning editorial tradition. This
batch covers 1960-1974 with heavy emphasis on Hartford-area ballot questions
(bonds, redevelopment, state constitutional amendments) alongside major
candidate endorsements.

## Final Counts

- **Clippings:** 24
- **Candidate endorsements:** 13 (endorsed 13)
- **Proposition endorsements:** 45 (endorsed 45)
- **Year coverage:** 1960-1974
- **Mean confidence:** ~0.95

## Process

1. Hash-dedup of 99 raw PDFs across multiple naming conventions
2. Routed by filename prefix (all hashed identical to Hartford Courant content)
3. Verified the 2 "106500_" Hartford Times-prefixed files were actually Courant
   content via OCR masthead inspection
4. OCR'd all 24 unique clippings via tesseract @ 300 DPI
5. Filled in real dates for placeholder MMDD-named files via OCR header dates
6. Sequential endorsement extraction per user instruction (no subagents)

## Notable Findings

- 1960: Nixon-Lodge (R) for President; Brennan (R) for House
- 1962: Alsop (R) for Governor; Seely-Brown (R) for Senate; mostly Republican
- 1964: Lodge (R) for Senate over Dodd (D-incumbent); Courant skipped presidential
        endorsement that year (Johnson vs. Goldwater unresolved in clippings)
- 1968: Nixon for President; 10 Hartford bond questions all endorsed YES
- 1970: Meskill (R) Governor, Weicker (R) Senate, Uccello (R) House (first GOP
        governor since 1955)
- Heavy ballot-question coverage; Courant routinely endorsed YES on Hartford
        bond/redevelopment issues

## Recommendation

PASS WITH NOTES. 95% mean confidence. The 1968 build-up editorials
were consolidated to avoid double-counting the same Q1-Q10 bond slate across 8
daily editorials. The 1974 partial clipping covers only the state ERA-style
amendment.
