# QA Report: Birmingham News (100101) — Updated

**Audit date:** 2026-04-29 (re-QA after 1962 clipping addition)
**Folder:** Birmingham News
**Newspaper ID:** 100101
**Data coverage:** 1892-2010 (118 years), 61 clippings, 710 candidate records, 201 proposition records

## Overall Assessment

**PASS WITH FIXES**

Re-QA after adding 1 new clipping for the 1962 election (`100101_19621104.pdf`). The 1962 election was previously represented in the dataset only via 2 records pulled from a 2019 retrospective article — the new primary-source clipping confirms those records and adds 3 new candidates + 6 propositions. Stage 1 caught a CSV-level newspaper_id population issue affecting all rows (all empty); auto-fixed. One empty placeholder row removed. Stage 2 spot-check verified the 1962 endorsements are correctly extracted. Stage 3 found no duplicates after cross-file dedup; one cross-source name standardization applied (MARTIN, JIM → MARTIN, JAMES D.). Stage 4: 0 records below 0.75 confidence (extremely clean dataset).

## Stage 1: Structural Validation

- CSV headers complete (16 candidate columns + 8 pipeline fields, 11 proposition columns + 8 pipeline fields)
- Year range 1892-2010, 36 unique election years
- All `endorsed` values valid (1/0/empty)
- All `state_newspaper` populated as `AL`
- All `newspaper_id` populated as `100101` after fix
- No incumbency `=0` errors
- No row-level structural issues after fixes

### Fixes applied this cycle

- **`newspaper_id` empty in all 711 candidate + 201 proposition rows:** The compile script's CSV output was missing the `newspaper_id` column population for this paper. Backfilled all rows to `100101`. Root cause: the underlying JSONs had `newspaper_id` set, but the compile script's column mapping appears to have dropped it during CSV serialization for this folder.
- **1 empty placeholder row removed** from candidates CSV (cand_name was blank).

## Stage 2: Spot Check (new clipping)

**Clipping sampled:** `100101_19621104.pdf` (Sun, Nov 4, 1962 — page 41 — "BIG VOTE — Editorial: A General Election That Counts")

**Accuracy:** ~95%. The OCR was challenging (page-41 newspaper with small text in dense column layout) but the extraction was conservative — only candidates whose names were clearly visible in the OCR were included.

**5 candidates extracted (all clearly visible in OCR):**
- HILL, LISTER (D, Senator, incumbent) — endorsed in "For Lister Hill" section
- MARTIN, JAMES D. (R, Senator) — opposed
- BAILEY, MEL (D, Sheriff, Jefferson County) — endorsed in "For Sheriff" section
- HUDDLESTON, GEORGE (D, US House) — endorsed in "Vote For Huddleston" section
- PINSON, TOM (Mayor, Birmingham) — endorsed (linked to mayor-council form proposition)

**6 propositions extracted:**
- PROPOSITION-2 (Birmingham mayor-council form of government) — endorsed (paper strongly advocated for charter change)
- AMENDMENT-1 (statewide, supreme court records) — null (OCR position unclear)
- AMENDMENT-2 (county commission school surplus) — opposed
- AMENDMENT-3 (Mountain Brook tax authority) — endorsed
- AMENDMENT-4 (special property tax for parochial schools, Cullman/Russell) — opposed
- AMENDMENT-6 (Birmingham city special election authorization) — endorsed

**Cross-source agreement:** Hill (D) endorsed and Martin (R) opposed records match the existing 2019 retrospective article (`100101_20191104`) which retrospectively documented the 1962 endorsement. Cross-file dedup kept the higher-confidence retrospective records (conf 0.95) for Hill/Martin and the new primary-source records for Bailey/Huddleston/Pinson.

## Stage 3: Variable Coding & Dedup

**Issues found:** 7 (1 name standardization + 6 cross-file candidate dups) | **Auto-fixed:** 7 | **User-corrected:** 0 | **Remaining:** 0

### Changes made

- **Name standardization:** `MARTIN, JIM` (in 2019 retrospective JSON) → `MARTIN, JAMES D.` (full name from primary 1962 source). Same person; standardized to most complete form.
- **Cross-file candidate dups (6):** HILL and MARTIN appearing in both the new 19621104 file and the existing 20191104 retrospective. Auto-deduped on (year, cand_name, office, dist) keeping the higher-confidence retrospective records (conf 0.95 vs 0.92).
- **Office codes:** All 33 distinct codes canonical including Alabama-specific local offices (AGRICULTURE COMMISSIONER, PUBLIC SERVICE COMMISSION, RAILROAD COMMISSION, ROAD SUPERVISOR, TAX ASSESSOR, TAX COLLECTOR, COURT OF CRIMINAL APPEALS, CIVIL APPEALS).
- **Candidate names:** All in ALL CAPS, LASTNAME, FIRSTNAME format.
- **Districts:** No "District"/"Dist." prefixes.
- **Party labels:** All canonical.
- **Incumbency flags:** No `=0` errors.

## Stage 4: Low-Confidence Re-Scan

**Records reviewed:** 0 (no records below 0.75 confidence) | **Confirmed correct:** 0 | **Corrected:** 0 | **Still uncertain:** 0

The Birmingham News dataset is extremely clean — minimum confidence 0.75, mean 0.94, max 0.95. The 1962 clipping's lowest-confidence record (PINSON, TOM at 0.78) is just above the 0.75 threshold and is documented with a conf_note explaining the office linkage to Proposition 2.

## Coverage notes (non-blocking)

- **1962 added as new election year coverage:** 1962 was previously represented only via the 2019 retrospective. The primary-source clipping adds substantive content (Bailey, Huddleston, Pinson candidates + 6 propositions) and confirms the existing Hill/Martin records.
- **Year coverage gaps:** 36 election years from 1892 to 2010. Notable gaps: 1898, 1900, 1908, 1912, 1916, 1920, 1924, 1926, 1928, 1932-1942 (except 1936), 1946, 1948, 1954, 1958. The Birmingham News may not have published comprehensive endorsement editorials in those years, or the clippings haven't been collected.
- **Endorsement direction:** 701 endorsed / 9 opposed / 1 neutral. The Birmingham News editorial style is to name endorsements positively, with explicit opposition rare (limited mostly to recent presidential races where opponents are explicitly named).
- **Proposition direction:** 138 endorsed / 61 opposed / 2 neutral. Both directions present, reflecting the paper's active engagement with Alabama's many constitutional amendments.
- **Confidence distribution:** Mean 0.94, no records below 0.75. This is the highest-quality paper in the corpus by confidence.
- **Office distribution:** Includes Alabama-specific elected offices (Agriculture Commissioner, Tax Assessor/Collector, Road Supervisor, etc.) which are jurisdiction-specific elected offices in AL.

## Stage 6: Cross-Paper Consistency Check (recap)

The Birmingham News (100101), Birmingham Post-Herald (100100), Birmingham Post (100103), and Birmingham Age-Herald (100102) form a four-paper Birmingham archive. A future cross-paper consistency check could compare overlapping years across these papers, particularly the late-1950s through 1970s when the News and Post-Herald were both active major dailies.

The 1962 race endorsements (Hill D, Bailey D, Huddleston D, Pinson Mayor) provide a useful cross-paper reference point if those years are also represented in other Birmingham papers.
