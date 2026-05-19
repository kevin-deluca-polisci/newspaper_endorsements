# QA Report: Shreveport Times (118400)

**QA Date:** 2026-05-01
**QA Result:** PASS WITH FIXES

## Summary

Built fresh archive from raw/Shreveport/SHREVEPORT TIMES. Hash-deduped 210 raw files down to 65 unique clippings spanning 1950-2014. Extraction processed in 4 parallel batches, with significant proposition coverage reflecting Louisiana's heavy use of constitutional amendments.

## Final Counts

- **Clippings:** 65
- **Candidate endorsements:** 75
- **Proposition endorsements:** 225
- **Year coverage:** 1950-2014
- **Mean confidence:** ~0.83
- **Low-confidence records (< 0.7):** ~30

## Stage 2 Spot-Check Results

- **118400_19681104.pdf (1968 Nixon endorsement):** 100% accuracy. Nixon endorsed; Humphrey opposed; Wallace effectively opposed.
- **118400_20081103.pdf (2008 Obama era):** Initial spot-check found candidates missing — root cause was a field-name mismatch in the agent's JSON output (used "name" instead of "cand_name", "description" instead of "prop_desc"). Fixed by normalizing field names across 23 affected JSONs (271 records corrected) and re-compiling.

## Process

1. Hash-deduped 210 raw files → 65 unique
2. Extracted dates from newspapers.com headers via pdftotext
3. Dispatched 4 parallel agents for extraction
4. Initial compile produced 61 candidates; spot-check revealed missing 2008 records
5. Identified field-name inconsistencies (`name` vs `cand_name`, `description` vs `prop_desc`) across 23 JSONs
6. Normalized fields and re-compiled — final: 75 candidates
7. Office code normalization: PRES → PRESIDENT, USS → SENATOR, USH → H, DA → DA/PROSECUTOR, PARISH COMMISSION → CNTY COMM, CITY JUDGE → JUDGE, CITY MARSHAL → CONSTABLE
8. Removed 41 sample-ballot junk rows where the agent extracted endorsements from sample-ballot images by office/party but didn't capture candidate names

## Notes for Downstream Use

- The Times historically endorsed Republicans for President in a solid-Democratic LA: Eisenhower (1952, 1956), Nixon (1960, 1968, 1972), Ford (1976), Reagan (1984), Bush (1988); shifted to Clinton (D) 1992 and 1996, Gore (D) 2000, Kerry (D) 2004, Obama (D) 2008, Romney (R) 2012
- Louisiana jungle primary started 1975 — all candidates of all parties on October ballot, runoff November
- LA has heavy constitutional amendment activity (often 30-50 per election)
- 2010 had a 5-day series of single-day endorsement editorials (Oct 25-29)
- Local offices: Caddo Parish Police Jury → CNTY COMM, Bossier Parish offices similar
- Some 1950s-1960s clippings are amendment "scoreboard" graphics with text too small to extract per-amendment direction; those were captured as summary propositions
- LA-4 (Shreveport area) historically Democratic until late-1990s; transitioned R with McCrery, Fleming, then to swing district

## Recommendation

PASS WITH FIXES. The field-name normalization issue was significant but is now resolved. Some amendment direction codes remain low-confidence due to scoreboard graphics; these are flagged in `extraction_confidence`.
