# QA Report: Columbia State (SC)

**Newspaper ID:** 143151
**QA date:** 2026-05-25
**Status:** PASS

## Summary

77 unique clippings spanning 1956-2020 (24 distinct years; gap 1990-1996 and 2000-2002).
160 candidate endorsements, 69 proposition endorsements.
Mean extraction confidence: 0.88. Zero records below 0.7.

## Stage 1: Structural validation

- Headers match standard 16-col candidates / 11-col propositions schema.
- All rows have `newspaper_id=143151`, `state_newspaper=SC`, `state_election=SC`.
- No incumbency "0" values; no junk rows; no empty critical fields.
- `endorsed` values are 1 only for candidates (the 2 anti-endorsement-looking records were actually non-endorsement editorials and were dropped during cleanup). Propositions split 59 YES / 10 NO.
- 77 clippings; metadata counts match CSV row counts.

## Stage 2: Spot-check accuracy

Processed by four parallel subagents (1952-1972, 1974-1978, 1980-1986, 1988-2020). Subagent notes confirm the State's documented endorsement pattern: Byrd "Independent Democrat" slate 1956 (segregationist alternative to Stevenson), Nixon 1960/1972, Reagan 1980/1984, Bush 1988, McCain 2008, Romney 2012, and **Hillary Clinton 2016 (the paper's first Democratic Presidential endorsement in 40+ years)** + Biden 2020. The 1988 anti-Spence editorial ("It's time to change horses in Congress") endorsing Leventis (D) for SC-2 is captured. The 1986 Campbell (R) Governor pick and 2010/2014 Sheheen (D) Governor picks are documented.

## Stage 3: Variable coding

All office codes resolved to the standard set. Zero non-standard codes.

Parties: Republican (85), Democrat (69), Independent (2), empty (4). The R-heavy split reflects the State's historical Republican lean at the federal level — though the 2016 Clinton + 2020 Biden picks plus consistent backing of Sheheen (D) for Governor show the paper's editorial flexibility on individual races.

All names in `LASTNAME, FIRSTNAME` ALL-CAPS format. Zero comma-less names.

## Stage 4: Low-confidence rescan

Zero records below 0.7 confidence after cleanup. No additional rescan needed.

## Coverage notes

- Sparse early coverage (1952-1968: scattered editorials, mostly props)
- Dense 1970-1988 coverage with multiple clippings per cycle (one editorial per race)
- Gap: no clippings 1990, 1992, 1994, 1996, 2000, 2002, 2018
- Modern (2004-2020) coverage typically one composite election-day editorial per cycle
- 1976 has the heaviest record count (23 candidates) — full county council/state senate slate

The State endorsed:
- 1956: Byrd "Independent Democrat" slate (segregationist alternative)
- 1960, 1972: Nixon (R)
- 1980, 1984: Reagan (R)
- 1988, 2004: Bush (R)
- 2008: McCain (R)
- 2012: Romney (R)
- **2016: Hillary Clinton (D)** — broke ~60-year Republican Presidential pattern
- 2020: Biden (D)

## Issues found and resolved

- 0 office code recodes
- 0 name fixes
- 2 non-endorsement placeholder records dropped during cleanup (1978 Agriculture Commissioner where editorial was undecided; 2012 Lexington Council where note indicated paper backed incumbent against the named candidate)
- 0 low-conf records remain
- 4 empty-party records (small enough to be augmentation backfill)

## Raw folder housekeeping

The raw/COLUMBIA STATE folder contained 307 PDFs that resolved to 78 unique hashes:
- 75 DELUCA-named clippings (processed here)
- 2 standalone orphans with real endorsement content (`Columbia_State_oct_27_1984.pdf` covering the 1984 SC spending cap amendment, and `Columbia_State_nov_5_1988 copy.pdf` covering the 1988 Leventis-for-Congress editorial). Both share dates with existing DELUCA clippings but are different scans/editorial pieces — kept as `_v1` versions alongside the DELUCA originals.
- 1 Wikipedia reference PDF (`143151_NoneMMDD_version89.pdf`) — used for metadata (founded 1891 by N.G. and A.E. Gonzales; acquired Columbia Record 1945; Knight Ridder 1986; McClatchy 2006; Chatham Asset 2020), skipped from extraction.

Total: 77 unique clippings processed.
