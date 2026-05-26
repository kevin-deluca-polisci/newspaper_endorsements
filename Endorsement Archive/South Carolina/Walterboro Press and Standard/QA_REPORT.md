# QA Report: Walterboro Press and Standard (SC)

**Newspaper ID:** WALTERBPS (placeholder — no GS permid assigned)
**QA date:** 2026-05-25
**Status:** PASS

## Summary

47 unique clippings spanning 1950-2006 (21 distinct years).
53 candidate endorsements, 20 proposition endorsements.
Mean extraction confidence: 0.91; minimum 0.70. Zero records below 0.7.

## Stage 1: Structural validation

- Headers match standard 16-col candidates / 11-col propositions schema.
- All rows have `newspaper_id=WALTERBPS`, `state_newspaper=SC`, `state_election=SC`.
- No incumbency "0" values; no junk rows; no empty critical fields.
- `endorsed` values are 1 only for candidates (paper used "we recommend / we endorse" patterns).
- Propositions split 19 YES / 1 NO.
- 47 clippings; metadata counts match CSV row counts.

## Stage 2: Spot-check accuracy

Processed by two parallel subagents (1950-1978, 1978-2006). The Press and Standard's documented historical pattern — Democratic editorial stance through the 1980s consistent with rural Lowcountry tradition of conservative Southern Democrats — shows up clearly in the data.

## Stage 3: Variable coding

All office codes resolved to the standard set. Zero non-standard codes.

Parties: Democrat (30), Republican (5), empty (18). The 6:1 Democrat:Republican ratio confirms the paper's rural-Southern-Democrat editorial pattern. The 18 empty-party records are nonpartisan local races (school board: 18 records; county council in some years). This is consistent with SC local races where party labels weren't always printed for trustee/council seats.

All names in `LASTNAME, FIRSTNAME` ALL-CAPS format. Zero comma-less names.

## Stage 4: Low-confidence rescan

Zero records below 0.7 confidence (minimum was 0.70). No additional rescan needed.

## Coverage notes

- Continuous biennial coverage 1950-1990, then 1992, 1998, 2000, 2004, 2006 (gaps: 1994, 1996, 2002)
- Some early 1950s clippings (1952, 1954) were too low-resolution to extract any records — flagged as legitimate empty results due to source image quality, not extraction errors
- 1950 clipping was propositions-only (3 amendments including poll tax repeal)
- Weekly paper, so each year typically has 1-3 clippings in October before election
- Heavy SCHOOL BOARD coverage (18 records) reflects Colleton County's ongoing school board races
- Notable picks captured: Humphrey 1968, Carter 1976, Dorn (D) 1974 Governor, Riley (D) 1978 Governor; gradual shift to Republican picks at state/county level from 1990 onward
- Colleton County was in SC-1 Congressional District in early years; redistricted to SC-6 (Clyburn) in the 2000s

## Issues found and resolved

- 0 office code recodes
- 0 name fixes
- 0 incumbency "0" fixes
- 0 low-conf records
- 18 empty-party records flagged for augmentation backfill (mostly nonpartisan school board)
- 6 candidate dedup catches across overlapping primary/composite-clipping records within same year

## Raw folder housekeeping

The raw/WALTERBORO PRESS AND STANDARD 1950-2006 folder contained 142 PDFs that resolved to 47 unique hashes. All 47 are DELUCA-named with the `[IDNUMBER]` placeholder in the filename (since the paper has no GS permid). The folder also contains 95 duplicate copies in `NOMEMBERID_YYYYMMDD` / `NoneMMDD` / `YYYYMMDD_v#` placeholder naming variants — all hash-identical to one of the 47 DELUCA originals.

Placeholder newspaper_id `WALTERBPS` assigned per the convention used for other no-permid papers (Banning Record-Gazette → BANNINGRG, Beaufort Gazette → BEAUFORTG, Windsor Beacon → WINDSORBC).

Total: 47 unique clippings processed.
