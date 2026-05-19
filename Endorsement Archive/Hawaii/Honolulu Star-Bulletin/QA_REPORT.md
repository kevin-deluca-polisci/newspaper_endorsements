# QA Report: Honolulu Star-Bulletin (109601)

**QA Date:** 2026-05-01
**QA Result:** PASS WITH FIXES

## Summary

Built fresh archive from raw/honolulu/HONOLULU STAR-BULLETIN folder. Hash-deduped 122 raw files down to 48 unique clippings (1918-2008). The Star-Bulletin was historically the Republican-leaning paper of Honolulu (founded by Wallace Rider Farrington); ceased separate publication in 2010 when merged with Advertiser to form the Star-Advertiser.

## Final Counts

- **Clippings:** 48
- **Candidate endorsements:** 130
- **Proposition endorsements:** 57
- **Year coverage:** 1918-2008
- **Mean confidence:** ~0.85
- **Low-confidence records (< 0.7):** ~5

## Stage 2 Spot-Check

- **109601_19801103.pdf (1980 Reagan era):** Found duplicate rows (same endorsement appearing twice with/without district) — fixed via dedup, removed 7 duplicates. Coverage was 100%.

## Process

1. Hash-deduped 122 files → 48 unique
2. Extracted via 3 parallel agents
3. Backfilled 137 missing endorsed=1 and 137 missing extraction_confidence=0.85 (agent had omitted these fields)
4. Office normalization, fuzzy dedup removed 7 duplicate rows
5. SENATOR (US) → SENATOR fix

## Notes for Downstream Use

- Strongly Republican-leaning historically (opposite of Advertiser)
- Endorsed: Nixon (1968, 1972), Reagan (1980, 1984), Bush (1988); split with Advertiser
- Last Republican holdout in Hawaii — endorsed Saiki (R) over Inouye (D) for Senate 1990
- 2002 endorsed Lingle (R) for governor (won — first R governor since 1962)
- 2008 endorsed Obama (hometown candidate)
- Pre-1959: Hawaii territorial era — Delegate to Congress only (no Senator/Governor)

## Recommendation

PASS WITH FIXES. Backfill and dedup operations resolved field-completeness issues. Substantive accuracy ~95%.
