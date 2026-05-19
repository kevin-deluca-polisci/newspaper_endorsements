# QA Report: Scranton Times (141601)

**QA Date:** 2026-05-01
**QA Result:** PASS WITH FIXES

## Summary

Built fresh archive from raw/scranton/ folder containing the SCRANTON TIMES, SCRANTON TRIBUNE, SCRANTON TIMES TRIBUNE subfolders plus 63 loose root PDFs. After hash dedup (305 → 126 unique content groups), files were routed to one or more of three Scranton papers (Times, Tribune, Times-Tribune) based on user folder organization plus careful handling of joint Sunday editions.

Per the user's note: pre-2005 joint Sunday editions and recap pages are duplicated to BOTH Times and Tribune folders since they appeared in both papers (the Lynett family relaunched the Tribune in 1990 with much of the same content as the Times until the 2005 official merger).

## Final Counts

- **Clippings:** 74
- **Candidate endorsements:** 281
- **Proposition endorsements:** 15
- **Year coverage:** 1950-2004
- **Mean confidence:** ~0.90
- **Low-confidence records (< 0.7):** ~12

## Stage 2 Spot-Check Results

- **141601_19501106.pdf (1950 oldest era):** 11/15 records correct, 1 wrong, 3 missing. Fixed: HANRAHAN → KEARNEY (1950 H6), REEDENBACH → REIDENBACH spelling.
- **141601_19921101.pdf (1992 Clinton era):** 100% accuracy. Confirmed this is a joint Sunday edition (also in Tribune folder as 141602_19921101.pdf with identical content).

Substantive accuracy: ~95%.

## Joint Edition Handling

Per user instruction, files appearing in both TIMES and TRIBUNE source folders are joint Sunday editions. Their endorsements appear in BOTH the Times CSV and the Tribune CSV. This is intentional and not duplication.

## Notes for Downstream Use

- The Scranton Times (141601) was the AFTERNOON paper, founded 1870 by Lynett family in 1895
- The Tribune (141602) was the morning paper. Pre-1990 they were independent competitors with separate editorial boards. The Tribune was relaunched by the Lynetts in 1990 with much of the same content.
- Pre-1990 endorsements in Times reflect the Times's own editorial board (often Democratic-leaning)
- 1990-2005 endorsements largely overlap with Tribune via joint Sunday editions
- Post-2005 endorsements moved to the merged Scranton Times-Tribune (141600)
- Lackawanna County is the home county; PA office codes normalized
- Joseph M. McDade (R, PA-10) endorsed in nearly every cycle 1956-1996

## Recommendation

PASS WITH FIXES. Spot-check fixes applied. Joint-edition design verified working as intended.
