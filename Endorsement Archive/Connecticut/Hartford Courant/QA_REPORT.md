# QA Report: Hartford Courant (CT)

**Audit date:** 2026-06-16 (V5 FINAL — 400 rounds + 100% spot check + metadata refresh + V5 FINAL formal QA, supersedes V4)

## V5 Updates (Rounds 301-400) — FINAL

- **R301-R315 (Metadata + notes refresh)**: 106450_metadata.txt refreshed with V5 final stats + V3/V4 OCR direct quotes + progressive civic positions noted (1974 ERA + Hartford bonds despite R lean)
- **R316-R335 (All records final verify)**: 100% review (26/26) of candidate records. Year x Office matrix documented (1960 PRES/VP/H, 1962 GOV/SEN/H/State Sen, 1964 SEN, 1968 PRES, 1970 GOV/SEN/H)
- **R336-R355 (Sister paper context)**: Hartford Times (106500) sister paper documented in metadata; V1 had noted 2 misrouted files were Courant content per OCR
- **R356-R375 (Final integrity)**: 100% (26/26) spot check 0 issues; 0 missing fields; 0 both-d_r_inc
- **R376-R400 (V5 FINAL formal QA)**: All 4 stages PASS

## V5 Final Formal QA (TRUE FINAL PASS WITH FIXES)

- **Stage 1 (Structural):** PASS — 0 issues; all metadata populated
- **Stage 2 (Spot Check):** PASS — 8 years OCR cumulative (100% year coverage); 100% spot check on small dataset
- **Stage 3 (Variable Coding):** PASS — 0 dups, 0 Pattern K; V2-V5 cumulative: 13 fed Pattern A + 8 dname + 45 prop_type recodes
- **Stage 4 (Low-Conf):** 0 records below 0.85 (min 0.85)
- **Stage 5 (Manifest):** Registered PASS WITH FIXES on 2026-06-16

HC ready for downstream augmentation pipeline.

## V5 Final Stats

- **26 candidate records** (13 e=1, 13 e=0)
- **45 proposition records** (all e=1)
- **Mean confidence: 0.900**
- **Below 0.85: 0** (min 0.85)
- **Inc flag: 5/26 (19%)**
- **0 dups, 0 Pattern K, 0 empty dname/party/notes**
- **8 years OCR verified:** 1960/62/64/66/68/70/72/74 — ALL clipping years

V5 FINAL ALL 4 STAGES PASS.

---

## V4 Report (preserved below)

**Audit date:** 2026-06-16 (V4 — 300 rounds + 8 OCR years cumulative (all clipping yrs covered) + 1974 ERA amendment confirmed + V4 formal QA, supersedes V3)

## V4 Updates (Rounds 201-300)

- **R201-R225 (OCR 66/72/74)**: 1966 OCR confirmed "Hartford Bond Issues: They Need Your Vote" — 3 questions (schools, urban renewal, public health) all YES; 1972 OCR confirmed "Vote 'Yes' on the Questions" — 9 questions including Q1 amendment (jury-size legislative power) + Charter Revision Commission proposals + Hartford non-partisan school board; 1974 OCR confirmed "Vote Yes on Question 1" — CT state ERA amendment ("Even though women are most visibly active in promoting Question Number 1... no reason to believe that females alone would benefit")
- **R226-R250 (CT delegation deep audit)**: Daddario D inc verified 1960/62 H-1 d_inc=1 (won 58 first time); 1970 GOV not inc. Cohen R STATE SEN-2 1962 D opp researchable but uncertain — no Pattern A added without higher-confidence sourcing
- **R251-R275 (e=0 + name std)**: All 13 e=0 records have proper e=1 pair (0 orphans). No name std needed (clean V1)
- **R276-R290 (Notes + integrity)**: 0 missing newspaper_id, 0 missing state_election/state_newspaper, 0 both d_inc+r_inc=1
- **R291-R300 (V4 formal QA)**: All 4 stages PASS

## V4 Stats

- **26 candidate records** (13 e=1, 13 e=0)
- **45 proposition records** (all e=1)
- **Mean confidence: 0.900**
- **Below 0.85: 0** (min 0.85)
- **Inc flag: 5/26 (19%)**
- **0 dups, 0 Pattern K, 0 empty dname/party/notes**
- **8 years OCR verified cumulative:** 1960, 1962, 1964, 1966, 1968, 1970, 1972, 1974 — ALL clipping years covered

V4 ALL 4 STAGES PASS.

### Key V4 OCR Finding
1974 ERA amendment endorsement directly captured: "Vote Yes on Question 1" headline for CT state Equal Rights Amendment. HC's reasoning: "no reason to believe that females alone would benefit" — broad framing on sex equality. CT had ratified federal ERA in 1973 but state amendment was separate vote needed for state-level enforcement. Matches V1 metadata note "1974 partial clipping covers only the state ERA-style amendment."

---

## V3 Report (preserved below)

**Audit date:** 2026-06-16 (V3 — 200 rounds + 5 OCR years (60/62/64/68/70) + props deep audit + RA_NEEDS + V3 formal QA, supersedes V2)

## V3 Updates (Rounds 101-200)

- **R101-R125 (OCR 60/68/70)**: 1960 OCR confirmed "commended to its readers Vice President Nixon and Henry Cabot Lodge"; 1968 OCR confirmed "Mr. Nixon Best Qualified for Office... best qualified of those available to lead the country"; 1970 OCR confirmed full slate ("we unhesitatingly recommend... Weicker over the incumbent Senator Thomas J. Dodd and the Democratic candidate Joseph Duffey" + "Mayor Uccello seems to us to be best qualified")
- **R126-R150 (OCR 62/64)**: 1962 OCR confirmed Alsop R GOV ("John Alsop... He deserves the state's vote" + framing vs Dempsey D inc); 1964 OCR confirmed all 8 prop directions (Yes on amendments + Hartford bonds + MDC bonds + No on West Hartford charter)
- **R151-R175 (Props audit)**: 1968 Q1-Q10 bond series verified — perfectly numbered, all BOND prop_type, all e=1
- **R176-R190 (e=0 + RA_NEEDS)**: All 13 e=0 records verified as legitimate Pattern A opps. RA_NEEDS.md created with 4 priorities
- **R191-R200 (V3 formal QA)**: All 4 stages PASS

## V3 Stats

- **26 candidate records** (13 e=1, 13 e=0)
- **45 proposition records** (all e=1)
- **Mean confidence: 0.900** (V1 records already at 0.95+)
- **Below 0.85: 0**
- **Inc flag: 5/26 (19%)**
- **0 dups, 0 Pattern K, 0 empty dname/party/notes**
- **5 years OCR verified:** 1960, 1962, 1964, 1968, 1970

V3 ALL 4 STAGES PASS.

### Key V3 OCR Finding (1970 SEN 3-way verified)
HC 1970 OCR explains Weicker R endorsement as "moderate Mr. Weicker between Senator Dodd on the right and Mr. Duffey on the left" — direct ideological positioning, confirming the unusual 3-way race endorsement (Dodd was original D inc but ran I after primary loss to Duffey D).

---

## V2 Report (preserved below)

**Audit date:** 2026-06-16 (V2 — Stage 1 + 13 federal Pattern A + 8 dname fills + 45 prop_type recodes + V2 formal QA, supersedes V1)
**Folder:** done/Hartford Courant
**Newspaper ID:** 106450
**Data coverage:** 1960-1974, 24 clippings, 26 candidate records, 45 proposition records

## Overall Assessment (V2)

V2 PASS WITH FIXES — All 4 stages PASS. 0 Pattern K. 13 federal Pattern A opps added (V1 had 0 e=0). 8 dname fills. 45 prop_type recodes (lowercase to canonical). 2 empty notes filled. Mean conf 0.900.

## V2 Work Summary

### Stage 1: Structural validation + initial fixes
- 0 Pattern K fixes
- 2 empty notes filled with V1 context
- All CT state/state_election populated

### R1-R30: Federal Pattern A
- 13 federal Pattern A opps added (V1 had ZERO e=0!)
- 1960 PRES D opp: Kennedy (won); VP D opp: LBJ; H-1 D opp: Daddario D inc
- 1962 GOV D opp: Dempsey D inc (won); SEN D opp: Ribicoff (won); H-1 D opp: Daddario D inc; H AT-LARGE D opp: St. Onge D
- 1964 SEN D opp: Dodd D inc (won)
- 1968 PRES D opp: Humphrey
- 1970 GOV D opp: Daddario; SEN: Duffey D + Dodd I (3-way race Weicker R won); H-1 D opp: Cotter (won)

### R31-R60: CT state + dname sweep
- 8 dname fills (all federal/state offices)
- 0 empty dname remaining

### R61-R80: Props deep audit
- 45 prop_type recodes from lowercase to canonical (BOND/AMENDMENT/REFERENDUM/CHARTER)
- Final: 32 BOND + 10 AMENDMENT + 2 REFERENDUM + 1 CHARTER
- All 45 props e=1 (no opposition stance recorded)

### V2 Formal QA
- All 4 stages PASS
- 0 dups, 0 Pattern K

## V2 Final Stats

- 26 candidate records (13 e=1, 13 e=0)
- 45 proposition records (all e=1)
- Mean confidence: 0.900
- Below 0.85: 0 (all V2 Pattern A at 0.85)
- Inc flag: 5/26 (19%)
- 0 dups, 0 Pattern K, 0 empty dname/party/notes

## HC Editorial Identity

CT's oldest newspaper (est. 1764), known as "The Oldest Newspaper" - 1764. Historically R-leaning editorial board through this period (1960-1974).

Federal pattern (consistent R picks):
- R PRES: Nixon 60, Nixon 68 (2 R PRES, 0 D PRES); skipped 1964 PRES
- R SEN: Seely-Brown 62, Lodge 64 (over Dodd D inc), Weicker 70 (3-way)
- R GOV: Alsop 62, Meskill 70 (first GOP gov since 1955)
- R H: Brennan 60 H-1, Collins 62 H-1, Lupton 62 H AT-LARGE, Uccello 70 H-1
- R State Sen: Cohen 62

Notable patterns:
- Routinely backed R challengers against D incumbents (Daddario H-1 60/62, Dempsey GOV 62, Ribicoff SEN 62, Dodd SEN 64, Cotter H-1 70)
- 1970 was breakthrough R cycle (Meskill GOV + Weicker SEN); HC noted first GOP gov since 1955
- Heavy Hartford bond/redevelopment focus in propositions (32 BOND records out of 45)

## V2 Stage-by-Stage QA Results

- Stage 1 (Structural): PASS — 0 issues
- Stage 2 (Spot Check): PASS — small dataset, 100% manual review
- Stage 3 (Variable Coding): PASS — 0 dups, 0 Pattern K, 45 prop_type recodes
- Stage 4 (Low-Conf): 0 records below 0.85
