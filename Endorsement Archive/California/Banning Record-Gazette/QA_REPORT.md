# QA Report: Banning Record-Gazette

**Audit date:** 2026-05-20
**Folder:** done/Banning Record-Gazette
**Newspaper ID:** BANNINGRG (placeholder — no Gentzkow-Shapiro permid available)
**Data coverage:** 1960-2014, 8 clippings, 62 candidate records, 30 proposition records

## Overall Assessment

**PASS**

Clean extraction from a small Riverside County, CA weekly newspaper. The Banning Record-Gazette serves the San Gorgonio Pass area (Banning, Beaumont, Cabazon, Cherry Valley) in eastern Riverside County. Most endorsements focus on local races (city council, school board, water districts, hospital district) with statewide California propositions also covered.

## Stage 1: Structural Validation
- CSV headers: OK
- Row integrity: 62 cands, 30 props, no junk rows
- Year sanity: all even-year general elections (1960, 1968, 1970, 2006, 2008, 2010, 2012, 2014)
- State fields: all CA/CA, all newspaper_id=BANNINGRG
- Incumbency fields: clean (no "0" values)
- 0 structural issues

## Stage 2: Spot Check
**Sampled:** 1968-11-04 Record-Gazette Recommendations sample-ballot graphic
**Accuracy:** 100% (5/5 candidates + 11/11 propositions matched)
- Verified: Nixon/Agnew (R-Pres/VP), Rafferty (R-Senate), Tunney (D-H38), Veysey (R-Assembly 75)
- Verified: 11 YES recommendations on state and county ballot measures (Props 1-9, 1A, A)

## Stage 3: Variable Coding
- Office codes all standard: CITY COUNCIL (22), CNTY COMM (16), JUDGE (6), SCHOOL BOARD (6), STATE REP (3), H (2), SUPERINTENDENT (2), PRESIDENT/VICE PRESIDENT/SENATOR/TREASURER/MAYOR (1 each)
- Party labels valid (Democrat, Republican, empty for nonpartisan local races)
- All names in LASTNAME, FIRSTNAME ALL CAPS format
- No duplicates

## Stage 4: Low-Confidence Re-Scan
- 0 records below 0.75 confidence
- Mean confidence: 0.93

## Notes
- 1960 issue covered only state propositions (15 props), no candidate endorsements on the captured page
- 1970 issue had 2 articles: a hospital district board fight (3 challengers endorsed, 3 incumbents opposed) and a superintendent endorsement (Riles over Rafferty)
- Most other years are recap editorials covering local Banning/Beaumont city council, water districts, school boards, plus statewide CA props
- The 16 CNTY COMM records include a mix of true county supervisors and some local district board members (hospital, water) that could plausibly be re-coded as DIRECTOR; left as-is since the office codes used reasonably capture intent
- This paper has no official Gentzkow-Shapiro permid; the BANNINGRG placeholder may need to be replaced with an assigned ID during downstream augmentation if a permid is later assigned
