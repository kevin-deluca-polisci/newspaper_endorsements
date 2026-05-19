# QA Report: Lincoln Journal Star

**Audit date:** 2026-04-21
**Folder:** Lincoln Journal Star 126150
**Newspaper ID:** 126150
**Data coverage:** 1996-2018, 12 clippings, 184 candidate records, 63 proposition records

## Overall Assessment

**PASS WITH FIXES**

Data quality is very strong. Stage 2 spot-check across three years (1996, 2006, 2016) showed 100% substantive accuracy on 67/67 records. Fixes in Stage 3 normalize `state_newspaper`, fill two missing party labels in 1998, and recategorize one proposition. No records required low-confidence re-scan (minimum extraction confidence 0.88).

## Stage 1: Structural Validation

- CSV headers complete (all 16 core candidate columns, all 11 core proposition columns)
- Year range 1996-2018, all valid even years
- No bad `endorsed` values (1/0/empty only)
- `state_election` = "NE" on all rows (100% populated)
- No `newspaper_id` missing
- No incumbency field = "0" errors
- **Fixed:** 184 candidate rows and 63 proposition rows had `state_newspaper = "NE-Lincoln Journal Star"` — auto-normalized to "NE" per the skill's 2-letter convention
- Metadata refreshed after QA.

## Stage 2: Spot Check

**Clippings sampled:**
- `Lincoln_Journal_Star_1996_Endorsements.pdf` (Nov 5, 1996 — 15 candidates + 8 propositions)
- `Lincoln_Journal_Star_Endorsements_2006.pdf` (Nov 7, 2006 — 24 candidates + 9 propositions)
- `DELUCA_NE_LINCOLNJOURNALSTAR_126150_20161108_LIST_1.pdf` (Nov 8, 2016 — 9 candidates + 2 propositions)

**Accuracy:** 67/67 = 100% on substance (name/office/endorsement direction)

- **1996:** 23/23 records correct. All 15 candidates matched perfectly with correct incumbency flags (Clinton d_inc=1, Bereuter r_inc=1). 8/8 propositions correct. Paper's lump coding of the five city charter amendments as a single row is consistent with their "we recommend a vote 'For' on each of the charter amendments" text.
- **2006:** 33/33 records correct. All 24 candidates matched perfectly, all 9 propositions correct. Incumbency flags (Nelson d_inc=1, Fortenberry r_inc=1, Heineman r_inc=1, Gale r_inc=1) all correct.
- **2016:** 11/11 records correct. All 9 candidates and 2 propositions matched perfectly.

**Recommendation:** Strong shape. No re-processing needed. Minor Stage 3 fixes applied.

## Stage 3: Variable Coding & Dedup

**Issues found:** 3 | **Auto-fixed:** 3 | **User-corrected:** 0 | **Remaining:** 0

### Changes made

- **Party fills (2 records):**
  - 1998 HAHN, KENDRA (AUDITOR) → Democrat (she was the D challenger to R incumbent; Kate Witek won as R)
  - 1998 KNAPP, PAT (ATTORNEY GENERAL) → Democrat (D challenger to R incumbent Don Stenberg)
- **Proposition type fix (1 record):**
  - 2000 SCHOOL LEVY OVERRIDE: prop_type "TAX" → "BALLOT MEASURE" (TAX is not in the canonical set; school levy overrides are properly coded as ballot measures)
- **state_newspaper reformatted (184 candidate + 63 proposition rows):** "NE-Lincoln Journal Star" → "NE" per skill convention.
- **Office codes:** All 20 distinct office codes already canonical (PRESIDENT, SENATOR, H, GOVERNOR, ATTORNEY GENERAL, SEC OF STATE, TREASURER, AUDITOR, STATE SENATOR, STATE BOE, REGENT, PSC, NPPD, NRD, CMTY COLLEGE, CNTY COMM, CNTY CLERK, CLERK DC, ASSESSOR, DA/PROSECUTOR). No fixes needed.
- **Candidate names:** All ALL CAPS, LASTNAME, FIRSTNAME format. No fixes.
- **Districts:** No "District"/"Dist." prefixes. No fixes.
- **Proposition types (after TAX fix):** All now in canonical set (AMENDMENT, BALLOT MEASURE, INITIATIVE, BOND, REFERENDUM).
- **Duplicates:** Zero duplicate candidate rows, zero duplicate proposition rows.

## Stage 4: Low-Confidence Re-Scan

**Records reviewed:** 0 | **Confirmed correct:** 0 | **Corrected:** 0 | **Still uncertain:** 0

All extraction_confidence values are at or above 0.88 (range 0.88-0.98, mean 0.93). No records required re-scanning.

## RA-Sourced Records (Will P.)

None. The Will P. xlsx covered pre-merger Lincoln Journal and Lincoln Star; the post-1995 LJS era was not covered.

## Known limitations (non-blocking)

- **Nonpartisan Nebraska offices:** Many state senators (NE Unicameral is nonpartisan), NRD directors, NPPD directors, regents, state BOE members, PSC commissioners, and community college board members have empty party fields. This is correct — these offices are nonpartisan in Nebraska. No fix needed.
- **Local partisan offices:** Some Lancaster County Commissioner, Clerk, and other local partisan offices have empty party fields where the clipping did not specify party. This is an extraction limitation, not a coding error.
