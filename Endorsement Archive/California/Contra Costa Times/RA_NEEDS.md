# RA Manual Review Needs: Contra Costa Times

**Status:** AI processing complete through V7. The items below require manual RA intervention because they cannot be resolved by automated OCR alone.

## Priority 1: 5 unverifiable clippings (~59 records affected)

The CCT source files are FULL newspaper pages, not isolated endorsement articles. At workable OCR resolution (75 DPI), 5 of 15 clippings yielded no usable endorsement text due to column scrambling and density.

**Recommended:** Manually clip the endorsement article(s) only from these pages, producing tight crops. Then re-extract with the standard pipeline.

| Clipping | Date | Approximate Records | Reason |
|----------|------|---------------------|--------|
| 172450_19661108 | 1966-11 | ~23 records | Column-scrambled OCR |
| 172450_19661106 | 1966-06 | (overlaps above) | Column-scrambled OCR |
| 172450_19700602 | 1970-06 | overlapping w/ 1970-11 | Column-scrambled OCR |
| 172450_19721107 | 1972-11 | ~7 records | Column-scrambled OCR |
| 172450_19741105 | 1974-11 | ~29 records | Column-scrambled OCR |

All ~59 records currently in the data sourced from these clippings have a V2 flag in `notes_endorse` saying "V2 RA-review: V2 OCR could not parse this year's clipping due to column-scrambling; record sourced from V1 extraction and not re-verified."

## Priority 2: 8 low-confidence records (below 0.75)

| Year | Office | Name | Conf | Issue |
|------|--------|------|------|-------|
| 1976 | DIRECTOR | COSTA, WALTER | 0.70 | PH Recreation board name OCR-ambiguous |
| 1976 | DIRECTOR | PHALEN, MICHAEL E. | 0.70 | PH Recreation board name OCR-ambiguous |
| 1978 | H | ALLEN, ROBERT S. | 0.70 | Originally extracted as DELLUMS, corrected via Stage 4; needs source confirm |
| 1978 | SCHOOL BOARD | BARDELLINI, PAT | 0.65 | Mt. Diablo recall - framing ambiguity |
| 1978 | SCHOOL BOARD | KELLY, HELEN | 0.65 | Mt. Diablo recall - framing ambiguity |
| 1978 | SCHOOL BOARD | COSGROVE, MILTON C. | 0.65 | Mt. Diablo recall - framing ambiguity |
| 1978 | SCHOOL BOARD | LANDI, VIRGINIA | 0.65 | Mt. Diablo recall - framing ambiguity |
| 1978 | SCHOOL BOARD | MICHAELS, WILLIAM R. | 0.65 | Mt. Diablo recall - framing ambiguity |

The 1978 SCHOOL BOARD recall records are all e=0. The framing ambiguity is: does e=0 mean CCT opposed the recall (voted to keep these trustees), or did CCT recommend voting FOR the recall (against keeping them)? An RA should re-read the 1978-11 clipping to determine the intended direction.

## Priority 3: 1970 props duplicates (32 records)

The 1970 proposition data has 32 records with apparent duplication: pairs like "state proposition 1" (lowercase) and "State Proposition 1" (capitalized) for Props 1-7. Likely artifacts of the primary (June) + general (November) ballot recap clippings. An RA should determine which ballot each prop appeared on and dedupe accordingly.

## Priority 4: Pattern A direction-inference records (~10 records)

Several Pattern A backfill records (e=0 opps added based on CA election history) have notes indicating "[per CA history]" rather than direct OCR confirmation. These are likely correct but were not explicitly opposed in any CCT editorial. An RA should verify direction by re-reading the relevant clippings if precision matters for the analysis.

Affected records:
- 1962 federal opps: BROWN D GOV inc, ANDERSON D LT GOV inc, RICHARDS D SEN, MOSK D AG inc
- 1976 federal opps: TUNNEY D SEN inc, DELLUMS D H 8 inc, STARK D H 9 inc
- 1978 federal opps: STARK D H 9 inc, BROWNING R AG primary, BROWN D GOV inc

## Priority 5: Cross-filing era (1952)

California allowed cross-filing 1914-1959. The 1952 CCT clipping may have endorsements where candidates were on both R and D primary ballots. Current records show single-party affiliation. An RA familiar with the cross-filing era should verify whether any 1952 records should have comma-separated party values like "R,D".

## What is NOT a concern

- **Structural integrity:** All 222 cand + 147 prop records PASS every validation check (year, endorsed, conf, inc fields, name format, party labels, state fields, newspaper_id, office codes, duplicates, Pattern K).
- **Federal Pattern A coverage:** All major federal opps documented across 1952-1978.
- **Local boards:** All DIRECTOR/SCHOOL BOARD/CITY COUNCIL/MAYOR/CNTY COMM standardized to Nonpartisan.
- **Cross-year naming:** Repeat candidates (Knox, Waldie, Baldwin, Boatwright, Dent, Moriarty) have consistent name forms.
- **R/D era pattern:** 61.5% overall R-lean confirmed via partisan endorsement audit; 1964 LBJ outlier historically accurate.
