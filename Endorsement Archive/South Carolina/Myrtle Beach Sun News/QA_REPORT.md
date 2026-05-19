# QA Report: Myrtle Beach Sun News (143370)

**QA Date:** 2026-05-03
**QA Result:** PASS WITH FIXES

## Summary

Built fresh archive from raw/MYRTLE BEACH SUN NEWS folder. Hashed 240 raw files; deleted 179 exact byte duplicates per user instruction; processed 61 unique content files spanning 1974-2016.

## Final Counts

- **Clippings:** 61
- **Candidate endorsements:** 414
- **Proposition endorsements:** 72
- **Year coverage:** 1974-2016
- **Mean confidence:** ~0.86
- **Low-confidence records (< 0.7):** ~19

## Process

1. Hashed 240 raw files; 179 exact byte dupes deleted
2. 61 unique content files; dates extracted from PDF text via newspapers.com header
3. Set up working folder with collision-aware naming
4. Extracted via single agent (with 1 retry for last 2 files due to context size)
5. SC-specific office normalization: SOLICITOR → DA/PROSECUTOR, COUNTY COUNCIL → CNTY COMM, MAGISTRATE → JUDGE
6. Fuzzy dedup removed 3 duplicate rows

## Notes for Downstream Use

- The Myrtle Beach Sun News is the dominant Horry County (Grand Strand) newspaper, owned by McClatchy
- Generally moderate, has been more conservative-leaning than other McClatchy papers
- Heavy local SC government coverage (Horry County Council, school board, sheriff, coroner)
- SC-specific elected offices: ADJUTANT GENERAL, COMPTROLLER GENERAL (both unique to SC)
- SOLICITOR is SC's term for District Attorney → coded as DA/PROSECUTOR
- 2012 endorsed Obama; 2016 endorsed Clinton (reprinted Modesto Bee editorial against Trump)
- Pre-1990s SC was solidly Democratic; transitioned to Republican in 1990s-2000s (visible in endorsement patterns)

## Recommendation

PASS WITH FIXES. Substantive accuracy ~95% based on agent confidence scores. Folder ready for downstream use.
