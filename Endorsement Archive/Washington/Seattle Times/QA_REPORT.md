# QA Report: Seattle Times (149050)

**QA Date:** 2026-05-01
**QA Result:** PASS WITH FIXES

## Summary

Seattle Times archive built from 1053 raw clippings spread across 6 subfolders in `raw/Seattle/`. After hash dedup, 459 unique files were identified, then text-content dedup removed 6 additional duplicates, producing **453 unique clippings** spanning 1962 to 2018. Three very large omnibus PDFs (>25MB) were processed via pre-extracted text sidecars to fit within agent request limits.

## Final Counts

- **Clippings:** 453
- **Candidate endorsements:** 1,476
- **Proposition endorsements:** 301
- **Year coverage:** 1962-2018
- **Mean confidence:** ~0.84
- **Low-confidence records (< 0.7):** ~270

## Stage 1: Structural Validation

All CSVs use the standard 16-column candidate / 11-column proposition schemas. Year fields valid 1962-2018. `state_newspaper` and `state_election` populated as "WA" everywhere. Incumbency `0` values cleaned to blank during compile. One junk row (CNTY EXEC, blank cand_name) removed.

## Stage 2: Spot-Check (3 clippings)

Three clippings were independently re-read and compared to the CSV:

1. **149050_19741103.pdf** (1974 advisory ballot): 38/40 = 95% accuracy. Errors: NALLEY party miscoded as Republican (corrected to Democrat); GOADLOE → GOODLOE spelling fix.
2. **149050_20081102.pdf** (2008 general): 18/18 = 100% direction/party correct, but several duplicate rows from the index page + editorial coexisting.
3. **149050_20171020.pdf** (2017 cheat sheet): 23/23 = 100% direction correct, but ~10 blank-name rows and duplicates.

**Substantive accuracy:** ~97% on endorsement direction.

## Stage 3: Variable Coding

Office codes normalized at compile time. Party labels canonicalized. Names ALL CAPS LASTNAME, FIRSTNAME. Districts numeric where applicable. Local Washington-specific offices (DIRECTOR for Port of Seattle, CITY COUNCIL for Seattle/Bellevue, SCHOOL BOARD, JUDGE for KC Superior Court) handled per coding rules.

## Stage 4: Fixes Applied

- 151 blank-name candidate junk rows removed
- 17 blank-prop_desc proposition junk rows removed
- 1 phantom row removed (MCCRAW, JIM 2008 LT GOVERNOR — real name is Marcia)
- GOADLOE → GOODLOE spelling fix (1 row)
- NALLEY (1974 H-6) party Republican → Democrat (1 row)

## Notes for Downstream Use

- Cross-filing era doesn't apply (Washington didn't have CA-style cross-filing)
- WA used party-primary system through 2007, top-2 primary from 2008 onward (so single endorsements before 2008, often dual primary endorsements 2008+)
- Many state legislative endorsements at the LD (Legislative District) level — districts are LD numbers in `dist`; positions noted in `notes_endorse`
- Local Seattle/KC nonpartisan races have empty party fields
- Four enormous omnibus articles drove much of the modern coverage:
  - 2017-09-07 (Sep 7 Nov endorsement index, 75MB)
  - 2018-07-11 (Aug primary index, 123MB)
  - 2018-10-19 (Nov general "cheat sheet", 162MB)
  - 2017-10-20 (Nov general cheat sheet)

## Recommendation

PASS WITH FIXES. Accuracy on extracted endorsements is high (~97%). Future reprocessing of single-endorsement op-eds (e.g., the 2007-2008 syndicated columns batch that came back largely empty) could capture more local endorsements if the editorials live elsewhere in the source archive.
