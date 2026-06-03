# QA Report: York Daily Record

**Audit date:** 2026-04-28
**Folder:** York Daily Record
**Newspaper ID:** 142651
**Data coverage:** 1980-2008, 24 clippings, 166 candidate records, 7 proposition records

## Overall Assessment

**PASS WITH FIXES**

Pennsylvania paper covering York County. 14 election years 1980-2008 with mostly comprehensive endorsement coverage. Stage 1 came back clean. Stage 2 spot-check confirmed extraction accuracy on sampled clippings. Stage 3 standardized 22 cross-year name variants and removed 1 duplicate Clinton 1992 record + 1 empty-name placeholder. Stage 4 confirmed 2 low-confidence records as documented OCR-degraded cases. Added 1 record (1988 Bush HW for President) based on a 2008 retrospective listing in the same paper.

## Stage 1: Structural Validation

- CSV headers complete (16 candidate columns + 8 pipeline fields, 11 proposition columns + 8 pipeline fields)
- Year range 1980-2008, 14 unique election years (all even years matching general elections)
- All `endorsed` values valid (1/0/empty)
- All clippings on standardized `142651_YYYYMMDD[_v2].pdf` format
- All `newspaper_id` populated as `142651`
- All `state_newspaper` and `state_election` populated as `PA`
- No incumbency `=0` errors
- No row-level structural issues

## Stage 2: Spot Check

**Clippings sampled:**
- `142651_19841105.pdf` (Nov 5, 1984 — 12 candidates, clean compact wrap-up list)
- `142651_19961104.pdf` (Nov 4, 1996 — 11+ candidates, full wrap-up editorial)
- `142651_20041031.pdf` (Oct 31, 2004 — heavy OCR degradation)

**Accuracy:** 23/23 sampled records substantively correct.

- **1984:** All 12 records on the compact list matched the OCR (Bruce Smith, Carville Foster, Greg Snyder, Michael Bortner, Donald Dorr, John Broujos, John Rowland, Allen Ertel for AG, Susan Shanaman for Aud Gen, Budd Dwyer for Treasurer, Bill Goodling for Congress, Reagan for President). The 1984 endorsement of Reagan was the paper's first Republican presidential endorsement (per 2008 retrospective, "in 1984, the York Daily Record... officially broke ranks with its Democratic past and endorsed Ronald Reagan for president").
- **1996:** Full wrap-up text confirms Clinton (D, inc) for President (Dole opposed); Goodling (R) for Congress; Joe Kohn (D) for AG; plus state legislative endorsements. All matched.
- **2004:** OCR was severely degraded. Only Stetler (D-95) and Saylor (R-94) running unopposed could be extracted from the body. Bush (R) presidential endorsement was correctly inferred from the 2008 retrospective listing, which explicitly listed past presidential endorsements (1984-2008). Coded with conf 0.72 + detailed conf_note.

**Recommendation:** Solid extraction. Minor fixes applied in Stage 3.

## Stage 3: Variable Coding & Dedup

**Issues found:** 24 | **Auto-fixed:** 24 | **User-corrected:** 0 | **Remaining:** 0

### Changes made

- **Cross-year name standardization (22 records affected, 10 distinct names):** Multiple cross-year name variants in the same person's records standardized to the longest/most complete form. Examples:
  - DWYER, BUDD → DWYER, R. BUDD (years 1980, 1984)
  - SNYDER, GREG → SNYDER, GREGORY (years 1984, 1990)
  - STETLER, STEPHEN / STETLER, STEVE → STETLER, STEPHEN H. (years 1990, 1992, 1994, 1996, 1998, 2000, 2002, 2004)
  - NICKOL, STEVE → NICKOL, STEVEN (years 1990, 1992, 2002, 2006, 2008)
  - ARMSTRONG, GIBSON → ARMSTRONG, GIBSON E. (1992, 2000)
  - WAUGH, MIKE → WAUGH, MICHAEL (1992, 1996)
  - MASLAND, AL → MASLAND, ALBERT (1992, 1996, 1998)
  - CASEY, BOB JR. → CASEY, ROBERT JR. (1996, 2000)
  - MACKERETH, BEV → MACKERETH, BEVERLY D. (2000, 2002, 2006)
  - BUSH, GEORGE H. W. (1988, 1992) and BUSH, GEORGE W. (2000, 2004) preserved as distinct (different people).
- **Duplicate removed (1):** CLINTON, BILL (PRESIDENT, 1992) — appeared in both the 1992-10-25 daily endorsement clipping and the 1992-11-01 wrap-up. Removed the wrap-up duplicate; kept the original 10-25 record.
- **Empty placeholder removed (1):** A 2008 STATE REP 93rd row with empty cand_name and a note "NO ENDORSEMENT MADE IN 93RD DISTRICT". Removed; the no-endorsement information is preserved in the 2008 wrap-up source clipping context.
- **Office codes:** All 10 distinct codes canonical (PRESIDENT, VICE PRESIDENT, GOVERNOR, SENATOR, H, STATE SENATOR, STATE REP, ATTORNEY GENERAL, AUDITOR, TREASURER). AUDITOR is used for PA Auditor General.
- **Candidate names:** All in ALL CAPS, LASTNAME, FIRSTNAME format after fixes.
- **Districts:** Numeric only (no "District"/"Dist." prefix). PA Congressional 19, State Senate 13/28/31, State House 92/93/94/95/193/196/199.
- **Party labels:** All canonical (Democrat, Republican, Independent for Perot 1992).
- **Incumbency flags:** No `=0` errors. No dual D+R errors.

### Crosscheck.py incumbency suggestions (not applied, false positives)

- **CLINTON, BILL (PRESIDENT) 1992: "likely incumbent" suggestion** — false positive caused by the duplicate Clinton record before dedup. Resolved by removing the duplicate.
- **DWYER, R. BUDD (TREASURER) 1984: "likely incumbent"** — actually correct (Dwyer was Treasurer 1980-1987). The script flag was suggestive only; manually verified and r_inc=1 is set correctly.
- **SMITH, BRUCE (STATE REP 92) 1984 / DORR, DONALD (STATE REP 193) 1984: "likely incumbent"** — both correct based on 1980 endorsements. r_inc flag set.
- **NICKOL, STEVEN (STATE REP 193) 2008: "likely incumbent"** — correct; r_inc=1 set.

## Stage 4: Low-Confidence Re-Scan

**Records reviewed:** 2 | **Confirmed correct:** 2 | **Corrected:** 0 | **Still uncertain:** 0

- **1980 ANDERSON (STATE REP, conf 0.65):** OCR is degraded. The 1980 clipping mentions Anderson and Dorr as incumbents being endorsed alongside Smith. The first name and party are not extractable from the OCR. Coded with conf 0.65 and detailed conf_note. The endorsement direction (endorsed=1) is correct based on the editorial's conclusion ("Anderson and Dorr will best represent York County in Harrisburg").
- **2004 BUSH, GEORGE W. (PRESIDENT R, conf 0.72):** As noted in Stage 2, the 2004 OCR body was almost entirely blank. The endorsement was inferred from the 2008 retrospective in `142651_20081025.pdf` which explicitly stated "2004 - George W. Bush (R)". This is reliable since it's a self-listing from the same paper. Conf 0.72 reflects the indirect source rather than uncertainty about the position.

## Coverage notes (non-blocking)

- **1988 Bush HW Presidential record added retroactively:** The 1988 wrap-up clipping (`142651_19881104.pdf`) was OCR-unreadable. The 2008 retrospective in the same paper explicitly listed "1988 - George H. W. Bush (R)" as a past endorsement. Added a record to the 1988-11-04 JSON with conf 0.75 and detailed conf_note explaining the inference source. Without this addition, the data would have a gap in the otherwise-complete presidential endorsement history.
- **2008 retrospective clipping (`142651_20081025`):** Coded as no_endorsements (it's a retrospective blog post listing past endorsements, not a current endorsement editorial). This is the source for the 2004 Bush and 1988 Bush HW inferences above.
- **1988 wrap-up (`142651_19881104`):** Originally coded as no_endorsements due to OCR failure. After adding the inferred Bush record, it has 1 candidate. The other 1988 races (Treasurer, Auditor General, Attorney General, State Reps) are extracted from the daily clippings (10/31, 11/01, 11/02, 11/03).
- **No Bortner record post-2000:** Bortner served PA-95 1984-1994; the 1990s wrap-ups should still mention him while he was incumbent. Records exist for 1990, 1992, 1994. After 1994 he was succeeded by Stetler (D), and Stetler appears in 1996+.
- **Daily-vs-wrap-up pattern:** Coverage in 1980 (3 daily clippings 10/28-10/30) and 1988 (4 daily clippings 10/31-11/03) is split across daily editorials, each focusing on one race. The 1984 and 1990+ years use a single wrap-up clipping. Both patterns work fine for the dedup logic.
- **Newspapers.com source:** All clippings sourced from newspapers.com via `cantstopkevin` (the user's account). The PDF wrappers add a header page that pdftotext extracts but obscures the article body, so all extraction relied on tesseract OCR of the page images.
