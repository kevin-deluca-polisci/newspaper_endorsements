# QA Report: Corpus Christi Caller-Times (145000)

**QA Date:** 2026-05-03
**QA Result:** PASS

## Summary

Built fresh archive for the Caller-Times. Includes pre-1987 joint Saturday/Sunday editions (36 files) and post-1987 morning-only consolidated paper (10 files). The Caller-Times paper officially formed via the 1929 Harte-Hanks merger of the Caller (1883) and Times (1917), but continued separate morning/afternoon editions until May 1987 when the paper switched to morning-only.

## Final Counts

- **Clippings:** 46 (36 pre-1987 Sat/Sun joint + 10 post-1987 morning-only)
- **Candidate endorsements:** 308
- **Proposition endorsements:** 135
- **Year coverage:** 1952-2018
- **Mean confidence:** ~0.93
- **Low-confidence records (< 0.7):** 0

## Process

1. Hashed 254 raw files; deleted 184 exact byte dupes
2. 70 unique content groups; masthead-routed via "Caller-Times" detection
3. CT folder received: 45 CT-masthead + 1 no-masthead defaulted to CT
4. Pre-1987 CT files (~36) ALSO duplicated to Caller and Times folders
5. Post-1987 CT files routed only to Caller-Times
6. Extracted via combined parallel agents (one batch with 33 + one batch with 10 + earlier batches)

## Notes for Downstream Use

- The Caller-Times has been the consolidated paper from 1929 onwards (Harte-Hanks merger)
- Pre-1987: Saturday/Sunday joint editions used the Caller-Times masthead
- May 1987: switched to morning-only as Caller-Times (the Caller and Times as separate papers ended)
- 1997 ownership transferred from Harte-Hanks to Scripps-Howard
- Heavy local Nueces County coverage (CCISD, Del Mar College, City Council, county offices)
- TX-specific offices: RAILROAD COMMISSION, LAND COMMISSIONER, AGRICULTURE COMMISSIONER, COMPTROLLER, TX SUPREME COURT (civil), COURT OF CRIMINAL APPEALS
- Pre-1987 endorsements: see also Caller (145002) and Times (145001) archives — joint edition content appears in all 3
- 2002 had detailed City of Corpus Christi propositions (baseball stadium, marina lease, strong mayor)
- Heavy modern (2016, 2018) coverage with 28-41 candidate endorsements per election

## Recommendation

PASS. High extraction confidence, comprehensive modern coverage.
