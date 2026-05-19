# QA Report: Anniston Star (100050) — Updated

**Audit date:** 2026-04-29 (re-QA after checking new "Endorsements 1918-2016" folder)
**Folder:** Anniston Star
**Newspaper ID:** 100050
**Data coverage:** 1918-2016, 65 clippings, 159 candidate records, 102 proposition records

## Overall Assessment

**PASS WITH FIXES**

Re-QA after checking the user's new `raw/ANNISTON STAR/Anniston Star Endorsements 1918-2016/` folder. **0 new clippings to add** — all 67 files in that folder turned out to be duplicates of existing archive content (65 byte-identical, 2 content-identical with minor PDF metadata variation). Stage 1-3 came back clean after one office-code normalization (SERVICE COMMISSION → PUBLIC SERVICE COMMISSION on 16 records). Stage 4: 10 low-confidence records, all OCR-degradation cases.

## Survey of new "Endorsements 1918-2016" folder

- **67 PDFs** in `raw/ANNISTON STAR/Anniston Star Endorsements 1918-2016/`
- **65 byte-identical duplicates** of existing archive files
- **2 hash-distinct files** turned out to be content-identical to existing 19781102 and 19781103 clippings — only minor PDF metadata differences (different download dates in the PDF wrapper). OCR text matches existing.
- **Net result: 0 new clippings**, no extraction work performed

## Stage 1: Structural Validation

- CSV headers complete (16 candidate columns + 8 pipeline fields, 11 proposition columns + 8 pipeline fields)
- Year range 1918-2016, 33 unique election years
- All `endorsed` values valid (1/0/empty)
- All `state_newspaper` populated as `AL`
- All `newspaper_id` populated as `100050`
- No incumbency `=0` errors
- No row-level structural issues

## Stage 2: Spot Check

**Spot-checked clippings (existing):**
- `100050_19781102.pdf` (Nov 2, 1978 — James for Governor): 8 candidates extracted
- `100050_19781103.pdf` (Nov 3, 1978 — Amendments): 9 propositions extracted

**Verified the 2 hash-distinct new files match existing content:**
- `Anniston_Star_1978_Amendments (1).pdf` matches existing 19781103.pdf (same Amendments 2, 8, 9 content)
- `Anniston_Star_1978_Endorsements (1).pdf` matches existing 19781102.pdf (same James/Hunt governor coverage)

## Stage 3: Variable Coding & Dedup

**Issues found:** 16 (1 office normalization × 16 records) | **Auto-fixed:** 16 | **User-corrected:** 0 | **Remaining:** 0

### Changes made

- **Office normalization (16 records):** `SERVICE COMMISSION` → `PUBLIC SERVICE COMMISSION` (Alabama's PSC oversees utilities). Affected 16 records across 1972-1990s spanning multiple Anniston Star clippings. Updated in both JSONs and CSV.
- **Office codes:** All 16 distinct codes now canonical including AL-specific PUBLIC SERVICE COMMISSION (16), STRAIGHT TICKET (4 — legitimate pre-1932 Anniston Star party-ticket endorsements), CHIEF JUSTICE, and standard codes.
- **Candidate names:** All in ALL CAPS, LASTNAME, FIRSTNAME format. 4 STRAIGHT TICKET records preserved per skill rules.
- **Districts:** No "District"/"Dist." prefixes.
- **Party labels:** All canonical (Democrat, Republican, Independent).
- **Incumbency flags:** No `=0` errors.
- **Dedup:** No duplicate `(year, cand_name, office, dist)` keys.

## Stage 4: Low-Confidence Re-Scan

**Records reviewed:** 10 | **Confirmed correct:** 10 | **Corrected:** 0 | **Still uncertain:** 0

The 10 low-confidence records (conf 0.60-0.70) are documented OCR-degradation cases:
- 1928 SMITH, AL (PRESIDENT, conf 0.65) — Al Smith 1928 Democratic nominee; OCR partial
- 1930 STRAIGHT TICKET (conf 0.70) — STRAIGHT TICKET coding for early-era endorsement
- 1966 WALLACE, LURLEEN and MARTIN, JIM (GOVERNOR, conf 0.70) — 1966 AL gov race; both OCR-uncertain
- 1978 VESTA, EMORY (AUDITOR, conf 0.70) — Auditor candidate
- 1986 BROWDER, GLEN (SEC OF STATE, conf 0.70)
- 1988 SULLIVAN, JIM (PSC, conf 0.70)
- 1994 SESSIONS, JEFF (AG, conf 0.70) and KENNEDY, MARK (SUPREME COURT, conf 0.70)
- 1998 SHELBY, RICHARD (SENATOR, conf 0.60) — lowest in dataset; OCR-degraded but historical name confirmed

All carry detailed `extraction_confidence_note` fields documenting OCR limitation.

## Coverage notes (non-blocking)

- **Coverage**: 33 election years (1918-2016) with notable gaps 1932-1942 (except 1944), 1946-1950, 1958-1962, 1970, 2000s mostly even years.
- **Top years by record count**:
  - 2006: 19 records
  - 2010: 14
  - 1978: 10
  - 2008: 9
  - 1980: 8
- **Endorsement direction**: 120 endorsed / 36 opposed / 3 neutral candidates; 81 endorsed / 18 opposed / 3 neutral propositions. The Anniston Star actively names both endorsements and opposed candidates.
- **STRAIGHT TICKET legitimate codes**: 4 records from 1918-1930 era when Anniston Star endorsed entire party tickets rather than individual candidates. Preserved per skill rules.
- **Alabama-specific offices**: PUBLIC SERVICE COMMISSION (16 records), CHIEF JUSTICE — all preserved as legitimate AL elected offices.
- **No new content from "Endorsements 1918-2016" folder**: All 67 files were duplicates. The folder appears to be a previously-curated batch that was already processed into the archive in earlier rounds.
