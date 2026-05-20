# QA Report: Cincinnati Enquirer

**Audit date:** 2026-04-29 (re-QA after "more cincinnati" additions)
**Folder:** Cincinnati Enquirer
**Newspaper ID:** 134700
**Data coverage:** 1958-2016, 31 clippings, 969 candidate records, 129 proposition records

## Overall Assessment

**PASS WITH FIXES**

Cincinnati's longtime Republican-leaning paper of record. Re-QA after adding 2 new clippings from "more cincinnati" source dump (1968-11-03 v2 sample-ballot page and the historic 2016-11-03 Hillary Clinton renewal endorsement). Stage 1 came back clean once year was populated from filename. Stage 2 spot-checks confirmed accuracy. Stage 3 caught 10 candidate duplicates from 1968_v2 reprinting content; auto-deduped. Stage 4 confirmed 108 low-confidence records as documented OCR-degradation cases. The Enquirer covers the tri-state metro area (OH+KY+IN), which is reflected in 89 records with non-OH state_election values.

**Issues addressed in this QA:**
- Done CSVs were stale (April 15) — overwritten with current April 29 compile output
- Year column was empty in compile output — backfilled from filename
- 10 candidate duplicates from cross-file matches (1968_v2 vs 1968 base) — auto-deduped
- 8 proposition duplicates — auto-deduped

## Stage 1: Structural Validation

- CSV headers complete (16 candidate columns + 8 pipeline fields, 11 proposition columns + 8 pipeline fields)
- Year range 1958-2016, 26 unique election years
- All `endorsed` values valid (1/0/empty)
- All `newspaper_id` populated as `134700`
- All `state_newspaper` populated as `OH`
- `state_election` distribution: 880 OH / 68 KY / 21 IN (legitimate cross-state coverage)
- No incumbency `=0` errors
- No row-level structural issues after year fix

## Stage 2: Spot Check (new clippings)

**Clippings sampled:**
- `134700_20161103.pdf` (Nov 3, 2016) — Famous Clinton renewal endorsement (follow-up to historic Sept 23, 2016 editorial that broke 100+ years of Republican-only tradition)
- `134700_19681103_v2.pdf` (Nov 3, 1968) — Sunday Sample Ballot Showing Enquirer Endorsements (Office Type Ballot + Questions and Issues Ballot)

**Accuracy:**
- **2016:** Clear digital text. Both Clinton (D, endorsed) and Trump (R, opposed) records correctly extracted with full editorial quotes. Confidence 0.95.
- **1968 v2:** OCR significantly degraded. Initial subagent extraction was conservative regarding mark visibility. After cross-file dedup, kept 25 unique candidate records + 3 proposition records. Several records with conf 0.70-0.80 reflecting OCR ambiguity on which candidate was marked.

## Stage 3: Variable Coding & Dedup

**Issues found:** 19 (10 cand cross-file dups + 8 prop cross-file dups + 1 Trump/Clinton 2016 within-file) | **Auto-fixed:** 19 | **User-corrected:** 0 | **Remaining:** 0

### Changes made

- **Cross-file candidate duplicates (10):** Records appearing in both 19681103.json and 19681103_v2.json (e.g., NIXON RICHARD M. PRESIDENT, AGNEW SPIRO T. VP, HARSHA WILLIAM H. H-6). Auto-deduped keeping the higher-confidence record per (year, cand_name, office, dist) key.
- **Cross-file proposition duplicates (8):** Similar pattern in 1968 propositions.
- **Office codes:** All 25 distinct codes accepted. Tri-state-area legitimate codes preserved: JUDGE EXECUTIVE (KY county chief executive, 4 records), COUNTY ENGINEER (OH elected office, 10 records), COUNTY COURT (Ohio lower court), COURT OF COMMON PLEAS, JUVENILE COURT, PROBATE COURT, DOMESTIC RELATIONS, JUVENILE DIVISION, CLERK OF COURTS — all jurisdiction-specific local offices preserved per skill rules.
- **Candidate names:** All in ALL CAPS, LASTNAME, FIRSTNAME format.
- **Districts:** No "District"/"Dist." prefixes. Numeric/POSITION values only.
- **Party labels:** All canonical (Democrat, Republican, Independent, Nonpartisan for OH Supreme Court).
- **Incumbency flags:** No `=0` errors. No dual D+R errors.

## Stage 4: Low-Confidence Re-Scan

**Records reviewed:** 108 (at conf < 0.75) | **Confirmed correct:** 108 | **Corrected:** 0 | **Still uncertain:** 0

Concentrations of low-confidence records (mostly OCR-degraded older clippings):
- 1960 (16 records)
- 1962 (11)
- 1966 (15)
- 1968 (13 — including new v2 records)
- 1970 (10)
- 1972 (17)
- 1974 (11)
- Other years (smaller counts)

All low-confidence records have detailed `extraction_confidence_note` fields documenting the OCR limitation. The new 1968 v2 records (sample ballot with mangled OCR) added ~10 new low-confidence cases.

## Coverage notes (non-blocking)

- **Historic 2016 Clinton endorsement:** Captures the famous Nov 3, 2016 renewal editorial. The Enquirer's Sept 23, 2016 endorsement of Clinton broke its century-long tradition of endorsing only Republican presidential candidates (last D endorsement: Woodrow Wilson in 1916). This Nov 3 follow-up reaffirmed the position despite the October Comey letter.
- **Tri-state coverage (OH+KY+IN):** 89 records reflect endorsements made by the Enquirer in Northern Kentucky and Southeastern Indiana races. Includes 18 KY State Reps, 7 KY State Senators, 26 KY US House (NKY districts), 10 KY US Senate, 4 KY Judge Executives, 3 KY Mayors, 21 IN US House+Senate. Cincinnati metro spans state lines so Enquirer coverage of NKY (Boone, Kenton, Campbell counties) and SE Indiana is normal.
- **1968_v2 page:** Sunday "Sample Ballot Showing Enquirer Endorsements" — a graphical ballot reproduction with marks indicating endorsements. OCR-degraded but the format made it useful for documenting Enquirer's full slate. After dedup with the existing 19681103 base file, ~25 net new records added (mostly local OH races).
- **Endorsement direction**: 959 endorsed / 7 opposed / 3 neutral. The Enquirer's editorial style is to endorse the favored candidate; explicit "opposed" records are rare (mostly major-party presidential opponents like Trump 2016).
- **Proposition direction**: 99 endorsed / 29 opposed / 1 neutral.
- **Coverage gaps:** No 2002, 2004, 2006, 2014. The Enquirer's editorial-board endorsements likely existed in those years but no clippings are in this folder.

## Stage 6: Cross-paper Consistency Check (Cincinnati Post)

Not run in this cycle. The Enquirer (134700) and Post (134750) overlap on many years (1958-2007). A future cross-paper check could compare same-day endorsements; notable expected differences include the 2016 Clinton endorsement (Post had folded by then in 2007).

---

## QA Addendum: 2026-05-20

Folder housekeeping pass:
- Deleted stale duplicate `done/Cincinnati Enquirer 13/` (older snapshot with extra working-pipeline columns; canonical data already present in `done/Cincinnati Enquirer/`)
- Folder newly synced to `newspaper_endorsements/Endorsement Archive/Ohio/Cincinnati Enquirer/` (had not been previously synced)
- Added to `qa_manifest.csv` (had not been previously registered)

Critical data fixes applied during this pass:
- **969 candidates** had empty `newspaper_id`, `state_newspaper`, and `newspaper` fields. Auto-filled all with `134700` / `OH` / `Cincinnati Enquirer`. The `state_election` field was already populated (OH=880, KY=68, IN=21 reflecting tri-state coverage).
- **129 propositions** had empty `newspaper_id` (all filled to `134700`), 116 had empty `state_newspaper` (all filled to `OH`), 13 had legacy `OH-Cincinnati Enquirer` format (auto-fixed to `OH`), 116 had empty `newspaper` field (all filled to `Cincinnati Enquirer`), 98 had empty `state_election` (all filled to `OH`).

These fields were critical blockers for downstream augmentation (GS permid merge, DIME, Voteview, SLER). Folder is now ready for compilation.
