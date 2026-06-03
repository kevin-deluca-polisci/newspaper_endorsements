# QA Report: Austin Chronicle

**Audit date:** 2026-06-01 (V2 — formal endorsement-qa skill pass after Round 1+2 spot checks)
**Folder:** Austin Chronicle
**Newspaper ID:** Not available (alternative weekly; not in newspapermembernumbers.xlsx)
**Data coverage:** 2012, 1 clipping, 36 candidate records, 19 proposition records

## Overall Assessment

**PASS WITH FIXES V2**

Austin Chronicle is an alternative weekly newspaper. Single 2012 endorsement guide covering federal, state, local races plus 18 ballot propositions. April 2026 QA identified issues but never applied them. V2 applied all fixes plus discovered 4 new errors (3 Pattern L party errors + 1 Pattern J missing prop) via OCR cross-check.

**Note on newspaper_id:** Austin Chronicle is not in the standard NAA/Newspapers.com member registry. newspaper_id field intentionally empty. GS permid augmentation merge will not work for this folder without manual ID assignment. CSV filenames retain "AUSTIN CHRONICLE_NOID_" prefix as standard naming requires an ID.

## Stage 1: Structural Validation (V2)

- CSV headers: PASS (16 cand cols + 11 prop cols)
- Row integrity: PASS (year 2012 valid, all endorsed values valid, all conf 1.0)
- state_newspaper / state_election: PASS (all TX)
- Incumbency=0 values: PASS (0)
- Junk rows: PASS (0)
- Newspaper ID: empty (Austin Chronicle not in registry)
- **CRITICAL Stage 1 fix applied: 17 prop records had `endorsed` = "YES"/"NO" strings; converted to 1/0** (same pattern caught in Austin American)

## Stage 2: Spot Check (2 rounds, ~30 spot checks)

**Clipping:** AUSTINCHRONICLE_20121106.pdf (single 2012 article from Oct 19 Chronicle issue covering Nov 6 election)
**OCR method:** 600dpi pdftoppm + tesseract across 13 pages

### Round 1: Verify all 36 cand against OCR
- **3 Pattern L party errors discovered:** EASTON (H-17) listed as Democrat but OCR explicit "Ben Easton (L)" = Libertarian. KOELSCH (TX Sup Place 2) listed as Democrat but OCR "Roberto Koelsch (L)". WATERBURY (TX Sup Place 4) listed as Democrat but OCR "Charles Waterbury (G)" = Green. All 3 fixed.
- **TX Supreme Court dist formatting:** "6"/"2"/"4" → "Place 6"/"Place 2"/"Place 4"
- **3rd Court of Appeals dist:** mixed "3rd 2", "3", "3rd 5", "3rd 6" → standardized to "Place N" with dname "3rd Court of Appeals"
- **ACC/AISD Trustee distinction:** Added dname=Austin Community College for Mink/Kaplan; dname=AISD for Mathias/Teich/Jackson/Hinojosa
- **HINOJOSA dist:** "8" → "At-Large Place 8" per OCR
- **DIRECTOR dname:** added "Barton Springs Edwards Aquifer Conservation District" for Goodman
- **Incumbency conversion:** MINK + KAPLAN ACC trustees were d_inc=1 with empty party (incorrect for nonpartisan races). Converted to o_inc=1. OCR explicit: "Three-term incumbent Kaplan", "Barbara Mink, incumbent and current board chair"

### Round 2: Verify all 18 props + check remaining incumbency
- **Pattern J: Missing Charter Prop 1** — paper endorsed both Prop 1 and Prop 2 of Austin City Charter, but data only had Prop 2. OCR explicit: "Prop. 1 would move municipal elections from May to November; Prop. 2 would do that as well as adjust council member terms to four years..." Added missing Prop 1.
- **Wrong prop_type: Props 10/11** were marked BOND but OCR explicit "Props. 10 and 11 would extend civil service protections" — these are CHARTER AMENDMENTS, not bonds. Bond propositions actually start at Prop 12. Fixed type BOND → AMENDMENT for both.
- **Prop 2 description** corrected to remove "moving elections" content that belongs to Prop 1

**Accuracy:** ~100% post all fixes
**Recommendation:** Excellent shape

## Stage 3: Variable Coding & Dedup (V2 final)

**Issues found:** 0 remaining | **Auto-fixed:** 32 total across V1→V2

All coding categories pass:
- 15 unique office codes — all standard (PRESIDENT, SENATOR, H, RAILROAD COMMISSION, TX SUPREME COURT, COURT OF CRIMINAL APPEALS, STATE BOARD OF ED, STATE SENATOR, STATE REP, COURT OF APPEALS, SHERIFF, TAX ASSESSOR, CNTY COMM, DIRECTOR, TRUSTEE)
- 4 party labels (Democrat 25, Green 2, Libertarian 2, empty 7 for nonpartisan races)
- 0 names without comma (all LASTNAME, FIRSTNAME ALL CAPS)
- 0 candidate duplicates
- 0 proposition duplicates
- 0 Pattern K incumbency-party mismatches
- All prop_type, prop_desc, notes_endorse ALL CAPS

## Stage 4: Low-Confidence Re-Scan (V2 final)

**Records reviewed:** 0 — all 36 cand + 19 prop have extraction_confidence ≥ 0.95
**Mean confidence:** 1.000 (cand) / 0.997 (prop)

## Stage 5: Manifest Registration

Austin Chronicle registered in `qa_manifest.csv` as entry #21 with qa_result "PASS WITH FIXES V2".

## Official endorsement-qa skill final pass (V2)

Definitive Stage 1+3+4 pass executed on V2 state:
- **Stage 1 PASS:** all 16 cand cols + 11 prop cols present, row integrity clean, 0 junk rows, newspaper_id consistently empty (alternative weekly convention)
- **Stage 3 PASS:** 15 standard office codes, 4 valid party labels, all names LASTNAME FIRSTNAME ALL CAPS, 0 cand dups, 0 prop dups, 0 Pattern K mismatches, all prop_type/prop_desc/notes ALL CAPS
- **Stage 4 PASS:** 0 records below 0.75 confidence; mean conf 1.000 (cand) / 0.997 (prop)
- Final assessment: PASS WITH FIXES V2 — structurally clean across all checks

---

## Final Statistics

- **36 candidate records, 19 proposition records (55 total)**
- **Year: 2012 (single election)**
- **End=1: 36 cand, 17 prop**
- **End=0: 0 cand, 1 prop (Charter Prop 3)**
- **No-position: 0 cand, 1 prop (Charter Prop 8)**
- **Mean confidence: 1.000 (cand) / 0.997 (prop)**
- **0 duplicates, 0 Pattern K mismatches**
- **Incumbency coverage: 9/36 = 25%**

## Total Changes V1 to V2

| Metric | V1 | V2 | Change |
|--------|----|----|--------|
| Cand records | 36 | 36 | 0 net |
| Prop records | 18 | 19 | +1 Pattern J (Charter Prop 1) |
| YES/NO → 1/0 prop conversions | 17 | 0 | -17 (Stage 1 critical fix) |
| Pattern L party errors | 3 | 0 | -3 (Easton L, Koelsch L, Waterbury G) |
| Office code standardizations | 11 | 0 | -11 |
| Wrong prop_type (BOND→AMENDMENT) | 2 | 0 | -2 (Props 10/11) |
| dist/dname normalizations | ~12 | 0 | -12 |
| Incumbency conversions (d_inc→o_inc) | 2 | 0 | -2 (Mink, Kaplan) |

**~47 total fixes across Round 1+2 + formal pass.**

## Notes for Future Work

1. **No newspaper_id available** — Austin Chronicle is not in newspapermembernumbers.xlsx (alternative weekly). GS permid augmentation merge will skip this folder unless an ID is assigned manually.
2. **Single-clipping folder** — coverage limited to 2012. Other Austin Chronicle endorsement years (2014, 2016, 2018, 2020, 2022) not in archive.
3. **Cross-filing era exceptions** — Chronicle endorsed L/G candidates in races where R incumbents had no D opposition: Easton (L) vs Flores (R); Wendel (G) vs Smitherman (R); Koelsch (L) vs Willet (R); Waterbury (G) vs Devine (R). Documented in notes_endorse.
4. **Mink/Kaplan o_inc=1** — convention for nonpartisan incumbents. Distinct from Republican/Democrat incumbency.
5. **Two-row Hinojosa note** — Hinojosa appears in both AAS folder 2012 (Pos 8 At-Large) and Chronicle 2012 (same race, AISD trustee). Different newspapers endorsing same person, no cross-record dup issue.
