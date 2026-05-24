# QA Report: Charlotte News (NC)

**Newspaper ID:** 132301
**QA date:** 2026-05-23
**Status:** PASS WITH NOTES

## Summary

14 unique clippings spanning 1960-1984 (13 distinct even years; 1964 has two clippings).
261 candidate endorsements, 28 proposition endorsements.
Mean extraction confidence: 0.87. Only 2 records below 0.7.

## Stage 1: Structural validation

- Headers conform to the standard 16-column candidates / 11-column propositions schema.
- All rows have `newspaper_id=132301`, `state_newspaper=NC`, `state_election=NC`.
- No incumbency "0" values, no junk rows, no empty critical fields.
- `endorsed` values are 1 or 0 only.
- All years are even.
- 14 clippings, all named per `132301_YYYYMMDD.pdf` convention; metadata counts match CSV row counts.

## Stage 2: Spot-check accuracy

The 14 clippings were processed by one subagent that read each PDF directly. Editorial board endorsements were transcribed from "Tomorrow's Elections", "Summing Up", and "The News Prefers" lead editorials.

## Stage 3: Variable coding

All office codes resolved to the standard set. Zero non-standard office codes.

Parties: Democrat (171), Republican (55), Nonpartisan (6), empty (29). The 29 empty-party records are from years (mainly 1960, 1964, 1966) when the printed endorsement list did not include party labels next to candidate names. DIME/Voteview augmentation will backfill.

All names in `LASTNAME, FIRSTNAME` ALL-CAPS format. One record auto-fixed: `KIRKMENDALL, KENNETH A. WESTMORELAND` was misparsed during extraction (Westmoreland is the school district area, not part of the name) -- corrected to `KIRKMENDALL, KENNETH A.` with `dname="Westmoreland"`.

Two no-endorsement placeholder records were cleaned during the JSON pre-compile step (1960 Kennedy "no presidential endorsement made" and 1984 STATE SENATOR 33rd district "seat unfilled, gubernatorial appointment").

## Stage 4: Low-confidence rescan

Only 2 records (<1%) below 0.7:
- 1974 ATTORNEY GENERAL EDMISTEN, RUFUS (0.6) -- low-resolution scan of "The News Prefers" 1974 clipping
- 1978 SCHOOL BOARD KIRKMENDALL, KENNETH A. (0.6) -- the name that was auto-fixed in Stage 3

Both names are plausible North Carolina figures (Rufus Edmisten did serve as NC Attorney General 1975-1985, and Kenneth Kirkmendall was active in Charlotte-Mecklenburg school politics in this era).

## Coverage notes

- Continuous biennial coverage 1960-1984.
- 1964 has two clippings (Oct 31 and Nov 2) -- the Oct 31 piece is a brief primary/candidate roundup, the Nov 2 piece is the full election-day endorsement list.
- The Charlotte News ceased publication in 1985; there are no post-1985 clippings.
- 1972 and 1974 clippings are heavily truncated/low-resolution -- only 5 and 3 candidates extracted respectively. This is a source-quality limitation, not extraction error.
- Editorial format: long-form ARTICLE editorials in the 1960s-70s ("Tomorrow's Elections", "Summing Up"), transitioning to a compact LIST format ("The News Prefers") in 1972 and later.
- The News was the afternoon (PM) sister paper to the Charlotte Observer (AM). They had separate editorial boards and frequently endorsed different candidates -- notably the News endorsed Nixon in both 1968 and 1972 while the Observer was more mixed.
- The 1982 referendum on a "4-3 County Election Plan" was opposed by the News (the lone candidate/prop opposed record in the dataset).

## Issues found and resolved

- 1 name auto-fixed (`KIRKMENDALL, KENNETH A. WESTMORELAND` -> `KIRKMENDALL, KENNETH A.` with dname).
- 2 no-endorsement placeholder records dropped during pre-compile.
- 29 records have empty `party` (no party label printed); flagged for augmentation backfill.
- 2 low-confidence records flagged (1974/1978, low-res source).

## Raw folder housekeeping

The raw/Charlotte News folder contained 64 PDFs that resolved to 27 unique hashes. 14 hashes corresponded to DELUCA-named clippings (processed here). 12 hashes corresponded to misfiled Charlotte Observer clippings (1960/62/64/66/70/72/74/76/82/84/86/88/90 MMDD placeholders matching Observer archive files by SHA-256) -- those were excluded since they belong to newspaper_id 132300. 1 hash was a 4-page CharlotteNews_19681104.pdf bundle covering 1968/1970/1972/1974 News content -- all four dates already covered by individual DELUCA clippings, so the bundle was skipped.
