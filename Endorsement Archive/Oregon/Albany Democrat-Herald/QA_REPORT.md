# QA Report: Albany Democrat-Herald (138300)

**QA Date:** 2026-05-26 (re-QA gap-fill; supersedes 2026-04-29 PASS WITH NOTES)
**QA Result:** PASS WITH FIXES (1992 AG race directions corrected to "both qualified"; 1992 Senate to no-direction; 8 missing 1998 opposed records added; 1 missing 1960 opposed record added; 1962 Whipple notes corrected)

## Summary

Independent re-QA of a folder previously assessed as PASS WITH NOTES on 2026-04-29. The April pass spot-checked 4 clippings with 100% accuracy. This re-QA ran a fresh stratified 10-clipping spot-check (1958, 1960, 1962, 1964, 1968, 1970, 1976, 1980, 1992, 1998) and found a systematic pattern where opposed candidates explicitly named in editorial-body comparison language were sometimes captured only in the endorsed candidate's `notes_endorse` field rather than as their own opposed records. The most significant finding was a directional error in the 1992 AG race (Rodeman/Kulongoski reversed, plus Rodeman's first name misread as "Esther" because the editorial opener "Either Rich Rodeman..." was mistaken for "Esther"). Net result: 403 candidate records (was 394; +9) and 182 propositions (unchanged); 4 no-direction records (was 2; +2 from Packwood/AuCoin).

## Final Counts (after re-QA)

- **Clippings:** 62 (unchanged)
- **Candidate endorsements:** 403 (was 394; net +9)
- **Proposition endorsements:** 182 (unchanged)
- **Year coverage:** 1958-2000 (22 even election years)
- **Mean confidence (cands):** 0.928
- **Low-confidence records (< 0.7):** 0
- **Direction distribution:** 313 endorsed, 86 opposed (was 79), 4 no-direction (was 2)

## Changes Applied in Re-QA

### 1. 1992 ATTORNEY GENERAL — directional flip + name fix ("both qualified" treatment)

The 1992-10-29 "In statewide elections" editorial says: "Attorney General — **Either Rich Rodeman**, the former city attorney of Corvallis, **or Ted Kulongoski**, head insurance regulator in the Goldschmidt administration, would make a decent head of the Justice Department." Per the "both qualified" standing rule, both candidates should be coded as endorsed=1. The original extraction had Rodeman's first name as "Esther" (likely OCR misreading of "Either Rich") and had directions reversed.

| Field | Was | Now |
|---|---|---|
| RODEMAN cand_name | RODEMAN, ESTHER | RODEMAN, RICH |
| RODEMAN party | (empty) | Republican |
| RODEMAN endorsed | 0 | 1 |
| KULONGOSKI endorsed | 1 | 1 (notes updated to reflect "both qualified" framing) |

### 2. 1992 U.S. SENATE — Packwood/AuCoin to no-direction

The same 1992-10-29 editorial criticizes both Packwood (R) and AuCoin (D) at length and concludes both "provide living arguments for term limits applied nationwide" without clearly endorsing either. Original extraction coded Packwood=1 / AuCoin=0; corrected to no-direction (empty) for both.

### 3. 1998 — 8 missing opposed records added

The 1998-10-29 "Recommendations, before it's too late" editorial explicitly names 8 candidates the paper opposes (described as inferior to the endorsed pick in each race). Original extraction captured the 7 endorsements but not the 8 opposed candidates. Added:

| Office | Dist | Name | Party | endorsed |
|---|---|---|---|---|
| GOVERNOR |  | SIZEMORE, BILL | Republican | 0 |
| H | 4 | WEBB, STEVE | Republican | 0 |
| SENATOR |  | LIM, JOHN | Republican | 0 |
| STATE SENATOR | 19 | OAKLEY, CAROLYN | Republican | 0 |
| STATE REP | 36 | CLOSE, BETSY | Republican | 0 |
| STATE REP | 37 | KROPF, JEFF | Republican | 0 |
| CNTY COMM |  | LINDSEY, JOHN | Republican | 0 |
| CNTY COMM |  | WOOTEN, CLIFF | Independent | 0 |

### 4. 1960 — SWEETLAND opposed added (SEC OF STATE)

The 1960-10-24 "We Agree With Brotherhood" editorial endorses Howell Appling Jr. (R) and devotes substantial text to criticizing Monroe Sweetland (D, "registered Socialist turned Democrat"). Sweetland was missing from the CSV. Added at confidence 0.92.

### 5. 1962 — WHIPPLE, BLAINE notes_endorse correction

The original notes for WHIPPLE, BLAINE (1962 H 1) said "LIVES IN STAYTON, MARION COUNTY" — but the 1962-10-29 "Norblad Needs Benton Vote" editorial actually says Stayton/Marion is where NORBLAD lives. Whipple lived in Multnomah County (Portland area, third district). Notes corrected. Direction (opposed) was correct.

### 6. raw/parts/ JSON updates (4 files)

Per Kevin's selective-update preference (preserving per-clipping ground truth where possible), updated only the 4 specific JSONs affected by the CSV fixes:

- `138300_19601024.json` — added SWEETLAND opposed (1 → 2 candidates)
- `138300_19621029.json` — WHIPPLE notes corrected
- `138300_19921029.json` — RODEMAN/KULONGOSKI/PACKWOOD/AUCOIN updated
- `138300_19981031.json` — added 8 opposed (7 → 15 candidates)

Pre-fix copies of the 4 JSONs backed up to `raw/Albany Democrat-Herald_138300/parts_bak_pre_albany_fix/`.

## Spot Check Results (10 stratified clippings)

| Clipping | Records found vs expected | Outcome |
|---|---|---|
| 138300_19581031 | 4/4 | Clean (Johns/McCormick DA, Downing/Ingram CntyComm) |
| 138300_19601024 | 1/2 → 2/2 after fix | Added Sweetland opposed |
| 138300_19621029 | 2/2 directions, 1 notes mix-up → fixed | Whipple residence notes corrected |
| 138300_19641102 | 3/3 | Clean (Albany city Measures 51, 52, 53 with 53 correctly deferred) |
| 138300_19681102 | (image too small to fully verify) | 15 records look comprehensive; trust prior QA |
| 138300_19701021 | 1/1 | Clean (Hoyt, C.R. "Dick" state senator endorsed) |
| 138300_19761101 | mostly match; 4 CNTY COMM records flagged | Dual records for Position 2 (Schrock+Tatom) and Position 3 (Keenan+Ross) — see Open Items |
| 138300_19801027 | 3/3 | Clean (Myers Treasurer endorsed; Lansing and Mertz opposed) |
| 138300_19921029 | 8 records; 2 wrong directions + 1 name + 1 borderline → fixed | 1992 AG and Senate races corrected |
| 138300_19981031 | 7/15 → 15/15 after fix | 8 opposed records added |

## Structural & Coding Validation

- OK: all CSV columns present (16 candidates, 11 propositions)
- OK: all `newspaper_id` populated (138300)
- OK: all `state_newspaper` and `state_election` are "OR"
- OK: all `year` values 4-digit even years 1958-2000
- OK: all clipping filenames follow `{id}_{YYYYMMDD}[_vN].pdf` convention
- OK: all `endorsed` values are 1, 0, or empty
- OK: incumbency fields 1/empty only
- OK: 0 junk rows, 0 bad years, 0 stub-format records
- OK: 0 exact duplicates (cand or prop)
- OK: metadata counts match CSV counts (403 cands, 182 props, 62 clippings)
- Note: 1 partial-name record (1962 CHANDLER CNTY COMM, single-word per editorial) — intentional per prior QA
- Note: prop_type uses skill-spec canonical values (BALLOT MEASURE, BOND, TAX, AMENDMENT, REFERENDUM, INITIATIVE) — consistent within paper; differs from Akron's long forms but matches skill spec

## Raw/ Folder Inspection

- OK: 62 PDFs in raw/Albany Democrat-Herald_138300/clippings/ — exact match with done/clippings/
- OK: 62 parts/ JSONs (one per clipping); all valid JSON
- OK: aux files present (_manifest.csv, _rename_log.csv, _skipped, more/ augmentation source)
- OK: 4 specific JSONs synced with done/ CSV fixes; remaining 58 untouched (preserve per-clipping ground truth)
- Backup of 4 pre-fix JSONs at raw/Albany Democrat-Herald_138300/parts_bak_pre_albany_fix/

## Open Items

1. **1976 CNTY COMM dual endorsements (Position 2 and Position 3).** The CSV has both SCHROCK (D) + TATOM (R) for Position 2 and both KEENAN (D) + ROSS (D) for Position 3, all coded endorsed=1 at confidence 1.0. The 1976-11-01 "Our election choices" list-format article (image quality limited) appears to name only one candidate per position. Could be: (a) legitimate "both qualified" dual endorsements if the editorial uses "either... or..." language; (b) Benton County races misfiled under Linn County; or (c) extraction errors. Confidence 1.0 in CSV suggests prior extraction was confident. Flagged for future verification against a higher-resolution scan.
2. **Partial-name record (1962 CHANDLER CNTY COMM).** Editorial only used surname "Chandler" without first name. Confidence 0.6. Could be enriched if a fuller name source is found.
3. **Dataset-wide convention deviations.** Standing decision to leave dataset-wide prop_type and case conventions as-is.

## Notes for Downstream Use

- Daily newspaper of Albany, Oregon (Linn County area, with overlap into Benton County and Mid-Willamette Valley coverage).
- Reliably Republican-leaning paper: Nixon (1960), Goldwater (1964), Reagan (1980), Bush (2000). Occasional Democratic crossovers when local incumbents had records the paper supported (AuCoin in CD-1 historically, Kitzhaber in 1998, Hill for State Treasurer 1992).
- Multiple multi-clipping years (each clipping = one editorial article): 1958 (3), 1960 (7), 1962 (8), 1964 (3), 1966 (6), 1970 (7), 1974 (2), 1980 (2), 1992 (3), 2000 (9).
- Heavy proposition coverage: 182 records across 19 years, with the paper frequently opposing tax limits and bond issues.
- The paper uses the "both qualified" pattern explicitly in list-format articles ("Either X... or Y...") — confirmed in 1976 AG (Redden D or Durham R) and 1992 AG (Rodeman R or Kulongoski D); apply the standing rule on this paper.
- OCR quality is degraded on 1958-1970 multi-column clippings; multi-name comparisons within the editorial body are most error-prone (e.g., 1962 Whipple notes mix-up, 1992 "Either" → "Esther" misread).
- Special handling: 1996 "vote no on all ballot measures except Measure 28" recap was treated as a single endorsement (Measure 28) rather than 22 unsupported opposition records.
- Linn County focus: 60 CNTY COMM records, 40 CITY COUNCIL, 19 MAYOR, 11 SHERIFF — comprehensive local coverage every cycle.

## Recommendation

PASS WITH FIXES. The April pass was solid on structure and on the 4 clippings it deeply spot-checked, but missed a class of errors in editorial-body comparison language (opposed candidates named explicitly in prose but not extracted as their own opposed records). The 9 added/corrected records resolve every issue surfaced in this re-QA's 10-clipping spot-check sample. The 1976 CNTY COMM dual-endorsement pattern is the only remaining open data question; it may be a legitimate "both qualified" treatment of Benton/Linn cross-coverage and is flagged for future verification.
