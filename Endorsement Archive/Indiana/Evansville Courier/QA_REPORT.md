# QA Report: Evansville Courier (113151)
**Date:** 2026-04-13
**State:** IN | **Years:** 1918–1956 | **Clippings:** 62

## Data Summary
- **107 candidate records**, **0 proposition records**
- Endorsed: 92 | Opposed: 15 | No position: 0
- Confidence range: 0.70–0.95 (mean 0.84)

## Structural Fixes Applied
- No structural issues found (headers correct, newspaper_id present)

## Clipping Renaming
- 62 clippings renamed from `DELUCA_IN_EVANSVILLECOURIER_113151_...` to standard `113151_YYYYMMDD.pdf` format

## Coding Fixes Applied
- **1920 ROOSEVELT:** Office changed from LT GOVERNOR → VICE PRESIDENT (FDR was the VP candidate on Cox's ticket, not Lt Governor)
- **1938 DRESS (Mayor):** Added first name → DRESS, WILLIAM H.
- **1944 GATES:** Added full name → GATES, RALPH F. (Republican gubernatorial nominee)
- **1944 JACKSON:** Middle initial corrected M. → D. (Samuel D. Jackson was the Democratic nominee)
- **1948 MCDONALD:** Office changed from DA/PROSECUTOR → SHERIFF (notes text explicitly says "sheriff candidate")
- **H district fills:** 1918, 1922, 1926, 1928, 1938 → dist 1 (Evansville was IN-1); 1942 → dist 1 (corrected from erroneous 11); 1948 → dist 8 (post-redistricting)

## Flagged for Review
1. **1944 STRICKLER (Governor, Democrat, endorsed=1):** Samuel D. Jackson was the Democratic gubernatorial nominee in 1944. STRICKLER appears as a separate Governor endorsement with notes referencing a ballot number. This may be a different office (Lt Governor?) or an extraction error from the original clipping. First name is also missing. Needs clipping re-read.
2. **1942 LARRABEE (H-1):** First name unknown. Single-word name left as-is.
3. **1932 WAGNER, ROBERT F. (Senator):** This is a New York senator, not an Indiana race. The Evansville Courier endorsed an out-of-state candidate. The `state_election` field may need to be set to NY.
4. **1940 LA FOLLETTE:** Listed in the Courier's sister paper (Press, 113152) but not in the Courier. The Press entry was tagged state_election=WI. If a matching Courier entry surfaces, apply same fix.
5. **1948 County Clerk SAUER:** ~~DELBERT~~ **RESOLVED (Round 3):** Clipping clearly says "Ed Sauer, a democrat." Fixed to SAUER, ED. The Press has SAUER, ED J. — same person, Press clipping headline is "Promote Ed J. Sauer." Different level of name detail, both correct per their source clippings.

## Out-of-State Endorsements
This paper endorsed candidates outside Indiana in at least one case (1932 Wagner, NY Senator). This was not uncommon for papers near state borders or for nationally prominent races.

## Notes
The Courier data covers 1918–1948, reflecting an era when editorial endorsements were more overtly partisan. The paper shows a generally Democratic lean through the 1930s–40s (endorsing Cox, FDR's VP run, multiple Democratic House candidates) with occasional Republican endorsements (Dewey for President in 1944 and 1948, Hillie for Governor in 1940).


---

## Additional Spot-Checks (Round 2)

### 1920 clipping (113151_19201102_1.pdf) — MATCH
Clipping shows "FOR PRESIDENT JAMES M. COX" and "FOR VICE-PRESIDENT FRANKLIN D. ROOSEVELT." CSV matches perfectly. Confirms the earlier fix changing Roosevelt's office from LT GOVERNOR to VICE PRESIDENT was correct.

### 1928 clipping (113151_19281105.pdf) — MATCH
"Vote for Boehne!" — endorsement of John W. Boehne, jr. for congressman from the First Indiana congressional district. CSV matches: BOEHNE, JOHN W. JR. (Democrat) H dist=1 endorsed=1.

### 1938 clipping (113151_19381106.pdf) — MATCH WITH DISCOVERY
Confirms: Van Nuys (Senator), Boehne Jr. (H-1), and Mayor Dress all endorsed. Also revealed that 1934 CSV entry "DREW, WILLIAM H." (Mayor) should be "DRESS, WILLIAM H." — William H. Dress was Evansville mayor 1935-1942. **Fixed.**

### 1944 clipping (113151_19441105_1.pdf) — CRITICAL FINDINGS
The clipping clearly states: "Their vote should go to Harry Stricler for **senator** and to Sam Jackson in the **governor's** race." This resolved two major issues:

1. **STRICKLER was coded as GOVERNOR but was actually SENATOR** — and was a garbled spelling of SCHRICKER, HENRY F. (same person as the existing SHRICKER entry, same ballot number B2). **Duplicate deleted.**
2. **JACKSON, SAMUEL had a duplicate entry coded as LT GOVERNOR** — the clipping makes clear Jackson ran for Governor only. **Duplicate deleted.**
3. **SHRICKER spelling corrected to SCHRICKER** — confirmed by the 1952 Press clipping which clearly prints "Schricker."

Net: 2 duplicate rows removed, 1 spelling fix. Row count: 43 → 41.

**Overall spot-check accuracy: 4/4 clippings checked, 2 critical errors found and fixed**


---

## Additional Spot-Checks (Round 3)

### 1948 cross-check and clipping re-read (113151_19481028.pdf) — ERRORS FOUND
Re-read of county offices clipping revealed:

**Name fix:**
- SAUER, DELBERT → SAUER, ED — clipping clearly says "Ed Sauer, a democrat." "DELBERT" was a hallucinated extraction.

**Missing records added (2):**
- LYNN, HENRY (Republican, Probate Judge) — "We think his election would make a real contribution to elevating this bench"
- OVIATT, CLYDE (Republican incumbent, County Treasurer) — "making a good county treasurer, one of the best... no good reason why he should be denied a second term"

**Not added (deliberate):**
- Circuit Judge Youngblood: tepid quasi-endorsement ("He hasn't made a bad judge"), not a clear endorsement
- Prosecutor (Williams R vs Crabtree D): no clear endorsement, paper was conflicted on both candidates

### 1948 Cross-Paper Validation
Both Courier and Press endorsed in the same three races: President (Dewey), H-8 (Mitchell), County Clerk (Sauer). All endorsement directions match. Name consistency confirmed for Dewey and Mitchell. Sauer appears as "SAUER, ED" (Courier) vs "SAUER, ED J." (Press) — same person, different name detail per the respective clippings.

**Updated totals: 43 candidates (41 after round 2 deletions + 2 new from round 3). Round 3 spot-check: 1 name fix, 2 records added.**


---

## Gap-Fill Extraction (Round 4)

19 clippings spanning 1946-1956 existed in the clippings folder but had never been extracted into the CSV. These were read and extracted, adding 64 new candidate records.

### 1946 (3 clippings) — 7 records added
- "We Favor Trying the Only Alternative!" — general Republican endorsement for federal offices
- US House: MITCHELL, ED (R) endorsed, DENTON, WINFIELD (D) opposed
- SENATOR: TOWNSEND, M. CLIFFORD (D) opposed
- County offices: KELLNER (Recorder D), OVIATT (Treasurer R incumbent), HITCH (Surveyor R), MILLER (Prosecutor R incumbent)

### 1950 (6 clippings) — 11 records added
- Individual endorsement editorials for OVIATT (Treasurer), MCDONALD (Sheriff), plus local candidates
- Federal: MCVEY, HERMAN L. (R) for H-8, CAPEHART (R incumbent) for Senator
- Opposed: DENTON (D) for H-8, CAMPBELL (D) for Senator
- Out-of-state: VURSELL, CHARLIE (R) for IL H-24

### 1952 (6 clippings) — 7 records added
- "The Question Is Simple!" — EISENHOWER endorsed for President, STEVENSON opposed
- CRAIG, GEORGE (R) for Governor
- "Clear Cut Cleavage Here" — MERRILL, D. BAILEY (R) for H-8, DENTON (D incumbent) opposed
- "Sauer Has Done an Outstanding Job" — SAUER, ED (D incumbent) for County Clerk
- "Only One Choice" — WEVER, PAUL (R) for Prosecutor
- Notably: Courier explicitly did NOT endorse Senator Jenner (R)

### 1954 (1 clipping) — 21 records added
"The Courier Recommends:" — Clean, structured endorsement list on the front page. 21 candidates across H-8, Circuit Judge, Superior Judge, State Senator, State Reps (4), County Auditor, Recorder, Sheriff, Assessor, County Commissioners (2), County Council (4 district + 3 at-large). Mix of Republican and Democrat endorsements.

### 1956 (3 clippings) — 18 records added
- "Handley for Governor" — HANDLEY (R) endorsed, TUCKER (D) opposed
- "The County Candidates" — comprehensive county endorsements: Clerk, Treasurer, Probate Judge, Commissioners, State Senator, State Reps (4), Recorder, Coroner, Surveyor (all Republican)
- "Vote Republican For Good Government" — election-day summary reaffirming EISENHOWER (President), CAPEHART (Senator), MERRILL (H-8), and full Republican ticket

**Updated totals: 107 candidates (43 from original + 64 from gap-fill). Courier data now spans 1918-1956 (19 election years).**
