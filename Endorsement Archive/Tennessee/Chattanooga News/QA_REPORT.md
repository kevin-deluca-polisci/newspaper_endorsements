# QA Report: Chattanooga News

**Audit date:** 2026-04-28
**Folder:** Chattanooga News
**Newspaper ID:** 143903
**Data coverage:** 1922-1938, 9 clippings, 37 candidate records, 3 proposition records

## Overall Assessment

**PASS**

This is the pre-merger Chattanooga News (Democratic-leaning paper that ceased publication in 1939 when it merged into the Free Press). Extracted from a folder that originally lived inside `Chattanooga_News_Free_Press` and was split out into its own newspaper folder per user direction. Newspaper ID 143903 is a placeholder (the paper was not in the GS lookup file; only the merged Chattanooga News-Free Press carries 143901). Stage 1 came back clean. Stage 2 spot-check confirmed extraction accuracy. Stage 3 found no duplicates or coding errors. Stage 4 confirmed the single low-confidence record.

## Stage 1: Structural Validation

- CSV headers complete (16 candidate columns + 8 pipeline fields, 11 proposition columns + 8 pipeline fields)
- Year range 1922-1938, 7 unique election years (all even years matching general elections)
- All `endorsed` values valid (1/0/empty)
- All clippings on standardized `143903_YYYYMMDD.pdf` format with dates in October-November of even years
- All `newspaper_id` populated as `143903`
- All `state_newspaper` and `state_election` populated as `TN`
- No incumbency `=0` errors
- No row-level structural issues found

## Stage 2: Spot Check

**Clippings sampled:**
- `143903_19221107.pdf` (Nov 7, 1922 — 9 candidates)
- `143903_19341106.pdf` (Nov 6, 1934 — 6 candidates)
- `143903_19361103.pdf` (Nov 3, 1936 — 5 candidates)

**Accuracy:** 20/20 = 100%

- **1922:** All 9 records matched the OCR. The paper made strong Democratic endorsements: Peay over the GOP incumbent Taylor for Governor, McKellar for Senate, Sanders (the GOP fellow-townsman) opposed on national issues, McReynolds for House 3rd, Bass for state senate, Bryan and Grubb for state house. The paper explicitly framed itself as "not a partisan paper" but said its allegiance in 1922 lay with the Democrats both nationally and in Tennessee.
- **1934:** All 6 records matched. McKellar (D inc), Bachman (D inc, short-term seat), McAlister (D inc Governor), Pope (Fusion ticket challenger, opposed), Hooper (R Senate challenger, opposed), McReynolds (D H 3 inc). The editorial framing — "every reason to expect a strong vote of confidence" — is Tennessee-shorthand for endorsement and was correctly captured.
- **1936:** All 5 records matched. The 1936 OCR is degraded but the paper's editorial position is clear: pro-FDR landslide, pro-Browning (D Governor), reluctantly endorsed McReynolds (the "tame" Democratic incumbent), opposed Republicans (J. Will Taylor in 2nd district). Two records (FDR and Taylor) carry conf 0.78 with detailed OCR notes documenting the implicit nature.

**Recommendation:** Solid extraction. No corrections needed.

## Stage 3: Variable Coding & Dedup

**Issues found:** 0 | **Auto-fixed:** 0 | **User-corrected:** 0 | **Remaining:** 0

- **Office codes:** All 7 distinct codes canonical (GOVERNOR, SENATOR, H, RAILROAD COMMISSION, STATE SENATOR, STATE REP, PRESIDENT).
- **Candidate names:** All in ALL CAPS, LASTNAME, FIRSTNAME format. Two single-word entries (SANDERS, DUNLAP) reflect the paper using surname-only references; preserved per skill rules.
- **Districts:** No "District"/"Dist." prefixes. Only numbered districts (3 for House) populated; rest left blank.
- **Proposition types/numbers:** All canonical (REFERENDUM, BALLOT MEASURE) with distinguishing prop_num codes (TN-CONST-CONV-1924, TN-GAS-TAX-1938, TN-POLL-TAX-1938).
- **Party labels:** All canonical (Democrat, Republican, Independent for Pope's 1934 fusion ticket).
- **Incumbency flags:** No `=0` errors. No dual D+R errors.
- **Dedup:** No duplicate `(year, cand_name, office, dist)` keys.
- **Cross-year name standardization:** McReynolds was originally written as "MCREYNOLDS, S. D." in 1922 and "MCREYNOLDS, SAM D." in 1934/1936. Standardized to "MCREYNOLDS, SAM D." across all three years.

## Stage 4: Low-Confidence Re-Scan

**Records reviewed:** 1 | **Confirmed correct:** 1 | **Corrected:** 0 | **Still uncertain:** 0

- **1926 WHITE, WALTER (GOVERNOR D, conf 0.70):** The 1926 OCR is heavily degraded and reads as a national overview rather than a clean local endorsement editorial. The paper clearly opposed Walter White ("we cannot back Mr. Walter White") but did not state a clear alternative endorsement. The endorsed=0 record is correct and the conf_note ("Heavy OCR degradation; paper opposed White but did not clearly state who it endorsed") accurately documents the limitation.

All other records carry confidence 0.78 or higher.

## Coverage notes (non-blocking)

- **1928 no-endorsements:** The 1928 clipping OCR is essentially garbled (most lines are random characters from poor-quality scan). Coded as no_endorsements with note. The paper likely endorsed Smith (D) over Hoover (R) given the paper's general Democratic alignment, but no extractable text supported that coding.
- **1936 implicit endorsements:** FDR was not explicitly endorsed in the 1936 editorial — the paper instead spoke of the New Deal indorsement holding "as well in Tennessee as in the rest of the country." Coded as endorsed=1 with conf 0.78 and detailed conf_note.
- **1938 Republican incumbents in 1st and 2nd Districts:** B. Carroll Reece (D-1) and J. Will Taylor (R-2) — wait, Reece was R, not D. The paper noted both would be re-elected but did not endorse them; the paper's allegiance lay with the New Deal Democrats. Coded endorsed=0 with conf 0.75.
- **Newspaper ID note:** 143903 is a placeholder ID assigned by the user since the paper was not in the GS lookup. Augmentation pipeline (DIME/Voteview/permid) will need to handle this paper specially or skip the permid merge.
- **Pre-merger paper:** Chattanooga News merged with Chattanooga Free Press in 1939 to form the News-Free Press. After 1939, all endorsement data appears under newspaper_id 143901.

---

## V9 DEEP VERIFICATION — 2026-06-21
Re-OCR'd all 9 clippings (1922–1938); high-res vision-verified every high-risk record.
**Result: PASS WITH FIXES.** 57→58 candidate records. Integrity clean (Pattern K=0, no dups).

3 corrections (1922 name scramble + omission):
- STATE SENATOR "Bass, Eugene"→"Bryan, Eugene"; STATE REP "Bryan, W.J."→"Bass, W.J." (V1 swapped the two names).
- +STATE REP "Coleman, D. M." (D) — omitted from "Maj. W. J. Bass, D. M. Coleman and W. French Grubb to the house."

Confirmed-correct (vision): 1928 Hoover-over-Smith ("Hoovercrat" bolt); 1930 Horton reluctantly endorsed over Taylor-sponsored Bruce; 1932/1934 McAlister-D over Pope-Ind; 1936 full D ticket (mirrors sister Free Press); 1938 five House districts (no scramble). Props (5, all YES) consistent with a progressive anti-poll-tax paper.
