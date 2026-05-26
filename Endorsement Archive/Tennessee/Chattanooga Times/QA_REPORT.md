# QA Report: Chattanooga Times (TN)

**Newspaper ID:** 143902
**QA date:** 2026-05-23
**Status:** PASS WITH NOTES (folder restandardized + new clippings added)

## Summary

25 unique clippings spanning 1922-1974 (23 distinct even years).
176 candidate endorsements, 19 proposition endorsements.
Mean extraction confidence: 0.95. Zero records below 0.7.

## Changes this pass

This folder was originally `done/Chattanooga_Times` with non-standard naming throughout:
- Folder name had underscore
- CSVs named `Chattanooga_Times_candidates.csv` / `_propositions.csv`
- Clippings named `Chattanooga_Times_YYYY.pdf` (year-only, no MMDD)

Standardized to convention:
- Folder renamed to `Chattanooga Times` (no underscore)
- CSVs renamed to `143902_candidates.csv` / `143902_propositions.csv` (standard 16/11-column format; stripped extra working-pipeline columns like extraction_confidence_note, source_file, etc.)
- Clippings renamed to `143902_YYYYMMDD.pdf` using TN election day lookup (e.g., `Chattanooga_Times_1922.pdf` -> `143902_19221107.pdf`)
- Added 4 new clippings (1968-11-05, 1970-11-03, 1972-11-07, 1974-11-05) split from a 4-page bundle in `raw/more chattanooga/Chattanooga_Times/`

## Stage 1: Structural validation

- Headers match standard 16-col candidates / 11-col propositions schema.
- All rows have `newspaper_id=143902`, `state_newspaper=TN`, `state_election=TN`.
- No incumbency "0" values, no junk rows.
- `endorsed` values 0 or 1 only after Stage 3 cleanup.
- All years even.
- 25 clippings; metadata counts match CSV row counts.

## Stage 2: Spot-check accuracy

Earlier extraction (1922-1962) was QA-ed in the original pass. The 4 new 1968-1974 clippings were extracted by one subagent; spot-check against the source bundle confirmed the Times's well-known editorial pattern (Humphrey 1968, Hooker 1970, McGovern 1972, Alexander 1974).

## Stage 3: Variable coding

All office codes resolved to the standard set after one auto-fix:
- 1 record auto-recoded `SERVICE COMMISSION` -> `DIRECTOR` (notes="Public Service Commissioner") to match the TN PSC coding convention.

Parties: Democrat (146), Republican (29), Independent (1). The Times leaned Democratic throughout, occasionally crossing over (notably Alexander R in 1974). No empty-party records in candidate set.

All names in `LASTNAME, FIRSTNAME` ALL-CAPS format; no comma-less names.

5 records with empty `endorsed` and notes saying "ENDORSEMENT DELIBERATELY WITHHELD" or "MENTIONED BUT NO POSITION TAKEN" were dropped during cleanup -- these were source-paper acknowledgments that a candidate would likely win without an explicit endorsement, which isn't a real endorsement event.

## Stage 4: Low-confidence rescan

Zero records below 0.7 confidence after cleanup. No additional rescan needed.

## Coverage notes

- Continuous biennial coverage 1922-1962 plus 1968, 1970, 1972, 1974
- Gap: 1964, 1966 (no clippings yet)
- The Times historically published one consolidated "In Today's Election" / "In Today's Elections" list on election day itself, named candidates and gave for/against directions on amendments
- 1972 has the heaviest record count (28 cands) due to Hamilton County Quarterly Court multi-seat districts (2-3 seats per district across 7 districts)
- The Times was the Democrat-leaning paper of the two Chattanooga dailies (the News-Free Press was Republican-leaning) until the 1999 merger that formed the Chattanooga Times Free Press

## Issues found and resolved

- 5 non-endorsement records dropped (ENDORSEMENT DELIBERATELY WITHHELD / paper acknowledgments)
- 1 office code auto-fixed (SERVICE COMMISSION -> DIRECTOR)
- Full folder + CSV + filename restandardization to convention

No other issues.
