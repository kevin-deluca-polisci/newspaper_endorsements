# QA Report: Corpus Christi Caller (145002)

**QA Date:** 2026-05-03
**QA Result:** PASS

## Summary

Built fresh archive from raw/corpus christi TX. Hashed 254 raw files; deleted 184 exact byte duplicates per user instruction. The Caller (morning paper) had no Caller-only content in the archive; all 36 records here are joint Saturday/Sunday "Caller-Times" editions duplicated to the Caller per user instruction.

## Final Counts

- **Clippings:** 36 (all joint Sat/Sun Caller-Times editions)
- **Candidate endorsements:** 67
- **Proposition endorsements:** 110
- **Year coverage:** 1952-1986
- **Mean confidence:** ~0.94
- **Low-confidence records (< 0.7):** 0

## Process

1. Hashed 254 raw files; 184 exact byte dupes deleted
2. 70 unique content groups; 1 file (1966 DELUCA) had no detectable masthead, defaulted to Caller-Times
3. Routing: 24 files Times-masthead → Times only; 45 files Caller-Times-masthead pre-1987-05 → all 3 papers (joint); CT-masthead post-1987-05 → Caller-Times only
4. Caller folder received 36 pre-1987 joint editions
5. Extracted via 2 parallel agent batches

## Notes for Downstream Use

- The Corpus Christi Caller was the morning paper, founded 1883
- 1929 consolidation with Times under Harte-Hanks; separate morning Caller and afternoon Times continued
- May 1987: paper switched to morning-only "Caller-Times"; the Caller as a separate paper effectively ended
- This archive only captures joint Sat/Sun editions (no morning Caller-only weekday content was present in the source)
- For Sat/Sun joint editions, content is identical to Times CSV for same dates
- Texas-specific offices: RAILROAD COMMISSION (3-member elected body), LAND COMMISSIONER, AGRICULTURE COMMISSIONER, COMPTROLLER
- TX has separate Supreme Court (civil) and Court of Criminal Appeals (criminal)
- Pre-1980s TX was Solid Democratic; transitioned Republican in 1980s+

## Recommendation

PASS. All 36 records are joint editions extracted with high confidence (mean 0.94).
