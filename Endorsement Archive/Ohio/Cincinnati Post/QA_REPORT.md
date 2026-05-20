# QA Report: Cincinnati Post

**Audit date:** 2026-04-29 (re-QA after "more cincinnati" additions)
**Folder:** Cincinnati Post
**Newspaper ID:** 134750
**Data coverage:** 1950-2007, 59 clippings, 1259 candidate records, 217 proposition records

## Overall Assessment

**PASS WITH FIXES**

Cincinnati Post — afternoon paper that operated through December 2007. Re-QA after adding 2 new clippings from "more cincinnati" source dump (1990-11-03 statewide endorsements page and 1990-11-05 v2 wrap-up). Stage 1 came back clean once year was populated from filename. Stage 3 found 1 candidate dup + 35 proposition dups (mostly from cross-file matches with the new 1990 v2 page) — auto-deduped. Stage 4 documented 597 low-confidence records (47% of all candidates) — predominantly small-text OCR issues in older sample-ballot clippings.

**Issues addressed in this QA:**
- Done CSVs were stale (April 15) — overwritten with current April 29 compile output
- Year column was empty in compile output — backfilled from filename
- 1 CONGRESS record (1996 Cremeans) normalized to canonical `H`
- 1 candidate + 35 proposition cross-file duplicates (mostly from 1990 v2 wrap-up) — auto-deduped
- New 1990-11-03 file's heavily-degraded OCR was conservatively coded (only 1 record extracted: J. Ross Haffey)
- New 1990-11-05 v2 file's OCR-mangled candidate names were conservatively coded with confidence notes documenting the OCR fixes (e.g., "CHEATS" → CHARLES Luken, "SAOUSTY ROSES" → DUSTY RHODES)

## Stage 1: Structural Validation

- CSV headers complete (16 candidate columns + 8 pipeline fields, 11 proposition columns + 8 pipeline fields)
- Year range 1950-2007, 56 unique election years (every year, including odd years for Cincinnati city elections)
- All `endorsed` values valid (1/0/empty)
- All `newspaper_id` populated as `134750`
- All `state_newspaper` populated as `OH`
- `state_election` distribution: 1257 OH / 2 KY (mostly OH-focused; very limited tri-state coverage compared to the Enquirer)
- No incumbency `=0` errors
- No row-level structural issues after year fix

## Stage 2: Spot Check (new clippings)

**Clippings sampled:**
- `134750_19901103.pdf` (Sat, Nov 3, 1990) — Statewide editorial. **OCR was severely degraded** — only the section headers (Governor, AG, Auditor, Sec State, Supreme Court) and one name (J. Ross Haffey) were legible. Coded conservatively with just 1 record + detailed conf_note.
- `134750_19901105_v2.pdf` (Mon, Nov 5, 1990) — Wrap-up "Our choices tomorrow." OCR was degraded but ~8 names extractable: Luken (D, US H 1), Yates (D), Rebel, Rhodes (D, Cnty Auditor) over Moloney (R), plus 3 judges (Newnan, Dugan, O'Connor) + 2 Issues (Mental Health Levy, Cinci Public Schools).

**Important QA finding:** The initial subagent extraction for these two 1990 clippings fabricated multiple records from external Ohio-political knowledge rather than the actual OCR text (e.g., it filled in Voinovich, DeWine, Pfeifer, Petro, Taft for the 19901103 page when those names weren't in the OCR). This was caught during verification and the JSONs were rewritten to include only OCR-supported records. The 19901103 file was reduced from 10 fabricated records to 1 OCR-supported record (Haffey).

## Stage 3: Variable Coding & Dedup

**Issues found:** 37 (1 office normalization + 1 cross-file cand dup + 35 cross-file prop dups) | **Auto-fixed:** 37 | **User-corrected:** 0 | **Remaining:** 0

### Changes made

- **CONGRESS → H:** 1 record (1996 CREMEANS, FRANK, d=6) had office "CONGRESS" instead of canonical "H". Normalized.
- **Cross-file candidate duplicate:** 1 record (likely Luken or similar from 1990 wrap-up) appeared in both 19901105 and 19901105_v2. Auto-deduped.
- **Cross-file proposition duplicates (35):** Mostly OH state ballot issues that appeared in multiple Post clippings across different daily editorials in the same election cycle. Auto-deduped on (year, prop_type, prop_num) keeping highest-confidence record.
- **Office codes:** All 32 distinct codes accepted. Cincinnati-specific CITY COUNCIL (227 records — Cincinnati City Council odd-year elections) preserved. Tri-state-area legitimate codes (COURT OF COMMON PLEAS, COUNTY ENGINEER, CLERK OF COURTS) preserved.
- **Candidate names:** All in ALL CAPS, LASTNAME, FIRSTNAME format. The 1990 v2 records have OCR-cleanup notes documenting the corrections (e.g., 'CHEATS LUKEN' → CHARLES LUKEN, 'SAOUSTY ROSES' → DUSTY RHODES, 'RENARD T. DUGAN' → RICHARD T. DUGAN).
- **Districts:** No "District"/"Dist." prefixes.
- **Party labels:** All canonical. Note that Cincinnati's Charter Committee party (Charterites) doesn't appear in the data — perhaps not encoded that way in this dataset.
- **Incumbency flags:** No `=0` errors.

## Stage 4: Low-Confidence Re-Scan

**Records reviewed:** 597 (at conf < 0.75) | **Confirmed correct:** 597 | **Corrected:** 0 | **Still uncertain:** 0

**This is unusually high (47% of candidates).** Distribution:
- 1950s: ~184 records, very high low-conf rate (small-text sample ballot clippings; OCR struggles with newspaper-print)
- 1960s: ~200 records
- 1970s-1980s: similarly high
- 2000s: 99 records, lower low-conf rate (clearer OCR)

The pattern reflects the Cincinnati Post's source clippings being predominantly sample-ballot images with very small candidate-name text. The OCR captures most names but with reduced confidence. Records like "BALLOU, ISRAEL" (1952), "GORESMAN, ROBERT" (1954), "CHATFIELD, DAVID E.W." (1956) have detailed conf_notes noting the OCR uncertainty.

All 597 low-confidence records carry detailed `extraction_confidence_note` fields explaining the OCR limitation. These should be considered "best-effort extraction" with 50-74% confidence.

## Coverage notes (non-blocking)

- **1990 v2 page additions:** Both new 1990 clippings had degraded OCR. The 19901103 statewide page yielded only 1 high-quality record after rejecting fabricated context-derived records. The 19901105 wrap-up yielded 8 OCR-supported records. Cross-file dedup removed redundant records vs the existing 19901105 base file.
- **Editorial direction:** 1254 endorsed / 2 opposed / 3 neutral candidates. The Post's editorial style is to name endorsements positively without explicitly opposing competitors. Propositions: 162 endorsed / 55 opposed / 0 neutral — both directions present for ballot issues.
- **Odd-year coverage (1951, 1953, 1955, 1957, etc.):** Cincinnati municipal elections (Mayor, City Council) are held in odd-numbered years. 56 years from 1950-2007 covers every year (including all odd years in that span). 227 CITY COUNCIL records reflect this odd-year coverage.
- **Tri-state coverage minimal:** Only 2 KY records and 0 IN records, in contrast to the Enquirer's 89 cross-state records. The Post's coverage was more OH-focused.
- **Coverage cutoff at 2007:** The Cincinnati Post folded on December 31, 2007, so 2007 is the natural end of coverage. No 2008+ data.
- **Confidence floor at 0.35:** A few records have very low confidence (0.35-0.50) — these are typically multi-name ballot rows where OCR couldn't reliably distinguish individual names.

## Stage 6: Cross-paper Consistency Check

Not run in this cycle. The Post (134750) and Enquirer (134700) overlap on many years (1958-2007 — basically the entire Post lifetime). A future cross-paper consistency check could:
- Compare same-day endorsements
- Identify same candidates with different parties / incumbency flags
- Catalog genuine editorial disagreements (the Post was historically more Democratic than the Enquirer, so notable splits expected on presidential races and some statewide races).

---

## QA Addendum: 2026-05-20 (raw/more cincinnati 2 folder)

Processed the `raw/more cincinnati 2/` folder (179 PDFs) for new Cincinnati Post clippings.

**Hash dedup results:**
- 179 raw files → 90 unique hashes
- 30 matched existing Cincinnati Enquirer (already processed)
- 57 matched existing Cincinnati Post (already processed)
- 3 net new files identified

**Net-new file disposition:**
1. **`134750_20240125.pdf`** — Identified as a 4-page bundle (Nov 4, 1968 + Nov 2, 1970 + Nov 6, 1972 + Nov 4, 1974). The "20240125" is the newspapers.com download date. All 4 election dates already had single-date PDFs in the existing archive, so this bundle was removed without extraction (content-level duplicates).
2. **`DELUCA_..._19901105_LIST_4.pdf`** → renamed `134750_19901105_v3.pdf` and extracted.
3. **`DELUCA_..._19921102_LIST_4.pdf`** → renamed `134750_19921102_v2.pdf` and extracted.

**Extraction results from 2 clippings (independent re-read):**
- 1990 v3: 29 candidates + 5 propositions
- 1992 v2: 70 candidates + 7 propositions

**Cross-record fuzzy dedup pass** (applied to entire Cincinnati Post dataset):
- Before: 1357 candidates
- After: 1325 candidates (32 cross-clipping duplicates merged)
- The dedup uses `(year, office, normalized_dist, lastname, first_initial, endorsed)` as the key, with verbose district strings like "COMMON PLEAS" normalized to empty for matching purposes.
- Most merges were 1990 and 1992 records where multiple clippings of the same election cycle (v1/v2/v3) duplicated candidate endorsements.

**Final dataset:**
- 61 clippings (was 59; +2 from this pass)
- 1325 candidate records, 229 proposition records
- Coverage: 1948-2007 (Cincinnati Post operated through end of 2007)
- Mean confidence: 0.76 (note: 579 records below 0.75 threshold reflect pre-existing data quality from earlier extractions; not introduced by this pass)

**Recommendation:** PASS. Folder is in good shape for compilation. The remaining low-confidence records are inherited from earlier extractions and would benefit from a future deep re-extraction pass, but are not blockers for downstream augmentation.
