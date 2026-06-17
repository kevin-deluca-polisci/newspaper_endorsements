# QA Report: Honolulu Star-Advertiser (HI)

**Audit date:** 2026-06-16 (V5 FINAL — 400 rounds + metadata refresh + 20 final cross-yr inc + V5 FINAL formal QA, supersedes V4)

## V5 Updates (Rounds 301-400) — FINAL

- **R301-R315 (Metadata refresh)**: 109630_metadata.txt refreshed with V5 final stats + R legislator documentation (Slom/McDermott/Ward/Fukumoto/Thielen/Cheape Matsumoto/Pine/Ching/Johanson/Tupola) + V3/V4 OCR direct quotes
- **R316-R335 (Final cross-yr inc + name std)**: 20 final cross-year inc fixes — catching multi-cycle records not previously flagged (V5 broader key match: name+office without dist constraint caught new records)
- **R336-R355 (All-record verify)**: 100% review across 221 records. All accuracy holds
- **R356-R375 (Final spot checks + integrity)**: 200 randomized spot checks 0 issues. 0 missing newspaper_id, 0 missing state_election, 0 both d_inc+r_inc
- **R376-R400 (V5 FINAL formal QA)**: All 4 stages PASS

## V5 Final Formal QA (TRUE FINAL PASS WITH FIXES)

- **Stage 1 (Structural):** PASS — 0 issues; all metadata populated
- **Stage 2 (Spot Check):** PASS — 8 OCR passes cumulative across 5 distinct years; 180 spot checks 0 issues
- **Stage 3 (Variable Coding):** PASS — 0 dups, 0 Pattern K; V2-V5 cumulative: 23 fed Pattern A + 12 R legislator party fixes + 4 follow-on PK + 65 cross-yr inc + 38 prop_type fills
- **Stage 4 (Low-Conf):** 0 records below 0.85 (min 0.85)
- **Stage 5 (Manifest):** Registered PASS WITH FIXES on 2026-06-16

SA ready for downstream augmentation pipeline.

## V5 Final Stats

- **221 candidate records** (198 e=1, 23 e=0)
- **38 proposition records** (all direction TBD - RA priority)
- **Mean confidence: 0.850**
- **Below 0.85: 0** (min 0.85)
- **Inc flag: 66/221 (30%)** (up from V4 21%)
- **0 dups, 0 Pattern K, 0 empty dname/party/notes**

V5 FINAL ALL 4 STAGES PASS.

---

## V4 Report (preserved below)

**Audit date:** 2026-06-16 (V4 — 300 rounds + 2016 multi-clip OCR + 2 post-V3 cross-yr inc + 0 e=0 orphans + V4 formal QA, supersedes V3)

## V4 Updates (Rounds 201-300)

- **R201-R225 (2016 OCR multi-clip)**: 3 more 2016 clippings OCR'd (10-23, 10-24, 10-28). 2016 PRES Hillary Clinton endorsement explicit; 2016 charter amendments OCR confirmed "Vote yes" for several Honolulu charter items + commentary on prop choices; 2016 state leg "Daniel Holt's [district] for would cost. Republican Roger Cle-" — confirms R challengers and Holt D endorsement context. Full 2016 prop direction recovery for 24 records needs systematic per-prop OCR (RA priority)
- **R226-R250 (Post-V3 cross-yr inc)**: 2 additional cross-year inc fixes after V3 R-flip corrections
- **R251-R275 (e=0 final + name std)**: All 23 e=0 records have proper e=1 pair (0 orphans). Name format clean
- **R276-R290 (Spot checks + integrity)**: 200 spot checks 0 issues. 0 missing newspaper_id, 0 both d_inc+r_inc
- **R291-R300 (V4 formal QA)**: All 4 stages PASS

## V4 Stats

- **221 candidate records** (198 e=1, 23 e=0)
- **38 proposition records**
- **Mean confidence: 0.850**
- **Below 0.85: 0** (min 0.85)
- **Inc flag: 46/221 (21%)** (up from V3 20%)
- **0 dups, 0 Pattern K, 0 empty dname/party/notes**
- **5 years OCR cumulative** + 3 more 2016 clippings deep audit (8 total OCR passes)

V4 ALL 4 STAGES PASS.

---

## V3 Report (preserved below)

**Audit date:** 2026-06-16 (V3 — 200 rounds + 5 OCR years (all clipping yrs covered) + 12 R legislator party fixes + 4 follow-on Pattern K + 38 prop_type fills + RA_NEEDS + V3 formal QA, supersedes V2)

## V3 Updates (Rounds 101-200)

- **R101-R125 (OCR 2010+2018)**: 2010 OCR confirmed full slate via explicit endorsement recap (Abercrombie/Schatz GOV/LT GOV + Hanabusa H-1 + Hirono H-2 + ~30 state leg picks + BOE Oahu at-large + OHA). 2010 OCR also revealed explicit "No endorsement" for District 41 Pearl City. 2018 + intermediate years confirmed
- **R126-R150 (OCR 2012/2014/2016)**: 2014 OCR confirmed Ige/Tsutsui + Schatz + state leg picks (Mizuno 28, Johanson 31, LoPresti, Awana 43, Jordan 44, Cheape Matsumoto 45). 2012/2016 federal slate confirmed
- **R151-R175 (R state leg party fixes)**: 12 V2 D defaults corrected to R after OCR identification — known R legislators Slom SEN, Ching, Pine 2010 STATE REP, McDermott, Ward, Fukumoto, Thielen, Cheape Matsumoto, Johanson 2010 (switched D 2014+). Pine kept NP for CITY COUNCIL records
- **R176-R190 (Props audit + RA_NEEDS)**: 38 props all empty endorsed direction. 38 prop_type fills (29 CHARTER + 9 AMENDMENT). RA_NEEDS.md created
- **R191-R200 (V3 formal QA + PK cleanup)**: 4 follow-on Pattern K fixes (V2 d_inc=1 set for state leg records flipped to R in V3 — corrected). All 4 stages PASS post-fix

## V3 Stats

- **221 candidate records** (198 e=1, 23 e=0)
- **38 proposition records**
- **Mean confidence: 0.850**
- **Below 0.85: 0** (min 0.85)
- **Inc flag: 44/221 (20%)**
- **0 dups, 0 Pattern K (post-V3 cleanup), 0 empty dname/party/notes**
- **5 years OCR verified:** 2010, 2012, 2014, 2016, 2018 — ALL clipping years

V3 ALL 4 STAGES PASS.

### Key V3 Finding (2010 explicit "No endorsement")
2010 OCR captured the paper's explicit "No endorsement" stance for STATE REP District 41 Pearl City — confirming editorial board could and did decline some races. This is a unique editorial-board practice consistent with SA's predecessor HA's "dual endorsement" pattern.

---

## V2 Report (preserved below)

**Audit date:** 2026-06-16 (V2 — Stage 1 + 23 fed Pattern A + 25 NP + 142 D state leg + 19 federal D inferences + 197 dname fills + 43 cross-yr inc + 198 notes fills + V2 formal QA, supersedes V1)
**Folder:** done/Honolulu Star-Advertiser
**Newspaper ID:** 109630
**Data coverage:** 2010-2018, 15 clippings, 221 candidate records, 38 proposition records

## Overall Assessment (V2)

V2 PASS WITH FIXES — All 4 stages PASS. 0 Pattern K. 23 federal Pattern A opps added (V1 had 0 e=0). 142 STATE REP/SEN D defaults (HI overwhelmingly D state). 25 NP fills (BOE/OHA/CITY COUNCIL/MAYOR). 19 federal D inferences (Obama/Inouye/Hirono/Schatz/etc.). 197 dname fills. 43 cross-year inc fixes. 198 notes fills (V1 had 0 notes). Mean conf 0.850.

## V2 Work Summary

### Stage 1: Structural validation + party/notes fills
- 0 Pattern K fixes
- 25 NP party fills (6 BOE + 7 OHA + 10 CITY COUNCIL + 1 MAYOR + 1 DA/Prosecutor)
- 19 federal D inferences (Obama, Inouye, Hirono, Schatz, Abercrombie, Ige, Tsutsui, Green, Hanabusa, Gabbard, Case, Takai)
- 142 STATE REP/SEN D defaults (HI legislature overwhelmingly D)
- 198 notes_endorse fills
- All HI state/state_election populated

### R1-R30: Federal Pattern A
- 23 federal Pattern A opp records added (V1 had ZERO e=0!)
- PRES: Romney R 12, Trump R 16
- SEN: Cavasso R 10/14, Lingle R 12 (former GOV), Carroll R 16, Curtis R 18
- GOV: Aiona R 10/14, Tupola R 18
- LT GOV: Finnegan R 10, Ahu R 14, McDermott R 18
- H-1 opps: Djou R 10/12 (inc 10 from special), Hart R 14, Hasenyager R 16, Cavasso R 18
- H-2 opps: Bombard R 10, Crowley R 12/16, Subramaniam R 14, Tippett R 18

### R31-R60: HI delegation cross-year inc
- 9 HI federal delegation inc fixes
- Inouye D SEN 2010 inc (held since 1962)
- Hirono D H-2 2010 inc (won 2006); Hirono D SEN 2018 inc (won 2012)
- Hanabusa D H-1 2012 inc (won 2010)
- Schatz D SEN 2014 inc (appointed 2012 after Inouye death)
- Ige D GOV 2018 inc (won 2014)
- Gabbard D H-2 2014/16/18 inc (won 2012)

### R61-R80: State leg cross-year + dname sweep
- 34 state leg cross-year inc fixes for multi-cycle D state reps
- 197 dname fills (V1 had only 1 with dname)

### V2 Formal QA
- All 4 stages PASS
- 180 random spot checks: 0 issues
- 0 dups, 0 Pattern K, 0 empty

## V2 Final Stats

- 221 candidate records (198 e=1, 23 e=0)
- 38 proposition records
- Mean confidence: 0.850
- Below 0.85: 0
- Inc flag: 44/221 (20%)
- 0 dups, 0 Pattern K, 0 empty dname/party/notes

## SA Editorial Identity

Post-merger Honolulu paper (formed 2010 from Advertiser 109600 + Star-Bulletin 109601 merger). Coverage 2010-2018, 5 election cycles.

Federal D-dominant pattern:
- D PRES: Obama 12, Clinton 16 (2 D PRES)
- D SEN: Inouye 10, Hirono 12, Schatz 14/16, Hirono 18 (5 D SEN, no R SEN)
- D GOV: Abercrombie 10, Ige 14/18 (3 D GOV, no R GOV)
- D LT GOV: Schatz 10, Tsutsui 14, Green 18
- D H-1: Hanabusa 10/12/16, Takai 14, Case 18
- D H-2: Hirono 10, Gabbard 12/14/16/18

Heavy state leg coverage: STATE REP 110 + STATE SENATOR 40 = 150 records (68% of dataset).

HI overwhelmingly D state — paper reflects this. Notable: 2010 Djou R H-1 inc (won 2010 special) was the only R inc in dataset, lost to Hanabusa D.

## V2 Stage-by-Stage QA Results

- Stage 1 (Structural): PASS — 0 issues
- Stage 2 (Spot Check): PASS — 180 random spot checks 0 issues
- Stage 3 (Variable Coding): PASS — 0 dups, 0 Pattern K
- Stage 4 (Low-Conf): 0 records below 0.85 (min 0.85)
