# QA Report: Greensboro Daily News (NC)

**Audit date:** 2026-06-16 (V5 — 400 rounds + 9 OCR years cumulative + 23-record judicial audit + name std + V5 formal QA, supersedes V4)

## V5 Updates (Rounds 301-400)

- **R301-R325 (OCR remaining years)**: 1954/1964/1976 300 DPI re-OCR. 1964 confirmed "Johnson Or Goldwater: Unity Or Division?" editorial — LBJ D PRES endorsement explicit; 1976/1980 sidebar context further verified
- **R326-R350 (Judicial audit)**: 23 judicial records (11 JUDGE + 5 DA/PROSECUTOR + 4 COURT OF APPEALS + 3 SUPREME COURT). 2 name std fixes: STANBACK, LEON → STANBACK, A. LEON JR. (1978 matches 1976 form); FOWLER, DARL → FOWLER, DARL L.; 1 r_inc fix (Fowler 78 lost endorsement after winning 76); 1982 PEARCE R COA E=1 noted as cross-party endorsement
- **R351-R375 (State leg dist verify)**: 60 state leg records, 39 empty dist (1970/76/78/80 multi-member at-large era confirmed; 1982 single-member shows all 21 records have dist post-reapportionment)
- **R376-R390 (e=0 + name std)**: BRIDGES, HENRY → BRIDGES, HENRY L. (1976 inc form). ERVIN, SAM J., III (1968 JUDGE) and ERVIN, SAM J., JR. (1968 SEN) confirmed as different people (father/son); 1 more cross-year inc fix
- **R391-R400 (V5 formal QA)**: All 4 stages PASS, 200 spot checks 0 issues

## V5 Stats

- **213 candidate records** (142 e=1, 71 e=0)
- **41 proposition records**
- **Mean confidence: 0.933**
- **Below 0.85: 16**
- **Inc flag: 80/213 (38%)** (+1 from V4)
- **0 dups, 0 Pattern K, 0 empty dname/party/notes**
- **9 years OCR verified cumulative:** 1954, 1964, 1968, 1970, 1972, 1974, 1976, 1978, 1980, 1982 (10 actually)

V5 ALL 4 STAGES PASS.

## V5 Final Formal QA (FINAL PASS WITH FIXES)

- **Stage 1 (Structural):** PASS — 0 issues; 0 missing newspaper_id; 0 missing state_election; 0 inc=0; 0 both-d_r_inc=1
- **Stage 2 (Spot Check):** PASS — 10 years OCR cumulative (1954/64/68/70/72/74/76/78/80/82); 200 randomized spot checks 0 Pattern K
- **Stage 3 (Variable Coding):** PASS — 0 dups, 0 Pattern K, parties standardized, office canonical (incl. AGRICULTURE COMMISSIONER recoded)
- **Stage 4 (Low-Conf):** 16 records below 0.85 — 7 V2 Pattern A opps at 0.78-0.82 (acceptable), 9 V1-era records preserved per RA_NEEDS
- **Stage 5 (Manifest):** Registered PASS WITH FIXES on 2026-06-16

GDN ready for downstream augmentation pipeline.

---

## V4 Report (preserved below)

**Audit date:** 2026-06-16 (V4 — 300 rounds + 8 OCR years + 3 NC state Pattern A + SCHOOL BOARD cross-year inc + V4 formal QA, supersedes V3)

## V4 Updates (Rounds 201-300)

- **R201-R225 (Deep OCR 1970/1972/1974/1980)**: 300 DPI re-OCR confirmed 1970 props ("recommend FOR amendments 1/4/5/6/7, AGAINST 2/3"); 1972 confirms Bowles Environmental Protection Amendment context; 1974 confirms Shore/Alexander/Gibson Sheriff endorsements + R-controlled Guilford CNTY COMM context; 1980 confirms Frye D STATE SEN (6 House terms) + Turner endorsements
- **R226-R250 (NC state Pattern A)**: 3 documented R opp Pattern A added — Stickley R 1968 LT GOV (vs Taylor D), Pope R 1976 AG (vs Edmisten D inc), Privette R 1976 LT GOV (vs Green D)
- **R251-R275 (SCHOOL BOARD audit)**: 31 records — all Nonpartisan, Guilford County Board, 4 years (1976/78/80/82). DELAUNE FRANCIS name standardized to "DELAUNE, FRANCIS W." for cross-year continuity; 1 o_inc fix (DELAUNE 78 inc from 76 win)
- **R276-R290 (200 spot checks)**: 0 issues found. 2 e=0 orphans confirmed (1978 SEN Helms+Ingram, documented as paper-declined)
- **R291-R300 (V4 formal QA)**: All 4 stages PASS

## V4 Stats

- **213 candidate records** (142 e=1, 71 e=0)
- **41 proposition records** (32 e=1, 9 e=0)
- **Mean confidence: 0.933** (3 new Pattern A at 0.78 brings down slightly from V3 0.936)
- **Below 0.85: 16** (3 new Pattern A)
- **Inc flag: 79/213 (37%)**
- **0 dups, 0 Pattern K, 0 empty dname/party/notes**
- **8 years OCR verified cumulative:** 1968, 1970, 1972, 1974, 1976, 1978, 1980, 1982

V4 ALL 4 STAGES PASS.

---

## V3 Report (preserved below)

**Audit date:** 2026-06-16 (V3 — 200 rounds + 4 OCR years + 101 dname fills + 36 prop recodes + RA_NEEDS + V3 formal QA, supersedes V2)

## V3 Updates (Rounds 101-200)

- **R101-R125 (OCR sample)**: 1976/1978/1980/1968 OCR — 1976 sidebar editorial confirmed endorsement methodology + cross-party tradition; 1978 OCR confirmed paper declined SEN (Helms/Ingram both opposed) and noted sister paper Greensboro Record DID endorse Helms; 1980 sidebar judges editorial confirmed
- **R126-R150 (NC state Pattern A + dname)**: 77 + 24 = 101 dname fills (federal + state + court + state leg); 2 office canonical fixes (COMMISSIONER OF AGRICULTURE → AGRICULTURE COMMISSIONER); state office Pattern A deferred (deep NC research needed)
- **R151-R170 (Props audit)**: 41 props verified. 36 prop_type recodes (CONSTITUTIONAL AMENDMENT → AMENDMENT); 3 empty prop_type fills (AMENDMENT). Distribution: 37 AMENDMENT + 2 REFERENDUM + 2 BOND. NC heavy on constitutional amendments confirmed
- **R171-R190 (e=0 + RA_NEEDS)**: All 68 e=0 verified — only 2 "orphan" e=0 (1978 SEN Helms+Ingram), documented as paper-declined per V1 metadata. RA_NEEDS.md created with 13 records below 0.85
- **R191-R200 (V3 formal QA)**: All 4 stages PASS, 100/100 spot checks PASS, 5 conf boosts (V1-confirmed records)

## V3 Stats

- **210 candidate records** (142 e=1, 68 e=0)
- **41 proposition records** (32 e=1, 9 e=0)
- **Mean confidence: 0.936** (up from 0.928)
- **Below 0.85: 13** (down from 18)
- **Inc flag: 78/210 (37%)**
- **0 dups, 0 Pattern K, 0 empty dname, 0 empty party, 0 empty notes**
- **All NC state/state_election populated**

V3 ALL 4 STAGES PASS.

---

## V2 Report (preserved below)

**Audit date:** 2026-06-16 (V2 — Stage 1 + 25 Pattern K + 4 federal Pattern A + 6 cross-year inc + V2 formal QA)
**Folder:** done/Greensboro Daily News
**Newspaper ID:** 132701
**Data coverage:** 1950-1982, 63 clippings, 210 candidate records, 41 proposition records

## Overall Assessment (V2)

**V2 PASS WITH FIXES — All 4 stages PASS. 25 Pattern K fixes (V1 systematic R-with-d_inc=1 error). 4 federal Pattern A opps added (Goldwater 64, Humphrey 68, Ford 76, Holshouser 72 GOV). 6 cross-year inc fixes (NC state office + H delegation). Mean conf 0.928.**

## V2 Work Summary

### Stage 1: Structural validation + initial fixes
- 25 Pattern K fixes — V1 systematic R candidates with d_inc=1 (swapped to r_inc=1)
- 0 inc=0 errors
- All state/state_election populated as NC

### R1-R30: Federal Pattern A
- 4 federal Pattern A opp records: GOLDWATER R 1964 PRES, HUMPHREY D 1968 PRES, FORD R 1976 PRES (r_inc=1), HOLSHOUSER R 1972 GOV
- 1976 GOV correctly has 3 e=1 records (FLAHERTY R primary, HUNT D general, WOOD D primary)
- 1972 + 1978 + 1982: no PRES/SEN endorsement; 1978 paper declined both Helms R + Ingram D (matches V1 note)

### R31-R60: NC state Pattern A + cross-year inc
- 3 cross-year inc for NC state offices (Bridges Auditor 76, Phillips Super 76, Edmisten AG 76, Ingram InsComm 80)
- State office Pattern A backfill deferred (deep NC research needed for opps in 68/76 cycles)

### R61-R80: H delegation + cross-year inc
- Preyer D H-6 confirmed inc for 70/74/76/78/80 cycles
- Pattern K-like fixes: Bemus 78 R challenger r_inc=1 removed; Johnston 80 R challenger r_inc=1 removed (Preyer was D inc both years)
- Preyer name standardized: "PREYER, RICHARDSON" to "PREYER, L. RICHARDSON"
- 1 state leg cross-year inc fix
- 2 all-office cross-year inc fixes

### V2 Formal QA
- All 4 stages PASS
- 0 dups, 0 Pattern K, 0 structural issues
- 78/210 inc flag (37%)

## V2 Final Stats

- **210 candidate records** (142 e=1, 68 e=0)
- **41 proposition records**
- **Mean confidence: 0.928**
- **Below 0.85: 18**
- **Inc flag: 37%**
- **0 dups, 0 Pattern K, 0 empty party, 0 empty notes**
- **101 empty dname, 142 empty dist** (most non-district offices)

## GDN Editorial Identity

Greensboro Daily News (NC) was the morning paper, 1909-1984 (merged with Record into News & Record). NC paper covering 1950-1982.

Federal pattern shows D-leaning with notable cross-party exceptions:
- D PRES: Johnson 64, Carter 76/80
- R PRES: Nixon 68 (over Humphrey)
- D SEN: Ervin 68 (inc)
- R SEN: Stevens 74 (only R SEN endorsement)
- 1978 declined to endorse SEN (both Helms R and Ingram D opposed)
- D GOV: Moore 64, Scott 68, Bowles 72 (lost to Holshouser R), Hunt 76/general
- R GOV: Flaherty 76 (R primary endorsement)

NC delegation continuity:
- Richardson Preyer D H-6 multi-cycle (68/70/74/76/78/80 endorsements)
- Ike Andrews D H-4 multi-cycle (72/74)
- Robin Britt D H-6 endorsed 82 (open-seat replacement for Preyer)

State office tradition heavily D (Edmisten AG, Phillips Super, Bridges Auditor, Lanier InsComm, Gill Treasurer, Taylor LT GOV all D).

## V2 Stage-by-Stage QA Results

- **Stage 1 (Structural):** PASS — 0 issues (year/conf/inc/state_election all clean)
- **Stage 2 (Spot Check):** PASS — V1 metadata confirms major editorial picks (Carter 76/80, Helms/Ingram 78 declined)
- **Stage 3 (Variable Coding):** PASS — 0 dups, 0 Pattern K after V2 fixes
- **Stage 4 (Low-Conf):** 18 records below 0.85 — to be reviewed in V3
