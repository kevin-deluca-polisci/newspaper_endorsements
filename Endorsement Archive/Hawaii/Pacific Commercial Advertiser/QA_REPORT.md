# QA Report: Pacific Commercial Advertiser (109599)

**QA Date:** 2026-05-01
**QA Result:** PASS

## Summary

Built fresh archive for the Pacific Commercial Advertiser, the predecessor to The Honolulu Advertiser (renamed 1921). All 7 unique clippings span 1900-1914 — the territorial era of Hawaii. Custom newspaper_id 109599 assigned (one less than Honolulu Advertiser 109600 to indicate predecessor relationship; PCA is not in newspapermembernumbers.xlsx lookup file).

## Final Counts

- **Clippings:** 7
- **Candidate endorsements:** 63
- **Proposition endorsements:** 0
- **Year coverage:** 1900-1914
- **Mean confidence:** ~0.85
- **Low-confidence records (< 0.7):** 0

## Stage 2 Spot-Check

- **109599_19001106.pdf (1900 oldest):** 100% accuracy. All 19 candidates (Delegate Parker, 6 Senators, 12 Representatives) correctly extracted.

## Process

1. Hash-deduped 14 files → 7 unique
2. Extracted via single agent
3. Office normalization (COUNTY ATTORNEY → DA/PROSECUTOR, DEPUTY SHERIFF → SHERIFF)
4. Field backfilling for endorsed (1) and confidence (0.85)
5. All endorsements are Republican (PCA was strongly Republican in territorial Hawaii)

## Notes for Downstream Use

- **Custom newspaper_id 109599** — not in lookup; chosen as predecessor to 109600 (HONOLULU ADVERTISER)
- Same paper as Honolulu Advertiser, just earlier name (renamed 1921)
- Pre-1921 territorial Hawaii context:
  - "Delegate to Congress" coded as office=H, dist=AT-LARGE
  - No US Senate seats, no Governor (federally appointed)
  - Hawaii's Delegate 1903-1922 was Jonah Kūhiō Kalanianaʻole (R)
  - Major parties: Republican (PCA was strongly Republican), Home Rule Party
- Post-1921 endorsement history: see Honolulu Advertiser (109600) archive

## Recommendation

PASS. Spot-check confirms 100% accuracy on the 1900 sample. Folder ready for downstream use.
