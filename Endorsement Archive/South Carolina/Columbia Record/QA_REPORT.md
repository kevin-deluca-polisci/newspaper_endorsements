# QA Report: Columbia Record (SC)

**Newspaper ID:** 143150
**QA date:** 2026-05-23
**Status:** PASS WITH NOTES

## Summary

50 unique clippings spanning 1950-1986 (14 distinct even years).
99 candidate endorsements, 40 proposition endorsements.
Mean extraction confidence: 0.90. Only 2 records below 0.7 after one auto-fix.

## Stage 1: Structural validation

- Headers conform to the standard 16-column candidates / 11-column propositions schema.
- All rows have `newspaper_id=143150`, `state_newspaper=SC`, `state_election=SC`.
- No incumbency "0" values; no junk rows; no empty critical fields.
- `endorsed` values are 1 or 0 only.
- All years even (federal/state general elections).
- 50 clippings, all named per `143150_YYYYMMDD.pdf` convention; metadata counts match CSV row counts.

## Stage 2: Spot-check accuracy

The 50 clippings were processed by four parallel subagents (1950-1972, 1972-1976, 1976-1982, 1982-1986). Subagent notes confirm that the Record's "one race per editorial" pattern was correctly interpreted -- most clippings yielded 1-5 endorsement records each, matching the paper's distinctive editorial cadence of running separate pieces on each race throughout the week before an election.

## Stage 3: Variable coding

All office codes resolved to the standard set. Zero non-standard codes.

Parties: Republican (33), Democrat (32), Nonpartisan (6), empty (28). The 28 empty-party records are concentrated in early years (1950, 1960-era SC was one-party Democrat and the paper often didn't print party labels) and in nonpartisan local races. Augmentation merge with DIME/Voteview will backfill federal records.

All names in `LASTNAME, FIRSTNAME` ALL-CAPS format. One name auto-fixed:
- `GLENN, JR.` (1976 Richland County Council) -> `GLENN, DARRYL JR.` (first name read from the photo strip on the editorial page, confidence raised to 0.75).
- `HARRNETT` (1976 Richland District 1 School Board) -> `HARRNETT,` with note "first name not legible in source"; flagged for augmentation lookup or manual correction.

## Stage 4: Low-confidence rescan

Only 2 records below 0.7 (both 1976 local races where the source photo strip was faded). One was partially corrected via the photo caption (GLENN, DARRYL JR.). The other (HARRNETT) remains uncertain; the school board context is preserved in `notes_endorse`.

## Coverage notes

- 1950: 3 statewide constitutional amendments only (no candidate picks captured)
- 1952: Eisenhower for President (the Record was unusual among Southern papers in backing Ike)
- 1960, 1968, 1972: Nixon for President -- a consistently Republican-leaning pattern at the presidential level for a Southern afternoon paper
- 1976: Ford for President
- 1984: Reagan/Bush for President
- 1986: Campbell (R) for Governor -- reflects SC's mid-century partisan realignment
- 1974: Governor race (Dorn vs. Edwards) was the only case where the Record explicitly declined to endorse ("An Unhappy Choice" editorial)
- 1960-11-07 clipping was too faded to extract specific endorsements
- 1982-10-26 clipping contained only general editorials (no candidate or prop picks)

Heavy proposition coverage in 1972 (15 props -- multiple ballots of statewide constitutional amendments plus local bond refs) and 1986 (3 including the magistrate amendment, Lexington Sunday liquor referendum, and an obscenity referendum the Record opposed).

## Editorial-format note

The Columbia Record produced one editorial per race rather than a consolidated election-day endorsement list. This produces 5-6 clippings per even year (1972/74/76/80/82/84/86) but a relatively low candidate count per clipping (1-5 picks each). Total endorsements per year (10-30) are comparable to single-list papers like the Charlotte News.

## Raw folder housekeeping

The raw/COLUMBIA RECORD folder contained 205 PDFs that resolved to 53 unique hashes:
- 50 DELUCA-named clippings (processed here)
- 2 cosmetically-different copies of DELUCA files (same content, trivial PDF metadata differences) -- skipped as duplicates
- 1 Wikipedia reference page about the Columbia Record (used for metadata; ceased April 1, 1988) -- not an endorsement clipping, skipped

## Issues found and resolved

- 1 name auto-fixed (`GLENN, JR.` -> `GLENN, DARRYL JR.` via photo caption).
- 1 name annotated (`HARRNETT` -> `HARRNETT,` with notes flagging illegible first name).
- 28 records have empty `party` (no party labels in source); flagged for augmentation backfill.
- 2 low-confidence records flagged (both 1976 local races).

No other issues.
