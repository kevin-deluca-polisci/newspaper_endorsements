# QA Report: Great Falls Tribune (MT)

**Audit date:** 2026-06-16 (V5 — 315 rounds + 5 formal QA + 1964/1972/1992 OCR + cross-year inc + erroneous Pattern A removed, supersedes V4)

## V5 Updates (Rounds 261-315) — FINAL

- **R261-R280 (Year OCR)**: 1964 OCR confirmed LBJ D PRES endorsement ("We Endorse President Johnson"); 1972 OCR confirmed Melcher D H-2 + Shoup R H-1 ("by default" against Olsen D); 1992 sidebar OCR fragmented but visible
- **R281-R300 (Cross-year inc continuity)**: 1 cross-year inc fix (Burns R SEN 94 r_inc=1, won 88); removed 1 erroneous Pattern A record (Baucus 92 AG — Baucus was US Senator not AG candidate); MT delegation inc continuity verified for Marlenee R H-2, Williams D H-1, Mansfield D SEN, Metcalf D SEN, Melcher D H-2/SEN
- **R301-R315 (V5 formal QA)**: All 4 stages PASS, 100/100 spot checks PASS, 0 dups, 0 Pattern K

## V5 Final Formal QA (PASS WITH FIXES)

- **Stage 1 (Structural):** PASS — 0 issues (year/conf/inc/state_election all clean)
- **Stage 2 (Spot Check):** PASS — 7 years OCR verified cumulative (1952, 1964, 1968, 1972, 1980, 1988, 2008); 100/100 sample accuracy
- **Stage 3 (Variable Coding):** PASS — parties standardized, offices canonical (incl. MT PUBLIC SERVICE COMMISSION + SUPREME COURT Nonpartisan), 0 dups, 0 Pattern K
- **Stage 4 (Low-Conf):** 8 records below 0.85 — all known: 2 "?" first-name flagged in RA_NEEDS (Harrison/Oberg PSC 86, Walker CNTY COMM 10), 6 Pattern A opps at 0.82 (acceptable for derived opp records)
- **Stage 5 (Manifest):** Registered as PASS WITH FIXES on 2026-06-16

## V5 Stats

- **195 candidate records** (125 e=1, 70 e=0)
- **75 proposition records**
- **Mean confidence: 0.915**
- **Below 0.85: 8**
- **Inc flag coverage maintained**
- **0 dups, 0 Pattern K, 0 empty dname/notes**
- **22 empty party** (mostly local Cascade County)
- **7 years OCR verified cumulative:** 1952, 1964, 1968, 1972, 1980, 1988, 2008

V5 ALL 4 STAGES PASS.

---

## V4 Report (preserved below)

**Audit date:** 2026-06-15 (V4 — 260 rounds + 4 formal QA + 6 H Pattern A opps + props audit + e=0 verify, supersedes V3)

## V4 Updates (Rounds 176-260)

- **R176-R200 (H Pattern A)**: 6 MT H district Pattern A opps added (Shoup R 76 H-1, Lien D 76 H-2, Schendel R 80 H-1, Blaylock D 80 H-2, Hartelius D 92 H-2, Pavlovich D 94 H)
- **R201-R220 (Props audit)**: 75 props verified. Distribution: 34 INITIATIVE + 21 AMENDMENT + 8 REFERENDUM + 5 BOND + 6 CHARTER + 1 CONVENTION. MT-specific types preserved.
- **R221-R240 (e=0 verify)**: All 71 e=0 records have proper e=1 Pattern A pair (0 orphans). Clean.
- **R241-R260 (V4 formal QA)**: All 4 stages PASS, 100/100 spot checks PASS

## V4 Stats

- **196 candidate records** (125 e=1, 71 e=0)
- **75 proposition records**
- **Mean confidence: 0.915**
- **Below 0.85: 8** (mostly V4 H Pattern A at 0.82)
- **Inc flag coverage maintained**
- **0 dups, 0 Pattern K, 0 empty dname/notes**

V4 ALL 4 STAGES PASS.

---

## V3 Report (preserved below)

**Audit date:** 2026-06-15 (V3 — 175 rounds + 3 formal QA + 1968/1980/1988 OCR + 4 MT state Pattern A + RA_NEEDS, supersedes V2)

## V3 Updates (Rounds 76-175)

- **R76-R100 (OCR sample)**:
  - 1968 OCR confirmed Humphrey D PRES endorsement + criticism of Wallace ("racist demagogue") — explicit editorial language
  - 1980 OCR FULL SIDEBAR verified: Reagan R PRES + Marlenee R H East + Williams D H West + Schwinden D GOV (split-party) + Lynch D SoS + Argenbright Super + Schneider PSC
  - 1988 OCR confirmed Dukakis D PRES endorsement with explicit "Quayle factor" rationale
  - 2008 OCR confirmed Bullock D AG + state office picks

- **R101-R125 (MT state Pattern A)**: 4 additional state opp pairs (Greely 76 AG, Baucus 92 AG, Lane 80 SoS, Hansen 08 SUPER)

- **R126-R145 (Cross-year inc + RA_NEEDS)**: RA_NEEDS.md created with 3 priority categories

- **R146-R175 (V3 formal QA)**: 100/100 spot checks PASS, all 4 stages PASS

## V3 Stats

- **190 candidate records** (125 e=1, 65 e=0)
- **75 proposition records**
- **Mean confidence: 0.918**
- **Below 0.85: 2** (cleanest)
- **56/190 inc flag (29%)**
- **0 dups, 0 Pattern K, 0 empty dname/notes**
- **22 empty party**

V3 ALL 4 STAGES PASS.

---

## V2 Report (preserved below)

**Audit date:** 2026-06-15 (V2 — Stage 1 + 14 Pattern K fixes + Federal Pattern A + party fills + V2 formal QA)
**Folder:** done/Great Falls Tribune
**Newspaper ID:** 125500
**Data coverage:** 1952-2012, 111 clippings, 186 candidate records, 75 proposition records

## Overall Assessment (V2)

**V2 PASS — All 4 stages of formal QA PASS. 14 Pattern K fixes (V1 systematic inc flag misplacement). 11 Federal Pattern A records added (1952-1994 MT cycles). 18 party fills via cross-year + Supreme Court Nonpartisan. Mean conf 0.919.**

## V2 Work Summary

### Stage 1: Structural validation + initial fixes
- **14 Pattern K fixes**: V1 systematic error (R candidates with d_inc=1) — fixed by swapping inc flags
- 147 dname fills (federal/state/local MT offices including PUBLIC SERVICE COMMISSION)

### R1-R30: Federal Pattern A 1952-1994
- 11 Pattern A opp records added: Eisenhower R 1952, Ecton R 1954, Goldwater R 1964, Babcock R 1964, Wallace R 1970, Carter D 1976/1980, Melcher D 1976, Ramirez R 1980, Racicot R 1992, Burns R 1994

### R31-R60: Empty party fills
- 18 records party-filled (cross-year matching + MT Supreme Court → Nonpartisan)
- Empty party: 40 → 22

### V2 Formal QA
- All 4 stages PASS
- 100/100 spot checks PASS
- 0 Pattern K, 0 dups

## V2 Final Stats

- **186 candidate records** (125 e=1, 61 e=0)
- **75 proposition records**
- **Mean confidence: 0.919**
- **Below 0.85: 2**
- **56/186 records with inc flag (30%)**
- **0 dups, 0 Pattern K, 0 empty dname/notes**
- **22 empty party**

## GFT Editorial Identity

Great Falls Tribune is the major MT daily covering north-central MT.

Federal pattern shows mixed cross-party tradition with heavy D federal endorsement (reflecting MT's historical Democratic tradition prior to recent R shift):

- D PRES: Stevenson 52, Johnson 64, Humphrey 68, Dukakis 88
- R PRES: Nixon 72, Ford 76, Reagan 80/84
- D SEN: Murray 54, Mansfield 64/70, Metcalf 66/72, Melcher 88
- D GOV: Anderson 68, Judge 72/76, Schwinden 80, Bradley 92, Schweitzer 08

## V2 Stage-by-Stage QA Results

- **Stage 1 (Structural):** PASS - 0 issues
- **Stage 2 (Spot Check):** 100/100 PASS
- **Stage 3 (Variable Coding):** PASS
- **Stage 4 (Low-conf):** 2 records below 0.85
