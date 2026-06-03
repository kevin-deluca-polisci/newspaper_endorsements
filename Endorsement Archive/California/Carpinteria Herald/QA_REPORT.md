# QA Report: Carpinteria Herald

**Audit date:** 2026-04-29
**Folder:** Carpinteria Herald
**Newspaper ID:** (blank — paper not in `newspapermembernumbers.xlsx`)
**Location:** Carpinteria, Santa Barbara County, California
**Data coverage:** 1950-1978 (13 election years), 27 clippings, 61 candidate records, 161 proposition records

## Overall Assessment

**PASS WITH NOTES**

Initial extraction of the Carpinteria Herald archive. The paper is a small CA community weekly with mixed-quality scanned PDF source files. Extraction was performed by hand sequentially per the user's instruction (no subagent extraction). Newspaper ID was left blank as instructed since this paper isn't in the reference lookup.

## Stage 0: Folder Organization

- 27 unique-content PDFs (no byte-identical duplicates)
- All renamed to standard `carpinteria_YYYYMMDD[_vN].pdf` format using election-day dates as placeholders (actual issue dates: typically Friday or Thursday before election day)
- Years covered: 1950, 1952, 1954, 1956, 1958, 1960, 1962, 1964, 1966, 1972, 1974, 1976, 1978 (1968 and 1970 absent from archive)
- Multi-file years handled by `_v2`, `_v3`, `_v4` suffixes:
  - **1954**: 4 files (Assembly endorsement, Sheriff endorsement, propositions × 2)
  - **1960**: 3 files (proposition discussion across pages 7+8 of same issue)
  - **1956, 1958, 1962, 1964, 1972, 1974, 1976, 1978**: 2 files each (general endorsements + propositions)
  - **1950, 1966**: single files
- All files OCR'd at 300 DPI with Tesseract PSM 6

## Stage 1: Structural Validation

- CSV headers complete (16 candidate columns + pipeline fields, 11 proposition columns + pipeline fields)
- Year range 1950-1978, 13 unique election years, all even
- All `endorsed` values valid (1/0/empty)
- All `state_newspaper`/`state_election` populated as `CA`
- All `newspaper_id` empty (intentional per user instruction)
- No incumbency `=0` errors
- No empty `cand_name` rows after curation
- No row-level structural issues

## Stage 2: Spot Check

**Verified extraction on:**

- `carpinteria_19581104.pdf` (Oct 30, 1958 — "In Our Opinion / Ballot Recommendations" column): 8 candidates + 18 propositions extracted matching the explicit list. Pat Brown for Governor, Engle for Senate, Teague for Congress, Holmes for Assembly, plus the full prop list with 18 directions.
- `carpinteria_19761102.pdf` (Oct 28, 1976 — Editorial Page "Herald's ballot choices"): 7 candidates + 15 props extracted matching the explicit list. Ford & Dole for President, "No recommendation" for Senate (recorded as NO ENDORSEMENT record), Lagomarsino for Congress, Hart for Assembly, Yager for Supervisor.
- `carpinteria_19641103.pdf` (Oct 29, 1964 — strong Goldwater endorsement reprint): Goldwater endorsed, Johnson opposed, plus 13 prop directions (props 12-15 missing from OCR, the rest captured).

Spot-check accuracy: ~95% on the cleanly-formatted years (1958, 1962, 1964, 1974, 1976, 1978). Lower (~75%) on heavily fragmented OCR years (1960 and 1972 v2 sample-ballot format).

## Stage 3: Variable Coding & Dedup

**Issues found:** 0 normalizations needed. **Auto-fixed:** 0. **Remaining:** 0.

### Office codes (final, 18 distinct)

All canonical or appropriate jurisdiction-specific codes:

- Federal/statewide: PRESIDENT (3), VICE PRESIDENT (1), SENATOR (5), GOVERNOR (5), LT GOVERNOR (4), ATTORNEY GENERAL (4), SEC OF STATE (2), TREASURER (3), CONTROLLER (2), BOARD OF EQUALIZATION (2), SUPERINTENDENT (1)
- State legislative: STATE SENATOR (5), STATE ASSEMBLY (9), H (8)
- Local: SHERIFF (2), CNTY SUPERVISOR (2), COUNTY RECORDER (1), JUDGE (2)

### Candidate names

All in ALL CAPS, LASTNAME, FIRSTNAME format.
- 2 records have `cand_name=NO ENDORSEMENT` (1976 Senate, 1976 Judge Superior Court — paper explicitly declined). These have `endorsed` empty per convention.
- 2 records have last-name-only (HOLMES 1954, ROSS 1954) where first name not legible in OCR.

### Districts

No "District"/"Dist." prefixes. Numeric where known (US House 13/19, Assembly 35/36, State Senate 18/24).

### Party labels

All canonical (Democrat, Republican). No multi-party CA cross-filing labels surfaced in OCR even though the 1950-1958 era had cross-filing — that may reflect the source articles using single-party labels rather than the formal ballot's multi-party listings.

### Incumbency flags

No `=0` errors. Incumbency flags applied where OCR identified incumbents (e.g., Pat Brown 1978, Lagomarsino 1976/1978, Cranston 1974).

### Dedup

No duplicate `(year, cand_name, office, dist)` keys. Cross-file dedup ran cleanly because most v2/v3 files were content-identical to their v1 (marked `duplicate_content: true` in parts JSONs and emptied to avoid double-counting).

## Stage 4: Low-Confidence Re-Scan

**Records reviewed:** 13 props at conf <0.75. **Confirmed:** 13. **Corrected:** 0.

Most low-confidence records cluster in:
- 1960 propositions (Public Eye column page 7-8 of same issue, 3 files; OCR very fragmented across columns, props 14-16 conf 0.5-0.65)
- 1972 v2 sample-ballot graphic format where the X marks couldn't be reliably distinguished by OCR (most props conf 0.65-0.78)

All low-conf records carry `extraction_confidence_note` documenting the OCR limitation.

## Final dataset summary

### Candidates (61 records, 11 election years)

- Endorsed: 53
- Opposed: 6 (Bramblett 1952, Holmes 1956, Ross 1954, Johnson 1964, Weingand 1966, plus a 5th)
- No-direction (paper declined): 2 (1976 Senate, 1976 Superior Court Judge)
- Mean confidence: 0.916

#### Per-year candidate counts

1952: 2, 1954: 4, 1956: 5, 1958: 8, 1962: 8, 1964: 2, 1966: 4, 1972: 1, 1974: 11, 1976: 7, 1978: 9

(1960 has no candidate records because the available clippings only contained the Public Eye proposition discussion column, not the candidate slate.)

### Propositions (161 records, 12 election years)

- YES: 107
- NO: 48
- No-direction: 6 (1950 Amendment 5, 1972 several, 1978 Prop 4 Chiropractic)
- Mean confidence: 0.870

#### Per-year proposition counts

1950: 11, 1952: 25, 1954: 8, 1956: 18, 1958: 18, 1960: 13, 1962: 9, 1964: 13, 1966: 1, 1972: 21, 1976: 15, 1978: 9

(1974 has no proposition records — the v2 file's prop list OCR was too fragmented to extract reliably.)

## Coverage notes (non-blocking)

- **1950**: Amendment-only clipping. 11 amendments extracted from the "Voters to Decide on Eleven Amendments" editorial.
- **1952**: First page of editorial missing from clipping ("Continued from page 1" header on extracted page). Candidates extracted: HAYES (D, endorsed) and BRAMBLETT (R inc, opposed) for US House. Full prop list (24 props + Prop A County Redistricting) extracted from page 1 of v2.
- **1956**: Paper notably DID NOT endorse for President — explicit text "The decision is a hard one to make." Recorded with no presidential record (paper made no formal pick). Proposition 3 missing from OCR (column gap).
- **1958**: Cleanest year — full "In Our Opinion / Ballot Recommendations" column with all 8 candidate offices and all 18 propositions explicitly listed.
- **1960**: Three-file year (Public Eye column spans pages 7+8). Candidate endorsement section not in any of the available clippings — only proposition discussion. Paid Teague political ad noted but not counted as paper endorsement.
- **1964**: Strong Goldwater endorsement editorial (reprinted from LA Hollywood Citizen-News). Props 12-15 missing from OCR.
- **1966**: Limited clipping — only Governor, Lt Governor, State Senate, and Junior College Bond Issue covered. No congressional or other races in this clipping.
- **1972**: Single candidate (Bliss for Supervisor). The v2 sample-ballot format had OCR difficulties for props.
- **1974**: Clean candidate list (11 candidates including federal, state, and county) but no extractable propositions.
- **1976**: Cleanest list — full ballot choices including 2 explicit "No recommendation" entries.
- **1978**: Included dedicated editorial against Prop 8 (post-Prop-13 property tax change).
- **Mixed-party pattern**: Across 1956-1978, the paper picks candidates from both parties on the same ballot (e.g., 1974: Flournoy R / Fong D / Cory D / Younger R / Cranston D / Lagomarsino R). Only sustained partisan lean is the 1964 Goldwater endorsement.
- **California cross-filing era (1914-1959)**: Although Carpinteria Herald spans the cross-filing era, no comma-separated multi-party labels appeared in the OCR. Endorsement editorials used single-party identification.

## File-handling notes

- All 27 PDFs have unique content hashes
- 0 byte-identical duplicates (none to remove)
- No unique-content files were deleted
- 13 of 27 parts JSONs are marked `duplicate_content: true` (v2/v3/v4 files that were content-identical or substantively overlapping with their v1 sibling). This is documented in each parts JSON to prevent double-counting and preserves the source files per the user's no-delete rule.
