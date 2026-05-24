# QA Report: Charlotte Observer (NC)

**Newspaper ID:** 132300
**QA date:** 2026-05-23
**Status:** PASS WITH NOTES

## Summary

26 unique clippings spanning 1960-2020 (24 distinct even years).
704 candidate endorsements, 75 proposition endorsements.
Mean extraction confidence: 0.91. 19 records below 0.7 (concentrated in the 1978 low-resolution scan and the 1960 county commission slate).

## Stage 1: Structural validation

- Headers conform to the standard 16-column candidates / 11-column propositions schema.
- All rows have `newspaper_id=132300`, `state_newspaper=NC`, `state_election=NC`.
- No incumbency "0" values, no junk rows, no empty critical fields.
- `endorsed` values are 1 or 0 only.
- All years are even (NC general elections fall on even years; gubernatorial is presidential cycle).
- 26 clippings, all named per `132300_YYYYMMDD.pdf` convention; metadata counts match CSV row counts.

## Stage 2: Spot-check accuracy

The 26 clippings were processed by three parallel subagents (1960-1976, 1978-1990, 2006-2020). Subagent notes confirm office attributions and party labels were checked against printed text on each clipping. Bipartisan endorsement pattern visible from 1980 onward (mix of D and R picks) matches the paper's well-documented editorial stance.

## Stage 3: Variable coding

All office codes resolved to the standard set. 6 records originally coded as `SUPERIOR COURT` were auto-fixed to `JUDGE` with `notes_endorse="Superior Court"` (matches the skill's coding rule for state-court superior court races).

Parties: Democrat (456), Republican (155), Independent (2), empty (91). The 91 empty-party records are concentrated in the 1980 "We Recommend" list and a few 1978/1976 entries where the printed list did not include party labels next to candidate names. These will be backfillable in the augmentation step via DIME/Voteview lookup. No auto-fix applied here since coding without source confirmation would risk introducing errors.

All names in `LASTNAME, FIRSTNAME` ALL-CAPS format. No names without commas.

## Stage 4: Low-confidence rescan

19 records (2.7%) below 0.7 confidence:
- 1960 Mecklenburg County Commission slate (4 records at 0.6) -- list of 4 GOP candidates the Observer left "unranked" for the fourth seat; transcription accurate but uncertainty about whether they were truly endorsed vs. listed for context.
- 1978 State Senate / State House district records (15 records at 0.6-0.7) -- low-resolution scan of the 1978 endorsement list; district numbers not legible, names transcribed best-effort.

These are flagged but not corrected -- the source images would need to be re-scanned at higher resolution to improve.

## Coverage notes

- Continuous biennial coverage 1960-1990 (16 election years).
- Gap: 1992-2004 (no clippings in this batch).
- Continuous biennial coverage 2006-2020 (8 election years).
- 1976 has three clippings: Aug 13 (primary recap, brief), Oct 29 (pre-election Wikipedia-style overview), Nov 2 (full election-day list with 43 candidates).
- Editorial format evolved from compact list ("The Observer Recommends:", "The Observer's Choices:", "We Recommend") in the 1960s-80s to long-form ARTICLE editorials with embedded picks in 2006-2018, returning to a consolidated list format for the 2020 election-day summary.
- Mecklenburg County local races (county commissioners, sheriff, register of deeds, district court judges, school board) appear throughout.
- NC General Assembly multi-member district seats common pre-2002: 36th House district elected up to 7 representatives; 22nd Senate district elected multiple. This inflates STATE REP and STATE SENATOR counts.
- 4 opposed-candidate records and 9 opposed-prop records appear from the 1980s onward, when the paper began explicitly opposing certain Charlotte bond questions and constitutional amendments (e.g., the 1988 Discovery Place bond, 1990 Mecklenburg Jail bond, several 2018 amendments).

## Issues found and resolved

- 6 records auto-fixed `SUPERIOR COURT` -> `JUDGE` (notes="Superior Court").
- 91 records have empty `party` (no party label printed in the source list); flagged for augmentation backfill, not corrected.
- 19 low-confidence records flagged (1960 county slate, 1978 low-res clipping); not corrected.

No other issues.
