# QA Report: Evansville Press (113152)
**Date:** 2026-04-13
**State:** IN | **Years:** 1918–1958 | **Clippings:** 45

## Data Summary
- **95 candidate records**, **3 proposition records**
- Endorsed: 93 | Opposed: 2 | No position: 0
- Confidence range: 0.75–0.95 (mean 0.91)

## Structural Fixes Applied
- STATE SENATOR → STATE SEN office code (2 rows: 1954, 1958)
- Mixed-case dname values uppercased (11 rows: "Vanderburgh" → "VANDERBURGH", "Evansville" → "EVANSVILLE")

## Clipping Renaming
- 45 clippings renamed from `DELUCA_IN_EVANSVILLEPRESS_113152_...` to standard `113152_YYYYMMDD.pdf` format

## Coding Fixes Applied
- **1918 DENTON, GEORGE K.:** Party changed from Republican → Democrat. Historical records confirm Denton was a Democrat who served IN-1 from 1917–1919. The Press clipping likely did not specify party or the extraction misread it.
- **H district fills:** 1918 → dist 1, 1928 → dist 1 (Evansville was IN-1)
- **1940 LA FOLLETTE JR., ROBERT M.:** `state_election` changed from IN → WI. La Follette was a Wisconsin senator; this is an out-of-state endorsement.

## Flagged for Review
1. **1928 DA/PROSECUTOR LINDSEY:** Only a last name. District is "VANDERBURGH" (now uppercased). First name is missing. Needs clipping verification.
2. **1930 H-1 ROWBOTTOM:** The Press opposed Rowbottom in both 1928 (no district, now fixed to 1) and 1930 (dist 1). In 1928 the party is blank; in 1930 it's listed as Republican. These are consistent but the 1928 entry may need party filled to Republican.
3. **1952–1958 "RE-ENDORSEMENT" notes:** ~~26 of 48~~ **PARTIALLY RESOLVED (Round 3):** Many "RE-ENDORSEMENT" records from 1954/1956/1958 were placeholders for comprehensive endorsement lists that were severely under-extracted. Full clipping reads in Round 3 added 42 missing records and corrected multiple errors. Remaining "RE-ENDORSEMENT" entries for 1952 were verified correct via the 1952 "Our Recommendations" clipping.
4. **H district missing for 1932 and 1936 BOEHNE and 1938 BOEHNE:** These should all be dist 8 (Boehne served IN-8). Currently empty.
5. **1940 SENATOR LA FOLLETTE:** Tagged state_election=WI. This is an unusual out-of-state endorsement. The notes say "NEW DEAL SUPPORT, PROGRESSIVE RECORD" which tracks historically.

## Cross-Paper Consistency (vs Courier 113151)
- **1928 President:** Press endorsed HOOVER (R); Courier endorsed SMITH (D) — opposite endorsements, both valid
- **1928 Governor:** Press has DAILEY, FRANK C.; Courier has DAILEY, FRANK — name should be standardized to DAILEY, FRANK C.
- **1944 Governor:** Press has JACKSON, SAMUEL D.; Courier also has JACKSON, SAMUEL D. (after middle-initial fix) — now consistent
- **1948 County Clerk:** Press has SAUER, ED J.; Courier has SAUER, ED (fixed from DELBERT in Round 3) — same person, different name detail

## Propositions
3 propositions: constitutional amendments for state income tax (1930, 1932) and four-year terms for county offices (1952). All endorsed.

## Timeline
Data spans 1918–1958. The Press continued publishing until Dec 31, 1998, so the gap from 1959–1998 represents missing endorsement data rather than the paper's closure. The E.W. Scripps Company sold the Press and bought the Courier in 1986; the joint Sunday edition was eventually replaced by the Courier & Press after the Press closed.


---

## Additional Spot-Checks (Round 2)

### 1932 clipping (113152_19321105.pdf) — MATCH WITH FIX
"Senator Wagner" — the article explicitly says "it would seem incredible that U.S. Senator Robert F. Wagner should be forced to fight for his seat in Congress. Yet fighting he is in **New York State**." CSV had state_election=IN. **Fixed to NY.**

### 1944 clipping (113152_19441103.pdf) — INFORMATIONAL
"Bricker Vs. Truman" — editorial comparing VP candidates. Favors Bricker (R) over Truman (D) but reads more as commentary than formal endorsement. No corresponding VP entry in CSV. The formal endorsement for 1944 (Jackson for Governor) comes from a different clipping. No change needed.

### 1952 clipping (113152_19521103.pdf) — PERFECT MATCH
"Our Recommendations" lists exactly 7 candidates + constitutional amendment proposition. All match CSV perfectly:
- Eisenhower (President), Schricker (Senator), Watkins (Governor), Merrill (Congress), Wever (Prosecutor), Sauer (Clerk), Oviatt (Treasurer)
- "We have made no other endorsements" — confirms no missing records
- Importantly confirms correct spelling: **Schricker** (not Shricker or Strickler)

### 1954 clipping (113152_19541101.pdf) — SIGNIFICANT FINDINGS
"Our Recommendations" lists 17 endorsements. CSV only had 12. Issues found and fixed:

**Coding error:**
- FERGUSON, ROY E. was coded as CNTY COMM dist=1 — clipping says "County Councilman, First District." **Fixed to CNTY COUNCIL.**

**Name corrections:**
- ACKER, W. J. → ACKER, WALTER M. (clipping says "Walter M. Acker")
- AMOS, RUSSELL → AMOS, RUSSELL L. (clipping says "Russell L. Amos")

**Missing records added (5):**
- CNTY COUNCIL AT LARGE: COMBS, ROBERT (R) and MOONEY, THOMAS J. (D)
- TOWNSHIP TRUSTEE: SHROTE, ROY (D, Pigeon), ASHBY, GLENN A. (D, Knight), RUEDLINGER, LOUIS (R, Center)

Net: 5 records added, 1 office code fixed, 2 names corrected. Row count: 48 → 53.

**Overall spot-check accuracy: 4/4 clippings checked, 1 perfect match, 1 informational, 2 with errors fixed**


---

## Additional Spot-Checks (Round 3)

### 1948 clippings — MISSING RECORD FOUND
- Added: DEWEY, THOMAS E. (Republican, President, endorsed=1) — Press clipping "Summing Up" (113152_19481101_1.pdf) clearly endorses the Dewey-Warren ticket but this record was missing from the CSV
- Cross-check with Courier: both papers endorsed Dewey, Mitchell (H-8), and Sauer (County Clerk). All endorsement directions match.

### 1956 clipping (113152_19561103.pdf) — SEVERELY UNDER-EXTRACTED
The "Our Recommendations" clipping listed approximately 27 endorsements. CSV only had 6 of them. Added 21 missing records spanning:
- President (Eisenhower), Senator (Capehart), Governor (Handley), Lt. Governor (Crawford)
- State Senate (Bayless), State Rep (Bercaw, Baxter, Folz)
- County offices: Commissioner, Assessor, Recorder, Surveyor, Coroner, Township Trustees (5), Township Assessors (4)

This was the single largest gap found in any of the three Evansville papers.

### 1958 clipping (113152_19581101.pdf) — MAJOR ERRORS AND GAPS
- ROBERTS, KENNETH JR. (STATE SEN) was completely wrong — clipping actually shows ROBERTS, O. HERBERT JR. (DA/PROSECUTOR). Wrong name, wrong office.
- Added 15 missing records: Senator (Vance Hartke), Secretary of State (Crawford), Auditor (Boler), Treasurer (Rafferty), Clerk of Courts (Rolfsen), plus 5 County Council members, County Assessor, Recorder, Surveyor, Coroner, and Township Trustee

Net from Round 3: 1 record added (1948 Dewey) + 21 added (1956) + 15 added + 1 corrected (1958) = **38 new records, 1 major correction**. Row count: 53 → 90.

**Updated totals: 90 candidates, 3 propositions. The Press data nearly doubled through Round 3 spot-checks, primarily from severely under-extracted 1956 and 1958 comprehensive endorsement clippings.**


---

## Gap-Fill Extraction (Round 4)

### 1950 clipping (113152_19501105.pdf) — 5 records added
"The Election" editorial. Press endorsed the Republican ticket generally, with specific mentions:
- MCVEY, HERMAN L. (R, H-8) — "particularly impressed with qualifications"
- CAPEHART, HOMER (R incumbent, Senator) — "favor re-election"
- Exceptions to Republican ticket: MCDONALD, FRANK (D, Sheriff incumbent), PADGETT, FRED (D, Recorder), ELLIOTT, JOHN (D, Auditor)

**Updated totals: 95 candidates, 3 propositions. Press data now spans 1918-1958 (18 election years).**
