# QA Report: Dallas Morning News (TX)

**Newspaper ID:** 145050
**QA date:** 2026-05-23
**Status:** PASS

## Summary

39 unique clippings spanning 2012-2022 (5 distinct years).
155 candidate endorsements, 10 proposition endorsements.
Mean extraction confidence: 0.95. Zero records below 0.7 after one auto-fix.

## Stage 1: Structural validation

- Headers match standard 16-col candidates / 11-col propositions schema.
- All rows have `newspaper_id=145050`, `state_newspaper=TX`, `state_election=TX`.
- No incumbency "0" values; no junk rows; no empty critical fields.
- `endorsed` values are 1 only (DMN consistently writes "we recommend X" without explicit oppositions).
- All years even.
- 39 clippings; metadata counts match CSV row counts.

## Stage 2: Spot-check accuracy

Processed by three parallel subagents across batches (2012-early 2022, Oct 2022 early, Oct 2022 late). Spot-check confirmed the digital-era one-race-per-editorial format. The 2016 Hillary Clinton Presidential endorsement (the DMN's first Democratic Presidential endorsement since 1940) appears in the data, as does the 2022 mixed-party slate (O'Rourke D for Governor; Hegar R for Comptroller; all three R-incumbent TX Supreme Court justices).

## Stage 3: Variable coding

All office codes resolved to the standard set. Zero non-standard codes.

Parties: Republican (83), Democrat (68), Nonpartisan (4). No empty-party records (digital-era endorsement editorials consistently print party affiliations). The mix reflects DMN's well-documented practice of crossing party lines on a race-by-race basis rather than backing a single party's slate.

All names in `LASTNAME, FIRSTNAME` ALL-CAPS format. Zero comma-less names. One name auto-fixed: `PRICE, THERESA DANIEL` (a misparse from the 2020 Dallas County Commissioner D1 race) -> `DANIEL, THERESA` with `d_inc=1` flagged as incumbent.

15 "no recommendation" placeholder records were dropped during pre-compile cleanup -- these were cases where the paper explicitly declined to recommend either candidate in a race (e.g., TX SD-2 Bob Hall, TX-3 Keith Self, TX-4 Pat Fallon, TX-24 Beth Van Duyne, Dallas County Court of Law No. 1 D'Metria Benson). These are not real endorsement events.

## Stage 4: Low-confidence rescan

Zero records below 0.7 confidence after the one auto-fix. No additional rescan needed.

## Coverage notes

- 2012: 1 clipping (Oct 8) -- Romney for President + general slate
- 2016: 3 clippings (Sep 7) -- all the same Hillary Clinton Presidential endorsement, published across multiple sources; deduped to 1 record
- 2018: 1 clipping (Sep 7) -- large 61-candidate composite slate (O'Rourke D for Senate, Abbott R for Governor, etc.)
- 2020: 2 clippings (Feb 16 + Oct 13) -- Feb editorial announced the paper would NOT endorse a President in 2020; Oct slate had Cornyn R for Senate + DISD Bonds A-E
- 2022: 32 clippings (Feb 6 primary non-endorsement, March 7 / April 24 / Oct 2-24) -- one-race-per-editorial format with a composite recap on Oct 24

Notable historical facts captured in the data:
- DMN's 2016 Hillary endorsement broke a 76-year Republican Presidential streak (last D endorsement 1940)
- DMN explicitly declined to recommend a President in 2020 and 2022 (no Senate race in TX in 2022 either)
- 2022 general election shows a mixed-party pattern: O'Rourke D for Gov, Collier D for Lt Gov, Garza D for AG, but Hegar R for Comptroller, all three R justices for TX Supreme Court

## Issues found and resolved

- 1 name auto-fixed (`PRICE, THERESA DANIEL` -> `DANIEL, THERESA` + incumbent flag).
- 15 "no recommendation" placeholder records dropped during pre-compile.
- All 33 dedup keys correctly identified duplicate records across the 2018/2020 large composite slates vs. the per-race October editorials (so a single endorsement isn't double-counted).

## Raw folder housekeeping

The raw/DALLAS MORNING NEWS folder contained 179 files (mix of PDF, JPG, PNG) that resolved to 39 unique hashes -- all 39 had DELUCA canonical names. The non-DELUCA files were all duplicate copies. 8 JPG/PNG files were converted to PDF via img2pdf during folder setup so the clippings folder is uniformly PDF.

No other issues.
