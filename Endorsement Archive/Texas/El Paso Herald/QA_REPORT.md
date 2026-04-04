# QA Report: El Paso Herald (1284)

**Audit date:** 2026-04-04
**Folder:** done/El Paso Herald
**Newspaper ID:** 1284
**Data coverage:** 1920, 2 clippings, 0 candidate records, 3 proposition records

## Overall Assessment

PASS WITH FIXES

Very small folder with only 3 proposition records from 2 clippings. All data is accurate. The only fixes were improving generic proposition descriptions to specific ones based on clipping content and bumping confidence scores after confirming the clipping is clearly legible.

## Stage 1: Structural Validation

- **CSV columns:** OK. Both candidates (16 columns, header only) and propositions (11 columns) have all expected fields.
- **Row integrity:** All 3 proposition rows pass. Year 1920 (valid even year), endorsed=1 for all, confidence within range, state codes valid.
- **Candidates CSV:** Header only, 0 data rows. Confirmed legitimate — the 1920 clippings contain no candidate endorsements.
- **Election date sanity:** Both clipping dates (Oct 29, Nov 1) are in the expected Oct-Nov range.
- **Metadata consistency:** Counts match (0 candidates, 3 propositions).
- **Newspaper ID:** 1284 populated in all rows.

No issues found.

## Stage 2: Spot Check

**Clippings sampled:** Both — 1284_19201029.pdf and 1284_19201101.pdf (100% coverage)
**Accuracy:** 100%

- **1284_19201029.pdf (Oct 29):** News article about Republican vote gains in New Mexico counties. Not an endorsement editorial. No endorsements to extract — consistent with 0 candidate records from this clipping.
- **1284_19201101.pdf (Nov 1):** Editorial titled "The Three Amendments" urging voters to vote FOR all three constitutional amendments on the ballot. Independently extracted 3 propositions, all FOR. Matches CSV exactly.

No missing endorsements. No extra records. No field errors.

**Recommendation:** Good shape.

## Stage 3: Variable Coding & Dedup

**Issues found:** 3 | **Auto-fixed:** 3 | **User-corrected:** 0 | **Remaining:** 0

### Changes made

- **Proposition descriptions improved (3 records):** Replaced generic descriptions with specific content from the clipping:
  - Amendment 1: "CONSTITUTIONAL AMENDMENT 1" → "PERMITS RURAL COMMUNITIES TO TAX THEMSELVES FOR PUBLIC BUSINESS"
  - Amendment 2: "CONSTITUTIONAL AMENDMENT 2" → "REMOVES RESTRICTIONS ON SCHOOL DISTRICT TAXATION FOR SCHOOL MAINTENANCE"
  - Amendment 3: "CONSTITUTIONAL AMENDMENT 3" → "FIXED SALARIES FOR PUBLIC OFFICERS IN LIEU OF FEE SYSTEM"

All other coding verified correct: state fields (TX), prop_type (CONSTITUTIONAL AMENDMENT), endorsed values (1), newspaper_id (1284). No duplicates.

## Stage 4: Low-Confidence Re-Scan

**Records reviewed:** 3 (all at 0.75, technically at threshold) | **Confirmed correct:** 3 | **Corrected:** 0 | **Still uncertain:** 0

All 3 records were at the 0.75 threshold. The Nov 1 clipping is clearly legible with unambiguous endorsement language. Bumped all 3 to 0.85.

## Notes

The El Paso Herald (1881-1931) is a distinct publication from the El Paso Herald-Post (1931-1997). These 1920 clippings were originally misfiled under the Herald-Post but have been correctly separated. Only 2 clippings exist for this paper; additional Herald issues from the 1920s may contain more endorsements but have not been collected.
