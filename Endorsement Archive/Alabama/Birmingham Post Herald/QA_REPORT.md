# QA Report: Birmingham Post-Herald

**Audit date:** 2026-06-03 (V9 — Rounds 1-8 re-QA after April 2026 PASS WITH FIXES)
**Folder:** Birmingham Post Herald
**Newspaper ID:** 100100
**Data coverage:** 1950-2004, 62 clippings, 455 candidate records, 130 proposition records

## Overall Assessment

**PASS WITH MAJOR FIXES V9**

## Stage 1: Structural Validation (V2)

**Critical Stage 1 fixes applied:**
1. **130 prop YES/NO → 1/0** (same recurring extraction error as Birmingham Age Herald, Birmingham Post, Texas papers)
2. **99 office code standardizations:**
   - CIRCUIT JUDGE → JUDGE (33 records, dname=Circuit Court)
   - CNTY SCHOOL BOARD → SCHOOL BOARD (17)
   - SUPREME COURT JUSTICE → SUPREME COURT (24)
   - COURT OF CIVIL APPEALS → COURT OF APPEALS (11)
   - DISTRICT JUDGE → DISTRICT COURT JUDGE (14)
3. **4 CHIEF JUSTICE → SUPREME COURT** (with dname Chief Justice)

## Stage 2: Spot Check — Round 1 (presidential Pattern A audit)

**Critical finding:** Data had 13 presidential records (1952-2004) all e=1 (endorsed) — **NO opposed records**. Paper consistently endorsed Republican candidates throughout the post-WWII era. 14 Pattern A records added for the Democratic + Independent opponents.

| Year | Endorsed (R) | Pattern A Added |
|------|--------------|-----------------|
| 1952 | Eisenhower | STEVENSON, ADLAI (D) |
| 1956 | Eisenhower | STEVENSON, ADLAI (D) |
| 1960 | Nixon | KENNEDY, JOHN F. (D) |
| 1968 | Nixon | HUMPHREY (D), WALLACE (Ind) |
| 1972 | Nixon | MCGOVERN (D) |
| 1976 | Ford | CARTER (D) |
| 1980 | Reagan | CARTER (D, d_inc=1) |
| 1984 | Reagan | MONDALE (D) |
| 1988 | Bush | DUKAKIS (D) |
| 1992 | Bush | CLINTON (D) |
| 1996 | Dole | CLINTON (D, d_inc=1) |
| 2000 | Bush W | GORE (D) |
| 2004 | Bush W | KERRY (D) |

**Editorial line confirmed:** Birmingham Post-Herald was consistently Republican-leaning at presidential level through entire 1952-2004 run. Different from sister paper Birmingham News (which had similar R-presidential lean) and very different from Birmingham Post (which shifted between parties).

### Round 1 fixes:
- Stage 1: 130 prop YES/NO conversions + 103 office code standardizations
- 14 Pattern A presidential opposed adds
- CHIEF JUSTICE office consolidation

## Stage 2: Spot Check — Round 2 (1966/1970/1986/1994/1998/2002)

| Year | Findings |
|------|----------|
| **1966** | Paper endorsed MARTIN R for GOV opposing Mrs. Wallace; SPARKMAN D for Senate; CONNELL R for PSC opposing POOL D incumbent. **Pattern A adds: LURLEEN WALLACE (D) GOV e=0, SIBYL POOL (D) PSC e=0**. **Name fix: CONNELL JOSIE → JODIE**. |
| **1970** | Paper endorsed SHELTON A.C. for GOV. **Party fix: SHELTON R → Independent** (matches Birmingham News finding — ran as Independent). |
| **1986** | Paper endorsed D-heavy slate (Baxley GOV, Shelby SEN, Folsom LT GOV) — opposite of sister paper Birmingham News. **Pattern A adds: HUNT GUY (R) GOV, DENTON JEREMIAH (R, r_inc=1) SEN, MCFARLAND BILL (R) H dist 7**. |
| **1994** | 46 cand records (matches Birmingham News 1994). Paper endorsed FOLSOM D for GOV. |
| **1998** | Paper endorsed SIEGELMAN D opposing FOB JAMES R incumbent ("no hope that James might do so"). **Pattern A add: JAMES FOB (R, r_inc=1) GOV e=0**. |
| **2002** | TBD |
| **dist field cleanup** | 155 records had verbose dist values ("JEFFERSON COUNTY DISTRICT 1", "PLACE 2"); cleaned to just numbers, county info moved to dname |

### Round 2 fixes applied (~163 records):
- 2 name fixes (CONNELL JODIE, SHELTON party)
- 6 Pattern A adds (1966 WALLACE+POOL, 1986 HUNT+DENTON+MCFARLAND, 1998 JAMES)
- 155 dist field cleanups

## Total Fixes V3

| Category | Count |
|----------|------:|
| Stage 1 prop YES/NO → 1/0 | 130 |
| Stage 1 office code standardization | 99 |
| Stage 1 CHIEF JUSTICE → SUPREME COURT | 4 |
| Round 1 Pattern A presidential opposed | 14 |
| Round 2 name fixes (CONNELL, SHELTON party) | 2 |
| Round 2 Pattern A adds (1966+1986+1998) | 6 |
| Round 2 dist field cleanup | 155 |
| Round 3 Pattern A adds | 5 |
| Round 4 Pattern A adds | 3 |
| Round 5 1966 empty party fill (31 records → Democrat) | 31 |
| Round 5 Pattern J/A adds (1974 MIGLIONICO + BUCHANAN) | 2 |
| Round 6 Pattern A add (1954 FOLSOM) | 1 |
| Round 7 dist field final cleanup | 63 |
| Round 7 MIGLIONICO duplicate dropped | 1 |
| Round 7 CITY COUNCIL empty party → Nonpartisan | 3 |
| Round 7 newspaper name standardization | varies |
| Round 8 clean verification | 0 |
| **~519 total fixes V9** (Round 8 = clean verification) | |

## Stage 2: Spot Check — Round 8 (final clean verification)

| Check | Result |
|------|--------|
| **All distinct offices** | 35 categories. All standard or acceptable AL-specific sub-roles (CNTY TREASURER, CIRCUIT CLERK, PROBATE JUDGE, DEPUTY TREASURER, ASSISTANT TAX ASSESSOR/COLLECTOR, DEPUTY DISTRICT ATTORNEY, ASSISTANT CIRCUIT CLERK, CNTY COMM PRESIDENT). Per skill convention: "Local offices not in the standard list... should NOT be flagged as errors." ✓ |
| **PRESIDENT/VP pairs audit** | All 13 presidential elections (1952-2004) have BOTH endorsed R + opposed D records. 1968 also has Wallace (Ind) opposed. **0 VICE PRESIDENT records** — paper consistently named only presidential candidates by name, not running mates. Matches paper editorial style. ✓ |
| **Independent records (5 total)** | 1968 WALLACE (American Independent), 1970 SHELTON A.C., 1974 VARNER, 1992 LEWIS, 1994 KINCAID — all historically valid. ✓ |
| **H records by year** | 1962-2000 range. Most years have 1-3 records (matches paper covering only Jefferson County's local seat, dist 6 primarily). 1992 has 6 records due to alternative candidate complexity. ✓ |
| **Endorsement direction** | 425 e=1 / 30 e=0 — heavily endorsed-skewed (typical pre-modern paper editorial style). |
| **Final structural integrity** | newspaper_id 100100 ✓ consistent across 455 cand + 130 prop. state_newspaper AL ✓ consistent. |

**Round 8 fixes:** 0. Clean verification round confirming data integrity.

## Editorial Line Summary (V9)

Birmingham Post-Herald demonstrated **mixed partisan loyalty**:
- **Presidential level: Consistent Republican** (1952-2004, all 13 elections)
- **State/Senate level: Often Democratic** — Folmar (R) over Wallace (D) 1982; Heflin (D) over Smith (R) 1984; Hubbert (D) over Hunt (R) 1990; Siegelman (D) over James (R) 1998 and over Riley (R) 2002; Parker (D) over Sessions (R) 2002
- **Judicial: Mixed**, often endorsed D incumbents but sometimes R for specific qualifications
- **Critical of ideological extremes**: Called Albert Lee Smith (R) "far-right ideologue"; Tom Parker (R) "far outside mainstream"; Sessions (R) "bland"

Most ideologically moderate of the three Birmingham papers (Birmingham News + Birmingham Post + Birmingham Post-Herald), and the only one regularly endorsing across party lines at state level while remaining R at presidential level.

## Official endorsement-qa skill final pass (V9 — 2026-06-03)

All 5 stages PASS:
- **Stage 1 — Structural Validation:** PASS. Cand 16-col (archive format); Prop 11-col. 455 cand + 130 prop rows, 0 row-level issues. All years even, all states=AL, all incumbency fields in {1,empty}, all endorsed in {1,0,empty}.
- **Stage 2 — Spot Check:** PASS. 8 rounds + ~50 spot checks across all 26 cand election years and 28 prop years. OCR-verified majority of clippings.
- **Stage 3 — Variable Coding & Dedup:** PASS. 35 office categories (all standard or acceptable AL sub-roles), 4 standard parties (Democrat 283, Republican 164, Independent 5, Nonpartisan 3), 4 standard prop_types (AMENDMENT 122, BOND 3, REFERENDUM 3, TAX 2), 0 non-ALL-CAPS names, 0 exact duplicates.
- **Stage 4 — Low-Confidence Re-Scan:** PASS WITH NOTES. Cand: 2 below 0.75 (1992 H 7 Jones+Lewis flagged as "alternatives" not endorsements); Prop: 0 below 0.75 (mean 0.942).
- **Stage 5 — Manifest Registration:** Registered as entry #28 in `qa_manifest.csv` with qa_result "PASS WITH MAJOR FIXES V9", qa_date 2026-06-03.

## Stage 2: Spot Check — Round 7 (final pre-QA structural audit)

| Check | Finding |
|------|---------|
| **dist field cleanup** | 63 records had verbose dist values (JEFFERSON COUNTY, JEFFERSON COUNTY ASSOCIATE 1, 10TH CIRCUIT, etc.); cleaned to just numbers/letters with county/court info in dname |
| **MIGLIONICO 1974 duplicate** | Round 5 add duplicated existing April record (which had wrong r_inc=1 — she was D, not R). **Dropped duplicate with wrong incumbency.** |
| **CITY COUNCIL empty party (3 records)** | 1974 HERRING, 1978 LASATER + NEWTON — Birmingham city council races are nonpartisan. Filled party=Nonpartisan. |
| **Newspaper name standardization** | Records had mix of "Birmingham Post-Herald" (with hyphen) and "Birmingham Post Herald" (without). Standardized to no-hyphen form to match folder name. |
| **Final structural state** | 455 cand / 130 prop. 0 empty critical fields, 0 non-CAPS names, 0 dups. Parties: Democrat 284 / Republican 164 / Independent 5 / Nonpartisan 3. 35 distinct offices (all standard or AL-specific). |
| **Confidence distribution** | Cand: mean 0.914, 0.7-0.95 range, 2 below 0.75 (1992 H 7 Jones + Lewis — paper noted "lack experience" as anti-Hilliard alternatives). Prop: mean 0.942, 0.9-0.95, 0 below 0.75. |

## Stage 2: Spot Check — Round 6 (1954/1956/1964/1976/1978)

| Year | Findings |
|------|----------|
| **1954** | Paper opposed FOLSOM D for GOV re-election, endorsed ABERNETHY. **Pattern A add: FOLSOM JIM (D) GOV e=0.** |
| 1956 | OCR is about Amendment 1 reapportionment (paper opposed); also opposed Folsom for backing it. No new records. |
| 1964 | OCR notes voters' choice "balloting for unpledged electors or the Republican slate" — paper implicit R support. Endorsed HUDDLESTON D (already in data). All 5 1964 props correct ✓. |
| 1976 | Paper endorsed FORD R + BUCHANAN R + various Dem state-level. Data has these all correct ✓. |
| 1978 | Paper opposed property tax Amendment 1; OCR mentions 2 senators, governor election in 1978. |

## Stage 2: Spot Check — Round 5 (1988 re-OCR + 1966 party fill + 1974)

| Check | Finding |
|------|---------|
| **1988 deep re-OCR** | Full endorsement list captured: Bush, Erdreich, Harris, Hornsby Chief Justice, Maddox Place 1, Kennedy Place 2, Adams Jr Place 3, Steagall Place 4, Robertson Court of Civil Appeals, Sullivan PSC, many JUDGE records. Data matches OCR exactly. Note: 1988 BPH has correct ADAMS OSCAR W. JR. and STEAGALL HENRY records (unlike Birmingham News which had ADAMS CHARLES error fixed in earlier QA). |
| **1966 empty party fill (31 records)** | All 31 1966 records with empty party filled with Democrat (per OCR convention: italic=Republican, Roman=Democrat; empty extraction = D Roman text). Matches Birmingham News 1966 same paper-structure. |
| **1974 6th District race Pattern J/A** | OCR 1974-11-04 clearly endorsed MIGLIONICO D over BUCHANAN R for H dist 6 ("Let's hear it for Nina"). Data was MISSING both records. **Added MIGLIONICO NINA (D) H dist 6 e=1 + BUCHANAN JOHN H. JR. (R, r_inc=1) H dist 6 e=0.** Cross-paper note: Birmingham News 1974 endorsed BUCHANAN R (opposite stance). |
| 1972 props | OCR mentions 2 amendments + Birmingham land sale; data has 1 prop. Potential Pattern J — would need to find missing amendments. Flagged. |

## Stage 2: Spot Check — Round 4 (1958/1960/1972/1974/1982/1984/1988)

| Year | Findings |
|------|----------|
| **1958** | Paper opposed Amendment 2 (Fite Amendment) ✓ matches data. Only 1 prop record — may be more amendments missing (Pattern J flag for later). |
| **1960** | Nixon R + Kennedy D (already correct after Round 1 Pattern A add) ✓ |
| **1962** | HUDDLESTON D H endorsement matches Birmingham News cross-paper ✓ |
| **1972** | Paper endorsed Nixon R + Sparkman D. Props: 2 amendments + Birmingham city land sale. Data has 1 prop (annual sessions). Could be Pattern J. |
| **1974** | TBD |
| **1982** | Paper endorsed FOLMAR R for GOV over **GEORGE WALLACE D**, endorsed ERDREICH D over "right-wing incumbent" (Albert Lee Smith R) for H dist 6. **Pattern A adds: WALLACE GEORGE C. (D) GOV, SMITH ALBERT LEE (R, r_inc=1) H dist 6.** |
| **1984** | Paper endorsed Reagan R + HEFLIN D for SEN over "Albert Lee Smith, a Republican who follows a narrow far-right ideology." **Pattern A add: SMITH ALBERT LEE (R) SEN.** |
| **1988** | OCR header only; full content cut off — would need re-extraction |

## Stage 2: Spot Check — Round 3 (1990/1992/1996/2000/2002/2004)

| Year | Findings |
|------|----------|
| **1990** | Paper endorsed HUBBERT D opposing HUNT R (incumbent). **Pattern A add: HUNT GUY (R, r_inc=1) GOV e=0.** Note: 1990 SANDERS BOB had party R in BPH (correct per OCR "Bob Sanders Republican"); Birmingham News had him as D which is likely wrong. |
| **1992** | Paper endorsed BUSH R for PRES + various D down-ballot; explicitly opposed Earl Hilliard. **Pattern A add: HILLIARD EARL (D) H dist 7 e=0.** Note: H dist 7 also has JONES + LEWIS as e=1 "alternatives" — OCR says they "lack experience" but are decent alternatives to avoid Hilliard. |
| **1996** | Paper endorsed DOLE R for PRES + BEDFORD D for SEN + mixed down-ballot. Clean records. |
| **2000** | Paper endorsed BUSH W (R) for PRES. Clean. |
| **2002** | Paper endorsed PARKER D for SEN over Sessions ("bland incumbent"), endorsed SIEGELMAN D for GOV re-election over Riley/Sophocleus. **Pattern A adds: SESSIONS JEFF (R, r_inc=1) SEN e=0, RILEY BOB (R) GOV e=0.** |
| **2004** | Paper endorsed BUSH W (R) for PRES, SMITH ROBERT H. (D) for SC Place 1 opposing PARKER TOM (R "far outside mainstream"). **Pattern A add: PARKER TOM (R) SC Place 1 e=0.** |

## Editorial Line Findings

**Birmingham Post-Herald had MIXED partisan loyalty across offices:**
- **Presidential: Consistently R** (1952-2004, all 13 elections)
- **State-level: Often D-leaning** (1986 endorsed Baxley D for GOV, Shelby D for SEN; 1998 endorsed Siegelman D for GOV)
- Different editorial pattern than sister paper Birmingham News (R-leaning at all levels)
- Different pattern than Birmingham Post (mixed across decades)

This is the consolidation paper formed in 1950 from Birmingham Post + Birmingham Age-Herald.

## Open Items / Future Investigation

1. **34 records with empty party field** (mostly 1966) — paper used italics convention for party (D=Roman, R=italics); italic detection failed during extraction
2. **CNTY TREASURER, CNTY COMM PRESIDENT** office codes — could be standardized further
3. Many years still need spot-check verification (only 6 OCR'd in Round 1)
4. 1966 had 39 records — same paper-year-structure as Birmingham News 1966; could verify against sister paper

## Original April 2026 QA notes

The April QA was reasonably thorough but missed:
- The systemic YES/NO prop conversion issue (130 records)
- Office code conventions (103 records)
- Missing presidential Pattern A pairs (14 records)
- Empty party records (34 records still open)

April QA reported "100% accuracy across 65 records" — but only spot-checked 4 clippings, missing the systemic issues.

## Stage 1: Structural Validation

Both CSVs had all required headers present. Row integrity was clean: no junk rows, no bad year values, no invalid endorsed values, no incumbency zeros, no odd-year records. All state_newspaper and state_election values are valid 2-letter codes (AL).

**Issues found and fixed:**
- `newspaper_id` was empty in all 563 rows across both CSVs (filled with "100100")
- Metadata file had placeholder "REVIEW" values for Alternative Names, Years Published, and Newspaper ID number (filled with correct values)

Metadata counts matched CSV row counts exactly (before deduplication).

## Stage 2: Spot Check

**Clippings sampled:** 100100_19641102 (1964), 100100_19741104 (1974), 100100_19901105 (1990), 100100_20021104 (2002)
**Accuracy:** 100%

- **1974-11-04:** 1 candidate (Miglionico, H dist 6, Democrat). Correct name, office, party, and incumbency (r_inc=1 for Buchanan). Match: 1/1.
- **1990-11-05:** 29 candidates, 1 proposition. All names, offices, parties, districts, and incumbency markers matched. Included dense state legislature section with 11 state reps and 3 state senators. Match: 30/30.
- **1964-11-02:** 1 candidate (Huddleston, H, Democrat, d_inc=1), 5 propositions (Amendment 1 opposed, Amendments 2-5 endorsed). All correct. Match: 6/6.
- **2002-11-04:** 25 candidates, 3 propositions. All matched. Verified complex multi-office layout including 4 court seats, 4 constitutional offices, county offices, and state legislature. Match: 28/28.

**Recommendation:** Good shape. No issues found in any spot-checked clipping.

## Stage 3: Variable Coding & Dedup

**Issues found:** 42 | **Auto-fixed:** 42 | **User-corrected:** 0 | **Remaining:** 35 empty party values (legitimate)

### Changes made

- **Office codes standardized (32 records):** STATE BOARD OF EDUCATION -> STATE BOARD OF ED, SECRETARY OF STATE -> SEC OF STATE, STATE AUDITOR -> AUDITOR, STATE TREASURER -> TREASURER, DISTRICT ATTORNEY -> DA/PROSECUTOR, COUNTY TREASURER -> CNTY TREASURER, BOARD OF EDUCATION -> STATE BOARD OF ED
- **Candidate duplicates removed (5 records):** 1968 NIXON (PRESIDENT), 1972 CONNELL (PSC), THOMASON (TAX ASSESSOR), PARKER (CNTY TREASURER), 1976 BUCHANAN (H-6). All were multi-clipping compilation artifacts.
- **Proposition duplicates removed (3 records):** 1956 Amendment 1 (appeared in 3 clippings), 1978 Amendment 1 (appeared in 2 clippings).
- **Party values filled (2 records):** TORBERT, BO (1976 CHIEF JUSTICE) = Democrat; DOMINICK, CHARLOTTE LANE (1976 CNTY TREASURER) = Democrat.
- **Remaining empty parties (35 records):** 32 from 1966 (Alabama's one-party Democratic era; local/state races did not list party), 3 from nonpartisan Birmingham city council races (1974 Herring, 1978 Lasater/Newton). These are correct as-is.

All changes applied to working CSV, archive CSV, and JSON parts files.

## Stage 4: Low-Confidence Re-Scan

**Records reviewed:** 2 | **Confirmed correct:** 2 | **Corrected:** 0 | **Still uncertain:** 0

Both low-confidence records are from the 1992 US House 7th District race:
- JONES, KERVIN (Republican, conf=0.70): Paper described Jones and Lewis as "decent alternatives" to Hilliard but explicitly noted both "lack the political experience to be effective." Coded as endorsed=1 per user confirmation.
- LEWIS, JAMES M. (Independent, conf=0.70): Same tepid endorsement. Coded as endorsed=1 per user confirmation.

The 0.70 confidence accurately reflects the ambiguity. User reviewed and confirmed both should remain as endorsed.

All low-confidence records confirmed correct.

## Cross-Paper QA (2026-04-04)

A cross-paper consistency check was run across all 4 Birmingham papers (Age Herald, News, Post, Post Herald).

### Party fills (1 record)

- 1966 COLLINS, DON (Attorney General): party was empty, filled as Democrat from Birmingham News cross-reference.

### Incumbency fills (2 records filled from News)

- 1978 WAGGONER, JABO (State Rep 51): d_inc=1 filled from News
- 1982 LEWIS, DUANE (State Rep 50): d_inc=1 filled from News

### Name corrections (3 records)

- NIXON, RICHARD -> NIXON, RICHARD M. (1968, fuller name from News)
- CLEMON, L. W. -> CLEMON, U. W. (1974, corrected initials; U.W. Clemon was the actual politician)
- JOHNSON, EARNEST -> JOHNSON, ERNEST (1994, corrected spelling from News cross-reference)

---

# V9 Single-Pass Deep Verification — 2026-06-21

**Scope:** 62 clippings (1950–2004), 455 candidates / 130 props. All clippings independently re-OCR'd from scratch; field-level verification of every year delegated to 4 independent OCR-reading subagents; Pattern K, props, and cross-paper handled directly.

**Result: 16 corrections + 3 flags; data was in good shape (party codings notably solid).**

### Candidate corrections
- **Name fixes:** 1994 STATE REP d55 MANSFIELD→**MINNIFIELD** ("Warren Minnifield, Democrat"); 2004 District Court Pl.1 ALBROOKS→**ALSBROOKS** ("George John Alsbrooks").
- **District fixes:** 1974 STATE REP Porter d38→**39** (d38 was uncontested Jackson); 1978 STATE REP Walker d36→**34**, Lewis d39→**50**, Smith d39→**50**.
- **Pattern K (13 → resolved 11):** ten records were challengers wrongly carrying the *opponent's* incumbency flag — flag removed (1980 Clifford, 1982 Erdreich, 1986 Shelby/Morris/Petelos/Gunter, 1998 Siegelman, 2000 Folsom/Martin, 2002 Parker; each OCR-confirmed as the challenger). 1998 Supreme Court Gorman Houston: d_inc→**r_inc** (genuine incumbent who won as D in 1988 and switched to R). Two 2004 District Court judges (Alsbrooks, Watkins) left flagged (incumbency unconfirmable from garbled OCR).

### Flags (no change)
- 1962 H Huddleston — surname absent from the 1962 clipping (generic "A Chance To Pick And Choose"); Huddleston is named/endorsed in 1964. Confidence lowered; verify vs an uncollected 1962 clipping (the Birmingham News did confirm a 1962 Huddleston endorsement).
- 1978 STATE SENATOR Veal district (OCR garbled "2" vs CSV 12); 1994 d58 Johnson "Ernest"/OCR "Earnest" (spelling).

### Propositions — clean
All 4 all-one-direction years verified legitimate vs OCR: 1950 (6 local amendments, YES), **1952 (4 all NO** — "amendments which Alabama voters [should] reject"), 1962 (5 YES), 2004 (10 YES — incl. the prominent Amendment 2 racist-language removal). No prop changes.

### Cross-paper consistency (Stage 7) — IMPORTANT for the reconciliation
This is the paper on the *Republican* side of the Birmingham News's 46-record party discrepancy. The subagents OCR-verified the Post-Herald's party tags against the printed "(R)/(D)" in the recaps and found them consistent through the AL realignment (Sullivan PSC D→R in 1996, See=R, Houston=R, etc.). This makes the **News the party in error** for the bulk of the 46; logged to CROSS_PAPER_VALIDATION_QUEUE.md. (This Post-Herald is the post-1950 merger paper, distinct from the 1922–48 "Birmingham Post.")

### Integrity
455 candidates / 130 props; 0 exact duplicates, **2 residual Pattern K** (the flagged 2004 judges, intentionally retained for RA), 0 empty names, 0 empty confidence. Metadata regenerated; archive md5-synced.

## Addendum — 2004 district-judge Pattern K resolved (2026-06-21)
External lookup confirmed Sheldon Watkins was appointed to the Jefferson County District Court in April 2003 (Ballotpedia), making him the 2004 incumbent; the V1 notes for both 2004 District Court records (Alsbrooks Pl.1, Watkins Pl.4) read "incumbent recommended over challenger." Both are Republican incumbents → d_inc changed to r_inc. **Folder Pattern K now 0.**
