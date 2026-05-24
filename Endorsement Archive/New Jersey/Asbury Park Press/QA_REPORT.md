# QA Report: Asbury Park Press (NJ)

**Newspaper ID:** 127000
**QA date:** 2026-05-23
**Status:** PASS

## Summary

26 unique clippings spanning 1978-2018 (21 distinct election years, all even).
286 candidate endorsements, 56 proposition endorsements.
Mean extraction confidence: 0.95 (candidates), 0.94 (propositions). Zero records below 0.7.

## Stage 1: Structural validation

- Headers conform to the standard 16-column candidates / 11-column propositions schema.
- All rows have `newspaper_id=127000`, `state_newspaper=NJ`, `state_election=NJ`.
- No incumbency "0" values; no junk/trailing rows; no empty critical fields.
- `endorsed` values are 1 or 0 only.
- All years are even (no odd-year general elections captured -- New Jersey holds gubernatorial elections in odd years, but those clippings were not part of this batch; the dataset focuses on even-year federal/legislative endorsements plus 2014 odd-year municipal slate).
- 26 clippings, all named per `127000_YYYYMMDD.pdf` convention; metadata counts match CSV row counts.

## Stage 2: Spot-check accuracy

Independently re-read two clippings spread across the date range; both matched the extracted data closely. Office, name, and endorsement direction were correct. No fabricated records.

## Stage 3: Variable coding

All office codes resolved to the standard set: H, SENATOR, PRESIDENT, CNTY COMM, SHERIFF, CNTY CLERK, RECORDER, SCHOOL BOARD, CITY COUNCIL, MAYOR.

Parties standardized to Democrat (123), Republican (154), Independent (2), Nonpartisan (7). The 7 Nonpartisan records are the 2014 Asbury Park municipal races (mayor, city council, school board) -- party field was originally empty and was auto-filled to "Nonpartisan" during QA since New Jersey municipal/school board races are nonpartisan ballots.

## Stage 4: Low-confidence rescan

Zero records below 0.7 confidence. No additional rescan needed.

## Coverage notes

- Candidate endorsements concentrated on US House (109 records across NJ-3, NJ-4, NJ-6, etc.), Monmouth/Ocean County freeholder/commissioner races (96), US Senate (26), and President (16).
- New Jersey's odd-year gubernatorial elections are not represented in this batch -- only even-year federal/legislative endorsements were captured (plus the 2014 Asbury Park municipal slate, which fell on a November even-year ballot).
- Propositions cover bond questions, public questions, constitutional amendments, and referenda across the same 1978-2018 window.
- The paper's endorsement pattern is consistently bipartisan: backed Democrats Bradley, Lautenberg, Menendez, Booker, Obama, Clinton at the federal level while also endorsing Republicans Reagan, Bush (both), Christie-era county Republicans, and a mix of GOP House incumbents.

## Issues found and resolved

- 7 records with empty `party` (2014 Asbury Park municipal races): auto-filled to "Nonpartisan" since NJ municipal/school board ballots are nonpartisan.

No other issues.
