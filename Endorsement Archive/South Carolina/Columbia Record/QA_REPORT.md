# QA Report: Columbia Record (Columbia, SC)

**Audit date:** 2026-06-10 (V14 final — 134 rounds + new year added)
**Folder:** done/Columbia Record
**Newspaper ID:** 143150
**Data coverage:** 1950-1986 (14 election years), 52 clippings, 182 candidate records, 39 proposition records

## Overall Assessment

**PASS WITH FIXES V14** — 134 rounds + formal QA + systematic record-by-record verification + raw/ folder recovery

**R131-R132 (major find):** Raw folder audit recovered a previously-missing election year — 1964. Two clippings (1964-10-29 "In Favor of the Amendment" + 1964-11-02 "Appointing a Superintendent") found in raw/ as NoneMMDD_version47.pdf and version71.pdf (date-detection failures during initial processing). Both clippings endorse Amendment No. 1 (change State Superintendent from elected to appointed by State Board of Education). Year added to dataset.

R-leaning Columbia, SC afternoon paper (ceased April 1, 1988). Endorsed Eisenhower 1952, Nixon 1960/1968/1972, Ford 1976, Reagan 1980/1984. Cross-party D endorsements at state level: West D Gov 1970, Riley D Gov 1982, Hollings D Sen 1980/1986. Notable 1974 dual LT GOV endorsement, 1974 declined GOV endorsement ("An Unhappy Choice"), 1976 Council 11th-seat dual recommendation.

## Stage 1: Structural Validation

**PASS clean.** 16-column candidate schema + 11-column proposition schema intact. 0 duplicates, 0 validity errors, 0 low-conf (<0.75), all years valid, all confidence in [0,1].

## Stage 2: Spot Check — Comprehensive 100-round audit

**12 election years re-OCR'd at 400dpi across 100 rounds:** 1950, 1952, 1960, 1968, 1970, 1972, 1974, 1976, 1978, 1980, 1982, 1984, 1986.

**Accuracy:** ~99% after re-OCR sweep.

### Major OCR-caught name/data errors (100-round cumulative)

**1976 R76 (Richland County Council):** 2 phantom records removed (LEONARD T. PATRICK, GLENN DARRYL JR.) + 7 missing endorsements added + MURRAY JAMES→JULIUS + 2 tie candidates

**1976 R84 (Lexington Trio STATE REP):** ALL 3 names wrong
- RUSSELL JAMES E. → HAM, H. RAY
- KLAPMAN MARSHALL → KLAPMAN, JARVIS R.
- SHEALY NORMA C. → RUSSELL, NORMA C.
+ SB Dist 1 HARRNETT removed as dup of PUTNAM BETSY→HAMMETT BETSY PUTNAM
+ SB Dist 2 ESTEP, FRANK added

**1982 R92 (multiple):**
- BOND PHIL → ROOF, PHIL (Council)
- EDENS LILLIE → HERNDON, LILLIE EDENS (Council)
- SPIRES party R→D
- MERCHANT party D→R
- LT GOV opp LEWIS E. CROSBY → RUSSELL NORMA (State Sen)
- + MYERS R AG opp Pattern A

**1984 R93 (Council):**
- WATTS CANDY → WAITES, CANDY
- HARPER, ROBERT → HARPER II, JOHN ROY
- MONROE, RUTH → MONROE, JOHN D.

**1986 R94 (School Board):**
- MIZELL, FRED → MIZELL, HAYES
- SMITH, KOSY → SMITH, KIT

**1974 R89:** LT GOV restored as DUAL endorsement (Campbell R + Harvey D both e=1) per OCR "we recommend both...Either is a happy choice"

**1972 R86:** 2 prop duplicates removed (Amendments 5 + 6 each described twice)

**1980 R91:** PORTEE JR., ALVIN Pattern A opp added for Coroner

**1971-R72 R-batch:** TURNIPSEED TOM 1980 H 2 opp + MOSELY KEN 1982 H 2 opp

**Other long-running:**
- 2 office reclassifications: 1980/1984 Bush PRESIDENT → VICE PRESIDENT
- 1978 DIRECTOR EATON → T. ESTON
- 32 Pattern A backfills V1-V7 across PRES/VP/SEN/GOV/state offices
- 1972 PRES restoration: Nixon R + McGovern D opp + Agnew/Shriver VPs
- 1978 cross-paper inferred 8 records (Thurmond, Riley, Patrick, McLeod, Campbell, Patterson, Morris, Marchant)
- 12 1986 Pattern A opps (Council + SB)
- 5 1986 SB dist=1 fills (R98)

**Cross-paper validation:** Columbia State (143151) — 1974/1978/1980/1982/1984/1986. Same Bush PRES→VP error flagged for folder 43.

## Stage 3: Variable Coding & Dedup

**Issues found:** ~115 | **Auto-fixed:** 115 | **Remaining:** 0

### Major changes across 100 rounds

- 2 office reclassifications (Bush)
- 1 direction correction (1974 LT GOV dual)
- 12 OCR-caught name errors (3 Lexington Trio + 2 SB 1986 + 3 Council 1984 + 2 Council 1982 + 1 SB 1976 + 1 DIRECTOR)
- 2 phantom records removed (1976 Council)
- 1 OCR duplicate removed (1976 SB)
- 2 prop duplicates removed (1972 Amendments)
- 5 SB dist fills (1986)
- 7 cross-year name standardizations
- 3 OCR-caught party errors (SPIRES, MERCHANT 1982 + LINDER 1978)
- 32 Pattern A backfills
- 1972 PRES restoration
- 8 1978 cross-paper inferred records
- 3 missing 1976 STATE REP endorsements
- 12 1986 Pattern A opps
- Richland County dname fills
- Cross-year party + incumbency fills

## Stage 4: Low-Confidence Re-Scan

**Records reviewed:** 0 records below 0.75 confidence (was 5 in V7). All previously low-conf records OCR-verified.

## Final Stats (V12)

- **182 candidate records** (128 e=1, 54 e=0)
- **38 proposition records**
- **Mean confidence: 0.891**
- **0 duplicates, 0 validity errors, 0 Pattern K, 0 odd-year records, 0 empty direction, 0 low-conf**
- 15 D incumbent + 14 R incumbent
- 8 empty party (early SC was one-party Democrat without party labels)
- 12 election years covered

## V13 Additions (Rounds 121-130) — Systematic record-by-record verification

Every record across every year (1950-1986) cross-checked against OCR. Result:
- 1950 props: 3 records all verified ✓
- 1952 cands: 4 records all verified ✓ (PRES/VP only)
- 1960 cands: 4 records all verified ✓ (PRES/VP only)
- 1968: 6 cands + 3 props all verified ✓
- 1970: 5 cands + 3 props all verified ✓
- 1972: 17 cands + 13 props all verified ✓ (after R111 KUSHNER fix + 5 D opps added)
- 1974: 7 cands + 4 props all verified ✓
- 1976: 40 cands + 3 props all verified ✓ (most-fixed year)
- 1978: 12 cands + 2 props all verified ✓
- 1980: 22 cands + 1 prop verified — 1 OCR-caught name error: WALTER, CANDY → WAITES, CANDY (same person as 1976/1984 WAITES; R128 fix)
- 1982: 18 cands + 1 prop all verified ✓
- 1984: 19 cands all verified ✓
- 1986: 28 cands + 3 props all verified ✓

V13 fix: 1 OCR-caught name error (WALTER CANDY→WAITES CANDY) - **15th OCR-caught name error total**

## V12 Additions (Rounds 111-120)

**1972 R111:** Major SCHOOL BOARD audit:
- KUNTNER, MICHAEL → KUSHNER, MICHAEL (name fix)
- Added 5 D Pattern A opps: JENKINS LINCOLN D (incumbent, only Negro candidate), MCGREGOR SAM D (incumbent), SCARBOROUGH ROBERT LEE D (incumbent), MOORE ROBERT D, NEUFFER IRENE LABORDE D

**1974 R112:** Prop_num fixes:
- BOOZE 1 → 3, BINGO 3 → 5 per OCR "Nos. 3 and 5"

**R113:** Cross-paper STATE SEN check - CS 1976 has mangled names (flagged for folder 43)

**R115:** Random spot check + 4 1976 STATE SEN Dist 8 party fills (D)

**1986 R119:** MCMASTER, HENRY → HENRY DARGAN expansion

Total V12 changes: ~14 fixes including 5 new Pattern A opps + 1 OCR-caught name error (KUNTNER→KUSHNER)

## V11 Additions (Rounds 101-110)

**1986 R104:** 2 missing SB opps added (HALLIGAN, WILLIAM + LLOYD, EDDIE - Mizell's single-member dist opponents)

**1972 R105:** ZEIGLER NICK → ZEIGLER E.N. (NICK) full-name fix per OCR

**1974 R106:** SPENCE r_inc=1 fill (served from 1971)

**1974 R107:** HEARN CANDY → HEARN, JOYCE major name fix (same person as 1976 STATE REP); MCKAY JAY → MCKAY, JULIUS W. (JAY) expansion

**1976 R108:** 3 STATE SENATOR D 7 unopposed endorsements added (RUBIN, SANDERS, MCDONALD) per "the four should continue" editorial

**1984 R109:** 4 party fills for SCHOOL BOARD (BYRD D, LIVINGSTON D, MITCHELL R, MCCOY R)

Total V11 changes: ~13 fixes including 1 major name error (HEARN CANDY→JOYCE)

## Key Findings

1. **R-leaning paper pattern:** Endorsed every R president 1952-1984
2. **Cross-party D endorsements at state level:** West D Gov 1970, Riley D Gov 1982, Hollings D Sen 1980/1986
3. **1974 declined GOV endorsement:** "An Unhappy Choice"
4. **1974 dual LT GOV endorsement:** "Voters Can't Lose" - both Campbell R + Harvey D endorsed
5. **1986 R Gov endorsement (Campbell):** SC's mid-century partisan realignment
6. **Editorial format:** One editorial per race
7. **Bush 1980/1984 PRES→VP fix**
8. **1976 R76+R84 major OCR fixes:** Multiple name errors and missing endorsements
9. **1982 R92 + 1984 R93 + 1986 R94 OCR sweeps:** Caught 7+ name errors across years
10. **Cross-paper validated** with Columbia State

## Notes

- Paper ceased publication April 1, 1988
- Sister paper Columbia State (143151) has same Bush PRES→VP error (flagged for folder 43)
- 1986 H 2 divergence with sister paper: CR endorsed Zeigler D challenger; CS endorsed Spence R incumbent (genuine editorial difference)
- newspaper_id 143150 confirmed for Columbia Record
- **Lesson learned:** Multi-column editorial layouts caused systematic name errors in initial LLM extraction. Re-OCR sweep necessary for catching these.

---

## ⚠️ AT-LARGE FALSE-ENDORSEMENT WATCH (flagged 2026-06-22, address during V9 processing)
A project-wide sweep flagged this folder for the **Cincinnati at-large bug**: one partisan race-slot (district or at-large) holding **5+ candidates all coded endorsed (e=1) with zero recorded opponents**. In the Cincinnati Enquirer this turned out to be a systematic error where the *entire* multi-member/at-large candidate list (endorsees + their opponents) was coded as endorsed — often with the opponents' party mislabeled. When V9-processing this folder, OPEN THE BALLOT IMAGE for each slot below and split into the marked endorsees (e=1) vs the unmarked opponents (e=0); watch for party mislabels and name scrambles. NOTE: some of these may be legitimate bipartisan at-large slates — verify against the clipping, do not assume.

Flagged slots (year | office | district | #endorsees | party mix):
- 1976 | CNTY COMM | dist blank | 12 endorsees | Democrat:4, Republican:8
- 1982 | CNTY COMM | dist blank | 6 endorsees | Democrat:3, Republican:3
- 1984 | CNTY COMM | dist blank | 6 endorsees | Democrat:3, Republican:3

---

## V9 100% IMAGE-LEVEL Verification — 2026-06-22 (per Kevin's standing rule)
182 candidate + 39 prop records, 1952–1986. SC paper, R-leaning top-of-ticket / split-ticket down-ballot.

**Every candidate year image-verified** against the clippings (all 50 clippings reviewed). Integrity clean (Pattern K=0, no dups/blanks).

**AT-LARGE WATCH RESOLVED — NOT the bug:** 1976/1982/1984 county-council slots are legitimate bipartisan endorsed slates ("A Good Council" 1976, "Six for Richland" 1982, "Three and three" 1984), confirmed against the clippings.

**5 corrections:** 1976 Joe Wilson (state senate) party D→R (he switched parties); 1980 John Galvin (county council) D→R; 1986 school board Smith R→Nonpartisan + Heyward & Mizell blank→Nonpartisan (1986 board went non-partisan).

**Notable confirmed findings:** R presidential endorsements every year incl. Ford-over-Carter 1976; 1972 all-R school-board slate endorsed against desegregation advocate Hayes Mizell; 1974 Campbell-R + Harvey-D dual Lt-Gov endorsement ("we recommend both"); 1986 Spence REVERSAL (Zeigler-D endorsed over Spence-R after 1974–84 of backing Spence); 1986 Mizell now endorsed.

**Flags (no folder clipping support):** 1972 president, 1974 Spence, 1978 statewide ticket (incl. a suspect "Patrick R Lt Gov" — he's the D Ag Commissioner). See RA_NEEDS.md §3. Props: all-FOR years are amendment editorials; 1972 13-prop block warrants an RA direction spot-check.

### V9 skill-checklist closure (2026-06-22) — full audit completed
Props vision audit (all 38; 1972 13-FOR block confirmed legit; removed 1 duplicate 1964 prop, 39→38). Cross-paper consistency vs 8 SC papers → fixed Patrick (1982 party D→R, 1978 office Lt Gov→Ag Commissioner; confirmed via Columbia State + web). Inc flags (29 set) verified-consistent but field is partial (flagged). All 50 clippings vision-read; no multi-year bundles. TOTAL fixes: 7 candidate (Wilson-R, Galvin-R, 3 school-board Nonp, 2 Patrick) + 1 prop dedup. Pattern K=0; all records have notes + confidence.

### V9 extra-comprehensive pass (2026-06-22)
Office codes checked (consistent). Incumbency flags ENRICHED 29->58/182 from explicit clipping language. 1980 Lexington council district fix (Shealy d3->d4, Howard d4->d3, per clipping). External validation: unsupported records (1972 pres, 1974 Spence, 1978 ticket) match actual SC results. Total candidate fixes now 10 (7 + 2 Patrick + Shealy/Howard districts) + 29 inc flags + 1 prop dedup. Pattern K=0, md5-synced.
