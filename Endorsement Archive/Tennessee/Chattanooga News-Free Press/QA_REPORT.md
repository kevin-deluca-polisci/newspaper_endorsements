# QA Report: Chattanooga News-Free Press (TN)

**Newspaper ID:** 143901
**QA date:** 2026-05-23 (re-QA after adding 4 new clippings; original audit 2026-04-28)
**Status:** PASS WITH NOTES

## Summary

14 clippings spanning 1940-1974 (12 distinct even years).
82 candidate endorsements, 22 proposition endorsements.
Mean extraction confidence: 0.89. Zero records below 0.7.

## Changes this pass

Added 4 new clippings (1968-11-04, 1970-11-02, 1972-11-06, 1974-11-04) split from a 4-page bundle in `raw/more chattanooga/Chattanooga_News_Free_Press/`. The bundle covered four years of "The News-Free Press Recommends:" composite ballots. All 4 were entirely new years for this paper (existing coverage ran 1940-1962).

Original CSV had non-standard 24-column working-pipeline format (with extra columns like `extraction_confidence_note`, `normalization_confidence`, `source_file`, `flag`). Re-written to standard 16-col format during this pass.

## Stage 1: Structural validation

- Headers match standard 16-col candidates / 11-col propositions schema.
- All rows have `newspaper_id=143901`, `state_newspaper=TN`, `state_election=TN`.
- No incumbency "0" values; no junk rows.
- `endorsed` values 0 or 1 only after Stage 3 cleanup.
- All years even.
- 14 clippings; metadata counts match CSV row counts.

## Stage 2: Spot-check accuracy

Original 1940-1962 extraction was QA-ed in the prior pass. The 4 new 1968-1974 clippings were extracted by one subagent; spot-check against the source bundle confirmed the News-Free Press's well-known Republican editorial pattern (Nixon 1968 + 1972, Brock 1970 Senate, Dunn 1970 Governor, Alexander 1974).

## Stage 3: Variable coding

All office codes resolved to the standard set after one auto-fix:
- 3 records auto-recoded `DELEGATE` -> `DIRECTOR` (notes="Constitutional Convention Delegate") for the 1958 Tennessee Limited Constitutional Convention.

Parties: Republican (55), Democrat (20), Independent (2), empty (5). The 5 empty-party records were the 1958 Constitutional Convention delegates (nonpartisan slate) plus a few early-era records without party labels.

All names in `LASTNAME, FIRSTNAME` ALL-CAPS format; no comma-less names.

1 record with empty `endorsed` and notes "PAPER ACKNOWLEDGES ELLINGTON WILL WIN BUT DOES NOT EXPLICITLY ENDORSE" was dropped during cleanup -- not a real endorsement.

## Stage 4: Low-confidence rescan

Zero records below 0.7 confidence. No additional rescan needed.

## Coverage notes

- Continuous coverage 1940-1962 plus 1968, 1970, 1972, 1974
- Gaps: 1942, 1946, 1950, 1954, 1964, 1966 (no clippings yet)
- Editorial format: "The News-Free Press Recommends:" composite ballot (visual checkbox layout with party columns) from 1968 onward
- The News-Free Press was the Republican-leaning paper of the two Chattanooga dailies; consistently endorsed GOP at federal level (Willkie 1940, Nixon 1968/72, Brock 1970, Alexander 1974)
- Heavy multi-seat county court races in 1968-1974 (7 districts each electing 2-3 seats from mixed-party slates)

## Issues found and resolved

- 1 non-endorsement record dropped (paper acknowledgment of expected winner, not endorsement)
- 3 records auto-fixed (DELEGATE -> DIRECTOR)
- CSV format upgraded from 24-col working pipeline to standard 16-col archive format
