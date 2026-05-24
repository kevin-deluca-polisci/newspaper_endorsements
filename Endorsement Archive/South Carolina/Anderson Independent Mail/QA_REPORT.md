# QA Report: Anderson Independent Mail

**Audit date:** 2026-05-20
**Folder:** done/Anderson Independent Mail
**Newspaper ID:** 143070
**Data coverage:** 1974-2008, 24 clippings, 294 candidate records, 40 proposition records

## Overall Assessment

**PASS**

NEW paper added to dataset. The Anderson Independent Mail is the daily covering Anderson County, SC (upstate Greenville/Spartanburg area). Formed from the merger of the Anderson Independent (morning) and Anderson Daily Mail (evening). Earlier clippings (1974-1980) come from the pre-merger papers; later clippings use the combined name.

## Stage 1: Structural Validation
- CSV headers: OK
- Row integrity: 294 cands, 40 props, 0 issues
- All newspaper_id=143070, state=SC/SC
- Incumbency fields clean

## Stage 2: Spot Check
Verified across two parallel extraction batches. Notable verifications:
- 1974: Mixed-party slate (most Democrats, some Republicans like Campbell Lt Gov)
- 1996: Endorsed Clinton (D) for President and Elliott Close (D) for Senate over Strom Thurmond
- 2002: Hodges (D-Gov), Graham (R-Senate), Barrett (R-SC-3) — split-ticket
- 2004: Kerry (D-Pres), Tenenbaum (D-Senate)

## Stage 3: Variable Coding
- All office codes standard (no non-standard codes)
- Most common offices: SCHOOL BOARD (83), STATE REP (44), CNTY COMM (41), SENATOR (14)
- 0 duplicates after fuzzy dedup
- 0 junk rows

## Stage 4: Low-Confidence Re-Scan
- 0 records below 0.75 confidence
- Mean confidence: 0.93

## Notable Patterns

**Mixed-party endorsement pattern** (typical of upstate SC traditionalist paper):
- 1976: Editorial board split on Carter/Ford — published dual columns, no consensus endorsement
- 1980: Endorsed Carter (D) + Hollings (D) + Derrick (D-Congress)
- 1984: Reagan (R) + Thurmond (R) + Derrick (D-Congress)
- 1988: Bush (R-Pres) + Derrick (D-Congress)
- 1996: Surprising D-leaning ticket — Clinton, Close (D-Senate over Thurmond), Dorn (D over Graham)
- 1998: Hodges (D-Gov), Hollings (D-Senate), Tenenbaum (D-Supt), but most cabinet seats Republican
- 2002: Hodges (D-Gov), Graham (R-Senate) — split
- 2004: Kerry (D), Tenenbaum (D-Senate)

**Coverage gap:** No endorsement clippings present for 2010-2016 in source folder. 2018 file contains only an editor's note ("Changes coming to opinion pages"), not endorsements.

**Format evolution:**
- 1974-2004: Comprehensive full-slate endorsements
- 2006-2008: Single ballot-measure clippings (1-cent sales tax referendums)
- 2010+: No endorsement content in source folder

Mean confidence 0.93. Clean structural output with no issues requiring follow-up.
