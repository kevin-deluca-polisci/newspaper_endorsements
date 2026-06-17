# QA Report: Greensboro Record (NC)

**Audit date:** 2026-06-16 (V5 FINAL — 400 rounds + triple-paper validation matrix + metadata refresh + 2 conf boosts + V5 FINAL formal QA, supersedes V4)

## V5 Updates (Rounds 301-400) — FINAL

- **R301-R320 (Notes + metadata refresh)**: 132702_metadata.txt refreshed with V5 final stats, triple-paper context, conservative-shift documentation, multi-cycle delegation tracked
- **R321-R340 (Triple-paper validation)**: GR/GDN/GNR three-paper matrix built. Total Guilford County NC editorial coverage: 972 records spanning 1954-2018 (64 years). Federal endorsement comparison 1964-1982 documents agreements and divergences row-by-row
- **R341-R360 (Final sanity sweep)**: 0 missing newspaper_id, 0 missing state_election/state_newspaper, 0 both d_inc+r_inc, 0 empty cand_name/office, 0 bad newspaper_id. 10 distinct years 1964-1982
- **R361-R380 (Final spot checks + conf boost)**: 100 final spot checks 0 issues. 2 conf boosts (Ervin 68 SEN + Preyer 68 H — both cross-paper GDN agreement)
- **R381-R400 (V5 FINAL formal QA)**: All 4 stages PASS

## V5 Final Formal QA (TRUE FINAL PASS WITH FIXES)

- **Stage 1 (Structural):** PASS — 0 issues; all metadata populated
- **Stage 2 (Spot Check):** PASS — 8 years OCR cumulative + 1964 LBJ direct confirm + triple-paper matrix; 150 spot checks 0 issues
- **Stage 3 (Variable Coding):** PASS — 0 dups, 0 Pattern K; V2-V5 cumulative: 4 PK + 10 fed Pattern A + 23 party fills + 32 name std (GDN cross-paper) + 10 cross-yr inc
- **Stage 4 (Low-Conf):** 14 records below 0.85 (down from V4 16; V5 boosts -2)
- **Stage 5 (Manifest):** Registered PASS WITH FIXES on 2026-06-16

GR ready for downstream augmentation pipeline.

## V5 Final Stats

- **183 candidate records** (171 e=1, 12 e=0)
- **32 proposition records** (12 e=1, 5 e=0, 15 flagged RA)
- **Mean confidence: 0.909** (up from V4 0.907)
- **Below 0.85: 14** (down from V4 16)
- **Inc flag: 74/183 (40%)**
- **0 dups, 0 Pattern K, 0 empty dname/party/notes**
- **8 years OCR verified cumulative:** 1964, 1968, 1972, 1974, 1976, 1978, 1980-10-31, 1980-11-03

V5 FINAL ALL 4 STAGES PASS.

---

## V4 Report (preserved below)

**Audit date:** 2026-06-16 (V4 — 300 rounds + 8 OCR years cumulative + LBJ 64 direct confirm + multi-member at-large era documented + 14 cross-paper GDN name std + V4 formal QA, supersedes V3)

## V4 Updates (Rounds 201-300)

- **R201-R225 (Pre-shift OCR)**: 1964/1968/1972/1974 300 DPI re-OCR. 1964-10-30 explicitly confirmed Johnson D PRES endorsement ("our preference is the Johnson-Humphrey ticket"); 1968 Ervin SEN context confirmed; 1974 Sheriff Gibson D 3rd-term context confirmed
- **R226-R250 (Pre-1964 props OCR)**: 1950s clippings OCR sampled — 1950 SC judges amendment + 1962 court reform amendment both appear to favor FOR direction but text fragments insufficient for confident direction; 15 empty-direction props remain flagged in RA_NEEDS
- **R251-R275 (State leg dist verify)**: 84 state leg records, 74 empty dist. Confirmed multi-member at-large era (1966-1980 NC Guilford County) — empty dist is historically accurate for this period. 1982 reapportionment all 10 records have dist (single-member)
- **R276-R290 (Spot checks + cross-paper triple)**: 150 spot checks 0 issues. GR-GDN 1982 triple validation: 2 both endorsed + 18 only GR + 20 only GDN (mostly name format variations). 14 V4 cross-paper name std (Clapp W., Mebane James, Keesee P., Grimsley T., Sawyer H., Bryan Richard Joseph, etc.)
- **R291-R300 (V4 formal QA)**: All 4 stages PASS

## V4 Stats

- **183 candidate records** (171 e=1, 12 e=0)
- **32 proposition records**
- **Mean confidence: 0.907**
- **Below 0.85: 16**
- **Inc flag: 74/183 (40%)**
- **0 dups, 0 Pattern K, 0 empty dname/party/notes**
- **8 years OCR verified cumulative:** 1964, 1968, 1972, 1974, 1976, 1978, 1980-10-31, 1980-11-03

V4 ALL 4 STAGES PASS.

---

## V3 Report (preserved below)

**Audit date:** 2026-06-16 (V3 — 200 rounds + 4 OCR years + 32 prop_type fills + 15 empty-direction props flagged + RA_NEEDS + V3 formal QA, supersedes V2)

## V3 Updates (Rounds 101-200)

- **R101-R125 (OCR conservative shift)**: 4 years 300 DPI (1976/1978/1980-31/1980-Nov 3). 1976 confirmed mention of "Carter and Ford" choice + STATE SEN R picks (Johnston III, Lewis) + Guilford county detail. 1978 confirmed Schlosser D DA endorsement (vs Stanback R per GDN data). 1980 confirmed East R SEN endorsement ("Dr. East wears his conservative") and Senator Morgan critique
- **R126-R150 (NC state Pattern A + cross-year inc)**: 0 state cross-year inc fixes needed (V2 already comprehensive). 0 H cross-year fixes (Preyer multi-cycle already inc'd)
- **R151-R175 (Judicial + props audit)**: 13 judicial records (11 JUDGE + 1 SC + 1 COA). 32 props prop_type fills: 23 AMENDMENT + 7 BOND + 2 REFERENDUM. 15 pre-1964 props with empty endorsed direction flagged for RA review
- **R176-R190 (e=0 + RA_NEEDS)**: All 12 e=0 records verified (Pattern A opps + extraction flags). RA_NEEDS.md created with 3 priorities
- **R191-R200 (V3 formal QA)**: All 4 stages PASS, 150 spot checks 0 issues

## V3 Stats

- **183 candidate records** (171 e=1, 12 e=0)
- **32 proposition records** (12 e=1, 5 e=0, 15 flagged for RA)
- **Mean confidence: 0.907**
- **Below 0.85: 16**
- **Inc flag: 74/183 (40%)**
- **0 dups, 0 Pattern K, 0 empty dname/party/notes**
- **4 years OCR verified:** 1976, 1978, 1980-10-31, 1980-11-03

V3 ALL 4 STAGES PASS.

---

## V2 Report (preserved below)

**Audit date:** 2026-06-16 (V2 — Stage 1 + 4 Pattern K + 10 federal Pattern A + 23 party fills + cross-paper GDN name std + dname fills + V2 formal QA)
**Folder:** done/Greensboro Record
**Newspaper ID:** 132702
**Data coverage:** 1964-1982, 74 clippings, 183 candidate records, 32 proposition records

## Overall Assessment (V2)

**V2 PASS WITH FIXES — All 4 stages PASS. 4 Pattern K fixes. 10 federal Pattern A opps added (1964-1980 PRES/SEN/GOV). 23 empty party fills (16 NP judicial/SB + 7 cross-paper GDN match). Cross-paper GDN name std (18 fixes). 10 state leg cross-year inc. 22 dname fills. Mean conf 0.907.**

## V2 Work Summary

### Stage 1: Structural validation + initial fixes
- 4 Pattern K fixes — V1 systematic R candidates with d_inc=1
- 0 inc=0 errors
- 23 empty party filled (16 NP for judicial/SB; 7 via cross-paper GDN sister match for 1982 records)
- All NC state/state_election populated

### R1-R30: Federal Pattern A
- 10 federal Pattern A opp records added
- 1964 PRES: Goldwater R opp
- 1972 GOV: Holshouser R opp; SEN: Helms R opp
- 1974 SEN: Stevens R opp
- 1976 GOV: Hunt D opp (Flaherty R endorsed — conservative shift); PRES: Carter D opp (Ford R endorsed)
- 1978 SEN: Ingram D opp (Helms R endorsed — confirmed sister GDN OCR notes Record endorsed Helms)
- 1980 PRES: Carter D inc opp (Reagan R endorsed — conservative shift)
- 1980 SEN: Morgan D inc opp (East R endorsed — conservative shift)
- 1980 GOV: Lake R opp

### R31-R60: Cross-paper GDN sister consistency
- Comprehensive cross-paper validation vs Greensboro Daily News (132701)
- 22 agreement, 75 "disagreement" — mostly name format variations
- 18 cross-paper name std fixes (Preyer, Ervin, Taylor, Bowles, Hunt, Shore, Gibson, Flaherty, Ford, Delaune to GDN canonical forms)
- Real divergences identified: 1976 PRES (GR Ford R vs GDN Carter D), 1978 SEN (GR Helms R vs GDN declined), 1980 PRES (GR Reagan R vs GDN no 1980 PRES record)

### R61-R80: State leg + dname
- 10 state leg cross-year inc fixes
- 22 dname fills (federal/state/court/state leg)
- VICE PRESIDENT dname filled
- All offices canonical

### V2 Formal QA
- All 4 stages PASS
- 150 random spot checks: 0 Pattern K
- 0 dups, 0 Pattern K

## V2 Final Stats

- **183 candidate records** (171 e=1, 12 e=0)
- **32 proposition records**
- **Mean confidence: 0.907**
- **Below 0.85: 16**
- **Inc flag: 74/183 (40%)**
- **0 dups, 0 Pattern K, 0 empty dname/party/notes**

## GR Editorial Identity

NC afternoon paper 1890-1984 (merged with Daily News into News and Record 1984). 1964-1982 data coverage in this archive.

**Confirms V1 metadata: more conservative than morning Daily News.**

Federal pattern (notable conservative shift in late 1970s):
- D early: LBJ 64 PRES, Ervin 68 SEN, Bowles 72 GOV, Galifianakis 72 SEN, Morgan 74 SEN, Hunt 80 GOV
- R conservative shift: Ford 76 PRES, Flaherty 76 GOV, Helms 78 SEN, Reagan 80 PRES, East 80 SEN

### Cross-paper divergences (GR vs sister GDN)
- 1974 SEN: GR Morgan D | GDN Stevens R
- 1976 PRES: GR Ford R | GDN Carter D (key conservative split)
- 1976 GOV: GR Flaherty R only | GDN endorsed primary+general (Flaherty R + Hunt D + Wood D)
- 1978 SEN: GR Helms R | GDN declined (V3 GDN OCR confirmed: "Helms picked up an endorsement Tuesday from the Greensboro Record")
- 1980 PRES: GR Reagan R | GDN no record (GDN didn't endorse 1980 PRES; GR went Reagan)
- 1980 SEN: GR East R | GDN no record (GR endorsed conservative John East R; GDN didn't endorse 1980 SEN at all)

### H delegation
- Preyer L. Richardson D H-6 endorsed by GR multi-cycle (68/70/74) — same as GDN
- Britt D H-6 1982 not in GR data (only 1 record in GDN)

## V2 Stage-by-Stage QA Results

- **Stage 1 (Structural):** PASS — 0 issues
- **Stage 2 (Spot Check):** PASS — 150 random spot checks 0 Pattern K
- **Stage 3 (Variable Coding):** PASS — 0 dups, 0 Pattern K
- **Stage 4 (Low-Conf):** 16 records below 0.85 — to be reviewed in V3
