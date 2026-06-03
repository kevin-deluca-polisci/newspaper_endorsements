# QA Report: Akron Beacon Journal (134150)

**QA Date:** 2026-05-26 (targeted gap-fill re-QA; supersedes earlier 2026-05-26 PASS WITH FIXES, 2026-05-20 PASS WITH MINOR FIXES, and 2026-04-02 reports)
**QA Result:** PASS WITH FIXES (gap-fill re-QA: re-verified 1970/1972/1974 independently, fixed 1970 judicial errors, added 7 1970 state legislative endorsements, added 3 1972 propositions, copied 3 missing PDFs to raw/, regenerated all 12 parts/ JSONs from done/ CSVs)

## Summary

Targeted gap-fill re-QA building on the earlier 2026-05-26 deep re-extraction. The earlier pass deeply spot-checked 7 years (1968, 2008, 2010, 2012, 2014, 2016, 2018) but preserved 1970/1972/1974 from the May 20 work without independent verification. This gap-fill independently re-read those 3 clippings and found that 1974 was clean, 1972 had 3 missing propositions, and 1970 had 4 substantive errors in the judicial races plus 7 state legislative endorsements omitted from the editorial body. All issues fixed. Also copied the 1970/1972/1974 PDFs into raw/ (they were previously only in done/) and regenerated all 12 parts/ JSONs to match the corrected done/ CSVs.

## Final Counts (after gap-fill re-QA)

- **Clippings:** 12 (unchanged; year coverage 1968-2018 plus 2020 empty)
- **Candidate endorsements:** 333 (was 327; net +6 = -3 incorrect removals +2 ballot corrections +7 editorial-body adds)
- **Proposition endorsements:** 46 (was 43; +3 1972 school-levy adds)
- **Year coverage:** 1968-2018
- **Mean confidence:** 0.935
- **Low-confidence records (< 0.7):** 0 (HODOS 2008 STATE REP 51 still at 0.70)
- **Party distribution:** Democrat 59, Republican 54, party-not-stated 220

## Changes Applied in Gap-Fill Re-QA

### 1. 1970 judicial errors fixed (-3, +2 = net -1)

The May 20 extraction reversed three judicial endorsements (coded the losing opponent as endorsed instead of the X-marked winner). Independent re-read of the Non-Partisan Ballot resolves them:

| Race | Was coded (CSV) | Actually X-marked on ballot | Action |
|---|---|---|---|
| Supreme Court Justice (Full Term Commencing Jan 1, 1971) | CORRIGAN, J. J. P. | BROWN, ALLEN | Remove Corrigan; add Brown |
| Supreme Court Justice (other Full Term) | DUNCAN, ROBERT M. (mislabeled "Unexpired Term" — that race didn't exist; CJ was unexpired and was O'Neill, who's correct) | STERN, LEONARD J. (already in CSV, correct) | Remove Duncan (no replacement needed; Stern was already endorsed for this race) |
| Common Pleas (Full Term Commencing Jan 1, 1971) | BELL, SAM H. | BARBUTO, JAMES J. | Remove Bell; add Barbuto |

### 2. 1970 name-correction fixes (middle initials)

| Was | Now |
|---|---|
| LOMBARDI, ANTHONY L. | LOMBARDI, ANTHONY J. |
| PRICE, THEODORE R. | PRICE, THEODORE B. |

### 3. 1970 state legislative additions from editorial body (+7)

The editorial body explicitly named seven state legislative endorsements not shown on the marked sample ballot ("In addition to those for which marked sample ballots are shown on the right, the Beacon Journal has endorsed the following:"). All seven were missing from the CSV:

| Office | Dist | Name | Party | Conf |
|---|---|---|---|---|
| STATE SENATOR | 10 | LEWIS, JAMES K. | Republican | 0.90 |
| STATE SENATOR | 21 | BROWN, ROBERT | Republican | 0.90 |
| STATE REP | 21 | BATCHELDER, WILLIAM | Republican | 0.90 |
| STATE REP | 20 | FISHER, RALPH | Republican | 0.90 |
| STATE REP | 53 | ROBERTS, MARCUS | Democrat | 0.90 |
| STATE REP | 31 | DEMORAL, ROSS G. | Democrat | 0.85 |
| STATE REP | 35 | THEYER, EDITH | Republican | 0.85 |

Surnames for Demoral and Theyer are taken from the editorial-text OCR and may need future verification against a higher-quality scan; flagged in notes_endorse and marked at lower confidence.

### 4. 1972 proposition additions (+3)

Three school-levy props endorsed in the editorial body were missing from the CSV:

| prop_type | prop_num | desc | endorsed |
|---|---|---|---|
| TAX LEVY | (blank) | Barberton City School District - 4.6-mill, two-year emergency operating levy | 1 |
| TAX LEVY | 21 | South Summit Joint Vocational School District - Issue 21 | 1 |
| TAX LEVY | 22 | South Summit Joint Vocational School District - Issue 22 | 1 |

Note: the editorial also references "the seven other school issues on the Summit County ballot" but these are not individually named in the text; left out per Kevin's gap-fill decision.

### 5. raw/ folder PDFs copied (3 files)

Pre-fix, raw/AKRON BEACON JOURNAL 2008-2020/ was missing the 1970/1972/1974 PDFs (which existed only in done/clippings/). Copied them in so raw/ now matches done/ exactly (12 PDFs each). Folder name "2008-2020" is now a misnomer but was preserved per Kevin's preference to avoid renaming a folder with downstream references.

### 6. raw/parts/ JSONs regenerated (12 files)

All 12 parts/ JSONs regenerated from the corrected done/ CSVs. Backed up the previous parts/ to `parts_bak_pre_regen/` before regen. Year-to-clipping mapping:

- 19681104, 19701102, 19721106, 19741104, 20101031, 20121104, 20141102, 20161106, 20181104 — all candidates and props for that year
- 20081102 — all 2008 records (substantive ABJ recommendations clipping)
- 20081103 — empty (Issue 5 reinforcement was merged into Nov 2 row per conceptual-duplicate handling; per-clipping ground truth was already lost in earlier extraction and CSV is now authoritative)
- 20201103 — empty (no endorsements; HB 6 opinion piece)

Each regenerated JSON includes a `regen_note` field explaining the regeneration. The CSV is the authoritative source going forward; if compile.py is rerun on raw/ it will now reproduce the corrected done/ CSV.

## Spot Check Results (gap-fill 3 clippings)

| Clipping | Outcome |
|---|---|
| 19701102 | Substantive errors: 3 wrong judicial endorsements (Corrigan/Duncan/Bell), 2 name middle-initial typos, 7 missing state legislative endorsements from editorial body. All fixed. |
| 19721106 | Substantively right: 46 candidate records match the editorial-named picks plus ballot. Missing 3 propositions (Barberton + S Summit 21/22) — added. "Seven other school issues" referenced generically — left out. |
| 19741104 | Clean. 37 candidate records + 7 propositions match the "Our Endorsements" list-format article exactly, including NO ENDORSEMENT correctly omitted for State Rep 50 and 70. No changes needed. |

(All other 9 clippings — 1968, 2008x2, 2010, 2012, 2014, 2016, 2018, 2020 — were deeply re-extracted earlier on 2026-05-26 and not re-checked in this gap-fill pass.)

## Structural & Coding Validation

- OK: all CSV columns present (16 candidates, 11 propositions)
- OK: all `newspaper_id` populated (134150) and consistent
- OK: all `state_newspaper` and `state_election` are "OH"
- OK: all `year` values are 4-digit even years (1968-2018)
- OK: all clipping filenames follow `{id}_{YYYYMMDD}.pdf` convention
- OK: all `endorsed` values are 1, 0, or empty
- OK: candidate names in ALL CAPS LASTNAME, FIRSTNAME format (0 names without comma)
- OK: incumbency fields all empty (consistent with sample-ballot and recap-editorial formats)
- OK: no exact duplicates (cand or prop)
- OK: no stub-format records
- OK: metadata counts match CSV counts (333 cands, 46 props, 12 clippings)
- Note: party field empty for many post-1990 records; Ohio judicial races are nonpartisan ballot
- Note: prop_type uses mixed long-form values (BALLOT MEASURE, STATE ISSUE, SUMMIT COUNTY ISSUE, TAX LEVY, etc.); standing dataset-wide decision to leave as-is

## Raw/ Folder Inspection

- OK: raw/AKRON BEACON JOURNAL 2008-2020/ now contains all 12 PDFs (1968, 1970, 1972, 1974, 2008x2, 2010-2020)
- OK: all 12 parts/ JSONs valid (json.load passes for each)
- OK: parts/ JSONs now in sync with done/ CSVs (verified: 333 cand + 46 prop records distributed across primary-clipping JSONs match the CSV totals exactly)
- OK: backup of pre-regen JSONs preserved at raw/AKRON BEACON JOURNAL 2008-2020/parts_bak_pre_regen/
- Note: raw/ folder name still "2008-2020" but now contains 1968-2020 content. Kept per Kevin's preference to avoid rename.
- Note: pre-regen CSVs backed up alongside done/ files (134150_candidates.csv.bak_pre1970fix, 134150_propositions.csv.bak_pre1970fix) for traceability.

## Open Items

1. **Surname OCR for editorial-only 1970 state legislators.** "Demoral" (Rep 31) and "Theyer" (Rep 35) are taken from editorial-text OCR and may be slight misreads of the actual surnames. Flagged at confidence 0.85. Could be verified against a higher-quality scan or external sources (OH Blue Book 1970, Voteview, etc.).
2. **Districts on the 1970 right-side ballot.** STATE REP 91-97 and STATE SENATOR 27/29 were preserved from the May 20 work without independent re-verification (the ballot image is too small to reliably re-read every district number). The candidate names appear consistent with known Akron-area legislators of the period; districts may reflect pre-1972 OH House numbering. Could be cross-checked against a redistricting reference if needed.
3. **Dataset-wide convention deviations** (prop_type forms, mixed-case notes) — standing decision to leave dataset as-is and update spec.

## Notes for Downstream Use

- Daily newspaper of Akron, Ohio (Summit County).
- Pre-1980 records use the office-type sample ballot format with X marks indicating endorsements, often paired with editorial body text that names additional endorsements not shown on the marked ballot.
- 1968 ballot contained multiple "BOTH QUALIFIED" overlay labels; per standing rule, both candidates treated as endorsed=1.
- 1970 has 36 candidate records: 7 from editorial body (Senate 10/21, House 20/21/31/35/53) + 29 from marked ballot.
- 2008 had two clippings: Nov 2 substantive recap + Nov 3 single-issue reinforcement (Issue 5 payday lender amendment). Nov 3 records merged into Nov 2 via conceptual dedup; the Nov 3 parts/ JSON is empty by design.
- 2010 had a charter-amendment-heavy ballot for the City of Akron (Issues 11-17 all endorsed YES).
- 2020 clipping is a guest opinion column about HB 6 repeal, correctly empty.
- Common Summit County office variations: SUMMIT EXECUTIVE, SUMMIT COUNTY COUNCIL (8 single-member districts + at-large pick-three), SUMMIT FISCAL OFFICER, SUMMIT ENGINEER, CHARTER COMMISSIONER.

## Recommendation

PASS WITH FIXES. After two QA passes today the dataset is substantively accurate across all 10 endorsement years. The 1970 corrections close the last known accuracy gap from the May 20 work. raw/ and done/ are back in sync (12 PDFs each, 12 parts/ JSONs all reflecting the authoritative done/ CSVs). Remaining open items are research-grade verifications (district numbers, two editorial-OCR surname spellings) rather than coding errors.
