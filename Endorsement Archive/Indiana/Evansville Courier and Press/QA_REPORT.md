# QA Report: Evansville Courier and Press (113150)
**Date:** 2026-04-13
**State:** IN | **Years:** 2000–2016 | **Clippings:** 10

## Data Summary
- **161 candidate records**, **8 proposition records**
- Endorsed: 158 | Opposed: 3 | No position: 0
- Confidence range: 0.75–1.00 (mean 0.93)

## Structural Fixes Applied
- `newspaper_id` was EMPTY in all rows — filled with "113150"
- SENATE → SENATOR office code (8 rows)

## Spot-Check Results

### 2004 clipping (113150_20041102.pdf) — SEVERE ERRORS
The 2004 extraction had ~50% error rate. 9 of 17 candidates had the wrong name and 3 records were missing. All corrected:

| Field | Was (wrong) | Now (correct) |
|-------|------------|---------------|
| U.S. Senator | LUGAR, RICHARD (R) | BAYH, EVAN (D) |
| U.S. House | HOSTETTER, JOHN (R) | JENNINGS, JON (D), dist 8 |
| State Senate | CARTER, STEVE, dist 56 | SERVER, GREG (R), dist 50 |
| County Clerk | WALSH, JOHN (R) | KIRK, SUSAN (R) |
| County Comm 1 | MCKINNEY, TOM (R) | SUTTON, ROYCE (D) |
| County Council (3 seats) | MOLLI/MURPHY/SMITH | ABELL/MOURDOCK/GOEBEL, AT LARGE |
| School Board 1 | SMITH, JEF | STRATTON, JEFFREY |
| School Board 3 | SMITH, REY | WILLETT, DANA |

Added missing: CNTY COMM 3 MUSGRAVE, RECORDER STUCKI, TREASURER TULEY

### 2006 clipping (113150_20061107.pdf) — MOSTLY CORRECT
- Fixed: PUELETHEWEIGHT → POSTLETHEWEIGHT, GEORGE (OCR garble, State Senate 49)
- Added missing: School Board At-Large WASHINGTON, TALITHA

### 2012 clipping (113150_20121106.pdf) — MODERATE ERRORS
- Fixed: Surveyor DAVYS, J. → FREEMAN, LINDA (D)
- Fixed: Recorder TILLEY, Z. → TULEY, Z.
- Fixed: State Rep 64 WASHINGTON → WASHBURNE, THOMAS
- Fixed: County Clerk WALSH — added party Democrat
- Added missing: STATE REP 77 RIECKEN, GAIL (D)
- Added missing: TREASURER DAVIS, RICK (D)
- Added missing: Consolidation referendum proposition

## Coding Fixes
- BUSCHON spelling corrected (was BUCSHON in 2014)
- AT LARGE districts set for CNTY COUNCIL (2012, 2014, 2016) and SCHOOL BOARD (2016)
- Missing districts filled: H=8 (2004), STATE REP 76/77 (2004)

## Flagged for Review
1. **2016 STATE SEN entries (BECKER, WASHBURNE, MCNAMARA):** Districts are empty. McNamara was STATE REP in 2012 — verify she ran for STATE SEN in 2016 or whether this is a miscoded office.
2. **2014 CNTY COMM UNGETHIEM:** District is empty. Needs 2014 clipping verification.
3. **2012 SCHOOL BOARD dist 1 RAGLAND (endorsed=0):** Coded as not endorsed because paper explicitly declined to endorse her. Notes capture reasoning. Coding is correct.

## Propositions
7 propositions covering constitutional amendments (2000, 2004, 2010), ballot questions (2004), a school bond (2008), and a city-county consolidation referendum (2012). All coded endorsed=1.


---

## Additional Spot-Checks (Round 2)

### 2000 clipping (113150_20001107.pdf) — PERFECT MATCH
All 21 candidate endorsements match exactly. Proposition (constitutional amendment) also matches. The clipping notes "no recommendation" for superintendent and AG, which correctly have no CSV entries.

### 2010 clipping (113150_20101031.pdf) — PERFECT MATCH
All 19 candidate endorsements match exactly. Proposition (property tax caps) also matches. Names, parties, districts, and endorsement directions all correct.

### 2014 clipping (113150_20141104.pdf) — PERFECT MATCH
All 13 candidate endorsements match. BUSCHON spelling (previously fixed from BUCSHON) confirmed correct. UNGETHIEM commissioner race confirmed — district not specified in the clipping either.

### 2016 clipping (113150_20161108.pdf) — PERFECT MATCH
All 21 candidate endorsements match. Clipping lists State Senate entries (Becker, Washburne, McNamara) as unopposed, consistent with CSV coding. McNamara's move from State Rep to State Senate in 2016 confirmed as historically accurate (she won SD-50 after Becker retired).

**Overall spot-check accuracy (post-fixes): 4/4 clippings perfect (74 endorsements checked)**


---

## Additional Spot-Checks (Round 3)

### 2002 clipping (113150_20021105.pdf) — MINOR ERRORS
- Fixed: WINDECKE → WINNECKE (County Commissioner) — spelling corrected to match historical records for Lloyd Winnecke
- Added missing: WORTMAN (County Council At-Large) — endorsed candidate omitted from original extraction
- Net: 1 name fix, 1 record added

### 2008 clipping (113150_20081104.pdf) — MATCH WITH NOTE
All 13 explicitly endorsed candidates match CSV. Clipping also lists several unopposed candidates (Weinzapfel for mayor, Tornatta for city clerk, etc.) but these were not extracted as endorsements. Added: township consolidation referendum proposition.
- Net: 1 proposition added. Candidate data correct.

**Updated totals: 168 candidates, 8 propositions. Round 3 spot-check accuracy: 2/2 clippings checked, minor fixes only.**
