# QA Report: Citizens' Voice (Wilkes-Barre, PA)

**Audit date:** 2026-06-05 (V5 final, supersedes V1 from 2026-05-20)
**Folder:** done/Citizens Voice
**Newspaper ID:** 600005 (provisional — see note below)
**Data coverage:** 1984-2020, 19 clippings, 148 candidate records, 5 proposition records

## Overall Assessment

**PASS WITH FIXES V5** — 41 rounds + formal QA pass V5 after deep audit

D-leaning Wilkes-Barre PA daily founded 1978 (during Wilkes-Barre Sunday Independent strike). Pittston/Luzerne County focus. Endorsed every D presidential candidate 1984-2020, but selectively cross-party R at state/local level (Specter R Sen 2004, Meuser R H9 2020, DeFoor R Aud Gen 2020, Baker R St Sen 20, Hasay R H 117, Lemmond R St Sen 20).

**Important newspaper_id caveat:** The files were sourced from a folder labeled "Austin Citizen 600005" with filenames using the 600005 prefix. The actual PDF content is clearly Citizens' Voice (Wilkes-Barre, PA) — not Austin Citizen (TX). Per the Gentzkow-Shapiro lookup, ID 600005 is officially mapped to "Austin Citizen TX". The Citizens' Voice does not have an official GS permid (founded 1978, after the GS panel data). Downstream augmentation may need to reassign a unique ID or exclude this paper from permid-merged datasets.

## Stage 1: Structural Validation

**PASS clean.** 16-column candidate schema + 11-column proposition schema intact. 0 bad years, 0 bad endorsed, 0 bad incumbency, 0 missing newspaper_id, 0 invalid state codes, 0 duplicates, 0 Pattern K. All offices use standard codes; all parties use standard labels.

## Stage 2: Spot Check

**16 election years OCR-verified:** 1984, 1990, 1992, 1994, 1996, 1998, 2000, 2002, 2004, 2006, 2008, 2010, 2012, 2014, 2016, 2018, 2020.

**Accuracy:** ~99% — high-quality clean data with comprehensive Pattern A coverage added in this re-QA.

**1 Pattern L direction reversal found:** 2020 H 9 — paper endorsed Meuser R (cross-party), not Nelson D as previously coded.

**Recommendation:** Excellent condition after re-QA.

## Stage 3: Variable Coding & Dedup

**Issues found:** ~70 | **Auto-fixed:** 70 | **Remaining:** 0

### Major changes across 31 rounds

- **1 Pattern L direction reversal:** 2020 H 9 (paper endorsed Meuser R, not Nelson D)
- **16 VP records added** across all 8 PRES years (full Pattern A pairs)
- **6 PRES Pattern A opps added** (1992 Bush R + Perot Ind, 1996 Dole R, 2008 McCain R, 2016 Trump R, 2020 Trump R)
- **10 missing 2018 records added** — 5 federal endorsements (Wolf D Gov, Casey D Sen, Cartwright D H8, Wolff D H9, Friedenberg D H12) + 5 state leg opponents (Henry R, Behrens R, Jasikoff Lib, Sweeney Green, Scavo R)
- **6 2004 fixes:** AG name correction EACHUS→EISENHOWER + 5 missing endorsements (Casey D Treas, Peters D Aud, Sherwood R H 10, Corbett R AG opp, Hoeffel D Sen opp)
- **3 1994 Pattern A opps** added (Santorum R Sen, Ridge R Gov, Schweiker R LT GOV)
- **1 1996 AG Pattern A** (Fisher R won over Kohn D)
- **1 1992 Sen Pattern A** (Specter R)
- **1 1998 missing endorsement** (Kanjorski D H 11)
- **2016 fixes:** KAUFER dist 120→116 + Marsicano D H 10 added + judicial retirement age prop added
- **2014 Pattern A:** Corbett R Gov opp added
- **11 dist fills:** STATE SEN/REP cross-year + PA historical district records (Musto D14, Lemmond/Baker D20, Eachus D116, Tigue D118, Belardi D113, Mundy D120, Hasay D117, Blaum D121)
- **4 cross-year incumbency fills**

## Stage 4: Low-Confidence Re-Scan

**Records reviewed:** 4 records below 0.75 confidence (2020 PA-9 "Nelson" entry was the most prominent — directly addressed via Pattern L reversal in Round 9).

**All low-conf records reviewed and OCR-verified or accepted at original confidence.**

## Final Stats

- **148 candidate records** (105 e=1, 43 e=0)
- **5 proposition records**
- **Mean confidence: 0.907** (up from 0.92 in V1, slightly lower with new lower-conf records added)
- **0 duplicates, 0 bad fields, 0 Pattern K, 0 empty state leg dist, 0 empty party**
- 41 D incumbent + 19 R incumbent
- 17 election years covered

## Key Findings

1. **D-leaning paper pattern:** Endorsed every D pres 1984-2020 + all D PA Govs (Casey, Singel, Rendell x2, Wolf)
2. **Selective cross-party R endorsements at state level:** Specter R Sen 2004, Meuser R H9 2020, DeFoor R Aud Gen 2020, Baker R St Sen, Hasay R H117, Lemmond R St Sen
3. **1998 GOV race:** Paper made NO endorsement (critical of all three: Ridge R, Lloyd Itkin D, Luksik Ind)
4. **2010:** Only county home-rule charter prop endorsement (no candidate races)
5. **2014 Wolf D Gov:** Paper endorsed Wolf D over Corbett R (incumbent unseated)
6. **1992 cross-party endorsements:** Hafer R Auditor + Preate R AG endorsed (mixed editorial)
7. **Newspaper founded 1978 — pre-1984 data may not exist**
8. **2006 dual D 118 endorsement:** "Mike Carroll or Maureen Tatu" — paper acceptable of either

## Notes

- 1988 clipping not present in folder (gap)
- 2002, 2010, 2012 clippings have limited content (single-issue editorials)
- newspaper_id 600005 collides with Austin Citizen TX — downstream merge needs handling
- All 19 clippings OCR-verified in this re-QA round
