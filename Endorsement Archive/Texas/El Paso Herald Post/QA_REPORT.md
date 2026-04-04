# QA Report: El Paso Herald Post (145301)

**Audit date:** 2026-04-04 (second QA pass after gap-fill extraction)
**Folder:** done/El Paso Herald Post
**Newspaper ID:** 145301
**Data coverage:** 1934-1996, 44 clippings, 168 candidate records, 132 proposition records

## Overall Assessment

PASS WITH FIXES

The folder is in excellent shape after the gap-fill extraction work. One missing presidential endorsement (Nixon 1968) was found during the spot-check and added. All variable coding is clean. Two low-confidence records were confirmed via re-scan and bumped slightly. No duplicates, no structural issues. The earlier QA pass (2026-04-03) identified and fixed 38 issues; this second pass found the data in much better condition.

## Stage 1: Structural Validation

- **CSV columns:** OK. Both candidates (16 columns) and propositions (11 columns) have all expected fields.
- **Row integrity:** All 168 candidate rows and 132 proposition rows pass validation. No invalid years, no bad endorsed values, no confidence values out of range, no junk rows.
- **state_newspaper / state_election:** All populated with valid 2-letter codes. No empty or invalid values.
- **Incumbency fields:** No erroneous "0" values found.
- **Election date sanity:** All 44 clippings fall within Oct/Nov date range.
- **Metadata consistency:** Counts match between metadata and CSV (updated after fix).
- **Newspaper ID:** Populated in all rows (145301).

No issues found.

## Stage 2: Spot-Check Endorsement Accuracy

**Clippings sampled:**
1. `145301_19581031.pdf` (1958 - "The Bad Ones" - propositions)
2. `145301_19681104.pdf` (1968 - "We Are Not Impressed" - candidates + propositions)
3. `145301_19941105.pdf` (1994 - "Our picks on Tuesday's ballot" - candidates)

**Accuracy:** 62/63 = 98.4%

### Clipping 1: 1958 propositions (Oct 31)
Article identifies 5 "bad" propositions (Amendments 1, 2, 4 and Bond Issues 5, 6). All 19 proposition records for 1958 in the CSV are correct. **19/19 correct.**

### Clipping 2: 1968 candidates + propositions (Nov 4)
Independent extraction identified 7 candidates. CSV had 6 - **missing Nixon 1968 PRESIDENT**. The clipping clearly states the Herald-Post and Scripps-Howard endorsed Nixon. Added the missing record. Propositions: 14 amendments match perfectly (FOR all except 7, 10, 12, 13). Name check: "MUNIZ, RAUL" confirmed as correct spelling per TX records. **20/21 correct (1 missing, now fixed).**

### Clipping 3: 1994 candidates (Nov 5)
Clear ballot-style format with check marks. All 23 endorsed candidates match the CSV exactly. **23/23 correct.**

**Recommendation:** Good shape. One missing record found and added.

## Stage 3: Variable Coding & Dedup

**Issues found:** 0 | **Auto-fixed:** 0 | **User-corrected:** 0 | **Remaining:** 0

No corrections needed in this pass. All office codes use standard abbreviations (26 distinct codes, all valid). All candidate names in ALL CAPS LASTNAME, FIRSTNAME format. Party labels: 103 Democrat, 52 Republican, 13 empty -- all valid. No duplicates. No incumbency errors. All proposition descriptions in ALL CAPS. District fields properly formatted.

Note: The first QA pass (2026-04-03) applied 38 fixes including 12 dedup removals, 3 name corrections, 6 office code standardizations, and 17 dname/dist cleanup operations. Those fixes remain in place.

## Stage 4: Low-Confidence Re-Scan

**Records reviewed:** 2 | **Confirmed correct:** 2 | **Corrected:** 0 | **Still uncertain:** 0

- **1936 Amendment 5** (conf 0.70 -> 0.75): Re-read `145301_19361031.pdf`. Confirmed "The Six Amendments" section discusses all 6 favorably. Position (FOR) is correct. Bumped to 0.75.
- **1936 Amendment 6** (conf 0.70 -> 0.75): Same source. Confirmed correct. Bumped to 0.75.

### Corrections applied

- 1936 Amendment 5: confidence 0.70 -> 0.75 (structure confirmed)
- 1936 Amendment 6: confidence 0.70 -> 0.75 (structure confirmed)
- 1968 PRESIDENT: Added missing record for NIXON, RICHARD M. (Republican), endorsed=1, conf 0.90

## Confidence Distribution (current)

- **Candidates:** Min 0.75, Max 0.90, Mean 0.85
- **Propositions:** Min 0.75, Max 0.90, Mean 0.84

## Data History

- **2026-04-03:** Initial compilation from legacy xlsx + clipping extraction. First QA pass applied 38 fixes.
- **2026-04-03:** Systematic gap-fill added 102 proposition records + 2 candidate records from clipping review.
- **2026-04-04:** Second gap-fill pass added 13 more proposition records (1952, 1954) from previously unextracted clippings.
- **2026-04-04:** This QA pass added 1 missing candidate (Nixon 1968 PRESIDENT), confirmed 2 low-confidence records.

## Remaining Known Issues

1. **Party identification gaps:** Several records have empty party fields or "CAN'T FIND PARTY ID" notes (local candidates where party was not listed in endorsement).
2. **Proposition gaps verified as legitimate:** Years 1938, 1974, 1992, 1994, 1996 have clippings but no proposition endorsements (candidates-only content confirmed by clipping review).
3. **Candidate gaps verified as legitimate:** Years 1934, 1938, 1940 have clippings but no candidate endorsements (proposition/editorial content only, confirmed by clipping review).
