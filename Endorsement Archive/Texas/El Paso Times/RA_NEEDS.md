# RA Manual Review Needs: El Paso Times

**Status:** AI processing complete through V4. The items below require manual RA intervention.

## Priority 1: 4 STATE REP empty dist (1976/1978/1980)

- 1976 STATE REP JONES, LUTHER D - dist unknown
- 1976 STATE REP VALLES, ROBERT D - dist unknown
- 1978 STATE REP JONES, LUTHER D - dist unknown
- 1980 STATE REP VOWELL, JACK R - dist unknown (likely 71 or 72)

OCR of source clippings would reveal specific dist numbers (likely 71-78 range for El Paso area post-1972 redistricting).

## Priority 2: Sparse early-year coverage (1922/1928/1930)

ET has thin coverage in 1922 (1 SEN record), 1928 (1 record), 1930 (1 STATE REP record). Pre-1932 coverage is sparse — may warrant additional clipping collection.

## Priority 3: 22 records below 0.85 conf (V3/V4 Pattern A)

The 22 remaining low-conf records are V3/V4 Pattern A additions where historical inference is more speculative:
- 1932 H Thomason inc (0.75)
- 1968 JUDGE NO ENDORSEMENT (0.80 — should be e='')
- Multiple V4 H Pattern A records 1982/1996/2008/2018 (0.70-0.75)
- LAND COMM/AG COMM/TREASURER Pattern A opps (0.70-0.80)

RA verification of these would boost confidence.

## Priority 4: 1968 JUDGE "NO ENDORSEMENT" record

The 1968 JUDGE 65th JUDICIAL DISTRICT NO ENDORSEMENT record (e=0 originally) is the V1 source's editorial "no endorsement" for a particular race. Should be recoded e='' (no recommendation) like DN's NO ENDORSEMENT records were handled.

## Priority 5: NM cross-border records detail (39 records)

39 NM records are present (ET extensively covered NM races due to El Paso border). Verification of state_election=NM coding is important for downstream analysis. Notable NM races:
- 1922 NM SEN Jones D
- 1936-1940 NM GOV Tingley/Miles D
- 1940 NM SEN Chavez D
- 1976/1982 NM SEN Schmitt R + 1982 Bingaman D upset
- 1978-1990 NM SEN Domenici R inc
- 1976-1982 NM H Skeen R
- 1990 NM downballot (GOV Bond R, AG Udall D, LAND Bigbee R, RR Serna D, TREASURER King R, SBOE Mayfield R)

## Priority 6: 1962 H 16 FOREMAN R (verified vs EHP)

ET correctly has FOREMAN ED R for 1962 H 16. EHP V4 used this finding to correct its own RUTHERFORD R extraction error.

## Priority 7: Cross-paper EHP relationship documented

- 92 direct candidate agreements between EHP and ET
- 13 ET records have explicit V4 "also endorsed by EHP - cross-paper consensus" notes
- Key disagreements: 1936 EHP=Landon R / ET=FDR D; 1992/1996 EHP=Bush/Dole R / ET=Clinton D (ET more D-flexible by 1990s)

## What is NOT a concern (V4 PASS)

- **Structural integrity:** All 456 cand + 219 prop records PASS every validation check (year, endorsed, conf, inc fields, name format, party labels, state fields, newspaper_id, office codes, duplicates, Pattern K).
- **Federal Pattern A coverage:** All 23 PRES cycles 1920-2012 with R+D pairs. All SEN races. All GOV races. AG/LT GOV pattern A.
- **TX one-party D era:** 66 empty party records all filled (mostly D for pre-1980 local/judicial races).
- **Cross-year naming:** 30+ name variants reconciled.
- **Inc flag coverage:** 37% of records have inc flags via cross-year matching.
- **Editorial pattern:** ET R-leaning PRES picks 1952-1988, D shift 1992-1996 Clinton, R picks 2000-2008, D shift 2012 Obama. TX state/local mostly D.
- **dname coverage:** 100%. NM-specific dnames for state_election=NM records.
- **Notes coverage:** 100%.
- **Props:** 219 records with 3 canonical prop_types (201 PROPOSITION + 6 REFERENDUM + 12 BOND).
- **TX-specific offices:** RR COMM (22), LT GOV (12), TX SUPREME COURT (35), COURT OF CRIM APPEALS (19), LAND COMM (13), AG COMM (10), TREASURER (11), COMPTROLLER (11).
- **Mean confidence: 0.879.**
