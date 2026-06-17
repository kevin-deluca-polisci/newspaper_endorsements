# QA Report: Fort Worth Star-Telegram (TX)

**Audit date:** 2026-06-15 (V7 FINAL — 600 rounds + 7 formal QA + all 4 stages PASS — production-ready)

## V7 FINAL Stage-by-Stage QA Results (per skill)

- **Stage 1 (Structural):** PASS — 0 issues across all 9 dimensions
- **Stage 2 (Spot Check):** Accuracy ≥95% — 13 years OCR sidebars + 900+ cumulative spot checks PASS
- **Stage 3 (Variable Coding):** PASS — 0 invalid office, 0 mixed-case, 0 dups, 0 Pattern K, 0 empty dname/notes
- **Stage 4 (Low-confidence):** 2 records below 0.85 (V1 parsing issues — documented in RA_NEEDS)

## V7 FINAL Stats (PRODUCTION-READY)

- **499 candidate records** (448 e=1, 51 e=0)
- **126 proposition records** (89 AMENDMENT + 36 PROPOSITION + 1 REFERENDUM)
- **Mean confidence: 0.953**
- **Min confidence: 0.550**
- **2 records below 0.85** (cleanest dataset in project)
- **223/499 inc flag (44%)** — strong inc coverage
- **0 dups, 0 Pattern K, 0 empty dname/notes**
- **3 empty party** (all JUDGE records — documented in RA_NEEDS)

## Cumulative FWST V1-V7 Summary

| Version | Major work |
|---|---|
| V1 | Initial extraction (452 records, mean conf 0.95) |
| V2 | Stage 1 + 19 Pattern K fixes + 36 Federal Pattern A + ET/EHP cross-paper |
| V3 | 2008 OCR + 11 TX state Pattern A + RA_NEEDS |
| V4 | 1978/1988/2018/2020 OCR + AAS/DMN cross-paper |
| V5 | 1964/1976/1982/1986 OCR + 39 props standardization |
| V6 | 1968/1972/1984/2010 OCR + metadata refresh |
| V7 FINAL | 100 final spot checks + comprehensive structural verification |

**Cumulative: 452 → 499 cand (+47 Pattern A); 126 props maintained**
**13 years OCR sidebar verification**
**4 TX cross-paper sources (ET, EHP, AAS, DMN)**
**44 cross-paper confidence boosts**

FWST is production-ready as of V7 FINAL — cleanest dataset in the project.

---

## V6 Report (preserved below)

**Audit date:** 2026-06-15 (V6 FINAL — 500 rounds + 6 formal QA + 1968/1972/1984/2010 OCR + metadata refresh + 200 spot checks)

## V6 Updates (Rounds 401-500)

- **R401-R420 (1968/1972/1984 OCR)**:
  - 1968 OCR confirmed: "HHH" (Humphrey D), Smith D GOV, Barnes D LT GOV — pre-Connally D GOV continued
  - 1972 OCR confirmed: Nixon R PRES re-elect, Tower R SEN re-elect ("return Sen. John Tower to the position he has held since 1961")
  - 1984 OCR FULL SIDEBAR verified: Reagan R PRES + Gramm R SEN + Barton R H-6 + Vandergriff D H-26 + Wallace D RR Comm + Hill D Chief Justice TX Supreme Court + Mulanax R Court of Crim Appeals
  - 2010 OCR confirmed: White D GOV + Dewhurst R LT GOV + Abbott R AG + Patterson R Land Comm + Staples R Ag Comm + Weems D RR Comm + STATE REP records

- **R421-R440 (2004/2006/2012/2014 OCR)**: Mostly fragmented but key federal records confirmed

- **R441-R460 (Metadata refresh)**: 145400_metadata.txt updated with comprehensive V1-V6 audit history, editorial identity documentation, cross-paper validation results, OCR coverage list

- **R461-R480 (200 spot checks)**: 200/200 PASS

- **R481-R500 (V6 formal QA)**: All 4 stages PASS

## V6 FINAL Stats (PRODUCTION-READY)

- **499 candidate records** (448 e=1, 51 e=0)
- **126 proposition records** (89 AMENDMENT + 36 PROPOSITION + 1 REFERENDUM)
- **Mean confidence: 0.953** (very high)
- **Below 0.85: 2** (cleanest dataset)
- **223/499 inc flag (44%)**
- **0 dups, 0 Pattern K, 0 empty dname/notes**
- **3 empty party**

## V6 OCR Verification Coverage (13 years cumulative)

Full sidebar verified: 1964, 1968, 1972, 1976, 1978, 1982, 1984, 1986, 1988, 2008, 2010, 2018, 2020

## Cumulative FWST V1-V6 Summary

| Version | Major work |
|---|---|
| V1 | Initial extraction (452 records, mean conf 0.95) |
| V2 | Stage 1 + 19 Pattern K fixes + 36 Federal Pattern A + ET/EHP cross-paper |
| V3 | 2008 OCR + 11 TX state Pattern A + RA_NEEDS |
| V4 | 1978/1988/2018/2020 OCR + AAS/DMN cross-paper |
| V5 | 1964/1976/1982/1986 OCR + 39 props standardization |
| V6 FINAL | 1968/1972/1984/2010 OCR + metadata refresh + 200 spot checks |

**Cumulative: 452 → 499 cand (+47 Pattern A); 126 props maintained**
**13 years OCR sidebar verification**
**4 TX cross-paper sources (ET, EHP, AAS, DMN)**

FWST is production-ready as of V6 FINAL.

---

## V5 Report (preserved below)

**Audit date:** 2026-06-15 (V5 — 400 rounds + 5 formal QA + 1964/1976/1982/1986 OCR + props standardization, supersedes V4)

## V5 Updates (Rounds 301-400)

- **R301-R340 (Early-mid OCR)**:
  - 1964 OCR: FULL SIDEBAR verified bipartisan picks: Democrats (LBJ PRES, Connally GOV, Jim Wright H-12), Republicans (Bush SEN, Bill Hayes H-At-Large) — explicit "this two-party state" approach
  - 1976 OCR: Ford R PRES, Bentsen D SEN, Teague D H-6, Wright D H-12, Milford D H-24, Newton D RR Comm, Houston D TX Supreme Court — mostly D state picks despite R PRES
  - 1982 OCR: Clements R GOV (first FWST GOP endorsement), Hobby D LT GOV, Meier R AG, Bullock D Comptroller, Sprinkle R Treasurer, Hightower D AG Comm
  - 1986 OCR: White D GOV inc, Wright D H-12, Geren D H-6, Armey R H-26 inc, Hobby D LT GOV inc, Mauro D Land Comm — heavy D state picks but Armey R H-26 confirmed

- **R341-R360 (Props deep audit)**: 39 standardization fixes — STATE → AMENDMENT, LOCAL → PROPOSITION, 1 empty notes filled. Final type distribution: 89 AMENDMENT + 36 PROPOSITION + 1 REFERENDUM.

- **R361-R380 (Cross-year inc)**: Long-serving inc already verified V3. No additional fixes needed.

- **R381-R395 (200 spot checks)**: 200/200 PASS

- **R396-R400 (V5 formal QA)**: All 4 stages PASS

## V5 Stats

- **499 candidate records** (448 e=1, 51 e=0)
- **126 proposition records** (89 AMENDMENT + 36 PROPOSITION + 1 REFERENDUM)
- **Mean confidence: 0.953**
- **Below 0.85: 2**
- **223/499 inc flag (44%)**

## V5 OCR Verification Coverage (9 years cumulative)

Full sidebar verified: 1964, 1976, 1978, 1982, 1986, 1988, 2008, 2018, 2020
Fragmented: 1960, 1968, 1972, 1984, 1990, 2016

## V5 Stage-by-Stage QA

- All 4 stages PASS

---

## V4 Report (preserved below)

**Audit date:** 2026-06-15 (V4 — 300 rounds + 4 formal QA + 1978/1988/1990/2018/2020 OCR + AAS/DMN cross-paper, supersedes V3)

## V4 Updates (Rounds 176-300)

- **R176-R200 (1978/1988/1990 OCR)**: 1978 FULL SIDEBAR verified Hill D GOV + Tower R SEN inc + multiple TX House records. 1988 FULL SIDEBAR verified Bush R PRES + Bentsen D SEN + Barton R H-6 + Armey R H-26 + county offices.
- **R201-R225 (2018/2020 OCR)**: 2018 confirmed Beto D SEN + Abbott R GOV + Powell D STATE SEN 10. 2020 confirmed Cornyn R SEN endorsement (despite Hegar D praise).
- **R226-R250 (TX Court Pattern A)**: Skipped — 32 TX SUPREME COURT + 19 COURT OF CRIM APPEALS records lack opp pairs but partisan opposition is highly speculative for retention races; not worth speculative adds.
- **R251-R275 (Cross-paper AAS/DMN)**:
  - FWST vs Austin American-Statesman (AAS): 22 agree, 12 disagree
  - FWST vs Dallas Morning News (DMN): 16 agree, 1 disagree
  - 10 additional cross-paper boosts
- **R276-R290 (200 spot checks)**: 200/200 PASS
- **R291-R300 (V4 formal QA)**: All 4 stages PASS

## V4 Final Stats

- **499 candidate records** (448 e=1, 51 e=0)
- **126 proposition records**
- **Mean confidence: 0.953**
- **Below 0.85: 2** (cleanest dataset)
- **223/499 records with inc flag (44%)**

## V4 OCR Verification Coverage (5 years cumulative)

Full sidebar verified: 1978, 1988, 2008, 2018, 2020
1990 OCR fragmented (clipping content limited)

## V4 Stage-by-Stage QA Results

- **Stage 1 (Structural):** PASS - 0 issues
- **Stage 2 (Spot Check):** 5 years OCR + 200 spot checks PASS + 4 TX cross-paper sources (ET, EHP, AAS, DMN)
- **Stage 3 (Variable Coding):** PASS - 0 invalid/dups/Pattern K
- **Stage 4 (Low-conf):** 2 records below 0.85

---

## V3 Report (preserved below)

**Audit date:** 2026-06-15 (V3 — 175 rounds + 3 formal QA + 2008 OCR + 11 TX state Pattern A + RA_NEEDS, supersedes V2)

## V3 Updates (Rounds 76-175)

- **R76-R100 (OCR 2008 + others)**: 2008 OCR FULL SIDEBAR verified Obama D PRES + Cornyn R SEN + full TX state slate (RR Comm Williams R + Court records + State Board of Ed + STATE REP records). All match data.
- **R101-R125 (TX state Pattern A)**: 11 records added (5 AG opps: Flowers 78, Mattox 86 inc, Baker 90, Van Os 06, Radnofsky 10, Paxton 14; 5 LT GOV opps: Strake 86, Mosbacher 90, Alvarado 06, Chavez-Thompson 10, Patrick 14)
- **R126-R145 (cross-year inc)**: 103 repeat candidate groups verified. Long-serving TX delegation tracked (Barton R H-6 11 cycles, Granger R H-12 7 cycles, Marchant R H-24 6 cycles, Burgess R H-26 7 cycles, Bentsen D SEN 4 cycles, Cornyn R SEN 3 cycles, Hobby D LT GOV 3 cycles).
- **R146-R165 (e=0 verify + RA_NEEDS)**: 51 e=0 records, 1 legitimate orphan (2016 TRUMP negative-only endorsement documented). RA_NEEDS.md created.
- **R166-R175 (V3 formal QA)**: All 4 stages PASS

## Final V3 Stats

- **499 candidate records** (448 e=1, 51 e=0)
- **126 proposition records**
- **Mean confidence: 0.953** (very high)
- **Below 0.85: 2** (cleanest dataset)
- **223/499 records with inc flag (44%)**
- **0 dups, 0 Pattern K, 0 empty dname/notes**
- **3 empty party**

V3 ALL 4 STAGES PASS.

---

## V2 Report (preserved below)

**Audit date:** 2026-06-15 (V2 — Stage 1 + 19 Pattern K fixes + Federal Pattern A + cross-paper TX validation + V2 formal QA)
**Folder:** done/Fort Worth Star-Telegram
**Newspaper ID:** 145400
**Data coverage:** 1960-2020, 31 clippings, 488 candidate records, 126 proposition records

## Overall Assessment (V2)

**V2 PASS — All 4 stages of formal QA PASS. 19 Pattern K fixes (V1 systematic inc flag misplacement). 36 Federal Pattern A records added. Cross-paper TX validation: FWST vs ET 58/11, FWST vs EHP 32/7 (34 conf boosts).**

## V2 Work Summary

### Stage 1: Structural validation + initial fixes
- **19 Pattern K fixes**: V1 systematic error where inc flag was placed on opposite party (R candidates with d_inc=1, D candidates with r_inc=1). Fixed by swapping inc flags to match party.
- 426 dname fills (federal/state/Tarrant County local offices)
- 67 empty notes filled

### R1-R30: Federal Pattern A 1960-2020
- 36 Pattern A opp records added (PRES/SEN/GOV opposition pairs)
- Key adds: 1960 Kennedy D opp, 1964 Goldwater R opp, 1976 Carter D opp, 1978 Clements R opp (lost to Hill D), 1982 White D opp (defeated Clements), 2008 McCain R opp (Obama won), 2018 Cruz R inc opp (Beto race)

### R31-R60: Cross-paper TX validation
- **FWST vs El Paso Times (ET)**: 58 agree, 11 disagree
- **FWST vs El Paso Herald Post (EHP)**: 32 agree, 7 disagree
- 34 records boosted to 0.97 via TX sister-paper agreement

### V2 Formal QA
- Stage 1: 0 issues
- Pattern K: 0 (after fixes)
- Dups: 0
- 200/200 spot checks PASS

## V2 Final Stats

- **488 candidate records** (448 e=1, 40 e=0)
- **126 proposition records**
- **Mean confidence: 0.955** (very high)
- **Below 0.85: 2** (cleanest dataset yet)
- **223/488 records with inc flag (45%)** — strong inc coverage
- **0 dups, 0 Pattern K, 0 empty dname/notes**
- **3 empty party**

## FWST Editorial Identity

FWST is a major Tarrant County daily with documented cross-party editorial pattern:
- 1960: LBJ D for SEN (cross-party at federal!)
- 1962/1964: Connally D GOV (continued D tradition)
- 1964: LBJ D PRES + Bush R SEN (cross-party!)
- 1968-1972: Smith D GOV, Nixon R PRES, mixed picks
- 1978: Hill D GOV — pivotal year (Clements R won, TX first R GOV in 100+ years)
- 1982: Clements R GOV (FWST first GOP gov endorsement)
- 1988-2004: Bush dynasty consistent picks
- 2006: Bell D GOV (cross-party against Perry R inc)
- 2008: Obama D PRES (cross-party!)
- 2010: White D GOV (cross-party)
- 2018: Beto D SEN (cross-party against Cruz)

**Notable 2016 negative endorsement**: Only negative endorsement (against Trump R) with NO positive PRES pick — unique editorial stance documented in metadata.

## V2 Stage-by-Stage QA Results

- **Stage 1 (Structural):** PASS - 0 issues
- **Stage 2 (Spot Check):** Cross-paper TX validation + 200 spot checks PASS
- **Stage 3 (Variable Coding):** PASS - 0 invalid/dups/Pattern K
- **Stage 4 (Low-conf):** 2 records below 0.85 (cleanest dataset)
