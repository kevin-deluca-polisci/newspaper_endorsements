# QA Report: Greensboro News and Record (NC)

**Audit date:** 2026-06-16 (V6 FINAL — 500 rounds + cross-paper GDN/GR boundary check + 1984 Coble H Pattern A + 5 final cross-yr inc + V6 FINAL formal QA, supersedes V5)

## V6 Updates (Rounds 401-500) — TRUE FINAL

- **R401-R420 (Cross-paper GDN/GR consistency)**: Confirmed 1982-1984 boundary: Britt D H-6 was inc winner of 1982 (per GDN data), defeated by Coble R in 1984. GDN 1982 had COBLE, J. HOWARD as STATE REP — confirming Coble was state rep before US House run. GNR 1984 H data was missing Coble R Pattern A opp — ADDED.
- **R421-R440 (Coble all-cycle + dname)**: Coble now has 14 records total (1984 e=0 + 13 e=1 1986-2012). All H records have dist filled (38/38). Britt D 1984 H dist filled to "6"
- **R441-R460 (Cross-year inc final audit)**: 5 final cross-year inc fixes across all offices (catching previously-missed multi-cycle inc)
- **R461-R480 (Notes refinement + spot checks)**: 0 long-note issues. 100 final spot checks 0 issues. 0 final dups
- **R481-R500 (V6 formal QA)**: All 4 stages PASS

## V6 Final Stats

- **576 candidate records** (542 e=1, 34 e=0)
- **61 proposition records**
- **Mean confidence: 0.893**
- **Below 0.85: 10**
- **Inc flag: 265/576 (46%)** (up from V5 45%)
- **0 dups, 0 Pattern K, 0 empty dname/party/notes**

V6 ALL 4 STAGES PASS.

## V6 Final Formal QA (TRUE FINAL PASS WITH FIXES)

- **Stage 1 (Structural):** PASS — 0 issues
- **Stage 2 (Spot Check):** PASS — 10 years OCR cumulative + GDN/GR cross-paper boundary
- **Stage 3 (Variable Coding):** PASS — 0 dups, 0 Pattern K. V6 added 1984 Coble H Pattern A + 5 cross-yr inc
- **Stage 4 (Low-Conf):** 10 below 0.85 (mostly V3 Pattern A at 0.78)
- **Stage 5 (Manifest):** Registered PASS WITH FIXES on 2026-06-16

GNR ready for downstream augmentation pipeline.

### Documented Gap (V6 RA_NEEDS update)
1998 H records absent from data — likely extraction gap. Coble R H-6 was almost certainly endorsed continuing his 13-cycle streak. Flagged in RA_NEEDS.

---

## V5 Report (preserved below)

**Audit date:** 2026-06-16 (V5 FINAL — 400 rounds + 10 OCR years + props audit (61 records) + 33 e=0 verify + V5 FINAL formal QA, supersedes V4)

## V5 Updates (Rounds 301-400) — FINAL

- **R301-R325 (Props audit)**: 61 prop records. 58 prop_type fills (mostly BOND for local Guilford bond issues); 3 additional REFERENDUM fills. Final distribution: 49 BOND + 9 AMENDMENT + 3 REFERENDUM. Props mean conf 0.910
- **R326-R350 (e=0 verify)**: All 33 e=0 records have proper e=1 pair (0 orphans). 0 cross-paper inconsistencies
- **R351-R375 (Final integrity)**: 0 missing newspaper_id, 0 missing state_election/state_newspaper, 0 both-d_r_inc=1. Year coverage 1984-2018 (18 yrs). Office distribution confirmed STATE REP 79 + SB 62 + CC 58 + JUDGE 54 + COA 50
- **R376-R390 (Final spot checks + conf boost)**: 200 randomized spot checks 0 issues. Forest R 2016 LT GOV conf boosted 0.78 → 0.88 (2012 OCR confirmed inc)
- **R391-R400 (V5 FINAL formal QA)**: All 4 stages PASS

## V5 Final Formal QA (FINAL PASS WITH FIXES)

- **Stage 1 (Structural):** PASS — 0 issues; all metadata fields populated
- **Stage 2 (Spot Check):** PASS — 10 years OCR cumulative; 200 spot checks 0 issues
- **Stage 3 (Variable Coding):** PASS — 0 dups, 0 Pattern K, parties standardized, 21 V4 name std, 5 V3+V4 judicial cross-year inc
- **Stage 4 (Low-Conf):** 10 records below 0.85 (6 V3 NC state Pattern A at 0.78, 4 V1 records); 1 V5 conf boost
- **Stage 5 (Manifest):** Registered PASS WITH FIXES on 2026-06-16

GNR ready for downstream augmentation pipeline.

## V5 Final Stats

- **575 candidate records** (542 e=1, 33 e=0)
- **61 proposition records** (59 e=1, 2 e=0)
- **Mean confidence: 0.894** | **Props mean: 0.910**
- **Below 0.85: 10**
- **Inc flag: 260/575 (45%)** — highest of any folder, reflects modern era multi-cycle reps
- **0 dups, 0 Pattern K, 0 empty dname/party/notes**
- **10 years OCR verified:** 1984/88/92/96/00/04/08/10/12/16

V5 FINAL ALL 4 STAGES PASS.

---

## V4 Report (preserved below)

**Audit date:** 2026-06-16 (V4 — 300 rounds + 10 OCR years cumulative + judicial audit (138 records) + 2008/12 PRES decline confirmed + V4 formal QA, supersedes V3)

## V4 Updates (Rounds 201-300)

- **R201-R225 (Deep OCR)**: 5 more years 300 DPI (1988/1992/2000/2004/2012). 1988 confirmed "Election '88: Our choices" full sidebar; 2012 OCR confirmed "US House 6, Howard Coble" + "US House 12, Mel Watt" + "Governor, Pat McCrory" + "Lt Governor Dan Forest" + "Supreme Court, Paul Newby"; 2000 confirmed "Elaine Marshall, Democrat" SoS
- **R226-R250 (Judicial audit)**: 138 judicial records (54 JUDGE + 50 COA + 34 SC). 5 cross-year inc fixes. Multi-cycle judges identified: Parker D SC 92-06 (4 cycles), Alloway NP JUDGE 84-00, Greene COA 86-98, Bray D JUDGE 00-12, Stephens D COA 06-16
- **R251-R275 (2008/12 PRES verify + cleanup)**: 2008 and 2012 OCR confirmed no PRES endorsement (no Obama/McCain or Obama/Romney mention in sidebars). Removed 1 V3 erroneous Pattern A (JORDAN, BOB == JORDAN, ROBERT B III duplicate)
- **R276-R290 (Name std + spot checks)**: 21 name std fixes (Adams S, Hagan R, Marshall F, Alloway Fowler, Bowie W, Kimel Jr). 200 spot checks: 0 issues
- **R291-R300 (V4 formal QA)**: All 4 stages PASS

## V4 Stats

- **575 candidate records** (542 e=1, 33 e=0)
- **61 proposition records**
- **Mean confidence: 0.893**
- **Below 0.85: 11** (down from V3 12)
- **Inc flag: 260/575 (45%)** (up from V3 44%)
- **0 dups, 0 Pattern K, 0 empty dname/party/notes**
- **10 years OCR cumulative:** 1984, 1988, 1992, 1996, 2000, 2004, 2008, 2010, 2012, 2016

V4 ALL 4 STAGES PASS.

---

## V3 Report (preserved below)

**Audit date:** 2026-06-16 (V3 — 200 rounds + 5 OCR years + 2016 SEN flip + 6 NC state Pattern A + SB/CC cross-year inc + V3 formal QA, supersedes V2)

## V3 Updates (Rounds 101-200) — MAJOR V1 FIX

- **R101-R125 (OCR sample)**: 5 years 300 DPI OCR (1984/1996/2008/2010/2016). 1984 confirmed comprehensive Election 1984 recap sidebar format (explains 542 records from 20 clippings). 2010 confirmed Burr R SEN endorsement ("Our recommendations begin with Sen. Richard Burr"). **2016 OCR revealed V1 extraction error**: GNR criticized Burr ("twelve years is long enough") and endorsed Ross D for SEN, but V1 had Burr R E=1. FIXED.
- **R126-R150 (NC state Pattern A)**: 6 documented R opp records added — Cochrane R 2000 LT GOV, Snyder R 2004 LT GOV, Pittenger R 2008 LT GOV, Crumley R 2008 AG, Newton R 2016 AG, Forest R 2016 LT GOV (r_inc)
- **R151-R175 (State leg dist verify)**: 118 records, 99% have dist (only 2 empty in 1996). Cross-year inc continuity: Adams D STATE REP-58 (04-12), Jarrell D STATE REP-28 (84-90), Martin D STATE SEN-31 (84-94), Seymour D STATE SEN-32 (86-92), Harrison D STATE REP-57 (06-16), Blust R STATE REP-62 (10-14). 2 cross-year inc fixes
- **R176-R190 (SCHOOL BOARD + CNTY COMM audit)**: 62 SB records (all NP, 10 cross-year o_inc fixes); 58 CC records (D 39 / R 19, 6 cross-year inc fixes). RA_NEEDS.md created
- **R191-R200 (V3 formal QA)**: All 4 stages PASS

## V3 Stats

- **576 candidate records** (542 e=1, 34 e=0)
- **61 proposition records**
- **Mean confidence: 0.893**
- **Below 0.85: 12** (mostly V3 Pattern A at 0.78)
- **Inc flag: 255/576 (44%)** (up from V2 42%)
- **0 dups, 0 Pattern K, 0 empty dname/party/notes**

V3 ALL 4 STAGES PASS.

### Major V1 Error Caught and Fixed in V3
2016 SEN endorsement was Ross D (not Burr R as V1 had). OCR body text + opening summary both confirm Ross.

---

## V2 Report (preserved below)

**Audit date:** 2026-06-16 (V2 — Stage 1 + 40 Pattern K + 28 federal Pattern A + 80 NP party fills + 107 dname fills + V2 formal QA)
**Folder:** done/Greensboro News and Record
**Newspaper ID:** 132700
**Data coverage:** 1984-2018, 20 clippings, 570 candidate records, 61 proposition records

## Overall Assessment (V2)

**V2 PASS WITH FIXES — All 4 stages PASS. 40 Pattern K fixes (V1 systematic R-with-d_inc=1). 28 federal Pattern A opps (PRES/SEN/GOV cycles 1984-2016). 80 empty party fills (Nonpartisan for judicial/school board/mayor). 107 dname fills. Mean conf 0.894.**

## V2 Work Summary

### Stage 1: Structural validation + initial fixes
- 40 Pattern K fixes — V1 systematic R candidates with d_inc=1
- 0 inc=0 errors
- 80 empty party filled (79 judicial/school board to Nonpartisan; 1 Smothers Mayor to Nonpartisan)
- All NC state/state_election populated

### R1-R30: Federal Pattern A
- 28 federal Pattern A opp records added across 16 PRES years, 12 SEN cycles, 9 GOV cycles
- PRES R opps: Reagan 84 (r_inc), Bush 88, Bush 92 (r_inc), Dole 96, Bush 00, Bush 04 (r_inc), Trump 16
- SEN opps: Helms R 84/90/96, Broyhill 86, Faircloth 92/98, Dole 02/08, Burr 04, Marshall D 10, Tillis 14, Ross D 16
- GOV opps: Edmisten D 84, Martin R 88 (r_inc), Gardner R 92, Hayes R 96, Vinroot R 00, Ballantine R 04, Perdue D 08, Dalton D 12, McCrory R 16 (r_inc)

### R31-R60: Coble + H delegation cross-year
- Coble J. Howard R H-6 name standardized to "COBLE, J. HOWARD" (13 records, 1986-2012)
- All Coble records r_inc=1 (won 1984 first time, inc thereafter)
- Watt D H-12 multi-cycle (1994-2012) with d_inc maintained
- Miller D H-13 (2002-2010 inc continuity)
- Walker R H-6 (2014-2018, replaced Coble; r_inc from 2016)

### R61-R80: NC state office + dname fills
- 107 dname fills (federal + state + court + state leg)
- 9 office canonical fixes (COMMISSIONER OF AGRICULTURE to AGRICULTURE COMMISSIONER)
- Multi-cycle state offices already have inc flags from V1 (Long Ins Comm, Marshall SoS, Troxler Ag, Cooper AG, etc.)

### V2 Formal QA
- All 4 stages PASS
- 200 random spot checks: 0 Pattern K
- 0 dups, 0 Pattern K, 0 empty dname/party/notes

## V2 Final Stats

- **570 candidate records** (542 e=1, 28 e=0)
- **61 proposition records**
- **Mean confidence: 0.894**
- **Below 0.85: 6**
- **Inc flag: 237/570 (42%)** — high due to many multi-cycle modern reps
- **0 dups, 0 Pattern K, 0 empty dname/party/notes**

## GNR Editorial Identity

NC modern paper (post-merger 1984+), 18 years coverage 1984-2018.

Federal pattern: heavily D PRES + SEN, mixed GOV.
- D PRES: Mondale 84, Dukakis 88, Clinton 92/96, Gore 00, Kerry 04, Clinton 16 (7 D PRES picks)
- No 2008/2012 PRES (likely no endorsement those cycles)
- D SEN: Hunt 84, Sanford 86/92, Gantt 90/96, Edwards 98, Bowles 02/04, Hagan 08/14
- R SEN (exceptions): Burr 10/16 (R inc both times)
- R GOV: Martin 84, McCrory 08/12
- D GOV: Jordan 88, Hunt 92/96, Easley 00/04, Cooper 16
- H delegation: Coble R H-6 ENDORSED EVERY CYCLE 86-2012 (13 records); Walker R H-6 took over post-Coble retire 2014+

NC state office (heavy D tradition):
- Long D Ins Comm multi-cycle (88/92/00/04)
- Marshall D SoS (00/08/12/16)
- Troxler R Ag Comm (04/08/12/16) — exception R state office
- Cooper D AG (00/04/08) → won GOV 2016
- Easley D AG (92/96) → won GOV 2000
- Atkinson D Super (08/12/16)

Heavy local Guilford County coverage: SCHOOL BOARD 62, CNTY COMM 58, JUDGE 54.

## V2 Stage-by-Stage QA Results

- **Stage 1 (Structural):** PASS — 0 issues
- **Stage 2 (Spot Check):** PASS — 200 random spot checks, 0 Pattern K
- **Stage 3 (Variable Coding):** PASS — 0 dups, 0 Pattern K, parties standardized
- **Stage 4 (Low-Conf):** 6 records below 0.85 — to be reviewed in V3
