# QA Report: Des Moines Tribune (115151)

**Audit date:** 2026-04-29
**Folder:** Des Moines Tribune
**Newspaper ID:** 115151
**Data coverage:** 1952-1980 (14 election years), 25 clippings, 8 candidate records, 18 proposition records

## Overall Assessment

**PASS**

The Tribune (an evening companion to the Des Moines Register, published 1908-1982) had a relatively narrow editorial scope in the available clippings: heavy on local Polk County / Des Moines ballot questions (bonds, charter amendments, swimming pools, fire stations, courthouse repairs) with only a few candidate endorsements (1952 President, 1960 Hospital Trustees, 1968 + 1976 Sheriff).

## Stage 0: Folder Organization

- 25 unique-content PDFs organized from a multi-folder source (DES MOINES TRIBUNE/ + DES MOINES TRIBUNE 1/ + top-level files in `raw/Des Moines Endorsements/`)
- 27 byte-identical and content-overlapping duplicates removed
- All renamed to standard `115151_YYYYMMDD[_vN].pdf` format
- Multi-file dates: 1954 (3 days, separate articles for county home / swimming pool / courthouse), 1966 (4 articles, 2 unique topics: Services Center bond + public housing)

## Stage 1: Structural Validation

- CSV headers complete (16 candidate columns + pipeline fields, 11 prop columns + pipeline fields)
- Year range 1952-1980, 14 unique election years, all even
- All `endorsed` values valid (1/0/empty)
- All `state_newspaper`/`state_election` populated as `IA`
- All `newspaper_id` populated as `115151`
- No incumbency `=0` errors
- Confidence mean 0.918, min 0.85 (clean OCR for clippings used)

## Stage 2: Spot Check

Verified extractions on:
- `115151_19521031.pdf`: Eisenhower for President — clearly endorsed via "The Eisenhower Promise" editorial. Independent OCR re-read confirms.
- `115151_19581031.pdf`: $375,000 fire stations bond — YES. Independent OCR re-read confirms.
- `115151_19601031.pdf`: 3 Republican candidates (Moore, Brown, Selden) for Broadlawns Hospital Trustees
- `115151_19681030.pdf`: Townsend, Arthur (R) for Polk County Sheriff. Independent OCR re-read confirms.
- `115151_19761028.pdf`: Dick Clemens (R inc) for Polk County Sheriff over Bob Rice (D)
- `115151_19801101_v2.pdf`: NO on constitutional convention, YES on Iowa ERA

**Spot-check accuracy: 6/6 records matched (100%).**

## Stage 3: Variable Coding & Dedup

**Issues:** 0. All clean.

### Office codes (3 distinct)

- PRESIDENT (1)
- HOSPITAL TRUSTEE (4: 3 endorsed + 1 opposed for 1960 Broadlawns) — local office, accepted as-is per skill convention
- SHERIFF (3: 2 endorsed + 1 opposed for 1968 Townsend & 1976 Clemens/Rice)

### Party labels & names

Republican (6), Democrat (2). All names ALL CAPS in `LASTNAME, FIRSTNAME` format. 0 name format issues.

### State, incumbency, dedup

- `state_newspaper` = IA, `state_election` = IA in all 8 candidate rows and all 18 proposition rows.
- 0 incumbency `=0` errors. `endorsed`: 6 endorsed, 2 opposed.
- 0 candidate duplicates, 0 proposition duplicates.

### Cross-file dedup

5 of 25 parts JSONs are marked as duplicate-content (same editorial appearing on multiple days):
- 1960 v2 = same Broadlawns editorial as v1
- 1966 v3 (19661104) = same Services Center editorial as v1 (19661101_v4)
- 1966 v4 (19661107) = same public housing topic as v1 (19661102)
- 1976 v2 = same sheriff editorial as v1
- 1980 v2 (19801103) = same conv/ERA editorial as v1 (19801101_v2)

## Stage 4: Low-Confidence Re-Scan

**Records reviewed:** 0 candidate records below 0.85, 0 propositions below 0.85. Cands mean 0.902, min 0.88; props mean 0.926, min 0.85. No re-scan needed.

## Final dataset summary

### Candidates (8 records, 4 election years)

- 1952: Eisenhower, Dwight (R) — President — endorsed
- 1960: Moore, J. Milton (R), Brown, Philip A. (R), Selden, Marvin R. (R) — Broadlawns Hospital Trustees — endorsed
- 1960: Champion, Doyle (D inc) — Broadlawns Hospital Trustee — opposed
- 1968: Townsend, Arthur (R) — Polk County Sheriff — endorsed
- 1976: Clemens, Dick (R inc) — Polk County Sheriff — endorsed; Rice, Bob (D) — opposed

### Propositions (18 records, 11 election years)

- 1954: NO on county home (mental patients) bond; YES on east side swimming pool; YES on courthouse tax levy
- 1956: YES on county parks/conservation board
- 1958: YES on $375k fire stations bond
- 1962: YES on Polk Courthouse repairs
- 1966: YES on $850k Central Services Center bond; YES on 850 low-rent public housing units
- 1970: YES on Southeast Bottoms public housing; YES on annexation
- 1972: NO on both cable TV franchise bidders (Athena and Hawkeye)
- 1974: opposed county office building; opposed Vets Auditorium expansion
- 1978: YES on lodging tax; YES on $10.6M new jail bond
- 1980: NO on constitutional convention; YES on Iowa Equal Rights Amendment

## Coverage notes

- The Des Moines Tribune ceased publication in 1982. Final clipping in archive is 1980.
- Editorial focus skewed heavily toward local Polk County / Des Moines ballot questions rather than candidate endorsements (the Register had broader candidate-endorsement coverage during the same period).
- 1964 file (`115151_19641103.pdf`) is media commentary about national newspaper endorsement statistics; the Tribune did not state its own presidential endorsement in this clipping.
