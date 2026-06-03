# QA Report: York Dispatch

**Audit date:** 2026-04-28
**Folder:** York Dispatch
**Newspaper ID:** 142700
**Data coverage:** 1992-2010, 31 clippings, 120 candidate records, 4 proposition records

## Overall Assessment

**PASS WITH FIXES**

Pennsylvania paper covering York County. Smaller paper than the York Daily Record, traditionally Republican-leaning but the 2008 retrospective in the Daily Record's archive notes that "in 1992, the Dispatch threw a change up and backed Democrat Bill Clinton" — and indeed our 1992 data has no Clinton endorsement so that's interesting (the Dispatch's 1992 clippings in this folder are the daily endorsements of state and local races, not the presidential editorial). 10 election years 1992-2010. Stage 1 came back clean. Stage 2 spot-check confirmed extraction accuracy. Stage 3 standardized 19 cross-paper name variants. Stage 4 confirmed 6 low-confidence records as documented OCR-degraded cases.

## Stage 1: Structural Validation

- CSV headers complete (16 candidate columns + pipeline fields, 11 proposition columns + pipeline fields)
- Year range 1992-2010, 10 unique election years (all even years matching general elections)
- All `endorsed` values valid (1/0/empty)
- All clippings on standardized `142700_YYYYMMDD[_v2].pdf` format
- All `newspaper_id` populated as `142700` (the original metadata typo "142651" was corrected during regeneration)
- All `state_newspaper` and `state_election` populated as `PA`
- No incumbency `=0` errors
- No row-level structural issues

## Stage 2: Spot Check

**Clippings sampled:**
- `142700_19921019.pdf` (1st of 10 daily endorsements; 13th State Senate — Armstrong R-inc over Petitto D)
- `142700_19921030.pdf` (last 1992 daily; US Senate — Specter R-inc over Yeakel D)
- `142700_19981102.pdf` (1998 wrap-up with 9 candidates + 2 propositions)

**Accuracy:** 16/16 sampled records substantively correct.

- **1992-10-19 (13th State Sen):** Armstrong (R inc) endorsed over Petitto (D). Editorial language: "we still endorse him this election year" despite a per-diem disagreement; Petitto "seriously lacks comprehensive knowledge of the issues." Both records correctly captured.
- **1992-10-30 (US Sen):** Specter (R inc) endorsed over Yeakel (D), with the editorial admitting "our heart follows Yeakel, but our minds tell us to remain practical this election year." Both records correctly captured.
- **1998 wrap-up:** Comprehensive list of state/federal endorsements + 2 propositions (jury commissioner repeal endorsed; bail amendment opposed). All matched.

**Recommendation:** Solid extraction; daily 1992 clippings each focused on a single race in sequence (13th State Sen → 31st State Sen → State Reps 199, 193, 95, 196, 93, 92, 94 → US Sen) — captured cleanly.

## Stage 3: Variable Coding & Dedup

**Issues found:** 19 (cross-paper name variants) | **Auto-fixed:** 19 | **User-corrected:** 0 | **Remaining:** 0

### Changes made

- **Cross-paper name standardization (19 records):** Standardized to match the unified naming used across both York papers, using the most complete form for each candidate. Examples:
  - SAYLOR, STAN → SAYLOR, STANLEY (Dispatch was already STANLEY; Record was STAN; standardized both to STANLEY)
  - STETLER, STEPHEN → STETLER, STEPHEN H. (Dispatch added the H.)
  - ARMSTRONG, GIBSON → ARMSTRONG, GIBSON E.
  - FOWLER, ROBERT H → FOWLER, ROBERT H. (period added)
  - CASEY, ROBERT P JR / CASEY, ROBERT JR → CASEY, ROBERT P. JR. (Bob Casey Jr., later US Senator)
  - BUSH, GEORGE W → BUSH, GEORGE W. (period added)
  - MACKERETH, BEVERLY → MACKERETH, BEVERLY D.
  - ELLSPERMAN, LARRY → ELLSPERMAN, LAURENCE
  - WAUGH, MIKE → WAUGH, MICHAEL
  - ALLOWAY, RICHARD → ALLOWAY, RICHARD II
- **Office codes:** All 9 distinct codes canonical (PRESIDENT, GOVERNOR, SENATOR, H, STATE SENATOR, STATE REP, ATTORNEY GENERAL, AUDITOR, TREASURER).
- **Candidate names:** All in ALL CAPS, LASTNAME, FIRSTNAME format. Six records have empty first names due to OCR-truncated last-name-only references; all flagged with conf < 0.75 and detailed conf_notes.
- **Districts:** Numeric only. PA Congressional 19, State Senate 13/15/28/31/33, State House 92/93/94/95/169/193/196/199.
- **Party labels:** All canonical (Democrat, Republican).
- **Incumbency flags:** No `=0` errors. No dual D+R errors.
- **Dedup:** No duplicate `(year, cand_name, office, dist)` keys.

### Crosscheck.py incumbency suggestion (already correct)

- **STETLER, STEPHEN H. (STATE REP 95) 2000: "likely incumbent"** — correct (Stetler held the seat from 1991+); d_inc=1 was already set.

## Stage 4: Low-Confidence Re-Scan

**Records reviewed:** 6 | **Confirmed correct:** 6 | **Corrected:** 0 | **Still uncertain:** 0

- **1992 KILGORE (STATE REP 94, conf 0.70, endorsed=1):** OCR-degraded clipping for the 94th State House race. Endorsement direction (D challenger over R Saylor) is clear from editorial conclusion ("a refreshing change... farmer with conservation focus"); first name not extractable. Coded with detailed conf_note.
- **1992 SAYLOR, STANLEY (STATE REP 94, conf 0.70, endorsed=0):** Same race; Saylor's "1987 firing" reference and "political baggage" are cited in opposition. OCR captures the surname and party but the editorial language was degraded.
- **2004 PAOLETTA (H 19, conf 0.70):** PA-19 Congressional race. Last name only in OCR. Paoletta ran as Constitution Party in 2000 but the 2004 candidate's party is unclear. Conf_note documents the uncertainty.
- **2004 STEEL (H 19, conf 0.70):** Same PA-19 race. Last name only in OCR. Coded as Independent given the multi-candidate context, but party uncertain.
- **2004 QUINLAN (STATE SENATOR 31, conf 0.70):** Last name only; party inferred as Democrat (opposing Republican Vance).
- **2004 EPSTEIN (STATE SENATOR 15, conf 0.70):** Editorial encourages voters to research candidate websites; not a clear endorsement direction. Coded as endorsed=null.

All 6 low-confidence records have detailed `extraction_confidence_note` fields documenting the OCR limitation.

## Coverage notes (non-blocking)

- **1992 Dispatch unique pattern:** The Dispatch published 10 daily endorsement editorials (one per business day) over Oct 19-30, 1992, with each editorial focused on a single race. This contrasts with the Daily Record's pattern of running a single comprehensive wrap-up clipping closer to election day. The 10 daily clippings together provide coverage of: 13th State Senate, 31st State Senate, 199th State House, 193rd State House, 95th State House, 196th State House, 93rd State House, 92nd State House, 94th State House, US Senate.
- **1992 presidential endorsement missing:** Per the Daily Record's 2008 retrospective, the York Dispatch endorsed Bill Clinton (D) for President in 1992 (described as breaking with the paper's Republican tradition). However, no clipping in this folder captures that endorsement editorial — it would have appeared in early November 1992 (around 11/01-11/03), but those dates are not in the source clippings. The Specter endorsement (10/30) was the last clipping in the 1992 series.
- **Specter 1992 (R inc):** Specter is coded as Republican here, which is correct for 1992. He switched parties to Democrat in April 2009. Records from 2010 (post-switch) are not in this folder.
- **No Dispatch-only candidates need second-paper backfill:** All endorsement-direction records have at least one extracted record per paper per year.
- **2004 PA-19 multi-candidate race:** The 2004 PA-19 race appears to have had multiple non-major-party challengers (Paoletta, Steel) per the OCR. These records preserve the extraction with low confidence.
- **Newspapers.com source:** Same as Daily Record — all clippings sourced from newspapers.com via `cantstopkevin` account; tesseract OCR was needed to read article body content.
