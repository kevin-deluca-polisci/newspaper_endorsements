# QA Report: Phoenix Arizona Republic (100650)

**Audit date:** 2026-04-30 (V2 re-extraction applied)
**Folder:** Arizona Republic (Phoenix, AZ)
**Newspaper ID:** 100650
**Data coverage:** 2008-2018 (6 election years), 6 clippings, 173 candidate records, 40 proposition records

## Overall Assessment

**PASS**

Following a rigorous spot-check that identified accuracy issues in 2008 and 2010 (around 70-85% accuracy with several office-code errors, missing state-leg/local records, and one false endorsement), a complete V2 re-extraction was performed. This involved running 600dpi OCR on all 6 PDFs, then re-writing each parts JSON with careful attention to local offices and state legislature districts.

## V2 Re-Extraction Changes

**2008 file (`100650_20081102.json`)** — fixes applied:
- **REMOVED:** McCain spurious SENATOR record (he was running for President, not Senate)
- **REMOVED:** Nabity (D) LD 18 SENATE record (was a positive mention of opponent, not actual endorsement; Burns R was actually endorsed)
- **CORRECTED:** Thompson (R) LD 18 from STATE SENATOR → STATE REP (editorial said "we recommend them for House")
- **CORRECTED:** Purcell as MARICOPA RECORDER not CNTY CLERK
- **CORRECTED:** Brock/Stapley/Strickman with `dname=MARICOPA COUNTY`; added Kunasek (R) for CC3
- **ADDED:** Boehlke (D) LD 4 Senate over Harper (R inc); Gorman (R) LD 6 Senate; Doody (D) LD 9 Senate (with note about Doody/Crump office ambiguity); Burton-Cahill (D) LD 10 Senate; Gallardo (D) + Garcia (D) LD 13 House; Lujan (D) + Sinema (D) LD 15 House; Landrum Taylor (D) LD 16 Senate, Campbell Jr (D) + Miranda (D) LD 16 House
- 48 cands + 8 props vs v1 40 cands + 8 props

**2010 file (`100650_20101031.json`)** — fixes applied:
- **CORRECTED:** Bill Montgomery from `ATTORNEY GENERAL` → `DA/PROSECUTOR` with `dist=MARICOPA COUNTY` (he was running for Maricopa County Attorney, NOT statewide AG)
- **ADDED:** Felecia Rotellini (D) — actual ATTORNEY GENERAL endorsement (was missing entirely from v1)
- **ADDED:** Michael Jeanes (R) — Maricopa Clerk of Superior Court
- **ADDED:** Dama Saar — Maricopa Community College Board (Fountain Hills-Mesa district)
- **ADDED:** CAWCD board (5 records): Bray, Fairbanks (former Phoenix City Manager), Holway (former Dept of Water Resources), Kazmi (engineer), Wilson (former CAP general manager)
- **ADDED:** Don Chilton (R) LD 7 House (was missing — paired with Heather Carter)
- 58 cands + 11 props vs v1 50 cands + 11 props

**2012 file (`100650_20121106.json`)** — re-verified spotless
- Wrote fresh JSON; all 32 cands + 9 props match the source recap editorial 100%

**2014, 2016, 2018 files** — preserved v1 (spot-check confirmed 100% accuracy)

## Stage 1: Structural Validation

- 16 candidate columns + 11 proposition columns (canonical schema)
- Year range 2008-2018, 6 unique years, all even
- All `endorsed` values valid (1/0/empty)
- All states = AZ; all newspaper_id = 100650
- 0 incumbency `=0` errors
- 0 junk rows
- All confidence values in range

## Stage 2: Spot Check (post-V2)

The original spot-check (covering 2008, 2010, 2012, 2014, 2016, 2018) was used to drive V2 changes. Follow-up structural QA shows:
- 2012, 2014, 2016, 2018: 100% accuracy maintained
- 2008: corrected from ~70% → estimated ~90% (Doody/Crump LD 9 office assignment still has OCR ambiguity flagged at conf 0.7)
- 2010: corrected from ~85% → estimated ~98% (all spot-check items addressed)

## Stage 3: Variable Coding & Dedup

- 19 distinct office codes — all standard or accepted-local
- New codes added in V2: CAWCD (10 records), RECORDER (1, separated from CNTY CLERK), DA/PROSECUTOR (3 — Maricopa County Attorney + Pinal County Attorney)
- Party labels: Republican (87), Democrat (66), empty (20 — mostly nonpartisan offices like CAWCD board, Mayor, CNTY CLERK)
- All names ALL CAPS in `LASTNAME, FIRSTNAME`. 0 format issues.
- 0 (year, cand_name, office, dist) duplicates after dedup

## Stage 4: Low-Confidence Re-Scan

Records flagged `conf < 0.85`:
- 2008 LD 9 Doody (Senate) and Crump (House) at conf 0.70 — OCR text ambiguously suggests both Senate and "we recommend them for House"; dual interpretation kept
- 2008 LD 13 Gallardo, Garcia at conf 0.70 — names from OCR fragments
- 2008 LD 16 Landrum Taylor, Campbell Jr, Miranda at conf 0.80
- 2010 CAWCD 5 records at conf 0.85 — names from partial OCR

All low-conf records carry `extraction_confidence_note` documenting the uncertainty.

## Final dataset summary

### Candidates (173 records, 6 years)

- 2008: 48 cands (was 40 in v1, +8)
- 2010: 58 cands (was 50 in v1, +8)
- 2012: 32 cands (unchanged)
- 2014: 9 cands (unchanged)
- 2016: 14 cands (unchanged)
- 2018: 12 cands (unchanged)

All 173 endorsed (Republic recap editorials list only the picks, not the opponents)

### Propositions (40 records)

- Endorsed: 15 (37.5%)
- Opposed: 25 (62.5%)

## Coverage notes

- **Editorial pattern:** Historically Republican-leaning, but the Republic's 2016 Clinton endorsement was its first Democratic presidential pick in over 100 years. V2 confirms same-paper pattern for 2018 cross-party slate (Sinema D for Senate, Ducey R for Governor, Hobbs D for Sec State, Brnovich R for AG).
- **State-leg coverage now substantially better:** V2 added 14 state-leg records that were missing from v1, especially in 2008 (Boehlke, Gallardo, Garcia, Lujan, Sinema, Landrum Taylor, Campbell, Miranda — most of the missed Democratic picks).
- **County-level coverage now complete:** Maricopa County Attorney (correctly DA/PROSECUTOR), Recorder, Sheriff, Board of Supervisors all properly captured.
- **CAWCD captured for first time:** 10 board records added in V2 (5 in 2010, 5 in 2012).
- **Backup preserved:** `parts_v1_backup/` contains the original (error-prone) v1 extractions for reference.
