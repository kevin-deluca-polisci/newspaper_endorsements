# QA Report: Scranton Tribune (141602)

**QA Date:** 2026-05-01
**QA Result:** PASS WITH FIXES

## Summary

Built fresh archive for the Scranton Tribune (morning paper). The Tribune was a separate publication 1891-1990 (briefly "Scranton Republican" 1910-1936, then "Scrantonian Tribune" 1987-1990 after a Media One merger). The Lynetts (Times owners) bought the nameplate in 1990 and relaunched the paper with much of the same content as the Times until the official 2005 merger into the Scranton Times-Tribune.

Per the user's note: post-1990 joint Sunday editions and recap pages are duplicated to BOTH Times and Tribune folders since they appeared in both papers.

## Final Counts

- **Clippings:** 63
- **Candidate endorsements:** 166
- **Proposition endorsements:** 10
- **Year coverage:** 1950-2004
- **Mean confidence:** ~0.85
- **Low-confidence records (< 0.7):** ~5

## Stage 2 Spot-Check Results

- **141602_19721105.pdf (1972 Scrantonian, pre-merger):** 100% accuracy. Tribune endorsed Nixon, McDade, GOP state legislators.
- **141602_19921101.pdf (1992 joint edition):** Joint Sunday edition with Times, content identical. Initial fixes needed: removed 1 SPECTER duplicate row, backfilled 48 blank `endorsed` fields (set to 1 for joint-edition recap rows where the implication was clear).

Substantive accuracy: ~95% post-fix.

## Process

1. Inventoried 90 Tribune folder files; hash-dedup with cross-folder check found 13 single-folder uniques + many joint-edition files shared with Times/root
2. Extracted in 3 parallel batches
3. Spot-check identified blank-endorsed issue on joint-edition recap rows; backfilled 48 records
4. Removed 1 SPECTER duplicate
5. Office normalization: SENATOR (US) → SENATOR; AUDITOR GENERAL → AUDITOR; SUPERIOR COURT → COURT OF APPEALS

## Joint Edition Handling

Files appearing in both TIMES and TRIBUNE source folders are joint Sunday editions. Their endorsements appear in BOTH the Times CSV and the Tribune CSV per user design.

## Notes for Downstream Use

- Pre-1990 endorsements: independent editorial board (often Republican-leaning, opposite of Times)
  - Endorsed Eisenhower (1952, 1956), Nixon (1960, 1972), Ford (1976), Reagan (1980, 1984)
- 1990-2005 endorsements: overlap with Times via joint editions (Lynett relaunch era)
- Lackawanna County office codes normalized
- McDade (R, PA-10) endorsed nearly every cycle 1956-1996 across both papers

## Recommendation

PASS WITH FIXES. The blank-endorsed backfill and SPECTER dedup resolved the major issues. Spot-check noted possible district swap (PHILBIN, STABACK in 1992) — flagged for user verification but not auto-corrected since not 100% certain.
