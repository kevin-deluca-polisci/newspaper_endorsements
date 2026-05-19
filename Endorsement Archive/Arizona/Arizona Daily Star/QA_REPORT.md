# QA Report: Arizona Daily Star (100750) — Re-QA

**QA Date:** 2026-05-03
**QA Result:** PASS WITH FIXES (V3)

## Summary

Augmented archive with 5 new clippings from raw/more tucson folder. After hashing all 451 raw files: 22 EXACT byte duplicates were deleted (per user instruction); 5 truly new Star files (1924, 1928, 1948, 1950, 1954) identified and merged.

## Final Counts

- **Clippings:** 227 (was 222)
- **Candidate endorsements:** 1,317 (was 1301; net change reflects fuzzy dedup of 34 duplicates after merging)
- **Proposition endorsements:** 320 (was 290)
- **Year coverage:** 1922-2020
- **Mean confidence:** ~0.91
- **Low-confidence records (< 0.7):** ~49

## Process

1. Hashed 451 raw files; deleted 22 exact byte duplicates per user instruction
2. Cross-checked unique files: 199 already in Star archive, 5 truly new
3. Extracted endorsements from 5 new Star clippings via agent
4. Merged 50 new candidate records + 31 new propositions into existing CSV
5. Aggressive fuzzy dedup removed 34 duplicate rows from full archive
6. AZ-specific office normalization applied (TAX COMMISSIONER → CORPORATION COMMISSION, etc.)

## New Content Highlights

- **1924**: Star endorsed straight Democratic ticket (Davis/Bryan); recommended NO on Prop 103 road bond
- **1928**: Star endorsed Al Smith (D) over Hoover — notable in Hoover landslide year, citing Hoover's stance on Colorado River
- **1948**: Split ticket — Truman (D) for President but Republican McKemy for Governor
- **1950**: Strong "vote straight Democratic ticket" recommendation; opposed most ballot measures
- **1954**: Endorsed GOP Gov Pyle for re-election ("entitled to re-election no matter what his party is")

## Notes for Downstream Use

- The Star is the morning paper, historically more independent/Democratic-leaning than Tucson Citizen
- AZ Tax Commission predecessor entity to Corporation Commission (mapped to CORPORATION COMMISSION)
- Mine Inspector is AZ-specific elected office
- Pima County offices: County Attorney → DA/PROSECUTOR, Supervisors → CNTY COMM

## Recommendation

PASS WITH FIXES (V3). Augmentation complete; new pre-statehood-era endorsements add meaningful historical depth.
