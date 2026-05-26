# QA Report: Dayton Daily News (OH)

**Newspaper ID:** 135101
**QA date:** 2026-05-25
**Status:** PASS WITH NOTES

## Summary

21 unique clippings spanning 1960-2010 (18 distinct years).
444 candidate endorsements, 100 proposition endorsements.
Mean extraction confidence: 0.91. 10 records below 0.7 (concentrated in 1988 judicial + 2008 state rep races, both source-quality limitations).

## Stage 1: Structural validation

- Headers match standard 16-col candidates / 11-col propositions schema.
- All rows have `newspaper_id=135101`, `state_newspaper=OH`, `state_election=OH`.
- No incumbency "0" values; no junk rows; no empty critical fields.
- `endorsed` values are 1 (442 records) or 0 (2 records -- legitimate 1996 anti-endorsements of Greene County Common Pleas judges Shattuck and Reid).
- Propositions split 88 YES / 12 NO.
- All years even.
- 21 clippings; metadata counts match CSV row counts.

## Stage 2: Spot-check accuracy

Processed by two parallel subagents (1960-1980, 1982-2010). Subagent notes confirm the DDN's Democratic-leaning pattern with notable Republican crossovers: Kennedy/Humphrey/Carter/Clinton/Obama at presidential level, with Nixon 1972 and Robert Taft Jr. 1964 Senate as documented R picks. The 1996 anti-endorsements of two Greene County judges (asking voters to vote "No" on confirmation) are real opposition events, not coding errors.

## Stage 3: Variable coding

All office codes resolved to the standard set. Zero non-standard codes (DIRECTOR used for 4 county engineer records as appropriate).

Parties: Democrat (192), Republican (125), empty (125), Independent (2). The 125 empty-party records are concentrated in 1960 (25) and 1964 (25) where the source lists didn't print party labels, plus judicial races throughout. Augmentation merge with DIME/Voteview will backfill federal-level records.

All names in `LASTNAME, FIRSTNAME` ALL-CAPS format after auto-fixes:
- 2 names auto-fixed from FIRSTNAME LASTNAME to LASTNAME, FIRSTNAME: `FAITH A. PARKER` -> `PARKER, FAITH A.` (1980) and `DEBRA JUSTICE` -> `JUSTICE, DEBRA` (1990).

## Stage 4: Low-confidence rescan

10 records (2.3%) below 0.7:
- 1988 JUDGE/CNTY JUDGE records (ORDER, JENKINS, BARTON) -- low-res scan of judicial slate
- 2008 STATE REP records (BLAIR, BEAGLE, WILLIAMS, FOLEY) and 2008 RECORDER (BAHAN) -- tiny composite image, names readable but small

Flagged but not corrected; names are plausibly accurate but source images don't permit higher confidence.

## Coverage notes

- Continuous biennial coverage 1960-1990 (16 election years), then 1996, 2008, and 2010.
- Gap: 1992-1994, 1998-2006, 2012+ in this batch.
- 2010 has TWO clippings: the standard pre-election composite (20101102) and a digital "A recap of our endorsements" web archive (20101029) covering additional Butler County races -- compile dedup handled the partial overlap.
- The DDN was the Democratic-leaning afternoon sister paper to the Republican-leaning Journal Herald (135102) within Cox Newspapers. Both papers were owned by James M. Cox's family. The two papers merged in 1986 (Journal Herald ceased publication; DDN became the combined paper).
- Endorsement patterns confirmed: Kennedy 1960, Humphrey 1968, Carter 1976/1980, Clinton 1996, Obama 2008 (D) at presidential level. Notable Republican crossovers: Nixon 1972 (matching JH), Robert Taft Jr. (R) 1964 Senate over Stephen Young (D).
- 2010 split slate captures the modern paper's mixed approach: Strickland D Gov + Fisher D Sen + Pepper D Auditor + Cordray D AG, but Mandel R Treas, Husted R SoS, Boehner R US-8 (heavy R area), and OH SC O'Connor + Lanzinger (R justices).

## Issues found and resolved

- 2 candidate names auto-fixed (FIRSTNAME LASTNAME order -> LASTNAME, FIRSTNAME)
- 0 office code recodes (zero non-standard)
- 0 incumbency "0" fixes
- 10 low-confidence records flagged but not corrected (source image quality)
- 2 legitimate anti-endorsements preserved (1996 Greene Cnty Common Pleas judges)
- 125 empty-party records flagged for augmentation backfill

## Raw folder housekeeping

The raw/DAYTON DAILY NEWS folder contained 71 PDFs that resolved to 23 unique hashes:
- 19 DELUCA-named clippings (processed here)
- 1 standalone `135101_1996MMDD.pdf` (Nov 5, 1996 endorsement summary, new year) -- processed
- 1 standalone `Dayton Daily News Journal Herald A recap of our endorsements.pdf` (Oct 29, 2010 web archive) -- processed (additional Butler County races beyond the print composite)
- 1 standalone `DaytonDailyNews_19681103.pdf` 4-page bundle covering 1968/1970/1972/1974 endorsements -- every page's date is already covered by individual DELUCA clippings, skipped as redundant
- 1 Wikipedia reference PDF -- used for metadata, skipped

Total: 21 unique clippings processed.
