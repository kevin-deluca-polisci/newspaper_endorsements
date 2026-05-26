# QA Report: Rock Hill Herald (SC)

**Newspaper ID:** 143450
**QA date:** 2026-05-25
**Status:** PASS

## Summary

32 unique clippings spanning 1964-2016 (9 distinct years; dense 2010-2014 cluster).
33 candidate endorsements, 23 proposition endorsements.
Mean extraction confidence: 0.94; minimum 0.90. Zero records below 0.7.

## Stage 1: Structural validation

- Headers match standard 16-col candidates / 11-col propositions schema.
- All rows have `newspaper_id=143450`, `state_newspaper=SC`, `state_election=SC`.
- No incumbency "0" values; no junk rows; no empty critical fields.
- `endorsed` values are 1 only for candidates. Propositions split 20 YES / 3 NO.
- 32 clippings; metadata counts match CSV row counts.

## Stage 2: Spot-check accuracy

Processed by two parallel subagents (1964-2012, 2014-2016). The 2014 cycle is especially dense — 13 separate one-race-per-day editorials from Oct 22 to Nov 4. Each yielded 0-1 records (single-race editorials). The Herald's documented moderate / split-ticket pattern shows up cleanly:
- 2014: Sheheen (D) for Governor over Haley (R), Graham (R) and Tim Scott (R) for Senate, Mulvaney (R) for SC-5 — mix of D and R picks in the same cycle
- 2010: Sheheen (D) Governor, Spratt (D) Senate slate
- 2012: Romney (R), Mulvaney (R) SC-5
- 1968: Nixon (R) President but Hollings/Gettys (D) at state level — split-ticket pattern goes back to 1968

## Stage 3: Variable coding

All office codes resolved to the standard set. Zero non-standard codes.

Parties: Democrat (13), Republican (8), empty (12). The 12 empty-party records are mostly nonpartisan local races (school board: 7 records, county council seats where party isn't always shown). The slight Democratic edge over Republican reflects the dataset's heavy 2010 weighting (12 of 33 records were the 2010 Sheheen-headed slate).

All names in `LASTNAME, FIRSTNAME` ALL-CAPS format. Zero comma-less names.

## Stage 4: Low-confidence rescan

Zero records below 0.7 confidence (minimum 0.90). No additional rescan needed.

## Coverage notes

- Sparse early coverage (single clippings in 1964, 1966, 1980)
- 1968 has 3 clippings (Oct 31, Nov 1, Nov 4)
- 1994/1996 had propositions-only editorials
- Dense modern cluster: 2010 (1 composite), 2012 (5 clippings + 2 orphan copies), 2014 (13 separate one-race-per-day editorials)
- 2016-11-05 was a guest LA Times editorial reprint, not a Herald endorsement (zero records)
- The 2014 dense cycle captures the modern paper's one-race-per-day editorial format leading up to election day

## Issues found and resolved

- 0 office code recodes
- 0 name fixes
- 0 incumbency "0" fixes
- 0 low-conf records
- 5 dedup catches across the two 2012 orphan vs DELUCA pairs (different scans of same content)
- 12 empty-party records flagged for augmentation backfill (mostly nonpartisan local races)

## Raw folder housekeeping

The raw/ROCK HILL HERALD folder contained 126 PDFs that resolved to 32 unique hashes:
- 30 DELUCA-named clippings (processed here)
- 2 orphan files with real endorsement content:
  - `143450_2012MMDD.pdf` = Nov 4, 2012 York County Council editorial (kept as `20121104_v1` alongside existing DELUCA `20121104` — same date, different scan)
  - `Rock_Hill_Herald_nov_2_2012 copy.pdf` = Nov 2, 2012 SC-5 Mulvaney editorial (kept as `20121102_v1` alongside existing DELUCA `20121102` — same date, different scan)

Total: 32 unique clippings processed.
