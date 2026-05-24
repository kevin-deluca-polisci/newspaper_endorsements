# QA Report: Boston Globe

**Audit date:** 2026-05-20
**Folder:** done/Boston Globe
**Newspaper ID:** 119300
**Data coverage:** 1964-2018 (17 distinct years), 45 clippings, 141 candidate records, 79 proposition records

## Overall Assessment

**PASS**

NEW paper added to dataset. Major New England daily covering Boston and the Massachusetts/New England region. Taylor family ownership through 1993, NYT Co 1993-2013, then Boston Globe Media (John Henry) 2013-present. Strongly Democratic-leaning editorial board.

## Stage 1: Structural Validation
- CSV headers: OK
- Row integrity: 141 cands, 79 props, 0 issues
- All newspaper_id=119300, state=MA/MA
- Incumbency fields clean

## Stage 2: Spot Check
Verified across both batches. Notable confirmed endorsements:
- 1974: Sargent (R-Gov, incumbent) — rare GOP endorsement
- 1986: Full Dukakis statewide slate
- 1988: Dukakis for President
- 1990: Weld/Cellucci (R) for Gov/LG split with Democrats elsewhere
- 2010: Patrick (D-Gov) re-elect
- 2014, 2018: Baker (R) for Governor — notable cross-party
- 2018: Warren (D) for Senate

## Stage 3: Variable Coding
- All office codes standard (no non-standard codes)
- Office distribution: H (36), SENATOR (17), GOVERNOR (17), STATE REP (16), STATE SENATOR (12), AUDITOR (10), TREASURER (9)
- 3 cross-clipping duplicates merged
- Note: 36 candidate records and 4 prop records have empty `endorsed` field — these are opposing candidates explicitly listed in the editorial (not endorsed, but recorded for completeness) plus non-endorsement decisions

## Stage 4: Low-Confidence Re-Scan
- 0 records below 0.75 confidence
- Mean confidence: 0.95

## Notable Editorial History

**Format evolution:**
- 1964-1990: Mix of single-issue editorials (1964 had 5 separate ballot-question clippings) and summary recaps
- 2008+: One-race-per-clipping individual editorials (industry trend; 2010/2014/2018 each have 8 single-race files)

**Endorsement patterns:**
- Strongly Democratic for federal/state (Kennedy, Kerry, Warren, Dukakis, Patrick, Obama)
- **Notable Republican gubernatorial endorsements**: Sargent 1974, Weld 1990, Baker 2014/2018
- **2010**: Endorsed several Republican state legislative challengers (to balance Democratic supermajority)
- **Cross-state endorsements**: Globe endorses in NH and RI races (NH Shaheen 2008/2014, NH Hassan 2016, RI Raimondo 2018) — included in this dataset

**Rare third-party endorsement:** 2018 Auditor — Daniel Fishman (Libertarian) over Bump (D incumbent)

## Notes
- Batch A used non-standard `endorsed: -1` for ~4 propositions where Globe declined to recommend (e.g., 1964 Q7 local-option liquor); converted to empty endorsed field per pipeline standards
