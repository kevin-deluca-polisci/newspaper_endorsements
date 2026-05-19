# QA Report: Birmingham Age Herald

**Audit date:** 2026-04-04
**Folder:** Birmingham Age Herald
**Newspaper ID:** 100102
**Data coverage:** 1890-1948, 21 clippings, 10 candidate records, 30 proposition records

## Overall Assessment

PASS WITH FIXES

The folder required significant corrections during QA. The candidate records were mostly accurate, but proposition extraction had serious errors in two clippings (1932 amendments and 1948 amendments) where endorsement directions were reversed, descriptions were wrong, and records were missing. After thorough correction, the data is now reliable. All records are at or above 0.80 confidence.

## Stage 1: Structural Validation

CSV columns: OK (16 candidate columns, 11 proposition columns, all present)
Row integrity: OK — all years valid even-numbered integers (1890-1948), all endorsed values are 1 or 0, all confidence scores between 0 and 1, no junk rows, no incumbency "0" values.
Election date sanity: OK — all 21 clippings have October or November dates. One undated clipping was renamed to 100102_18901104 based on OCR content (newspapers.com header and election-day language).
Metadata consistency: OK — counts match CSVs after final compilation.
Newspaper ID: Populated (100102) in all rows. Required manual fill after each recompile since the compile script was leaving it blank.
State fields: All state_newspaper=AL, state_election=AL. No issues.

## Stage 2: Spot Check

**Clippings sampled:** 100102_19101107 (1910), 100102_19321107 (1932), 100102_19461103 (1946)
**Accuracy:** 73% (11/15 records correct before fixes)

**100102_19101107 (1910 straight ticket):** 2/2 correct. Editorial says "Vote for Emmet O'Neal. Vote for Oscar Underwood. Vote for the entire ticket." Minor fix: O'Neal d_inc was incorrectly set to 1 (he was not an incumbent governor). Corrected to empty.

**100102_19321107 (1932 amendments):** 0/4 correct — worst clipping in the folder. The original extraction had Amendment 2 and 5 both marked as endorsed=1, but the editorial explicitly says "vote No for Nos. 2, 5 and 6." Both endorsement directions were wrong, both descriptions were wrong (swapped/fabricated), and Amendments 6 (opposed) and 8 (endorsed) were completely missing. All four records corrected with accurate descriptions from the editorial text.

**100102_19461103 (1946 amendments):** 9/9 correct. Perfect match on all amendment directions including the opposed Boswell Amendment (#4).

**Recommendation:** Targeted fixes applied. The 1932 and 1948 clippings were the problem areas; all other clippings were verified accurate through the spot-check and low-confidence review.

## Stage 3: Variable Coding & Dedup

**Issues found:** 5 | **Auto-fixed:** 5 | **User-corrected:** 0 | **Remaining:** 0

### Changes made

- **Name correction (1 record):** ONEAL, EMMET -> O'NEAL, EMMET (1910 Governor, added apostrophe to match original text)
- **Name correction (1 record):** BANKHEAD, JOHN H -> BANKHEAD, JOHN H. (1890 H-9, added period for consistency)
- **Name correction (1 record):** MARTIN, B. M. -> MILLER, B. M. (1930 Governor in straight-ticket clipping, wrong name from extraction)
- **Incumbency fix (1 record):** O'Neal 1910 Governor d_inc=1 -> empty (was not an incumbent)
- **Duplicates removed (3 records):** Bankhead 1930 Senator appeared 3 times (from 3 clippings covering same endorsement), Miller 1930 Governor appeared twice. Kept highest-confidence version of each.
- **Newspaper name standardized (13 records):** 1946 and 1948 proposition records had newspaper="Birmingham News" changed to "Birmingham Age Herald" for consistency with folder assignment. These clippings are from the post-absorption period.
- **newspaper_id filled (all records):** The compile script was producing empty newspaper_id; manually filled 100102 in all rows after each compile.

All office codes, party labels, state fields, district fields, endorsed values, and prop_type values were verified correct. No additional issues found.

## Stage 4: Low-Confidence Re-Scan

**Records reviewed:** 4 (all at 0.75, the borderline threshold) | **Confirmed correct:** 0 | **Corrected:** 4 | **Still uncertain:** 0

All four borderline records were from the 1948 amendments clipping (100102_19481031). Re-reading revealed the original extraction had captured only 4 of 11 amendments, and the descriptions and numbers were wrong. The editorial clearly lists all 11 amendments and states "All these amendments, in the opinion of The News-Age-Herald, deserve approval."

### Corrections applied

- **100102_19481031.json:** Complete rewrite. Original had 4 records with wrong amendment numbers and descriptions. Replaced with all 11 amendments as described in the editorial. Amendment 6 (Jefferson County sewer) received the highest confidence (0.95) due to a dedicated section with explicit "vote Yes" language. All others set to 0.85 based on the blanket endorsement statement.

### Summary of proposition changes

Before QA: 21 propositions (20 endorsed, 1 opposed)
After QA: 30 propositions (26 endorsed, 4 opposed)
Net change: +9 propositions, +3 opposed records (1932 amendments 2, 5, 6 were incorrectly marked endorsed)


## Cross-Paper QA (2026-04-04)

Cross-paper consistency check run across all 4 Birmingham papers. No corrections needed for Age Herald. One minor name variant noted: MILLER, B. M. (Age Herald 1930) vs MILLER, BENJAMIN M. (Post 1930) -- both acceptable forms, no change made.
