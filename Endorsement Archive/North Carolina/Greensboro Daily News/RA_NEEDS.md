# RA Manual Review Needs: Greensboro Daily News

**Status:** AI processing complete through V3. The items below require manual RA intervention.

## Priority 1: 13 records below 0.85 confidence

After V3 boosts (18 → 13), remaining low-conf records:

### V2 Pattern A opps at 0.82 (acceptable derived records)
- 1964 PRES R: GOLDWATER (opp of LBJ D)
- 1968 PRES D: HUMPHREY (opp of Nixon R)
- 1976 PRES R: FORD, GERALD R. (opp of Carter D, R inc)
- 1972 GOV R: HOLSHOUSER (opp of Bowles D)

### V1 extraction low-conf records remaining (need OCR re-check)
- 1954 H STEVENS BILL R E=1 conf=0.80
- 1964 GOV GAVIN ROBERT R E=0 conf=0.80
- 1968 GOV GARDNER JIM R E=0 conf=0.80
- 1968 JUDGE COLLIER ROBERT JR D E=1 conf=0.70
- 1968 JUDGE ERVIN SAM J III D E=1 conf=0.70
- 1970 STATE SENATOR BOWLES + EDWARDS D E=1 conf=0.70
- 1972 GOV BOWLES D E=1 conf=0.50
- 1980 SCHOOL BOARD GRAGG WILLIAM K N E=1 conf=0.83

## Priority 2: 2 documented "declined endorsement" records (not orphans)

- 1978 SENATOR HELMS R E=0 (paper declined)
- 1978 SENATOR INGRAM D E=0 (paper declined)

V1 metadata confirms: "1978 declined to endorse either Helms (R) or Ingram (D) for US Senate."

## Priority 3: State office Pattern A backfill deferred

NC state office endorsements (heavy D years 1968/1976) lack R opp Pattern A records:
- 1968: LT GOV (Taylor D), AG (Morgan D), AUDITOR (Bridges D), INS COMM (Lanier D), SUPER (Phillips D), TREASURER (Gill D), COMM AG (Graham D), COMM LABOR (Crane D)
- 1976: SoS (Spaulding R - was endorsed), AG (Edmisten D inc), AUDITOR (Bridges D inc), LT GOV (Green D), INS COMM (Ingram D), SUPER (Phillips D inc), TREASURER (Boyles D), COMM AG (Graham D), COMM LABOR (Brooks D)

R opp identities require deeper NC archive research.

## V3 Work Summary

- 25 Pattern K fixes (V2)
- 4 federal Pattern A opps (V2)
- 6 cross-year inc fixes (V2)
- 101 dname fills (V3)
- 36 prop_type recodes (CONSTITUTIONAL AMENDMENT → AMENDMENT)
- 3 empty prop_type fills (AMENDMENT)
- 5 conf boosts (V3)
- Preyer name standardized

## What is NOT a concern (V3 PASS)

- Structural integrity: 100% pass
- Pattern K: 0 (after V2/V3 fixes)
- Dups: 0
- 0 empty dname (after V3), 0 empty party, 0 empty notes
- 78/210 inc flag (37%)

## GDN Editorial Identity

NC morning paper 1909-1984 (merged to News & Record).

- D PRES: Johnson 64, Carter 76/80
- R PRES exception: Nixon 68
- D SEN: Ervin 68 (inc), Stevens R 74 (only R SEN)
- 1978 declined SEN
- D GOV: Moore 64, Scott 68, Bowles 72, Hunt 76 (general)
- R GOV exception: Flaherty 76 (primary)
- D state office tradition: Bridges Auditor, Phillips Super, Edmisten AG, Lanier InsComm, Gill Treasurer, Taylor LT GOV
- H delegation: Preyer D H-6 multi-cycle (68/70/74/76/78/80)
