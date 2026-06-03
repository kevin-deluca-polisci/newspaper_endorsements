# QA Report: Chattanooga Free Press

**Audit date:** 2026-04-28
**Folder:** Chattanooga Free Press
**Newspaper ID:** 143900
**Data coverage:** 1936 only, 1 clipping, 4 candidate records, 0 proposition records

## Overall Assessment

**PASS**

This is the pre-merger Chattanooga Free Press (Republican-leaning paper that operated 1936-1939 before merging with the Chattanooga News in 1939 to form the News-Free Press). Only one election year (1936) had a clipping in the source folder. Newspaper ID 143900 comes from the GS lookup. All 4 candidate records are high-confidence (0.92-0.95) with strong, unambiguous editorial endorsements.

## Stage 1: Structural Validation

- CSV headers complete (16 candidate columns + pipeline fields, 11 proposition columns)
- Year: 1936 only (single clipping)
- All `endorsed` values valid (1/0/empty)
- Clipping `143900_19361103.pdf` follows standardized naming
- All `newspaper_id` populated as `143900`
- All `state_newspaper` and `state_election` populated as `TN`
- No incumbency `=0` errors
- No structural issues

## Stage 2: Spot Check

**Clippings sampled:** `143900_19361103.pdf` (Nov 3, 1936 — 4 candidates) — only clipping in folder.

**Accuracy:** 4/4 = 100%

The Free Press's 1936 editorial is one of the strongest endorsement editorials in the Chattanooga corpus. The paper devoted its entire editorial page to endorsing Alf Landon over FDR ("Vote for Alf Landon next Tuesday") and William Hilleary (R) over the Democratic incumbent McReynolds in the 3rd Congressional District ("the most abject yes man of them all"). The OCR captured the editorial cleanly and all 4 records are high-confidence.

The Free Press's editorial position is also a striking contrast with the same-day Chattanooga News editorial (which favored FDR and the Democratic ticket). This documents the genuine political split between the two pre-merger Chattanooga papers — the Free Press leaned Republican under Roy McDonald's ownership while the News leaned Democratic. The merger in 1939 carried forward the Free Press's editorial stance.

**Recommendation:** No corrections needed.

## Stage 3: Variable Coding & Dedup

**Issues found:** 0 | **Auto-fixed:** 0 | **User-corrected:** 0 | **Remaining:** 0

- **Office codes:** PRESIDENT and H — both canonical.
- **Candidate names:** All 4 in ALL CAPS, LASTNAME, FIRSTNAME format.
- **Districts:** McReynolds and Hilleary correctly coded as `dist=3` (Tennessee 3rd Congressional District). No "District"/"Dist." prefix issues.
- **Party labels:** Republican, Democrat — both canonical.
- **Incumbency flags:** FDR `d_inc=1` and McReynolds `d_inc=1` — both correctly marked as Democratic incumbents. No `=0` errors.
- **Dedup:** Only 4 records and no duplicates.

## Stage 4: Low-Confidence Re-Scan

**Records reviewed:** 0 | **Confirmed correct:** 0 | **Corrected:** 0 | **Still uncertain:** 0

All records carry confidence 0.92 or higher. No low-confidence records to re-scan.

## Coverage notes (non-blocking)

- **Single-year coverage:** The Free Press only operated 1936-1939 (the original folder contained one Free Press clipping from 1936 in the `Chattanooga_Free_Press/` subfolder; subsequent years 1937-1939 were not in the source). The Free Press's editorial board carried forward into the merged News-Free Press starting 1939, so post-1939 endorsements appear under newspaper_id 143901.
- **No propositions:** The 1936 clipping focused entirely on the presidential race and the 3rd District House race. No proposition endorsements present.
- **Editorial consistency check (cross-paper):** The same-day Chattanooga News (143903) clipping endorsed FDR (implicit), Browning (D Governor), and McReynolds (D inc 3rd) — all directly opposed by the Free Press. This is preserved as a genuine editorial split between the two papers; see CROSS_PAPER_CHECK_CHATTANOOGA.md for the detailed comparison.
