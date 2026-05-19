# QA Report: Lincoln Star

**Audit date:** 2026-04-21
**Folder:** Lincoln Star 126152
**Newspaper ID:** 126152
**Data coverage:** 1970-1994, 18 clippings, 202 candidate records, 84 proposition records

## Overall Assessment

**PASS WITH FIXES**

Data quality is strong. Stage 2 spot-check across three years (1970, 1982, 1994) showed 97.8% substantive accuracy. Fixes in Stage 3 normalized `state_newspaper`, filled in missing party labels for partisan-office rows, added one missing proposition (1970 Amendment 12), and recoded one misclassified proposition (1970 Amendment 13). Stage 4 reviewed the two conf=0.60 records and confirmed they are correctly coded.

## Stage 1: Structural Validation

- CSV headers complete (all 16 core candidate columns, all 11 core proposition columns)
- Year range 1970-1994, all valid even years
- No bad `endorsed` values (1/0/empty only)
- `state_election` = "NE" on all rows (100% populated)
- No `newspaper_id` missing
- No incumbency field = "0" errors
- **Fixed:** 202 candidate rows and 83 proposition rows had `state_newspaper = "NE-Lincoln Star"` — auto-normalized to "NE" per the skill's 2-letter convention
- Metadata refreshed after QA.

## Stage 2: Spot Check

**Clippings sampled:**
- `LINCOLN_STAR_1970_ENDORSEMENTS.pdf` (Oct 27, 1970 — 18 candidates + 16 propositions)
- `Lincoln_Star_1982_Endorsements.pdf` (Nov 1, 1982 — 19 candidates + 14 propositions)
- `Lincoln_Star_1994_Endorsements.pdf` (Nov 8, 1994 — 36 candidates + 2 propositions)

**Accuracy:** 89/91 = 97.8% on substance (name/office/endorsement direction)

- **1970:** 32/34 records correct. All 18 candidates matched perfectly. Propositions 14/16: Amendment 12 ("State aid to private school students," paper took "No position") was missing; Amendment 13 was coded endorsed=1 but the paper opposed the first two sections and only favored the third section (net position opposed). Both fixed in Stage 3.
- **1982:** 33/33 substantively correct (19 candidates + 14 propositions). Three candidates (Douglas AG, Orr Treasurer, Naumann Auditor) had empty party fields; Douglas 1982 missing r_inc=1. Fixed in Stage 3.
- **1994:** 38/38 substantively correct (36 candidates + 2 propositions). Steinman (CNTY COMM dist 1) had empty party despite clipping showing "(D)"; Wolfe had empty `dist` where clipping showed "at large." Fixed in Stage 3.

**Recommendation:** Good shape. Targeted fixes applied in Stage 3.

## Stage 3: Variable Coding & Dedup

**Issues found:** 16 | **Auto-fixed:** 16 | **User-corrected:** 0 | **Remaining:** 0

### Changes made

- **Party fills (9 records):** Filled missing party based on clipping text and candidate history:
  - 1978 Fowler, Marilyn (H-3) → Democrat (challenger to Virginia Smith)
  - 1978 Beermann, Allen J. (SEC OF STATE) → Republican
  - 1978 Douglas, Paul (ATTORNEY GENERAL) → Republican
  - 1982 Douglas, Paul (ATTORNEY GENERAL) → Republican
  - 1982 Orr, Kay (TREASURER) → Republican
  - 1982 Naumann, Darl (AUDITOR) → Republican
  - 1994 Steinman, Linda (CNTY COMM dist 1) → Democrat
  - 1980 Will P. RA rows: Exon (SENATOR), Dyas (H-1), Cavanaugh (H-2), Fowles (H-3) → all Democrat
- **Incumbency flag (1 record):** Douglas, Paul 1982 ATTORNEY GENERAL → `r_inc=1` (incumbent AG since 1979).
- **District fill (1 record):** Wolfe, Carl 1994 NRD `dist=""` → `dist=AT-LARGE` per clipping.
- **state_newspaper reformatted (202 candidate + 83 proposition rows):** "NE-Lincoln Star" → "NE" per skill convention.
- **Office codes:** All 27 distinct office codes already canonical (PRESIDENT, SENATOR, H, GOVERNOR, LT GOVERNOR, ATTORNEY GENERAL, SEC OF STATE, TREASURER, AUDITOR, STATE SENATOR, STATE BOE, REGENT, PSC, RAILWAY COMM, NPPD, OPPD, NRD, CMTY COLLEGE, SHERIFF, CNTY COMM, CNTY CLERK, CLERK DC, RECORDER, ASSESSOR, DA/PROSECUTOR, PUBLIC DEFENDER, WEED CONTROL AUTH). No fixes needed.
- **Candidate names:** All in ALL CAPS, LASTNAME FIRSTNAME format. No fixes.
- **Districts:** No "District"/"Dist." prefixes. No fixes.
- **Proposition types:** All in canonical set (AMENDMENT, BALLOT MEASURE, INITIATIVE, BOND, REFERENDUM). No fixes.
- **Duplicates:** Zero duplicate candidate rows. "Duplicate" proposition keys (e.g., 1974 AMENDMENT #1-#3 and 1970/1978 blank-num BALLOT MEASURE/INITIATIVE) are legitimate — city-charter vs state constitutional amendments on the same ballot sharing numbers, and multiple city/county ballot measures without numbers. Kept as-is.

### Additions from Stage 2 spot-check

- **1970 Amendment 12 added (1 record):** "State aid to private school students." Endorsement coded as empty (paper took "No position"). Note flags QA-added provenance.
- **1970 Amendment 13 recoded (1 record):** Previously endorsed=1; clipping shows paper opposed sections 1 and 2 (remove LT GOV as presiding officer, team election with GOV) and favored only the third section. Net recoded as endorsed=0 with note documenting the split position.

## Stage 4: Low-Confidence Re-Scan

**Records reviewed:** 2 | **Confirmed correct:** 2 | **Corrected:** 0 | **Still uncertain:** 0

- **1984 HERRINGTON, FRED (NPPD dist 1) & TREVES, JANE P. (NPPD dist 1), conf=0.60 each:** Re-read the 1984 Lincoln Star clipping. Paper wrote: "SUBDIVISION 1, Nebraska Public Power District — Both Fred Herrington and Jane P. Treves highly qualified." No endorsement direction was given. Current coding (both as endorsed='' with explanatory notes) is correct. Low confidence was justified by extraction ambiguity, not extraction error.

All other extraction_confidence values are at or above 0.75 (overall range 0.60-0.98, mean 0.91).

## RA-Sourced Records (Will P.)

Five candidate records in this CSV came from the Will P. xlsx rather than direct clipping extraction. They are flagged in `notes_endorse` with "FROM WILL P. XLSX (RA-CODED); NOT EXTRACTED FROM CLIPPING":

- 1980 EXON, JIM (SENATOR, D)
- 1980 DYAS, HESS (H dist=1, D)
- 1980 CAVANAUGH, JOHN J., III (H dist=2, D)
- 1980 FOWLES, MARILYN (H dist=3, D) — note Will used "FOWLES" spelling; clipping extraction used "FOWLER"
- 1986 CAMPELL, KATHY (CNTY COMM dist=4) — note spelling from Will P; likely Kathy Campbell

These fill 1980 federal races not found in existing clippings and one 1986 county commission race.

## Known limitations (non-blocking)

- **Partisan county offices:** Many Lancaster County Commissioner, Sheriff, Treasurer, and other partisan offices were extracted without party labels (the clippings often listed candidate names without party annotation). This is a known extraction limitation, not a coding error. Downstream augmentation (DIME/CFscores) can fill these in via candidate-level party lookups.
- **Senate non-endorsements:** 1982 clipping explicitly offered "No endorsement" for Senate; this is not recorded as a row (consistent with coding practice — only endorsed/opposed candidates recorded, not non-endorsements by office).
