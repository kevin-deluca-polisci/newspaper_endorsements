# RA Manual Review Needs: Detroit News

**Status:** AI processing complete through V7. The items below require manual RA intervention because they cannot be resolved by automated inference alone.

## Priority 1: STATE REP Pattern A backfill (~400+ records needed)

The 530 STATE REP records are mostly e=1 with no R/D opponent pairs. Same gap as Detroit Free Press.

**Recommended:** An RA should add Pattern A opponent records for each MI House race documented. Each year typically had 110 contested races. Many DN-endorsed R candidates ran against D opponents (Detroit-area D-dominant seats); many DN-endorsed D candidates ran against R challengers in suburban districts.

**Why automated Pattern A wasn't done:** Per-race MI legislative history is too specific for reliable LLM inference without primary source (Almanac of American Politics or MI Manual).

## Priority 2: 24 cross-party same-dist primary endorsement records

These records have both R and D candidates marked e=1 for the same (year, office, dist). Most are likely primary endorsements but extraction lost the primary/general distinction.

| Year | Total groups |
|------|--------------|
| 2000 | 1 |
| 2002 | 2 |
| 2006 | 5 |
| 2008 | 3 |

An RA should re-read the source clippings to determine which record was the primary endorsement (e='primary' if a new field is added) and which was general.

## Priority 3: Missing year clipping coverage

DN has STATE REP coverage gaps for: 1968, 1970, 1972, 1976, 1978, 1982, 2010, 2012.

These reflect clipping availability not extraction failures. Additional clippings would expand coverage.

## Priority 4: 4 NO ENDORSEMENT records (by design)

- 1970 SENATOR: "THE NEWS WITHHELD ITS U.S. SENATE ENDORSEMENT"
- 2004 PRESIDENT: "Detroit News stated 'No preference' for President"
- 2020 PRESIDENT: "Detroit News declined to endorse Trump or Biden"
- 2022 ATTORNEY GENERAL: "Paper explicitly declined to endorse either Nessel or DePerno"

These are correctly coded as endorsed='' with notes documenting the editorial decision.

## Priority 5: 14 records below 0.85 confidence (actually 0)

V6 confidence push eliminated all below-0.85 records. All 0 records below threshold.

## Priority 6: 301 records below 0.90 confidence

These are mostly V2/V3 Pattern A backfill records (0.88) and structural records. Not blocking but RA verification would boost confidence.

## Priority 7: LT GOVERNOR under-extraction

Only 1 LT GOVERNOR record (1986 ENGLER, COLLEEN R) across 1968-2022. MI lt gov candidates run on tickets with gov, so ~14 records expected.

**Recommended:** When clippings explicitly endorse a gov ticket, the lt gov should be added with same direction.

## Priority 8: 1986 AG CLELAND ROBERT - empty party (already flagged for verification)

DN endorsed CLELAND ROBERT for AG in 1986 - empty party, V5 inferred D. Need OCR confirmation. Frank Kelley D AG inc actually won in 1986 against R challenger William P. Hampton. Cleland may have been the D primary loser.

## What is NOT a concern (V7 PASS)

- **Structural integrity:** All 2,038 cand + 254 prop records PASS every validation check (year, endorsed, conf, inc fields, name format, party labels, state fields, newspaper_id, office codes, duplicates, Pattern K).
- **Federal Pattern A coverage:** All 14 PRES/VP cycles 1968-2022 with R+D pairs, all SEN races, all GOV races, key AG/SoS races.
- **Local boards:** All JUDGE/TRUSTEE/REGENT/SCHOOL BOARD/SUPREME COURT/COURT OF APPEALS standardized to Nonpartisan with proper dname.
- **Cross-year naming:** 90+ name variants reconciled in V3.
- **Inc flag coverage:** 20% of records have inc flags via cross-year matching.
- **R-lean validated:** 1960s-2010s 28-88% R, 2020s 50% balanced; cross-paper with DFP confirms (DN 58% R vs DFP 29% R partisan e=1).
- **dname coverage:** 100% (all records).
- **Notes coverage:** 100% (all records).
- **Props:** 254 records with 3 canonical prop_types (116 PROPOSITION + 104 REFERENDUM + 34 BOND), 9 OCR-flagged empty direction.
- **JUDGE court standardization:** 228 fixes across Wayne/Detroit Recorder's/Oakland/Macomb circuits.
- **University boards:** 126 fixes consolidating Wayne State/MSU/U-M into canonical dnames.
- **Mean confidence: 0.910** (matches DFP V7 baseline).
