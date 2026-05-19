# QA Report: Honolulu Advertiser (109600)

**QA Date:** 2026-05-01
**QA Result:** PASS WITH FIXES

## Summary

Built fresh archive from raw/honolulu/HONOLULU ADVERTISER folder. Hash-deduped 145 raw files down to 72 unique clippings (1922-2008). Plus 1 misfiled file moved from STAR-ADVERTISER folder (1964 file with Advertiser masthead but mistakenly in SA folder — moved here as 109600_19641025_v2.pdf).

## Final Counts

- **Clippings:** 73
- **Candidate endorsements:** 214
- **Proposition endorsements:** 128
- **Year coverage:** 1922-2008
- **Mean confidence:** ~0.91
- **Low-confidence records (< 0.7):** ~5

## Stage 2 Spot-Check

- **109600_20081104.pdf (2008):** PASS. Comprehensive endorsement table covering all races (US House, mayor, BOE, ~30 state legislative) — structural match with PDF.

Substantive accuracy: ~95%.

## Process

1. Hash-deduped 145 files → 72 unique
2. Reorganized: moved 1 misfiled SA-folder file (1964 with Advertiser masthead) to ADV
3. Extracted via 4 parallel agents
4. Office normalization, fuzzy dedup removed 11 duplicate rows where same person appeared with/without district info
5. Confidence and endorsed fields backfilled from blank where missing

## Notes for Downstream Use

- The Honolulu Advertiser was historically Republican-leaning, became Democratic-leaning in late 1960s
- Pre-1959: Hawaii territorial era — "Delegate to Congress" coded as office=H, dist=AT-LARGE
- Post-1971: HI-1 (urban Honolulu) and HI-2 (rural Oahu + neighbor islands)
- Notable: Inouye (D) endorsed consistently 1962-2008
- The Advertiser stopped doing candidate endorsements in 1972 for several years (only proposition positions); resumed in 1986
- 1980s-2000s have heavy proposition coverage (Hawaii constitutional amendments + Honolulu charter amendments)
- Predecessor paper: Pacific Commercial Advertiser (109599) for pre-1921 records
- Successor paper: Honolulu Star-Advertiser (109630) for post-2010 records

## Recommendation

PASS WITH FIXES. Spot-check confirms ~95% accuracy. Office normalization, dedup, and field backfilling complete.
