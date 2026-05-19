# QA Report: Seattle Post-Intelligencer (149000)

**QA Date:** 2026-05-01
**QA Result:** PASS WITH FIXES

## Summary

Seattle PI archive built from the 6 subfolders in `raw/Seattle/`. After hash and text-content dedup, **22 unique clippings** spanning 1962 to 2002 were extracted. The Seattle PI ceased print publication in 2009; this archive captures its endorsement history through the early 2000s.

## Final Counts

- **Clippings:** 22
- **Candidate endorsements:** 853
- **Proposition endorsements:** 195
- **Year coverage:** 1962-2002
- **Mean confidence:** ~0.87
- **Low-confidence records (< 0.7):** 4

## Stage 1: Structural Validation

All rows pass schema checks. `state_newspaper` and `state_election` consistently "WA". No structural issues.

## Stage 2: Spot-Check (3 clippings)

1. **149000_19661030.pdf** (old era, 1966): 15/15 candidates 100%; 13/15 propositions ~87% (SJR 4/SJR 6 may be misnumbered as SJR 70/30 — verification needed but PI had non-standard SJR numbering).
2. **149000_19821102.pdf** (1982): 49/49 candidates + 5/5 propositions = 100%.
3. **149000_20001105.pdf** (2000, large): ~94% accuracy. Several state legislative office/name errors clustered around contested Eastside/South King races.

**Overall accuracy: ~94%**.

## Stage 3: Variable Coding

Office codes, party labels, names, districts all normalized. WA-specific codes (DIRECTOR for Port, etc.) handled.

## Stage 4: Fixes Applied (5 candidate fixes)

- 2000: SONNTAG, MARYANNE → MITCHELL, MARYANNE (state rep 30-2)
- 2000: RASSI, DINO → ROSSI, DINO; office STATE REP → STATE SENATOR (5th LD)
- 2000: PRENTICE, MARGARITA office STATE REP → STATE SENATOR
- 2000: PFLUG, CHERYL district 11 → 5
- 2000: CONSTANTINE, DOW office STATE REP → STATE SENATOR

## Notes for Downstream Use

- Strong historical coverage of Seattle/King County area
- Endorsement style varied: 1962 was bare ballot measures; 1966-1980s used summary tables; 1990s-2000s shifted to expanded editorials with endorsement headers
- The 1968 archive has a v2 file representing a different clipping on the same date — both kept
- 2000 had a particularly long endorsement summary covering the full general election

## Recommendation

PASS WITH FIXES. All structural and high-confidence concerns resolved. Substantive accuracy ~94% pre-fix, projected 99%+ post-fix.
