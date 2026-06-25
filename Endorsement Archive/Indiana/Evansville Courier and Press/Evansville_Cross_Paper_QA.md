# Cross-Paper QA Report: Evansville Newspapers
**Date:** 2026-04-13 | **QA Rounds Completed:** 3 + Gap-Fill Extraction

## Papers Covered

| Paper | ID | Years | Candidates | Propositions |
|-------|----|-------|-----------|-------------|
| Evansville Courier and Press | 113150 | 2000-2016 | 161 | 8 |
| Evansville Courier | 113151 | 1918-1956 | 107 | 0 |
| Evansville Press | 113152 | 1918-1958 | 95 | 3 |
| **Total** | | **1918-2016** | **363** | **11** |

## Historical Context
The Evansville Courier and Evansville Press were separate daily newspapers in Evansville, Indiana. The E.W. Scripps Company sold the Press and bought the Courier in 1986. The Evansville Press ceased publication on December 31, 1998. The Courier was renamed the Evansville Courier & Press around that time, continuing as the city's sole daily paper.

## Timeline Validation
- Courier (113151) data: 1918-1948 — all within operating period
- Press (113152) data: 1918-1958 — all within operating period (Press closed 1998, so gap 1959-1998 represents missing endorsement data, not paper closure)
- Courier & Press (113150) data: 1992-2016 — consistent with the merged paper's timeline

## Cross-Paper Endorsement Comparisons

### 1948: Courier vs Press (3 overlapping races)

| Race | Courier | Press | Match? |
|------|---------|-------|--------|
| President | DEWEY, THOMAS E. (R) endorsed | DEWEY, THOMAS E. (R) endorsed | Yes |
| H-8 | MITCHELL, ED (R) endorsed | MITCHELL, ED (R) endorsed | Yes |
| County Clerk | SAUER, ED (D) endorsed | SAUER, ED J. (D) endorsed | Yes (same person, name detail differs) |

Courier-only 1948 races: IL Governor (Stevenson endorsed, Green opposed), Sheriff (McDonald), Probate Judge (Lynn), County Treasurer (Oviatt)

### 1928: Courier vs Press (opposite presidential endorsements)
- Courier endorsed SMITH, AL (D) for President
- Press endorsed HOOVER, HERBERT (R) for President
- Both endorsed DAILEY for Governor (Courier: "DAILEY, FRANK"; Press: "DAILEY, FRANK C.")

### 1944: Courier vs Press
- Both endorsed JACKSON, SAMUEL D. (D) for Governor — consistent

### Name Standardization Notes
- DAILEY, FRANK vs DAILEY, FRANK C. (1928 Governor) — different name detail across papers, both correct per their clippings
- SAUER, ED vs SAUER, ED J. (1948 County Clerk) — same person, different name detail

## QA Summary by Round

### Round 1: Structural validation and auto-fixes
- 113150: newspaper_id filled (was empty in all rows), office codes standardized
- 113151: clippings renamed to standard format, H districts filled, Roosevelt office corrected
- 113152: clippings renamed, office codes standardized, dname values uppercased, Denton party corrected

### Round 2: Targeted spot-checks (4 clippings per paper)
- 113150: 2000, 2010, 2014, 2016 — all perfect matches (74 endorsements verified)
- 113151: 1920, 1928, 1938, 1944 — 2 critical errors found (Strickler/Schricker duplicate resolved, Jackson duplicate resolved), 1 name fix (Drew→Dress)
- 113152: 1932, 1944, 1952, 1954 — Wagner state_election fixed, 5 missing records added, 1 office code fixed

### Round 3: Focused spot-checks on concern areas
- 113150: 2002, 2008 — 1 name fix (Winnecke), 1 missing candidate, 1 proposition added
- 113151: 1948 cross-check — 1 name fix (Sauer), 2 missing records added (Lynn, Oviatt)
- 113152: 1948, 1956, 1958 — **38 missing records added**, 1 major correction (Roberts). The 1956 and 1958 comprehensive endorsement clippings had been severely under-extracted, nearly doubling the Press dataset.

### Round 4: Gap-fill extraction (unextracted clippings)
Cross-paper comparison revealed clippings present in folders with no corresponding CSV data.
- 113150: 7 records for 1992-1998 had **no backing clippings** — removed. 2018 clipping was a news article, not an endorsement editorial. C&P now covers 2000-2016 (161 candidates).
- 113151: **19 unextracted clippings** found for 1946, 1950, 1952, 1954, 1956. All read and extracted, adding **64 new candidate records**. Courier now covers 1918-1956 (107 candidates). Highlights include the clean "The Courier Recommends" list for 1954 (21 endorsements) and comprehensive 1956 county endorsements (18 records).
- 113152: **1 unextracted clipping** for 1950. Read and extracted, adding **5 new records**. Press now covers 1918-1958 (95 candidates).

### New Cross-Paper Overlaps Discovered (Round 4)
With the Courier now covering 1946-1956, there are many more overlapping years with the Press:

**1950:** Both papers endorsed McVey (R) for H-8, Capehart (R) for Senator, and McDonald (D) for Sheriff. Both also endorsed Padgett (D) for Recorder. Endorsement directions match perfectly.

**1952:** Courier endorsed Eisenhower, Merrill (H-8), Craig (Governor), Sauer (Clerk), Wever (Prosecutor). Press endorsed Eisenhower, Merrill, Schricker (Senator), Watkins (Governor), Sauer, Wever, Oviatt (Treasurer). Sauer and Wever endorsed by both papers.

**1954:** Both papers published comprehensive endorsement lists. Strong overlap: Merrill (H-8), Acker/Amos (State Reps), Sauer (Auditor), Padgett (Recorder), McDonald (Sheriff), Ferguson (Council), Combs/Mooney (Council at-large). The Courier list adds Mehrle (State Rep), Oursler (Joint State Rep), Rawlings (Superior Judge), Reeves (Circuit Judge), Kollker (Assessor), and more council/commission seats.

**1956:** Both papers endorsed Eisenhower, Capehart, Merrill, Handley. County endorsements largely overlap: Oviatt, Reed (Clerk), Combs (Coroner), Nussmeyer (Surveyor), Fitzgerald/Nussmeier (Commissioners), Wesselman (State Sen), Acker (State Rep).

## Remaining Flags
1. **113151 LARRABEE (1942 H-1):** First name unknown, left as single name
2. **113151 WAGNER (1932 Senator):** Out-of-state (NY) endorsement, state_election may need updating
3. **113152 LINDSEY (1928 DA/PROSECUTOR):** First name unknown
4. **113152 ROWBOTTOM (1928):** Party field blank (should be Republican to match 1930 entry)
5. **113152 BOEHNE H district (1932, 1936, 1938):** Should be dist 8, currently empty
6. **113150 2016 STATE SEN districts:** Empty for Becker, Washburne, McNamara (confirmed unopposed, district info not in clipping)
7. **113151 1950 HITCH, OTIS R. (SURVEYOR):** Office inferred from family pattern (Bill Hitch was Surveyor in 1946). Low confidence (0.70). Clipping text was hard to read.
8. **113151 1950 HARRIS, EVIGENE (TOWNSHIP TRUSTEE):** Name uncertain from hard-to-read clipping. Low confidence (0.70).

---

# V9 CROSS-PAPER RECONCILIATION (2026-06-24)
Run AFTER all three papers were individually V9 deep-image-verified (counts now: Courier 113151 = 438 cand; Courier-and-Press 113150 = 360 cand + 16 props; Press 113152 = 604 cand + 39 props). This supersedes the pre-V9 spot-checks above.

## Paper relationships (corrected understanding)
- **113151 Courier (morning)** and **113150 Courier-and-Press** are the SAME morning paper under two IDs. The morning Courier was renamed "Courier & Press" ~1998; newspapers.com labels it "Evansville Courier and Press" even for pre-merger years, so the same clippings were extracted into both IDs. They OVERLAP 1982–1998 and are **near-duplicate data**.
- **113152 Press (evening, Scripps-Howard)** is a GENUINELY DISTINCT paper (independent, frequently split tickets — endorsed Hoover 1928, Willkie 1940, Dewey 1944/48, Eisenhower 1952, Lugar 1974). It overlaps the Courier 1918–1996; direction differences are REAL editorial splits, not errors. Scripps sold the Press + bought the Courier in 1986; the Press ceased 1998-12-31.

## Reconciliation A — Courier (113151) ↔ Courier-and-Press (113150), 1982–1998
Full record-level diff of all 9 shared years. The two are ~95% identical (1982 & 1998 = 100% common). **Resolved 11 inconsistencies by bringing the Courier into line with the more-complete, more-recently-V9-verified C&P:**
- 2 genuine party conflicts (triangulated 2-of-3 + historical): **WORTMAN** (1986/1994 Council) Courier D → **R** (C&P+Press agree R; C&P also R in 2002); **TULEY** (1996 Comm) Courier R → **D** (C&P+Press agree D; Patrick Tuley is a Democrat).
- 9 blank-party fills to match C&P: 1986 Humphrey(D), 1992 Smith(R), 1994 Sutton(D)/Musgrave(R)/Crouch(R), 1998 Musgrave(R)/Crouch(R)/Ellsworth(D).
- **0 remaining hard party conflicts; 0 direction conflicts** between the two IDs.
- **DEDUP DECISION FOR PROJECT:** these 1982–1998 records are duplicate data across two IDs. Remaining structural deltas are dedup-level only: the C&P carries more Pattern-A opponent records (1984 Donovan, 1988 Pence/Opper, 1992 Perry, 1994 Stuart, 1996 Davis); the Courier pins 1984 school-board districts (Deem d1 / Smith d3) where C&P left blank; name format "Bland" vs "Berry Bland". C&P lacks 1990 entirely (no clipping). Decide whether to keep one ID or both.

## Reconciliation B — Press (113152) ↔ Courier (113151), 1918–1996
267 shared candidate records (same year/office/dist/surname).
- **12 DIRECTION differences = confirmed legitimate editorial splits** (each image-verified within its own paper's V9 pass): 1928 PRES (Courier Smith-D / Press Hoover-R), 1952 GOV (Craig-R / Watkins-D), 1960 GOV (Parker-R / Welsh-D) + Treasurer, 1962 SEN (Capehart-R / Bayh-D), 1964 SEN (Bontrager-R / Hartke-D), **1974 SEN (Courier Bayh-D / Press Lugar-R — spot-verified: Press "Mayor Richard Lugar for U.S. senator")**, 1990 SEN (Hill-D / Coats-R), 1996 GOV (O'Bannon-D / Goldsmith-R). These reflect the Press's distinct ticket-splitting and must be PRESERVED.
- **5 PARTY conflicts (errors — a candidate has one party). 4 FIXED in the Press (roster-fill errors; image showed no party; Courier+C&P agree + historical):** 1982 Council FORD D-not-R, TAYLOR R-not-D (image lists council with no party; the Press swapped them); 1992 & 1996 Recorder HERMANN R-not-D (Betty Hermann is a Republican recorder). **1 FLAGGED (unresolved):** 1972 Recorder COLE — Press image "13-B Cole Jr"=Democrat vs Courier=Republican; two image-based reads genuinely disagree (RA to confirm Clyde "Buddy" Cole Jr's 1972 party).

## Integrity after reconciliation
All three: Pattern K=0, 0 exact dups. Courier 438, C&P 360, Press 604. Archives synced (md5).

## RECONCILIATION ROUND 2 (2026-06-24) — final sweep
- **1972 Cole (recorder) conflict RESOLVED.** Calibrated the Press's 1972 ballot-column system using known-party picks: "-B" = Republican (1-B Nixon, 2-B Bowen, 3-B Orr, Zion, clerk Cox, treasurer Tilford all R; Democrats Hays/Schwartz are "-A"). So "13-B Clyde Buddy Cole Jr" = **Republican**. Fixed the Press (was Democrat) to match the Courier. **0 cross-paper party conflicts now remain (any pair).**
- **Office consistency:** 1954 FERGUSON fixed in the Press (CNTY COMM → CITY COUNCIL; he's County Council 1st District per the editorial, matching the Courier). The other office mismatch — 1956 "COMBS" (Courier CORONER vs Press AUDITOR) — is a coincidental surname collision (Herman T. Combs, county coroner ≠ Roy T. Combs, state auditor), not an error.
- **Proposition cross-check (7 shared years):** 1968 (both pari-mutuel NO) and 1974 (both all-YES) match exactly. 1970 and 1972 differ — the Press endorsed ALL constitutional amendments while the Courier was selective (1970 opposed the term-extension amendment; 1972 opposed props 2 & 5). Both were image-verified within their own passes → **legitimate editorial differences on ballot measures**, consistent with the 12 candidate direction-splits (preserved, not errors).
- Final integrity: Courier 438 / C&P 360 / Press 604, all Pattern K=0, 0 dups. Archives synced.
