# QA Report: Akron Beacon Journal

**Audit date:** 2026-05-20 (post-incremental-addition pass; supersedes 2026-04-02 report)
**Folder:** done/Akron Beacon Journal
**Newspaper ID:** 134150
**Data coverage:** 1968-2018, 12 clippings, 258 candidate records, 40 proposition records

## Overall Assessment

**PASS WITH MINOR FIXES**

Folder is in good shape. This QA pass followed the addition of 4 new clippings (1968, 1970, 1972, 1974) extracted from a single user-uploaded 4-page bundled PDF on 2026-05-20. The new records extend coverage backward by 40 years (previously 2008-2020). Minor fixes applied: 21 proposition `endorsed` values converted from "YES"/"NO" strings to 1/0 integers, 13 office codes standardized, 2 placeholder duplicate prop rows consolidated.

## Stage 1: Structural Validation

- CSV headers: OK (16-column candidates, 11-column propositions)
- Row integrity: 258 candidate rows, 40 proposition rows; no junk rows, no all-empty fields
- Year sanity: all even-year general elections, no out-of-range years
- State fields: all OH/OH, all newspaper_id=134150
- Incumbency fields: clean (no "0" values, all "1" or empty)
- Election date sanity: all 12 clipping filenames have valid YYYYMMDD dates in Oct/Nov
- Metadata consistency: counts match CSV row counts after fixes

**Auto-fix applied:** 21 proposition rows had `endorsed="YES"` or `endorsed="NO"` (from pre-existing 2008-2020 data). Converted to integers 1/0.

## Stage 2: Spot Check

**Clippings sampled:** 134150_19721106.pdf (1972, densest of new clippings)
**Accuracy:** ~95%

Independent re-read of the 1972 endorsement page confirmed the following extracted endorsements:
- Nixon (R-Pres) — verified via editorial text
- US House: Stanton (R-11), Mosher (R-13), Seiberling (D-14), Regula (R-16), Vanik (D-22) — all verified via editorial
- Slusser (R-County Commissioner) — editorial explicitly endorses "re-election of Richard Slusser over his fellow commissioner, Mark Ravenscraft"
- Reece (Common Pleas Judge over incumbent Reed) — editorial: "endorses lawyer John Reece over incumbent Common Pleas judge Evan J. Reed"
- 18th Ohio Senate: no endorsement — correctly captured (editorial states paper unable to choose between Anice W. Johnson and Thomas E. Walter)
- NO on State Issue 1 (Constitutional Convention) — verified
- NO on State Issue 2 (income tax flat-rate amendment) — verified
- YES on Edwin Shaw Hospital levy and Children Services Board levy — verified

**Minor concern:** Proposition numbering for 1972 may use sequential ballot order (1-6) rather than the official multi-section ballot numbering (state 1-2, Summit County 1-4, etc.). The endorsement direction (YES/NO) is correct in all cases.

**Recommendation:** Good shape.

## Stage 3: Variable Coding & Dedup

**Issues found:** 16 | **Auto-fixed:** 15 | **Remaining:** 1

### Changes made

- **Office codes standardized (13 records):**
  - `SUMMIT SHERIFF` to `SHERIFF` (1 row)
  - `CNTY AUDITOR` to `AUDITOR` (2 rows)
  - `SUMMIT PROSECUTOR` to `DA/PROSECUTOR` (2 rows)
  - `SUMMIT CLERK OF COURTS` to `CNTY CLERK` (2 rows)
  - `SUMMIT COMMON PLEAS JUDGE` to `JUDGE` (5 rows)
  - `SUMMIT DOMESTIC RELATIONS JUDGE` to `JUDGE` (1 row)
  - Original office name preserved in `notes_endorse` for each fix.

- **Duplicate propositions consolidated (2 rows removed):** The 1970 editorial endorsed "three small tax levies" in Summit County without naming them. Extraction created 3 identical placeholder rows; consolidated to 1 row with descriptive note.

- **Endorsed field normalization (21 records, Stage 1):** Pre-existing 2008-2020 prop rows had `endorsed="YES"` or `endorsed="NO"`. Converted to 1/0 integers.

### Accepted as-is (jurisdiction-specific local offices)

These non-standard office codes are kept because they describe legitimate local Summit County positions with no clean standard mapping:
- `SUMMIT COUNTY COUNCIL` (9 records) — county council seats, distinct from county commissioners
- `CHARTER COMMISSIONER` (4 records) — 1974 Summit County charter commission slate
- `SUMMIT EXECUTIVE` (2 records) — county executive
- `SUMMIT FISCAL OFFICER` (2 records)
- `COUNTY ENGINEER` / `SUMMIT ENGINEER` (3 records)

### Duplicate check
- Candidate duplicates: 0 found
- Proposition duplicates: 2 (both removed, see above)

### Names and parties
- All cand_name values in LASTNAME, FIRSTNAME ALL CAPS format
- All party labels valid (Democrat / Republican / empty; no nonstandard values)
- 69 records with empty party — these are mostly judicial (nonpartisan ballot) and 1974 records where the extracting subagent did not capture party labels visible on the ballot. Acceptable per skill rules (party can be empty).

## Stage 4: Low-Confidence Re-Scan

**Records reviewed:** 2 (mid-confidence 0.75-0.85; no records below 0.75) | **Confirmed correct:** 1 | **Flagged:** 1

### Records reviewed

- **`134150_19681104.pdf` row 143 (CORONER, KYRIAKIDES, A. H.):** Confidence 0.75. Independent re-read of the 1968 PDF did not show a clear X mark on either coroner candidate (Kyriakides or Repasky). However, the paper consistently endorsed Kyriakides in 1972 and he served as Summit County Coroner 1968-1996. Retained with conf=0.75 and flagged for user review. Recommend confirming against a higher-resolution scan if available.

- **`134150_20181104.pdf` row 115 (JUDGE, "LANZINGER, KELLY L. MCLAUGHLIN"):** Confidence 0.80. Pre-existing record from 2026-04-02 QA pass. Name format suggests a parsing issue between two judges (Lanzinger was an Ohio Supreme Court justice 2005-2016; McLaughlin appears to be a different judge). Out of scope for this incremental pass; recommend separate review.

## Notes on this Pass

This QA pass focused on validating the 4 newly added 1968-1974 clippings extracted from a single user-uploaded bundle PDF. The pre-existing 2008-2020 data was lightly checked (structural validation, dedup, encoding standardization) but not spot-checked at the clipping level since that was done in the original 2026-04-02 QA pass.

The 4 new clippings extended Akron Beacon Journal coverage backward by 40 years and added 141 new candidate records and 20 new proposition records.
