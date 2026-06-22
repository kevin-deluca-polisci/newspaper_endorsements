# QA Report: Cedar Rapids Gazette (114900)

**Audit date:** 2026-06-03 (V2 — 10 rounds re-QA + formal endorsement-qa skill pass)
**Folder:** Cedar Rapids Gazette
**Newspaper ID:** 114900
**Location:** Cedar Rapids / Linn County, Iowa
**Data coverage:** 1960-2018 (21 cand election years + 9 prop years), 64 clippings, 175 cand records, 24 prop records

## Overall Assessment

**PASS WITH MAJOR FIXES V2**

Most error-prone folder QA'd from the systematic re-pass: April 2026 extraction had widespread Pattern A gaps (missing opponent records), 3 phantom records, and at least one critical direction error (1978 MYERS R was actually D challenger). Ten rounds of OCR-driven spot checks + formal QA pass surfaced ~34 fixes total.

## V2 Fix Summary (~34 fixes total)

### Stage 1: Structural fixes (11 fixes)
- 8 prop_type LOCAL → BALLOT MEASURE (5) / BOND (3)
- 3 Supreme Court empty party → Nonpartisan (Iowa retention elections, paper rejected all 3 in 2010)

### Round 1: 10 spot checks across eras (5 fixes)
- **CRITICAL: 1968 H STANLEY, IVOR → RILEY, TOM** (per OCR; Ivor Stanley was IA STATE REP not US Congress)
- 1972 DA HUMPHREY → HUMPHREYS, LLOYD (OCR spelling)
- 2014 PODZIMEK, TOM → PODZIMEK, TOMAS (OCR spelling)
- PATTERN J: 1968 PRESIDENT NIXON, RICHARD R (OCR "We think Richard Nixon as President...")
- PATTERN J: 1972 H dist 2 CULVER, JOHN D (OCR explicit Culver 2nd Dist endorsement)

### Round 2: Empty party + Pattern A audits (2 fixes)
- 1960 BROMWELL, JAMES (JIM) → JAMES (name standardization across 1960/1962)
- 2010 GONZALEZ Treasurer o_inc=1 (incumbent Linn County Treasurer 1995-2018)

### Round 3: 2012 PRESIDENT gap + 1978 Pattern A (3 fixes)
- PATTERN J ADD: 2012 PRESIDENT ROMNEY, MITT R + OBAMA, BARACK D Pattern A (OCR "Romney as the best choice")
- PATTERN A ADD: 1978 SENATOR CLARK, DICK D e=0 d_inc=1 (OCR "confidence in Clark has waned")

### Round 4: HARKIN cross-year + 1982 LIGHTFOOT phantom (3 fixes)
- 2018 HEIDEN CntyComm o_inc=1 (Linn County Supervisor since 2011)
- PATTERN A ADD: 1982 H dist 2 APPEL, BRENT D (OCR "Brent Appel... distortions of the Tauke record")
- 1982 LIGHTFOOT flagged at 0.50 — no OCR source

### Round 5: 1972 systematic Pattern A discovery (5 fixes)
- PATTERN A ADD: 1972 PRESIDENT MCGOVERN D (OCR "McGovern has botched, bungled and mishandled")
- PATTERN A ADD: 1972 SENATOR CLARK, DICK D (OCR "over Dick Clark")
- PATTERN A ADD: 1972 GOVERNOR FRANZENBURG, PAUL D (OCR "in preference to Paul Franzenburg")
- PATTERN A ADD: 1972 H dist 2 ELLSWORTH, TED R (OCR "Ted Ellsworth challenger")
- 1972 MEZVINSKY flagged at 0.55 — phantom suspect

### Round 6: 1978 backward record + 1980 (3 fixes)
- **CRITICAL FIX: 1978 H dist 1 MYERS, RICHARD party R→D, e=1→0** — Major data error! OCR clearly identifies Myers as D challenger; paper endorsed Leach R, not Myers. Original extraction had wrong party AND wrong direction.
- PATTERN J ADD: 1978 H dist 1 LEACH, JAMES R e=1 r_inc=1 (paired with Myers fix)
- PATTERN A ADD: 1980 H dist 2 SOVERN, STEVE D (OCR "Democratic challenger Steve Sovern of Cedar Rapids")

### Round 7: Phantom deletions + 1970 (6 fixes — 3 deletes + 3 adds)
- **DELETE: 1982 LIGHTFOOT, ROBERT** (confirmed phantom; no OCR source even at 1200dpi PSM 6)
- **DELETE: 1972 MEZVINSKY, EDWARD** (not in 1972 OCR; wrong dist — was 1st not 2nd)
- **DELETE: 1970 SCHERLE, WILLIAM 2nd Dist** (Scherle was actually 7th Dist; OCR shows Culver D won 2nd Dist)
- PATTERN J ADD: 1970 H dist 2 CULVER, JOHN D e=1 d_inc=1 (OCR explicit Culver endorsement)
- PATTERN A ADD: 1970 H dist 2 MCMARTIN, COLE R (OCR "his challenger, Cole McMartin")
- PATTERN A ADD: 1970 GOVERNOR FULTON, ROBERT D (Fulton was Ray R's opponent)

### Round 8: 1988 Pattern A pairs (3 fixes)
- PATTERN A ADD: 1988 H dist 1 GLUBA, BILL D (OCR "Bill Gluba... campaigned unsuccessfully against Leach in 1982")
- PATTERN A ADD: 1988 H dist 2 TABOR, ERIC D (OCR "Democratic challenger Eric Tabor")
- PATTERN A ADD: 1988 H dist 3 REDFERN, DONALD R (OCR "Cedar Falls Republican Donald Redfern")

### Round 9: 1986 LtGov Pattern J/A pair (2 fixes)
- PATTERN J ADD: 1986 LT GOVERNOR LIPSKY, JOAN R (1200dpi PSM 6 OCR explicit)
- PATTERN A ADD: 1986 LT GOVERNOR ZIMMERMAN, JO ANN D (OCR explicit)

### Round 10: Final comprehensive sweep (0 fixes)
- 0 duplicates, 0 empty critical fields, 0 incumbency '0' errors, all office codes canonical, all prop_types canonical, all opposed records have notes

## Stage 2: Spot Check (formal pass)

**Clippings sampled:** 3 (1976 Pres, 1988 USHouse, 1990 USSenate)
**Accuracy:** 100% — all Pattern A pairs verified post-Round 8 fixes

## Stage 3: Variable Coding & Dedup

**Issues found:** 0 | All fields canonical: 14 office codes (canonical), 4 parties (Republican 86 / Democrat 80 / Nonpartisan 3 / empty 6), 3 prop_types (AMENDMENT/BALLOT MEASURE/BOND). 0 duplicates. 0 incumbency '0' errors. 0 'District' phrase in dist field.

## Stage 4: Low-Confidence Re-Scan

**Records reviewed:** 3 (all <0.75 conf) | All have documenting notes:
- 1986 SENATOR CONLIN/GRASSLEY (conf 0.70) — OCR garbled, direction inferred from contextual pattern
- 1986 prop Iowa state printing amendment (conf 0.70) — OCR garbled, topic from clip title

## Outstanding Coverage Gaps (Intrinsic source limits)

- **6 empty-party records** — Iowa partisan offices where OCR couldn't capture party labels at any DPI: 1972 HUMPHREYS DA, 2010 MCCALMANT Recorder, 2010 SWAIM/DIXON STATE REP, 2010 GONZALEZ Treasurer, 2014 PODZIMEK CntyComm
- **2014 coverage gap** — Only CntyComm + SecState + StateSenator; missing GOV (Branstad re-elect over Hatch), SENATOR (Ernst R won open Harkin seat), 4 H districts
- **2018 coverage gap** — Only CntyComm + H; missing GOV (Reynolds R), AG, SOS, Treasurer, Auditor
- **Coverage gap 1992-2006** — 7 election cycles with no clippings in archive
- **Pattern A gaps still open** — 1968 PRES Humphrey (no explicit critique), 1980 H d1 (name cut off in OCR), 1986 H d3 Nagle's R opponent (no clipping coverage), 2010 H d1/d2/d3 (OCR too poor at any DPI)

## Notes for Downstream Use

- The Cedar Rapids Gazette is owned by Gazette Communications (independent Iowa-based)
- Historically conservative-leaning R paper but with notable cross-party endorsements:
  - 1966: Hughes D Gov
  - 1970/1972: Culver D 2nd District H (paper flipped from opposing him in 1968 to endorsing twice)
  - 1980: Endorsed Reagan + Grassley but discussed split
  - 1986: Endorsed Nagle D for 3rd Dist H
  - 2008: Harkin D Sen (over McCain R Pres same year)
  - 2018: Finkenauer D over Blum R incumbent 1st Dist (paper shifted modern era)
- **2016 Pres declined**: Paper explicitly DID NOT endorse Trump or Clinton ("the paper opted to NOT support Trump or Democratic nominee Hillary Clinton")
- Presidential endorsements: Nixon 1960/68/72, Ford 1976, Reagan 1980/84, Bush 1988, McCain 2008, Romney 2012; no endorsement 2016
- TAUKE R (1978-1990) and LEACH R (1976-2007) were repeated multi-year endorsements
- BRANSTAD R consistent for Gov 1982/86/90
- 2010 paper voted to REJECT all 3 Iowa Supreme Court retention votes over same-sex marriage ruling

---

# V9 Single-Pass Deep Verification — 2026-06-21

**Scope:** 64 clippings (1960–2018), 175→181 candidates / 24 props. All clippings independently re-OCR'd; every candidate year field-verified by 3 independent OCR-reading subagents; high-stakes directions vision-confirmed.

**Result: substantial corrections — 12 candidate fixes + 6 omission adds; props clean.**

### Candidate corrections
- **2010 Iowa Supreme Court retention (Baker, Streit, Ternus): DIRECTION INVERTED e=0→e=1.** Vision of the 2010 editorial confirms the Gazette recommended **RETAINING** the justices ("casting out Justices Ternus, Baker and Streit" is unjustified; "consider whether these justices are competent and impartial… upholding our constitution"). V1 had coded them as vote-OUT — confusing the famous ouster *outcome* with the paper's *recommendation*. **3 records flipped.**
- **1978 Senate Jepsen e=1→blank** and **1980 Senate Grassley e=1→blank / Culver e=0→blank** — both were explicit NON-endorsements ("the logical recipient of a newspaper's endorsement is no one"; "In lieu of an endorsement, all we urge is careful scrutiny").
- **1986 Senate name fix: "Conlin, Roxanne" → "Roehrick, John"** — the 1986 D challenger was John Roehrick (Des Moines attorney), not Roxanne Conlin (who ran Gov-1982 / Senate-2010). Grassley endorsement confirmed.
- **2008 STATE REP fixes:** Potts first name Renee→**Kathy** + district fills (Willems d29, Nemecek d29, Potts d33, Taylor d33, Lawyer d36) from OCR section headers.

### Omissions added (reverse-match)
- **1968 US Senate:** Stanley (R) endorsed / Hughes (D) opposed.
- **1974 US Senate:** Culver (D) endorsed / Stanley (R) opposed — a cross-party endorsement.
- Opponent records: 1980 H-1 Larew (D), 1986 H-3 McIntee (R).

### Verified, no change
- The paper's many genuine **cross-party endorsements** all confirmed (1970/1972 Culver-D US House; 1986/1988 Nagle-D; 2008 mixed slate; 2014 Podzimek-Independent; 2016 Vernon-D & Peters-R; 2018 Finkenauer-D).
- **Props clean:** 1968 (6 FOR — "We urge the people to approve all the amendments") and 1974 (4 FOR — special session/school-fund/zoo bond/zoo levy all "Yes") all-FOR years verified legitimate; the 1974 "rapup" is a prose recap (no checkbox grid). Candidate gap 1964 is genuine (amendments-only).

### Cross-paper & integrity
Statewide candidates fully consistent with the Des Moines Register/Tribune (no metadata mismatches). 181 candidates / 24 props; 0 exact duplicates, 0 Pattern K, 0 empty names. Metadata regenerated; archive md5-synced.

## Addendum — 2008 HD-37 + 2010 legislature-grid high-res vision (2026-06-21)
Both flagged items resolved by high-zoom vision of the clipping images (the photo-grid/truncated layouts had defeated OCR — V1 was substantially wrong here). 181→188 records.
**2008:** District 36 "Lawyer" corrected RENEE/Republican → **GRETCHEN LAWYER, Democrat** ("Marion Democrat Gretchen Lawyer... gets our endorsement" over Republican Nick Wagner); added HD-37 Schulte (R, endorsed) + Staed (D, opposed) and HD-36 Wagner (R, opposed). 2008 State Rep races now complete head-to-head pairs.
**2010 "Endorsements for Iowa Legislature" photo-grid:** corrected HD-37 "Swaim, Jeff" → **Renee Schulte (R)** and HD-38 "Dixon, Tyler" → **Tyler Olson (D)** (V1 mis-read the grid); added grid endorsees HD-34 Todd Taylor (D), HD-29 Nathan Willems (D), and opponents Seidl (HD-37) / Marshall (HD-38). The 2010 State Senator records (Danielson Sen-10, Horn Sen-33) could NOT be confirmed against this degraded grid scan (which shows a Senate District 16 endorsement) — flagged + confidence lowered for a higher-res re-scan, along with the grid's unreadable Senate-16 endorsee and a "Dave Jacoby" House entry.
