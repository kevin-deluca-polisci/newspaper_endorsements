# RA Manual Review Needs: Detroit Free Press

**Status:** AI processing complete through V7. The items below require manual RA intervention because they cannot be resolved by automated cross-year inference alone.

## Priority 1: STATE REP Pattern A backfill (~600+ records needed)

The 894 STATE REP records are ALL e=1 with no R/D opponent pairs. This is the single largest remaining gap.

**Recommended:** An RA should add Pattern A opponent records for each MI House race documented. Each year typically had 110 contested races. Many DFP-endorsed D candidates ran against R opponents who lost in Detroit-area D-dominant seats; many DFP-endorsed R candidates ran against D opponents in suburban R seats.

The cleanest approach: for each (year, dist) with a single e=1 record, look up the actual MI House race winner/loser and add the opposite party's nominee as e=0.

**Why automated Pattern A wasn't done:** Per-race MI legislative history is too specific for reliable LLM inference without primary source. Required Almanac of American Politics or MI Manual.

## Priority 2: 14 cross-party same-dist primary endorsement records

These records have both R and D candidates marked e=1 for the same (year, office, dist). Most are likely primary endorsements but extraction lost the primary/general distinction.

| Year | Office | Dist | Cross-party endorsement |
|------|--------|------|-------------------------|
| 1994 | H | 6 | CARR D + UPTON R |
| 1994 | H | 10 | BONIOR D + MCCOTTER R |
| 1994 | H | 11 | PETERS D + KNOLLENBERG R |
| 1994 | STATE REP | (one) | (need OCR) |
| 1996 | (one) | (one) | (need OCR) |
| 1998 | (one) | (one) | (need OCR) |
| 2002 | (one) | (one) | (need OCR) |

An RA should re-read the source clipping and determine which record was the primary endorsement (e='primary' if a new field is added) and which was general.

## Priority 3: LT GOVERNOR under-extraction

Only 1 LT GOVERNOR record (1982 RUPE PHILIP E. R) exists across 1970-2022. MI lt gov candidates run on tickets with gov, so ~14 records expected.

**Recommended:** When clippings explicitly endorse a gov ticket (gov + lt gov), the lt gov should be added with same direction. An RA should mine the MI gov endorsement clippings for the running mate.

## Priority 4: 88 STATE REP empty dist records

88 STATE REP records have empty dist after era-aware cross-year inference. These are candidates appearing in multiple eras with different dist values (post-redistricting).

**Recommended:** OCR-based extraction of dist value from individual clipping.

## Priority 5: Sparse 2014-2018 + 2000 coverage

- 2014: 1 clipping, 48 records
- 2018: 1 clipping, 27 records  
- 2000: 1 clipping, 31 records

DFP likely published multiple endorsement editorials per year (primary + general). Additional clippings would expand coverage for these years.

## Priority 6: 1972 PRES + 1992 PRES VP

- 1972 PRES: DFP had no PRES endorsement record extracted. National election year — should have one.
- 1996 VP DOLE: only Kemp present, no Dole D opp.

Minor structural gaps to verify against original clippings.

## Priority 7: 440 records below 0.90 confidence

These are mostly V2/V3 Pattern A backfill records (0.85) and structural records with limited extraction text. Not blocking issues but RA verification would boost confidence.

## What is NOT a concern (V7 PASS)

- **Structural integrity:** All 2,553 cand + 216 prop records PASS every validation check (year, endorsed, conf, inc fields, name format, party labels, state fields, newspaper_id, office codes, duplicates, Pattern K). 
- **Federal Pattern A coverage:** All 14 PRES/VP cycles 1968-2022 with R+D pairs, all SEN races, all GOV races, key AG/SoS races.
- **Local boards:** All JUDGE/TRUSTEE/REGENT/SCHOOL BOARD/SUPREME COURT/COURT OF APPEALS standardized to Nonpartisan with proper dname.
- **Cross-year naming:** 240+ name variants reconciled (ESCH MARVIN→MARVIN L., O'HAIR JOHN→JOHN D., etc.).
- **Inc flag coverage:** 19% of records have inc flags via cross-year matching (back-to-back election + era-aware + 4-year cycle).
- **D-lean validated:** 1960s-2010s 21-33% R, 2020s 2% R; cross-paper with DN confirms (DFP 29.2% R vs DN 60.6% R partisan e=1).
- **dname coverage:** 99.96% (only 1 empty - 2004 POTTS CNTY COMM).
- **Notes coverage:** 100% (all 2,553 records have notes).
- **Props:** 216 records with 3 canonical prop_types (105 PROPOSITION + 101 REFERENDUM + 10 BOND), 11 OCR-flagged empty direction documented.
