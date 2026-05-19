# QA Report: Tucson Arizona Citizen (100751) — Re-QA

**QA Date:** 2026-05-03
**QA Result:** PASS WITH FIXES (V3)

## Summary

Augmented archive with 18 new clippings from raw/more tucson folder. After hashing all 451 raw files: 22 EXACT byte duplicates were deleted (per user instruction); 23 truly new files identified across both papers (18 Citizen, 5 Star). The 18 Citizen new files cover 1922-1956 (early statehood era), filling gaps in early-20th-century coverage.

## Final Counts

- **Clippings:** 226 (was 208)
- **Candidate endorsements:** 1,072 (was 1091; net change reflects fuzzy dedup of 86 duplicates after merging)
- **Proposition endorsements:** 274 (was 272)
- **Year coverage:** 1920-2008
- **Mean confidence:** ~0.87
- **Low-confidence records (< 0.7):** ~101

## Process

1. Hashed 451 raw files; found 22 exact byte duplicates within folder → deleted per user instruction
2. Cross-checked remaining unique files against existing Citizen archive (208 files): 206 already present, 18 truly new
3. Routed 18 Citizen + 5 Star files to working folders with collision-aware naming
4. Extracted endorsements via parallel agent
5. Merged 67 new candidate records + 2 new propositions into existing CSV
6. Aggressive fuzzy dedup pass removed 86 duplicate rows (existing CSV had some name-spelling variants now consolidated)
7. AZ-specific office normalization: CORP COMM → CORPORATION COMMISSION, TAX COMMISSIONER → CORPORATION COMMISSION (predecessor entity), STATE INSTRUCTION SUPT → SUPERINTENDENT, PRESIDENTIAL ELECTOR → PRESIDENT

## Notes for Downstream Use

- The Tucson Citizen was historically the conservative/Republican-leaning paper of Tucson
- New 1922-1928 content fills important early-statehood gap (AZ became state Feb 1912)
- Some 1924/1928 clippings reference "Combination Ticket" — bipartisan endorsements common in early AZ
- 1950 endorsed Democrat Bob Morrison (County Attorney) and Frank Eyman (Sheriff) as reform candidates over Republican incumbents
- Historical AZ Tax Commission was a 3-member elected body that became the Corporation Commission
- Pima County offices: County Attorney → DA/PROSECUTOR, Supervisors → CNTY COMM
- Mine Inspector and Corporation Commission are AZ-specific elected statewide offices

## Recommendation

PASS WITH FIXES (V3). Augmentation complete; all duplicates from new merge cleaned up.
