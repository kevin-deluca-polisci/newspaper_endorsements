# QA Report: Appleton Post-Crescent

**Audit date:** 2026-05-20
**Folder:** done/Appleton Post-Crescent
**Newspaper ID:** 150250
**Data coverage:** 1960-2014 (24 distinct years), 94 clippings, 297 candidate records, 14 proposition records

## Overall Assessment

**PASS**

NEW paper added to dataset. The Appleton Post-Crescent is the daily for Outagamie County and the Fox Valley region (Appleton, Neenah, Menasha, Kaukauna) in northeast Wisconsin. Currently Gannett owned.

## Stage 1: Structural Validation
- CSV headers: OK
- Row integrity: 297 cands, 14 props, 0 issues
- All newspaper_id=150250, state=WI/WI
- Incumbency fields clean

## Stage 2: Spot Check
Verified across three parallel batches. Notable historical patterns confirmed:
- 1964: Endorsed LBJ (D) over Goldwater (R) — paper noted as "first Democrat endorsed since 1932"
- 1982: Endorsed Tony Earl (D-Gov), reversed in 1986 to endorse Thompson (R)
- 1990 + 1994 + 1998: Sustained Thompson (R) re-elect
- 2010 Senate: Endorsed Feingold (D) over Johnson (R), Barrett (D) over Walker (R)
- 2014: Endorsed Burke (D) over Walker (R)

## Stage 3: Variable Coding
- All office codes standard (no non-standard codes)
- Most common: STATE REP (97), H (60), STATE SENATOR (33), GOVERNOR (24)
- 14 cross-clipping duplicates merged (front-page + continuation duplicates noted by subagents)
- 0 junk rows

## Stage 4: Low-Confidence Re-Scan
- Only 2 records below 0.75 confidence
- Mean confidence: 0.93

## Format Evolution
- **1960s-1980s**: Comprehensive endorsements per clipping, often 5-16 cands
- **2000-2006**: Endorsement grid/box format (11-17 cands per single recap clipping)
- **2008-2014**: Shift to one-race-per-clipping individual editorials (industry trend)
  - 2008-2014 has many single-race files; explains why total clipping count (94) is high
  - Several `_v2` files are front-page + continuation pages of the same editorial (deduplicated)

## Endorsement Patterns
**Republican lean for federal/state offices** historically:
- US House: Toby Roth (R-WI-8) 1978-94, Mark Green (R) 2000-04, Steve Kagen (D) endorsed 2008, Reid Ribble (R) 2014
- Tom Petri (R-WI-6) consistently endorsed 1980-2014
- Tommy Thompson (R-Gov) 1990-1998
- Mike Ellis (R-State Senate) 1986-1998

**Democratic crossovers (notable):**
- LBJ 1964
- Gaylord Nelson (D-Senate) 1962, 1968
- Tony Earl (D-Gov) 1982
- Mondale (D-Pres) 1984
- Doyle (D-Gov) 2002, 2006
- Kohl (D-Senate) 1994
- Feingold (D-Senate) 2004, 2010
- Barrett (D-Gov) 2010
- Burke (D-Gov) 2014
- Obama (implicit — Kohl 2000)

**Notable non-endorsements:**
- 1992 US Senate (Kasten vs Feingold): explicit refusal to endorse, both candidates criticized

## Notes
- One DELUCA filename had typo "200611O5" (letter O instead of zero); corrected during routing to 20061105
- 24 PNG-format clippings (year-only naming) routed using WI election day for that year
