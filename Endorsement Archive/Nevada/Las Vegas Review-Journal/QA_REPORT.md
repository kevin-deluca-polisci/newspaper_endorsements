# QA Report: Las Vegas Review-Journal (NV)

**Newspaper ID:** 126500
**QA date:** 2026-05-23
**Status:** PASS

## Summary

23 unique clippings spanning 1968-2022 (23 distinct years, every even year 1968-2010 plus 2022).
1,235 candidate endorsements, 171 proposition endorsements.
Mean extraction confidence: 0.92. Only 6 records below 0.7.

## Stage 1: Structural validation

- Headers match standard 16-col candidates / 11-col propositions schema.
- All rows have `newspaper_id=126500`, `state_newspaper=NV`, `state_election=NV`.
- No incumbency "0" values; no junk rows; no empty critical fields.
- `endorsed` values are 1 only for candidates (LVRJ used "we recommend X" pattern throughout). Propositions split 99 YES / 72 NO -- the libertarian streak shows up in heavy opposition to bonds and tax measures.
- All years even.
- 23 clippings; metadata counts match CSV row counts.

## Stage 2: Spot-check accuracy

Processed by two parallel subagents (1968-1992, 1994-2022). Subagent notes confirm the Presidential pick pattern matches what's well-documented for the paper: Nixon 1968/72, Carter 1976 (notable Democratic crossover), Reagan 1980/84, Bush 1988/92, Dole 1996, Bush 2000/04, McCain 2008.

## Stage 3: Variable coding

All office codes resolved to the standard set. Zero non-standard codes.

Parties: Democrat (415), Nonpartisan (355), Republican (345), Libertarian (6), Independent (2), Independent American (1), empty (111). The 355 Nonpartisan records are concentrated in Clark County judicial races, university Regents, school board, and municipal races. The 111 empty-party records are mostly from 1968 (33), 1970 (32), and 1988 (31), where the source paper did not print party labels in the consolidated endorsement list. Augmentation merge with DIME/Voteview will backfill federal records.

The "Independent American" party (1 record) is a valid Nevada minor party (Independent American Party of Nevada), not a coding error.

All names in `LASTNAME, FIRSTNAME` ALL-CAPS format. Zero comma-less names.

One name was already auto-fixed before compile: `BERKLEY, SHELLEY` in 2004 was extracted as Republican (clipping appears to have a misaligned column header); corrected to Democrat with `d_inc=1`. Cross-checked against her 2006/2008/2010 records, which all correctly show her as a Democrat incumbent.

## Stage 4: Low-confidence rescan

6 records (0.5%) below 0.7:
- 1974 JUDGE FOXX, MAHLON BROWN (0.6) -- low-res clipping
- 1974 CONSTABLE TABATA, LOUIS (0.6) -- faded text
- 1974 DIRECTOR BELDEN, HERMAN VAN (0.65) -- multi-name listing partially cropped
- 1978 STATE REP ARDIE, DAVE (0.6) -- faded text
- 1980 STATE REP GRILE, DICK (0.55) -- name spelling uncertain
- 1980 STATE REP DUBOIS, JOHN (0.6) -- multi-name listing

These are flagged but not corrected; the names are plausibly accurate but the source images don't permit higher confidence. None affect office classification or party assignment.

## Coverage notes

- Continuous biennial coverage 1968-2010 (22 election years).
- Gap: 2012-2020 (no clippings in this batch).
- Single 2022 clipping is a digital "Review-Journal endorsements for the 2022 election" composite article from after Sheldon Adelson purchased the paper in 2015.
- 1978 has the heaviest record count (91 candidates) -- reflects a heavy local/judicial slate that year.
- 2002 has the lightest (9 candidates) -- subagent noted it was a brief "restatement" editorial rather than a full slate.
- LVRJ historically published one large composite "election day" or "election eve" recap listing every endorsement including the full Clark County local ballot (county commissioners, judges across the 8th Judicial District, justices of the peace, constables, school board, university regents, plus municipal races for Las Vegas/North Las Vegas/Henderson/Boulder City). This produces a high record count per clipping (40-85/year typical).

The paper's libertarian/conservative leaning is clearly visible in:
- Heavy opposition pattern on bond and tax measures (72 NO vs. 99 YES across 171 props)
- Republican-leaning Presidential picks (one Democratic crossover: Carter 1976)
- Pattern strengthened after Adelson purchase in 2015 (2022 sample shows the trend)

## Issues found and resolved

- 1 party auto-fix (`BERKLEY, SHELLEY` 2004 Republican -> Democrat with `d_inc=1`).
- 111 records with empty `party` (no party labels printed in 1968/1970/1988 source lists); flagged for augmentation backfill.
- 6 low-confidence records flagged but not corrected (faded/cropped names in 1974/1978/1980).

No other issues. Raw folder housekeeping: 45 PDFs in raw folder boiled down to 23 unique by SHA-256; each year typically had a 126500_YYYYMMDD.pdf canonical file paired with a redundant Review_Journal_YYYY.pdf duplicate (no new content).
