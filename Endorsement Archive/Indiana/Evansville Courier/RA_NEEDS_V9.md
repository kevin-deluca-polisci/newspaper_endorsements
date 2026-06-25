# RA Needs: Evansville Courier (113151) — after V9 deep image verification (2026-06-24)

Deep image pass (re-OCR all 95 clippings + 4 era-agents + lead re-verification) corrected real errors and recovered the missing 1932 year. Candidates 439→438, props 21→23; Pattern K=0, 0 dups, 0 blank names. The folder was in good shape (mostly a Democratic/Republican Indiana paper with clean slates); the items below are residual judgment/external calls, NOT auto-applied.

## Genuinely remaining for RA
1. **Pattern-A inferred opponents (not in any clipping image).** The losing major-party candidate in races the paper decided is recorded by convention but never printed: presidential opponents (1956 Stevenson, 1960 Kennedy, 1968 Humphrey, 1972 McGovern, etc.) and 1980 Hillenbrand/Carter/Quayle, 1982 Fithian, 1984 Townsend/Mondale, 1986 Long. Confirm the project wants these inferred records; they are by-design, not image-confirmed.
2. **Roster-filled party codes** on offices the editorials list without party: judges (1974 Dietsch/Lynn, 1982 O'Connor/Shepard/Lensing, 1984 Bowers), school-board members, and several county offices (1986 Umbach/DeGroote, etc.). These come from a candidate roster, not the image. Verify against the Indiana candidate roster; some are internally inconsistent (1974 Dietsch filled D, Lynn left blank).
3. **District allocations among jointly-listed names are inferred.** 1980/1984 County Commissioners "1st and 3rd Districts" and 1984 School Board "1st and 3rd Districts" list names without pinning each to a district; the CSV assigns specific districts. 1974 state-rep districts (71/72) are roster-filled — the image lists state reps with NO districts.
4. **1942 Larrabee district** (currently d1): William H. Larrabee represented Indiana's 9th district, not Evansville's 1st — and the clipping reads as statewide commentary ("only one Indiana congressman… will survive"), so the e=1 "endorsement" and the district both need an RA decision (likely recode district or reclassify as commentary).
5. **1950 McCray first name** not printed in the clipping (surname fixed McVey→McCray from image); RA to confirm the full name from an external roster.
6. **1932 President (Roosevelt e=1 / Hoover e=0, conf 0.72):** the "After the Election" editorial is a philosophical liberal-vs-conservative piece that leans Roosevelt rather than a crisp "vote for" slate endorsement — kept at lower confidence for RA review.
7. **Weak omission flags not added:** 1920 McCulloch (hypothetical Gov mention), 1926 Rowbottom (named opposed incumbent contextually). 1946 Capehart endorsement is implied but the federal clipping is physically cut off — RA confirm.

## Pipeline note (no data impact)
The 1968 source PDF (`113151_19681105.pdf`) is a 4-page multi-year scan (1968/1970/1972/1974); the rendered PNGs/OCR for 1970/1972/1974 were duplicated from it. The **CSVs for those years are correct** (agents verified against the true images), but the render/OCR pipeline mis-copied 1968 output into those slots.

## Newspaper ID
`113151`; confirm Gentzkow-Shapiro permid in augmentation. Sister papers (Evansville Press, Evansville Courier and Press) are in `done/` — cross-paper reconciliation pending after all three are V9-verified.

## CROSS-PAPER RECONCILIATION (2026-06-24)
113151 (Courier, morning) ↔ 113150 (Courier-and-Press) are the SAME morning paper; their 1982-1998 records are near-duplicate. Reconciled 11 Courier party values to match the verified C&P (Wortman→R, Tuley→D, + 9 blank-fills). 113151 ↔ 113152 (Press, evening) are DISTINCT papers — 12 direction differences are real editorial splits (preserved). **DEDUP DECISION for project:** 113150's 1982-1998 ≈ 113151's — decide whether to keep one ID or both. See Evansville_Cross_Paper_QA.md (V9 section) in the Courier-and-Press folder.
