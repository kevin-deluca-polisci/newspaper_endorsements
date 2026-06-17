# RA Manual Review Needs: Honolulu Star-Advertiser

**Status:** AI processing complete through V3. Items below require manual RA intervention.

## Priority 1: All 38 props with empty endorsed direction

V1 extracted props but did not capture endorsed direction. Direction recovery requires systematic per-prop OCR.

Year distribution:
- 2016: 24 props (richest year — HI ConCon)
- 2014: 5 props
- 2012: 4 props
- 2010: 3 props (V3 OCR confirmed at least some YES)
- 2018: 2 props

V3 OCR captured one specific direction: 2010 "BOARD OF EDUCATION... 'Shall the Board of Education be replaced... YES.'" — this is a notable constitutional change moving HI to appointed BOE.

## Priority 2: 142 V2 STATE REP/SEN D defaults need OCR verification

V2 defaulted 142 STATE REP/SEN records to Democrat because HI legislature is overwhelmingly D. V3 identified 12 known R legislators (Slom, Ching, Pine, McDermott, Ward, Fukumoto, Thielen, Cheape Matsumoto, Johanson pre-2014) and fixed those. Other R legislators may exist who weren't caught — full OCR pass needed.

Known R legislators V3 fixed:
- SLOM, SAM (STATE SEN District 8/9 East Honolulu, only R STATE SEN 2010-2016)
- CHING, CORINNE (STATE REP 27 Nuuanu-Liliha)
- PINE, KYMBERLY (STATE REP 43 in 2010, then CITY COUNCIL NP)
- MCDERMOTT, BOB (STATE REP 40)
- WARD, GENE (STATE REP 17)
- FUKUMOTO, BETH (STATE REP 47)
- THIELEN, CYNTHIA (STATE REP 50)
- CHEAPE MATSUMOTO, LAUREN (STATE REP 45)
- JOHANSON, AARON LING (STATE REP 31 - R in 2010, switched D 2014+)
- TUPOLA, ANDRIA (STATE REP 43 in 2016)

## Priority 3: V3 STATE REP/SEN cross-year inc may need refinement

V2 added 34 state leg cross-year inc fixes for D defaults. After V3 R fixes, may need to re-verify inc for affected records.

## V3 Work Summary

- 2010 OCR confirmed full slate: Abercrombie/Schatz GOV/LT GOV + Hanabusa H-1 + Hirono H-2 + state leg picks (Say, Nishimoto, Saiki, Brower, Choi, Ihara, Taniguchi, etc.) + BOE Oahu at-large
- 2010 OCR explicit "No endorsement" for District 41 (Pearl City)
- 2014 OCR confirmed Ige/Tsutsui + Schatz + state leg (Mizuno 28, Johanson 31, LoPresti, Awana, Jordan, Cheape Matsumoto 45)
- 12 V3 R legislator party fixes (Slom, Ching, Pine, McDermott, Ward, Fukumoto, Thielen, Cheape Matsumoto)
- 38 prop_type fills (29 CHARTER + 9 AMENDMENT)

## What is NOT a concern (V3 PASS)

- Structural integrity: 100% pass
- Pattern K: 0 (after V3 R fixes)
- Dups: 0
- 0 empty dname/party/notes (cand records)

## SA Editorial Identity

Post-merger Honolulu paper (formed 2010). Heavy D-dominant 2010-2018 reflecting HI's D state nature. 5 cycles, ~40 state legislative endorsements per cycle. Practiced explicit "No endorsement" for some races (V3 OCR 2010 District 41 example).

Federal D-dominant pattern confirmed:
- D PRES: Obama 12, Clinton 16
- D SEN: Inouye 10, Hirono 12, Schatz 14/16, Hirono 18
- D GOV: Abercrombie 10, Ige 14/18
- D H-1: Hanabusa 10/12/16, Takai 14, Case 18
- D H-2: Hirono 10, Gabbard 12/14/16/18

Only R inc in dataset: Djou R H-1 2010 (won 2010 special), lost to Hanabusa D.

12 R state legislators identified (V3 fix). HI Senate had only 1 R (Slom 2010-2016). HI House had 6-8 R during this period.
