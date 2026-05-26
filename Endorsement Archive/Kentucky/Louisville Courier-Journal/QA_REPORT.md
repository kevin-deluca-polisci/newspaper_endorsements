# QA Report: Louisville Courier-Journal (KY)

**Newspaper ID:** 117400
**QA date:** 2026-05-25
**Status:** PASS

## Summary

55 unique clippings spanning 1960-1990 (16 distinct years).
192 candidate endorsements, 43 proposition endorsements.
Mean extraction confidence: 0.89. Only 3 records below 0.7.

## Stage 1: Structural validation

- Headers match standard 16-col candidates / 11-col propositions schema.
- All rows have `newspaper_id=117400`, `state_newspaper=KY`, `state_election=KY`.
- No incumbency "0" values; no junk rows; no empty critical fields.
- `endorsed` values are 1 only for candidates (paper used "we endorse" pattern; the 2 anti-endorsement-flavored records were dropped as non-endorsement placeholders). Propositions split 39 YES / 4 NO.
- 55 clippings; metadata counts match CSV row counts.

## Stage 2: Spot-check accuracy

Processed by three parallel subagents (1960-1968, 1970-1982, 1982-1990). The CJ's documented strong Democratic-leaning pattern at federal level shows up cleanly:
- **Kennedy 1960, LBJ 1964, Humphrey 1968, McGovern 1972, Carter 1976/80, Mondale 1984, Dukakis 1988** — a perfect 8-for-8 Democratic Presidential endorsement streak across the captured period
- Mazzoli (D) for KY-3 consistently endorsed throughout 1970s-90s
- Heavy Jefferson County School Board coverage — 42 records

## Stage 3: Variable coding

All office codes resolved to the standard set. Zero non-standard codes.

Parties: Democrat (118), Republican (12), empty (62). The 10:1 Democrat:Republican ratio confirms the paper's documented Democratic-leaning editorial stance under the Bingham family ownership (1918-1986). The 62 empty-party records are concentrated in nonpartisan judicial races (KY judges run nonpartisan), Jefferson County School Board, KY local offices (PVA, county clerk), and a few early-era records without party labels.

All names in `LASTNAME, FIRSTNAME` ALL-CAPS format. Zero comma-less names.

## Stage 4: Low-confidence rescan

3 records (1.6%) below 0.7 — all from 1988-1990 KY/IN state-level records with possible name confusion:
- 1988 IN Governor "GRIFFIN, JOHN MUTZ" (0.6) — looks like a garbled merge of John Mutz (R Gov candidate) and a Lt Gov running mate; flagged for review
- 1990 KY State House "CLARKE, GERTA BENDL" (0.6) — Gerta Bendl was a real KY state rep; "Clarke" may be maiden name confusion
- 1990 KY State House "MAZZOLI, MARY" (0.5) — name uncertain; could be misread of a Louisville-area state rep

Records flagged but kept in dataset; augmentation merge against DIME/Voteview may help disambiguate.

## Coverage notes

- Continuous biennial coverage 1960-1990 (16 election years)
- Each year typically has 3-6 clippings (one per major-race editorial in the week before election)
- 1972 has the heaviest record count (23 candidates) — full master endorsement list
- 1990 has 15 candidates + 9 propositions — heavy late-Bingham-era ballot recap
- Heavy school board coverage characteristic of CJ-era civic engagement on Louisville/Jefferson education policy
- Also includes Indiana races (Senator, House, Governor) since Louisville's media market extends into Southern Indiana — coded with `state_election=KY` per the newspaper's home state convention; `dname=IN` flag marks IN-specific races

## Issues found and resolved

- 0 office code recodes
- 0 name fixes
- 0 incumbency "0" fixes
- 2 non-endorsement placeholder records dropped (1978 Snyder critique without endorsement + 1990 Indiana Coats "not endorsed" marker)
- 3 low-confidence records flagged but retained (1988/1990 IN+KY state-level name uncertainties)
- 41 candidate + 6 proposition dedup catches across overlapping pre-election/election-day master-list clippings

## Raw folder housekeeping

The raw/LOUISVILLE COURIER JOURNAL folder contained 224 PDFs that resolved to 56 unique hashes:
- 55 DELUCA-named clippings (processed here)
- 1 Wikipedia reference PDF (`The Courier-Journal - Wikipedia`) — used for metadata context (founded 1868, Bingham 1918-1986, Gannett 1986+, Pulitzer history), skipped from extraction

Total: 55 unique clippings processed.
