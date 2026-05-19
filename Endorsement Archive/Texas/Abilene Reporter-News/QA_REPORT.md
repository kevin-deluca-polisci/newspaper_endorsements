# QA Report: Abilene Reporter-News (144600)

**QA Date:** 2026-05-04
**QA Result:** PASS WITH FIXES

## Summary

Built fresh archive for the Abilene Reporter-News, the modern paper formed circa 1937 when the Abilene Daily Reporter merged with the Abilene Morning News. Owned by Harte-Hanks (founders Houston Harte and Bernard Hanks were also founders of Harte-Hanks Communications and the broader media group).

## Final Counts

- **Clippings:** 50
- **Candidate endorsements:** 239
- **Proposition endorsements:** 79
- **Year coverage:** 1952-2018
- **Mean confidence:** ~0.93
- **Low-confidence records (< 0.7):** ~4

## Process

1. Hashed 132 raw files; deleted 68 exact byte duplicates per user instruction
2. 63 unique content files; clean separation: 13 DR (1928-1936) + 50 RN (1952-2018)
3. Extracted in 2 agent passes; one retry needed for the final 8 files due to 32MB limit on first dispatch
4. TX-specific office normalization applied

## Notes for Downstream Use

- The Abilene Reporter-News is the modern Taylor County (Abilene) paper
- TX-specific elected offices: RAILROAD COMMISSION (3-member), LAND COMMISSIONER, AGRICULTURE COMMISSIONER, COMPTROLLER, TX SUPREME COURT (civil), COURT OF CRIMINAL APPEALS (criminal)
- 1996 had two clippings (Nov 1 preview + Nov 5 Election Day full list)
- 2002 included a constitutional amendment endorsement (constable office local control)
- 2016 the paper did NOT endorse for President; stuck to area races
- 2018 the paper explicitly stated it doesn't endorse candidates in statewide races
- Pre-1980s TX was Solid Democratic; transitioned Republican 1980s+
- Pre-1937 endorsement history: see Abilene Daily Reporter (144599) archive

## Recommendation

PASS WITH FIXES. High extraction confidence on candidate records.
