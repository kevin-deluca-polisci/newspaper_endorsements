# El Paso Times (145300) — V9 verification skill: COMPLETE (final double-check 2026-06-24)

**UPDATE 2026-06-24 (final double-check):** 1964 candidate slate **now image-verified** via the misfiled `19621105.pdf` (=Nov 3 1964 "Your Turn To Vote" full list) — all 15 endorsed records confirmed; 3 e=0 are inferred opponents (annotated, factually correct). 1934 confirmed prop-only ("Texas Amendments To Constitution"). 2018 County Judge Cook+Samaniego dual endorsement image-verified (March Dem primary list). Integrity clean (501 cand, Pattern K=0, 0 dups); archive synced (md5 identical). See QA_REPORT.md "FINAL DOUBLE-CHECK" section. Remaining items below are low-confidence M/L descriptors only.


Large folder: 454→446 cand, 218 props, 41 years (1920-2018), 85 clippings. (Skill classifies this as a ~4-hr folder.)

## DONE so far:
- Stage 0 inventory + baseline integrity: Pattern K=0, 0 dups, 0 blank names.
- Removed 3 formatting-variant duplicates (1962 Owen Frank III, 1970 Kaster d4, 1972 Kaster d71).
- **1964-1976 fully image-verified (agent + lead):** 1968 Blaine d2→67th Place 2; 1970 Boles County Clerk→e=0 (Fields endorsed); 1970 standalone JUDGE Moore removed (dup of County Judge); **1972 TX Supreme Court name garble cleaned** (Place 1=Daniel only [removed spurious "Jay, Sam"], Place 2=Sam Johnson [removed dup Daniel, fixed "Sam Jay"→"Sam"], Greenhill=Chief Justice); **1974 removed 2 miscoded duplicates** (Treasurer "Chacon"→she's County Clerk, statewide Treasurer is Holt; State-Bd-of-Ed "Wallace"→he's the Railroad Commissioner); 1974 Scoggins Place 2→1; 1976 Houston TX Sup Ct Place 1→2. 1964 candidate slate NOT VERIFIABLE (only an amendments editorial clipping exists for 1964 — flag).
- Key pattern confirmed: 1976 statewide Senate is already correctly TX/NM-tagged (Bentsen TX, Schmitt NM).

## STILL TO DO (continuation):
1. **Image-verify 1920-1962** (early era — props-heavy + presidents; agents not yet run).
2. **Image-verify 1978-2018** (agents not yet run) — this era has the bulk of the flagged issues.
3. **SYSTEMATIC TX/NM BORDER TAGGING (top priority):** El Paso borders New Mexico and the Times endorsed in BOTH states. ~9 statewide-office "double-endorsements" are really TX+NM pairs needing state_election tags: 1978 GOV (Hill-TX/Skeen-NM), 1978 SEN (Tower-TX/Domenici-NM), 1982 GOV (Clements-TX/Irick-NM), 1982 SEN (Bentsen-TX/Schmitt-NM), 1990 AG (Morales-TX/Udall-NM), 1990 GOV (Richards-TX/Bond-NM), 1990 LAND (Mauro-TX/Bigbee-NM), 1990 SEN (Gramm-TX/Domenici-NM), 1976 already done.
4. **Opponent-coding flags to resolve vs image:** 1982 TREASURER (Finley-D/Richards-D), 1990 LT GOV (Bullock-D/Thompson-L), 2018 CNTY JUDGE (Cook/Samaniego), 2018 JUDGE d1 (Chew/Nunez).
5. **Multi-place tags** (legit, need labels): 1974/1990/1994 Railroad Commission (full/unexpired seats), TX Supreme Court & Court of Criminal Appeals places, district-court judges by court.
6. **Props audit** all years (all-one-direction check on the 218 props).
7. **El Paso 3-paper cluster reconciliation** (Herald / Herald-Post / Times) — cross-paper metadata + shared statewide prop agreement.

## PROPOSITION RA ITEMS (2026-06-24 final pass)
1. **Empty descriptions (50 props):** years 1954(11), 1962(12), 1978(7), 1980(9), 1984(8), 1988(3) have correct directions but blank `prop_desc`. Recover the amendment-subject text from the Times' own ballot/amendment editorials (image). Generic "Constitutional Amendment N" is acceptable as a placeholder if subjects aren't recoverable.
2. **Times↔Herald-Post proposition direction disagreements** on shared statewide-amendment numbers in 11 of 15 overlapping years (1934/1936/1954/1958/1960/1962/1966/1968/1970/1972/1976). Both papers were independently image-verified, so these are a MIX of genuine editorial splits and possible per-year prop-numbering misalignment. RA should spot-check a sample (e.g., 1958 #1, 1954 #6/8/9) against both papers' images to confirm the numbering aligns before treating disagreements as real.
3. **RESOLVED this pass:** 1968/1972 amendment duplication removed (210→182 props); 1968/1972 directions image-verified; 1972 Johnson name restored to printed "Sam Jay Johnson".
