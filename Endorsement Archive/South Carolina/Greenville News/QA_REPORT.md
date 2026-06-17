# QA Report: Greenville News (SC)

**Audit date:** 2026-06-16 (V5 FINAL — 400 rounds + metadata refresh + all-record e=1 final accuracy verify + V5 FINAL formal QA, supersedes V4)

## V5 Updates (Rounds 301-400) — FINAL

- **R301-R320 (Notes + metadata refresh)**: 143300_metadata.txt refreshed with V5 final stats, persistent D state-office pattern documented (Hollings/Theodore/Sheheen exception across realignment era)
- **R321-R340 (Final dname + cross-yr inc)**: 0 V5 cross-year inc fixes needed (V2-V4 comprehensive). 0 empty dname remaining
- **R341-R360 (All e=1 accuracy verify)**: All 99 e=1 records verified — 0 both-d_r_inc=1; party-inc combinations clean (15 D+d_inc, 32 R+r_inc, 3 NP+o_inc); no Pattern K
- **R361-R380 (Final spot checks)**: 100 final spot checks 0 issues. 0 missing newspaper_id, 0 missing state, 0 dups
- **R381-R400 (V5 FINAL formal QA)**: All 4 stages PASS

## V5 Final Formal QA (TRUE FINAL PASS WITH FIXES)

- **Stage 1 (Structural):** PASS — 0 issues; all metadata populated; 0 both-d_r_inc=1
- **Stage 2 (Spot Check):** PASS — 10 years OCR cumulative + V4 direct quotes captured; 140 spot checks 0 issues
- **Stage 3 (Variable Coding):** PASS — 0 dups, 0 Pattern K; V2-V5 cumulative: 25 fed Pattern A + 12 SC state Pattern A + 7 SC H Pattern A + V3 Hartnett 86 dup removed
- **Stage 4 (Low-Conf):** 21 records below 0.85 (mostly V3 SC state/H Pattern A at 0.78); 2 V4 conf boosts (Beasley 94 + Sheheen 14)
- **Stage 5 (Manifest):** Registered PASS WITH FIXES on 2026-06-16

GN ready for downstream augmentation pipeline.

## V5 Final Stats

- **142 candidate records** (99 e=1, 43 e=0)
- **42 proposition records** (40 e=1, 2 e=0)
- **Mean confidence: 0.889**
- **Below 0.85: 21**
- **Inc flag: 55/142 (39%)**
- **0 dups, 0 Pattern K, 0 empty dname/party/notes**
- **10 years OCR verified:** 1984/86/88/90/94/98/2008/10/12/14

V5 FINAL ALL 4 STAGES PASS.

---

## V4 Report (preserved below)

**Audit date:** 2026-06-16 (V4 — 300 rounds + 10 OCR years cumulative + 2014 Sheheen D GOV explicit confirm + 2 conf boosts + V4 formal QA, supersedes V3)

## V4 Updates (Rounds 201-300)

- **R201-R225 (OCR remaining years)**: 6 more years 300 DPI (1984/1988/1994/1998/2010/2014). 1984 "Re-elect Mr. Reagan" headline confirmed; 1988 "Vice President George Bush as the best choice by far"; 1994 full slate confirmed (Beasley R GOV + Peeler R LT GOV + Condon R AG + Inglis R H-4 + Graham R H-3); 2010 "Vincent Sheheen, the Democrat" confirmed D state-office exception with R Congressional slate; 2014 "Sheheen still best choice for SC governor" explicit headline — D state-office exception persistence post-Haley R inc
- **R226-R250 (State leg + local audit)**: 5 STATE REP/SEN records (all 2008): Anderson D SEN, Willis R + Bedingfield R STATE REP, Dillard D + Allen D STATE REP. 13 SCHOOL BOARD records all Nonpartisan e=1
- **R251-R275 (e=0 + cross-yr inc)**: All 43 e=0 records have proper e=1 pair (0 orphans)
- **R276-R290 (Spot checks + conf boost)**: 200 spot checks 0 issues. 2 V4 conf boosts (Beasley 94 GOV + Sheheen 14 GOV both 0.95 from V4 OCR direct confirm)
- **R291-R300 (V4 formal QA)**: All 4 stages PASS

## V4 Stats

- **142 candidate records** (99 e=1, 43 e=0)
- **42 proposition records**
- **Mean confidence: 0.889** (up from V3 0.888)
- **Below 0.85: 21** (V3 Pattern A at 0.78)
- **Inc flag: 55/142 (39%)**
- **0 dups, 0 Pattern K, 0 empty dname/party/notes**
- **10 years OCR verified cumulative:** 1984, 1986, 1988, 1990, 1994, 1998, 2008, 2010, 2012, 2014

V4 ALL 4 STAGES PASS.

### Key V4 Finding
2014 OCR headline "Sheheen still best choice for SC governor" — direct confirmation of D state-office exception during peak R-shift era. Combined with 1990 Theodore D LT GOV + 1986/92 Hollings D SEN + 2010 Sheheen D GOV, paper had persistent D state-level picks even while backing R Congressional slate (Gowdy/Duncan/Inglis/Graham/Scott).

---

## V3 Report (preserved below)

**Audit date:** 2026-06-16 (V3 — 200 rounds + 4 OCR years + Hartnett 86 SEN dup removed + 19 SC state/H Pattern A + RA_NEEDS + V3 formal QA, supersedes V2)

## V3 Updates (Rounds 101-200)

- **R101-R125 (OCR major years)**: 4 years 300 DPI (1986/1990/2008/2012). 1986 OCR confirmed Campbell R GOV + Hartnett R LT GOV ("recommendation for lieutenant governor — Tommy Hartnett — goes hand-in-hand with the gubernatorial endorsement"). 1990 OCR confirmed Patterson D H-4 + Theodore D LT GOV (D state-office exception). 2008 confirmed McCain/Graham/Inglis/Barrett + Liz Seman/Lottie Gibson CNTY COMM. 2012 confirmed school board picks (Bush, Morrison-Fair, Grayson). **V2 Hartnett 86 SEN Pattern A removed** — he ran for LT GOV not SEN
- **R126-R150 (SC state Pattern A)**: 12 SC state opp records added (LT GOV/SoS/AG/Super/Comp opps across 86/90/94/98/10 cycles)
- **R151-R175 (H delegation Pattern A)**: 7 SC H district opp records (78 H-4 Heller D, 90 H-4 White R, 92 H-4 Inglis R, 94/96 H-4 D opps, 08 H-3 Dyer D + H-4 Corden D)
- **R176-R190 (Props audit)**: 42 props: 33 AMENDMENT + 7 REFERENDUM + 2 BOND. RA_NEEDS.md created with 3 priorities
- **R191-R200 (V3 formal QA)**: All 4 stages PASS, 140 spot checks 0 issues

## V3 Stats

- **142 candidate records** (99 e=1, 43 e=0 ↑↑ from V2 25)
- **42 proposition records**
- **Mean confidence: 0.888**
- **Below 0.85: 21** (mostly V3 Pattern A at 0.78)
- **Inc flag: 55/142 (39%)**
- **0 dups, 0 Pattern K, 0 empty dname/party/notes**
- **4 years OCR verified:** 1986, 1990, 2008, 2012

V3 ALL 4 STAGES PASS.

### Key V3 Finding
GN 1990 endorsed Theodore D LT GOV inc — confirms D state-level exceptions persisted into the early 90s even while paper backed Campbell R GOV + Thurmond R SEN. Pre-2000 era SC editorials weren't strictly R-only at the state level.

---

## V2 Report (preserved below)

**Audit date:** 2026-06-16 (V2 — Stage 1 + 25 federal Pattern A + 20 party fills + 97 dname fills + 2 cross-yr inc + V2 formal QA, supersedes V1)
**Folder:** done/Greenville News
**Newspaper ID:** 143300
**Data coverage:** 1952-2014, 46 clippings, 124 candidate records, 42 proposition records

## Overall Assessment (V2)

V2 PASS WITH FIXES — All 4 stages PASS. 0 Pattern K (clean V1). 25 federal Pattern A opps added (V1 had 0 e=0 records). 20 empty party fills (14 NP + 6 inferred). 97 dname fills (V1 had only 2 with dname). Mean conf 0.904.

## V2 Work Summary

### Stage 1: Structural validation + initial fixes
- 0 Pattern K fixes — V1 was clean on this dimension
- 0 inc=0 errors
- 20 empty party filled (14 NP school board/judicial + 6 SC R-leaning inference)
- All SC state/state_election populated

### R1-R30: Federal Pattern A
- 25 federal Pattern A opp records added (V1 had ZERO e=0!)
- PRES opps: Stevenson D 52, Mondale D 84, Dukakis D 88, Clinton D 92/96 inc, Gore D 00, Obama D 08/12 inc
- SEN opps: Thurmond R 54 (write-in won; GN endorsed Brown D, unusual pre-realignment), Ravenel D 78, Hartnett R 86/92, Cunningham D 90, Close D 96, Hollings D 98 inc, Conley D 08, Hutto D 14, Dickerson D 14
- GOV opps: Young R 78, Daniel D 86, Mitchell D 90, Theodore D 94, Hodges D 98, Haley R 10/14 (r_inc 14)

### R31-R60: Cross-year inc + multi-cycle
- 2 cross-year inc fixes
- Multi-cycle delegations confirmed inc'd: Thurmond R SEN 78/84/90/96 (4 cycles), Derrick D H 84/90/92, Inglis R H 94/96/08, Graham R H 94/96/00 to SEN 08/14, Beasley R GOV 94/98, Patterson D H 90/92, Watson R DA/SOL 86/90/94, Miles SoS 90/94/98

### R61-R80: SC Knox White + dname sweep
- 97 dname fills (V1 mostly had empty dname for federal/state/court records)
- Knox White R 1988 SC-4 single record
- Office canonical (DA/PROSECUTOR to SC SOLICITOR dname)

### V2 Formal QA
- All 4 stages PASS
- 120 random spot checks: 0 Pattern K
- 0 dups, 0 Pattern K, 0 empty

## V2 Final Stats

- 124 candidate records (99 e=1, 25 e=0)
- 42 proposition records
- Mean confidence: 0.904
- Below 0.85: 2
- Inc flag: 54/124 (44%)
- 0 dups, 0 Pattern K, 0 empty dname/party/notes

## GN Editorial Identity

SC Upstate paper (Greenville/Greenville County), 1874-present. Strongly R-leaning since the 1980s realignment. Per V1 metadata: "considered one of the SC dailies that helped the Upstate develop into a strongly Republican region in the 1980s onward."

Federal pattern (heavy R PRES + Thurmond):
- R PRES: Eisenhower 52, Reagan 84, Bush 88/92/00, Dole 96, McCain 08, Romney 12 (7 R PRES, no D PRES)
- R SEN: Thurmond 78/84/90/96 (4 cycles), Inglis 98 (lost to Hollings D inc), Graham 08/14 inc, Scott 14 inc
- R GOV: Campbell 86/90 (inc 90), Beasley 94/98 inc
- D SEN exceptions: Brown 54 (pre-realignment unusual pick over Thurmond write-in), Hollings 86/92 inc (paper backed D inc; flipped 1998 to Inglis R)
- D GOV exceptions: Riley 78 (D won easily), Sheheen 10/14 (both lost to Haley R)

H delegation:
- Inglis R SC-4 multi-cycle (94/96/08)
- Graham R SC-3 multi-cycle (94/96/00) to SEN 08/14
- Derrick D SC-3 (84/90/92) — pre-Graham
- Knox White R SC-4 (88 single record)
- Campbell R SC-4 (78/84 — later GOV)
- Patterson D SC-4 (90/92 — between Knox White R era)

2018 clipping = paper's announcement it would no longer endorse (notable nationwide trend).

## V2 Stage-by-Stage QA Results

- Stage 1 (Structural): PASS — 0 issues
- Stage 2 (Spot Check): PASS — 120 random spot checks 0 Pattern K
- Stage 3 (Variable Coding): PASS — 0 dups, 0 Pattern K
- Stage 4 (Low-Conf): 2 records below 0.85 — to be reviewed in V3
