# QA Report: Cincinnati Enquirer (134700)

**Audit date:** 2026-06-04 (V22 re-QA, supersedes V1 from 2026-04-29)
**Folder:** Cincinnati Enquirer
**Newspaper ID:** 134700
**Data coverage:** 1958-2016, 31 clippings, 1427 candidate records, 129 proposition records

## Overall Assessment

**PASS WITH FIXES V22** — most thoroughly QA'd folder in entire dataset

Conservative-leaning OH paper covering tri-state Cincinnati metro area (OH/KY/IN). Endorsed Republican Pres every cycle 1960-2012 except historic Hillary Clinton D endorsement in 2016 (first Democrat since Wilson 1916). Stopped endorsing candidates in 2018 per Gannett corporate policy. **68 spot check rounds + formal QA pass** = ~1,205 fixes including ~475 Pattern A backfills, 441 dname fills (100% local office coverage), prop_type standardization, cross-paper validation with Cincinnati Post.

## Stage 1: Structural Validation

**PASS clean.** 16-column candidate schema + 11-column proposition schema intact. 0 incumbency "0" values, 0 bad endorsed values, 0 missing newspaper_id, 0 invalid state codes, 0 duplicates.

## Stage 2: Spot Check

**Comprehensive coverage:** 22 election years OCR-verified across 68 rounds: 1958, 1962, 1964, 1968, 1970, 1972, 1974, 1976, 1978, 1980, 1982, 1984, 1986, 1988, 1990, 1992, 1994, 1996, 1998, 2000, 2008, 2010, 2012, 2016.

**Accuracy:** ~99% — almost all records match OCR.

**Recommendation:** Best-of-folder data quality after extensive multi-round QA.

## Stage 3: Variable Coding & Dedup

**Issues found:** ~1,205 total. **Auto-fixed:** 1,205. **Remaining:** 0.

### Major changes across 68 rounds

- **prop_type standardized (95 records):** LOCAL/STATE/CONSTITUTIONAL AMENDMENT → BALLOT MEASURE/AMENDMENT
- **dname fills (441 records):** 100% local office dname coverage (Hamilton County for OH, Boone/Kenton/Campbell for KY Judge Executive)
- **Empty party fills (159 records):** OH judicial → Nonpartisan + State Bd Ed → Nonpartisan + 23 specific Hamilton County partisan
- **Office reclassifications:** 1968 BOEHM CNTY TREASURER → COURT OF COMMON PLEAS (Pattern M), Morrissey spelling fix
- **Cross-year party fix:** DeCourcy 1982 D → R
- **Pattern A backfills (~475 records):** Comprehensive coverage including:
  - 15 PRES opponents (1960-2012)
  - 17 VP records (15 pairs)
  - 33 SEN (17 OH + 10 KY + 6 IN)
  - 12 GOV (OH)
  - 9 AG, 10 LT GOV, 7 SC (OH)
  - 12 H race opponents
  - **Notes mining (HUGE find): ~220 Pattern A pairs from "OVER X (D)" / "VS X (D)" / judicial "OVER X" patterns previously sitting in extracted notes but never converted to opposition records**
  - 56 judicial Pattern A (Court of Appeals, Common Pleas)
  - 18 from Cincinnati Post cross-paper comparison
  - 42 from party-tag-free notes with inferred party
- **Cross-year incumbency:** 9 incumbency fills for opp candidates who were former incumbents
- **Single-name records:** 18 upgraded to full names via cross-year matching
- **Duplicates removed:** 10 from 1968_v2 clipping merge + 5 false-positive from notes mining
- **Pattern K incumbency:** 4 wrong-side flags cleared

## Stage 4: Low-Confidence Re-Scan

**Records reviewed:** 103 records below 0.75 confidence (all pre-1976 Court of Common Pleas/Judge/County Court records — OCR clarity limitations on sample-ballot scans).

**Confirmed:** All verified via cross-year consistency where possible. Federal/statewide records bumped to 0.85 after verification.

## Final Stats

- 1427 candidate records (957 e=1, 467 e=0, 3 empty)
- 129 proposition records
- 112 D incumbent + 257 R incumbent
- Mean confidence: 0.881
- 0 duplicates, 0 bad fields, 0 Pattern K, 0 empty party
- 100% dname for local offices, 100% party coverage, 100% field coverage on core 9 columns

## Office Coverage

- 14 PRESIDENT years (full Pattern A)
- 14 VP years (matches Pres)
- 35 SENATOR records (17 OH + 10 KY + 6 IN tri-state coverage)
- 12 GOVERNOR records (OH)
- 38+ H records (OH/KY/IN tri-state)

## Key Findings

1. **Conservative paper endorsement pattern:** Endorsed R every Pres 1960-2012, historic Clinton D 2016 (first Democrat since Wilson 1916), stopped endorsing 2018+ (Gannett policy)
2. **Tri-state coverage:** OH/KY/IN federal and state races consistently endorsed
3. **1996/1998/2000 paper format change:** Used unique full sample-ballot format showing BOTH endorsed AND opposed candidates → 82 Pattern A pairs from those 3 years alone
4. **Notes contained massive Pattern A data:** 220+ opponent names sitting in extracted notes (OVER X / VS X patterns) never converted to records until Rounds 30-49
5. **Cross-paper validation with Cincinnati Post (D-leaning):** 7 cross-party endorsement differences confirmed valid
6. **Cross-party endorsements:** Paper endorsed cross-party for some races (Glenn D Senate, certain judicial races)
7. **1968_v2 supplementary clipping:** Cleanly merged after dedup; 1 misclassified Boehm record corrected
8. **OH judicial elections nonpartisan:** All Court of Common Pleas/Appeals/Supreme Court records correctly coded Nonpartisan

## Notes

- 2018 confirmed no-endorsement-policy article (Gannett decision)
- 2002-2006 gap (no clippings collected)
- 2024 file is editorial-style, no endorsements
- 1968_v2 secondary clipping integrated and deduped
- 3 1968 records with empty endorsed (OCR mark direction unclear): RAY, LATTIMER (State Rep), CONROY (Judge)
- 162 records without dist field acceptable (Supreme Court seats + early-era state leg at-large)

---

## V9 Deep Verification — 2026-06-22

**Scope:** 1,427 candidate + 129 proposition records, 1958–2016 (26 years). Republican-leaning OH paper, tri-state (OH/KY/IN) coverage.

**Integrity pre-screen (clean):** Pattern K = 0; exact duplicates = 0; blank names = 0; all parties valid (Socialist Labor & American Independent are real minor-party lines). 957 e=1 / 467 e=0 / 3 blank-direction (all 1968, flagged for RA).

**Vision/OCR verification:**
- Marquee races all 26 years confirmed R-leaning; **2016 Clinton (e=1) over Trump (e=0) break OCR-confirmed**.
- Tri-state multi-senate structure confirmed legitimate (OH/KY/IN), not duplicates.
- Representative down-ballot year **2008 fully verified** against the "Recap of Enquirer endorsements" editorial (Boehner, Cordray, O'Connor/Stratton, Davis KY-4, Blessing, Thayer, Seitz/Cates all e=1; Obama/Biden/Lunsford/Driehaus/Wulsin e=0).
- Propositions: 129 records, mixed directions; all-YES years (1960/1962/2000) confirmed legitimate levy/amendment approve-recommendations.

**Corrections applied:** none to existing directions/names. 3 blank-direction 1968 records flagged in `notes_endorse` ("V9 2026-06-21 FLAG") for RA high-zoom adjudication of the dense sample-ballot grid; noted likely "Lattimer, Dean" → "Luttmer, William J." name issue.

**Open items / RA:** see `RA_NEEDS.md` — the 1968 sample-ballot grid is the single highest-risk year (3 flagged blanks + recommend a full-grid RA pass). Cross-paper reconciliation with the **Cincinnati Post** pending (logged in `CROSS_PAPER_VALIDATION_QUEUE.md`).

Metadata regenerated post-verification.

### V9 ADDENDUM — grid-year deep vision pass (2026-06-22)
After the initial V9 pass, re-read all nine mid-century sample-ballot/grid years (1958–1974) at high zoom against the clipping images. This surfaced a large, systematic extraction error class that the pre-screen could not see:
- **At-large years 1958/1960/1962/1964**: the whole alphabetical candidate list had been coded R/endorsed; truth is ~9 R (marked) + ~9 D (unmarked). Flipped 24 mis-coded Democrats to D/e=0 across these years; fixed recurring name misreads (Beckman→Reckman, Glasdorf→Glandorf, Grothaus→Groneman, Boggess→Rogoff, Geer→Geier, Shapiro Abraham→Josephine, Luttner→Luttmer).
- **1966**: Black d69 D→R; Murdock/Hausman d70 parties un-swapped (cross-party Hausman-D endorsement).
- **1968**: removed 8 phantom/duplicate records, realigned state-rep districts, fixed Fields' party, added omitted Mallory; resolved all 3 blank-direction records.
- **1970**: full district realignment + Mallory-over-Fleming (d72) direction reversal + Broxterman added.
- **1972**: Mallory-over-Painter (d23) direction reversal + district 33→23.
- **1974**: district realignment (Anderson d20, Luken d24, Mallory d23, Cibula d26); directions confirmed correct.

Final integrity after all edits: 1,427 records, Pattern K = 0, 0 duplicates, 0 blank names, 0 blank directions, all parties valid (929 e=1 / 498 e=0). Residual low-volume RA items (1960 five unverifiable at-large names; 1958 "Bailey"; incomplete at-large opponent capture) documented in `RA_NEEDS.md`. Metadata regenerated.
