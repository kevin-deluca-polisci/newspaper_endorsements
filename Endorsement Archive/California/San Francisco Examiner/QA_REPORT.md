# QA Report: San Francisco Examiner

**Audit date:** 2026-04-14
**Folder:** San Francisco Examiner
**Newspaper ID:** 104252
**Data coverage:** 1944-1988, 24 clippings (23 JSONs), 1102 candidate records, 679 proposition records

## Overall Assessment

PASS WITH FIXES

The Examiner's 44-year endorsement dataset (1944-1988) is comprehensive and highly accurate. The primary structural issue was that 858 candidate rows and 485 proposition rows had empty year, state_newspaper, newspaper, and state_election fields because the extraction JSONs for 1960-1988 lacked election_date values. Years were recovered by parsing the JSON filenames (format: 104252_YYYYMMDD). Office codes and party labels were standardized to pipeline conventions. One party label was corrected from a newspaper typo. The apparent "duplicate" problem (327 candidates, 346 propositions) was entirely an artifact of the empty year fields and resolved once years were populated. Spot-check accuracy was ~100%.

## Stage 1: Structural Validation

- CSV columns: all expected columns present in both candidates and propositions CSVs
- Row integrity: no junk rows found
- state_newspaper: was empty in 858 candidate rows and 485 proposition rows; auto-filled to "CA"
- newspaper: was empty in 858 candidate rows and 485 proposition rows; auto-filled to "San Francisco Examiner"
- year: was empty in 858 candidate rows and 485 proposition rows (JSONs from 1960-1988 had no election_date); derived from JSON filenames (e.g., 104252_19601107 -> 1960)
- state_election: was empty in 521 candidate rows and 485 proposition rows; auto-filled to "CA"
- dname: was empty in 1075 candidate rows; auto-filled to "San Francisco"
- newspaper_id: correctly populated as "104252" in all rows
- Incumbency "0" values: none found
- No odd-year elections (all even years as expected)
- Year range: 1944-1988, 22 election years for candidates, 23 for propositions (includes 1946 propositions-only)

## Stage 2: Spot Check

**Clippings sampled:** 104252_19561105.pdf (1956 general), 104252_19781106.pdf (1978 general)
**Accuracy:** ~100%

1956 spot-check: "The Examiner Recommends" list. All 45 candidates matched exactly: President (Eisenhower), Vice President (Nixon), Senator (Kuchel), 13 Congress, 4 State Senate, 21 State Assembly, 1 Court of Appeals (Kaufman), 1 Supreme Court (McComb), 2 Board of Education. The Superior Court race was correctly excluded (Examiner said "both candidates qualified" without endorsing either). All 27 propositions (8 city, 19 state) matched in number, description, and YES/NO direction, including 4 "NO" votes (Props 4, 7, 10, 18).

1978 spot-check: 76 candidates and 24 propositions confirmed. Full statewide slate (Governor Brown, AG Deukmejian as notable cross-party pick), 13 Congress, 7 State Senate, 18 Assembly, 4 Supreme Court confirmations (including Rose Bird), 3 Board of Ed, 3 Community College, 15 Charter Commission, 4 BART directors, plus Assessor and Public Defender. Lt. Governor "No recommendation" and 3 Congress "No recommendation" races correctly absent. City Props A-X (16 items including grouped L-S) and State Props 1-8 all matched. One note: the Appellate Court 1st District had a blanket endorsement of "the nine justices appearing on the ballot" without listing names -- this was reasonably excluded from extraction since no individual names were provided.

**Recommendation:** Good shape.

## Stage 3: Variable Coding & Dedup

**Issues found:** 737 | **Auto-fixed:** 736 | **QA-corrected:** 1 | **Remaining:** 0

### Changes made

- **Office codes standardized (114 records):** COMMUNITY COLLEGE -> COMMUNITY COLLEGE DISTRICT (3), COMMUNITY COLLEGE BOARD -> COMMUNITY COLLEGE DISTRICT (24), COURT OF APPEAL -> COURT OF APPEALS (44), SECRETARY OF STATE -> SEC OF STATE (9), SUPERINTENDENT OF PUBLIC INSTRUCTION -> SUPERINTENDENT (2), SUPERVISOR -> BOARD OF SUPERVISORS (31), SUPT PUBLIC INSTRUCTION -> SUPERINTENDENT (1)
- **Party labels standardized (622 records):** D -> Democrat (374), R -> Republican (247), I -> Independent (1)
- **Duplicates resolved (0 actual):** The 327 candidate and 346 proposition "duplicates" identified in pre-QA diagnosis were entirely an artifact of empty year fields. Once years were populated from JSON filenames, zero true duplicates remained. The apparent duplicates were the same candidates appearing across different election years (e.g., an incumbent endorsed in 1960, 1962, and 1964).

## Stage 4: Low-Confidence Re-Scan

**Records reviewed:** 1 below 0.75 threshold | **Confirmed correct:** 0 | **Corrected:** 1 | **Still uncertain:** 0

### Corrections applied

- `104252_19621105.json`: RUMFORD, WILLIAM B. in STATE REP Dist 17 (conf=0.70 -> 0.90) -- newspaper listed party as (R)* but William Byron Rumford was a Democrat. Confirmed from 4 other clippings (1956, 1958, 1960, 1964) where he is consistently listed as Democrat. Party corrected from Republican to Democrat. This was a newspaper typo in the original 1962 endorsement list.
