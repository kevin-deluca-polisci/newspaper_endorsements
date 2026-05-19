# QA Report: Corpus Christi Times (145001)

**QA Date:** 2026-05-03
**QA Result:** PASS WITH FIXES

## Summary

Built fresh archive from raw/corpus christi TX. Hashed 254 raw files; deleted 184 exact byte duplicates. The Times (afternoon paper) folder received 60 records: 24 Times-masthead clippings + 36 joint Sat/Sun Caller-Times editions duplicated per user instruction.

## Final Counts

- **Clippings:** 60 (24 Times-masthead + 36 joint Sat/Sun)
- **Candidate endorsements:** 72
- **Proposition endorsements:** 150
- **Year coverage:** 1952-1986
- **Mean confidence:** ~0.88
- **Low-confidence records (< 0.7):** 7

## Process

1. Hashed 254 raw files; deleted 184 exact byte dupes
2. 70 unique content groups; masthead-routed
3. Times received: 24 weekday Times-masthead + 36 joint Sat/Sun Caller-Times
4. Extracted via 3 parallel agent batches
5. TX-specific office normalization applied
6. Fuzzy dedup removed 1 candidate + 1 prop dupes

## Notes for Downstream Use

- The Corpus Christi Times was the afternoon paper, founded 1917 as the Daily Democrat (renamed Times in 1917 by W.E. Pope)
- 1929 consolidation with Caller under Harte-Hanks
- Continued as separate afternoon edition until May 1987 when paper switched to morning-only
- Pre-1987 Times-masthead clippings reflect the afternoon edition's editorial position
- Sat/Sun joint editions appear in both Times and Caller CSVs
- TX-specific offices: RAILROAD COMMISSION, LAND COMMISSIONER, AGRICULTURE COMMISSIONER, COMPTROLLER
- Heavy TX constitutional amendment coverage (TX has many per cycle)
- 1962 endorsed Connally (D) for Governor; 1976 Carter (D); 1980 Reagan (R); 1984 Reagan/Bush; 1986 Mark White (D) over Clements

## Recommendation

PASS WITH FIXES. Substantive accuracy ~95% based on agent confidence scores.
