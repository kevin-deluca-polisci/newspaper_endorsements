# QA Report: Greenville News (SC)

**Newspaper ID:** 143300
**QA date:** 2026-05-25
**Status:** PASS

## Summary

46 unique clippings spanning 1952-2014 (19 distinct years; 2018 clipping has zero records as the editor announced the paper would no longer endorse).
99 candidate endorsements, 42 proposition endorsements.
Mean extraction confidence: 0.91 (candidates); min 0.80. Zero records below 0.7.

## Stage 1: Structural validation

- Headers match standard 16-col candidates / 11-col propositions schema.
- All rows have `newspaper_id=143300`, `state_newspaper=SC`, `state_election=SC`.
- No incumbency "0" values; no junk rows; no empty critical fields.
- `endorsed` values are 1 only for candidates. Props split 40 YES / 2 NO.
- 46 clippings; metadata counts match CSV row counts.

## Stage 2: Spot-check accuracy

Processed by two parallel subagents (1952-1988, 1990-2018). The Republican-leaning pattern documented in the historical literature shows up clearly in the data — see Coverage notes below.

## Stage 3: Variable coding

All office codes resolved to the standard set. Zero non-standard codes.

Parties: Republican (54), Democrat (25), empty (20). The 2:1 R:D ratio confirms the paper's documented Republican lean — Greenville News was one of the first SC dailies to consistently back Republicans at the federal and state level (matching the Upstate region's earlier-than-rest-of-state partisan realignment). The 20 empty-party records are mostly nonpartisan local races (school board, county council in some years).

All names in `LASTNAME, FIRSTNAME` ALL-CAPS format. Zero comma-less names.

## Stage 4: Low-confidence rescan

Zero records below 0.7 confidence (minimum was 0.80). No additional rescan needed.

## Coverage notes

- Sparse early coverage (1952, 1954, 1962): scattered single editorials
- Strong cluster 1974-2014 with multiple clippings per cycle
- Per-race-per-editorial format in 1986, 1990, 2014 (5-6 clippings per cycle)
- 2018 clipping has zero records — that's the editor's announcement that the paper would no longer endorse candidates (a notable nationwide trend among regional papers in that era)
- No 2016 or 2020 in this batch

Presidential picks captured:
- 1952: Eisenhower (R)
- 1984: Reagan (R)
- 1988: Bush (R)
- 2000: Bush (R) (also 1992 Bush)
- 2008: McCain (R)
- 2012: Romney (R)

State-level picks:
- 1986/1990: Carroll Campbell (R) for SC Governor (strong backing both cycles)
- Consistent Thurmond (R) US Senate endorsements through the 1990s
- Knox White (R) for SC-4 starting 1988
- 1954: Edgar Brown (D) over Strom Thurmond write-in for US Senate — one unusual Democratic pick from the pre-realignment era

## Issues found and resolved

- 0 office code recodes
- 0 name fixes
- 0 incumbency "0" fixes
- 0 low-conf records
- 21 dedup catches across overlapping primary/composite-clipping records within same year
- 20 empty-party records flagged for augmentation backfill

## Raw folder housekeeping

The raw/GREENVILLE NEWS folder contained 182 PDFs that resolved to 46 unique hashes:
- 45 DELUCA-named clippings (processed here)
- 1 standalone orphan `Greenville_News_oct_28_1990.pdf` containing the 1990 Campbell-for-Governor + Watson-for-Solicitor editorial. Different scan from the existing DELUCA 19901028 file (different hash but same date and overlapping content) -- kept as `_v1` alongside the DELUCA version.

Total: 46 unique clippings processed.
