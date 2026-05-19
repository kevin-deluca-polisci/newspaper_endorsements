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
