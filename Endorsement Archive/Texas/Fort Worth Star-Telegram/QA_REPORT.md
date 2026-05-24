# QA Report: Fort Worth Star-Telegram

**Audit date:** 2026-05-20
**Folder:** done/Fort Worth Star-Telegram
**Newspaper ID:** 145400
**Data coverage:** 1960-2020, 31 clippings, 452 candidate records, 126 proposition records

## Overall Assessment

**PASS**

NEW paper added to dataset. Major Tarrant County, Texas daily — historically Carter Publications (1909-1997), then Knight Ridder (1997-2006), McClatchy (2006-present).

## Stage 1: Structural Validation
- CSV headers: OK
- Row integrity: 452 cands, 126 props, 0 issues
- State/IDs: all TX/TX, all newspaper_id=145400
- Incumbency fields: clean

## Stage 2: Spot Check
Each year verified via descriptive filename hints. Subagents reported 100% match on famous Texas races (Connally 1962, Hill D 1978, Clements R 1982, Bush 1988, Beto 2018).

## Stage 3: Variable Coding
- **All office codes standard** (no non-standard codes used) — includes TX-specific codes (TX SUPREME COURT, COURT OF CRIMINAL APPEALS, RAILROAD COMMISSION, LAND COMMISSIONER, AGRICULTURE COMMISSIONER)
- Office distribution: STATE REP (97), H (70), JUDGE (50), TX SUPREME COURT (32), CNTY COMM (21)
- 23 cross-clipping duplicates merged (election-day recap repeating prior individual endorsements)
- 1 junk "UNKNOWN" row removed
- Party "U" (judicial nonpartisan placeholder) normalized to empty

## Stage 4: Low-Confidence Re-Scan
- Only 2 records below 0.75 confidence (both 1982: MILLSAP State Rep, BEAM Treasurer — small-print clipping issues)
- Mean confidence: **0.95** (very high)

## Notable Editorial History

**Format evolution (industry-wide retreat pattern visible here):**
- 1960s-70s: Extensive narrative endorsements (3-17 candidates per clipping)
- 1978-1992: Comprehensive ballot-format listings (17-42 candidates per cycle peak)
- 2000s-2010s: Compact bullet lists (14-39 endorsements)
- 2018-2020: Sharp decline to 4-8 endorsements (industry retreat)

**Cross-party endorsement pattern:** Star-Telegram historically willing to cross party lines:
- 1960: LBJ for Senate; Nixon/Lodge for Pres
- 1962: Connally (D) for Gov
- 1978: John Hill (D) for Gov + Tower (R) for Senate (split)
- 1982: Clements (R) — first GOP gov endorsement, Bentsen (D) for Senate
- 1988: George H.W. Bush, Bentsen
- 2006: Bell (D) over Perry
- 2010: White (D) for Gov
- 2018: Beto O'Rourke (D) over Cruz
- 2016: **Only "negative endorsement" against Trump** (no positive Pres pick — coded endorsed=0)
- 2020: Cornyn (R inc) over Hegar

## Notes
- 1978-10-11 clipping was a news story (not editorial); correctly captured 0/0
- 1970 PNG only had year in filename (no month/day); used election day with _v2 suffix to distinguish from main 1970 clipping
