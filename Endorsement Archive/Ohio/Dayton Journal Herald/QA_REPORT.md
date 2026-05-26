# QA Report: Dayton Journal Herald (OH)

**Newspaper ID:** 135102
**QA date:** 2026-05-23
**Status:** PASS

## Summary

55 unique clippings spanning 1960-1984 (12 distinct even years).
275 candidate endorsements, 73 proposition endorsements.
Mean extraction confidence: 0.93. Zero records below 0.7.

## Stage 1: Structural validation

- Headers match standard 16-col candidates / 11-col propositions schema.
- All rows have `newspaper_id=135102`, `state_newspaper=OH`, `state_election=OH`.
- No incumbency "0" values; no junk rows; no empty critical fields.
- `endorsed` values are 1 (274 records) or 0 (1 record -- 1962 Judge Shank anti-endorsement, legitimate).
- Propositions split 62 YES / 11 NO.
- All years even.
- 55 clippings; metadata counts match CSV row counts.

## Stage 2: Spot-check accuracy

Processed by four parallel subagents (1960-1966, 1966-1970, 1970-1972, 1972-1984). Subagent notes correctly identified the JH's editorial pattern:
- 1960-1972: one-race-per-day editorials throughout October ("X for [Office]" headline pattern)
- 1974 onward: single composite election-day "JH Endorsements" list

The Republican-leaning pattern with Democratic crossovers is captured cleanly: Nixon 1960/68/72, Reagan 1980/84, but Gilligan (D) 1970/74 Governor, Glenn (D) 1974/80 Senator, Celebrezze (D) 1982 Governor. This matches the historical reputation of the paper.

## Stage 3: Variable coding

All office codes resolved to the standard set. Zero non-standard codes.

Parties: Republican (112), Democrat (48), empty (115). The 115 empty-party records are distributed across all years (peaking 1980 with 27) and reflect:
- Judicial races where party isn't always shown (Common Pleas Judge, Court of Appeals)
- OH State House multi-seat district composite lists where the subagent left party blank rather than guess
- 1980 in particular had a low-resolution scan where the subagent could read names but not the small party labels next to them

Augmentation merge with DIME/Voteview will backfill federal-level records.

All names in `LASTNAME, FIRSTNAME` ALL-CAPS format. Zero comma-less names.

## Stage 4: Low-confidence rescan

Zero records below 0.7 confidence. No additional rescan needed.

## Coverage notes

- Continuous biennial coverage 1960-1984 (12 election years; gap: 1964 had only 1 clipping that yielded zero endorsements, so 1964 doesn't appear in the data).
- Heavy clipping density in 1960 (8 clippings), 1962 (10), 1970 (13), and 1972 (10) reflects the JH's one-editorial-per-race pattern.
- 1968-11-04 "For The Record" is the densest single clipping (23 candidates + 4 props), capturing the full Montgomery County composite.
- 1972-11-07 "JH Recommendations" and 1974-11-05 "JH Endorsements" are dense composite year-end lists.
- The Journal Herald merged into the Dayton Daily News in 1986, so coverage ends with the 1984 general election.

## Issues found and resolved

- 0 office code recodes (all 24 office codes used were standard)
- 0 candidate name fixes
- 0 incumbency "0" fixes
- 0 low-confidence records
- 1 legitimate anti-endorsement preserved (1962 Judge Shank — "editorial urges voters to defeat")
- 115 empty-party records flagged for augmentation backfill (concentrated in judicial races and 1980 low-res scan)

## Raw folder housekeeping

The raw/dayton journal herald folder contained 187 PDFs that resolved to 56 unique hashes:
- 55 DELUCA-named clippings (processed here)
- 1 standalone 15-page "DaytonJournalHerald_19681104.pdf" bundle covering 1968/1970/1972/1974 endorsements -- every page's content was already covered by individual DELUCA clippings at the same date, so the bundle was skipped as redundant
