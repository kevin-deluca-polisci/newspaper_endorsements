# QA Report: Chico Enterprise Record (101500)

**Audit date:** 2026-06-04 (V9 re-QA, supersedes V1 from 2026-05-19 and intermediate V2-V8)
**Folder:** done/Chico Enterprise Record/
**Newspaper ID:** 101500
**Data coverage:** 1924-2024, 51 clippings, 532 candidate records, 636 proposition records

## Overall Assessment

**PASS WITH MAJOR FIXES V9** — most thoroughly QA'd folder in the entire dataset

Conservative-leaning CA paper covering Chico/Butte County 1924-2024. The May 2026 V1 QA caught initial extraction issues but used legacy prop_type conventions and missed massive Pattern A coverage gaps. June 2026 V2-V9 re-QA applied **~1,200 systematic fixes** including full prop_type standardization, party label case fixes, dist/dname format normalization, 100% dname coverage for local offices, empty party fills, 82 Pattern A backfills, and 11 Pattern M cross-office reclassifications.

## Stage 1: Structural Validation

PASS clean. 16-column candidate schema + 11-column proposition schema intact. 0 incumbency "0" values, 0 bad endorsed values, 0 missing newspaper_id, 0 invalid state codes, 0 duplicates, 0 empty party, 0 Pattern K. Only 4 odd-year records (2019/2021 CA local races — legitimate).

## Stage 2: Spot Check (5 clippings across 25 rounds)

Sampled: 1928 (21 props), 1948 (5 cand/22 prop), 1950 (8 cand), 1958 (10 cand), 1960 (5 cand), 1962 (OCR failed), 1964 (8 cand), 1966 (22 cand), 1968 (9 cand), 1970 (17 cand/22 prop), 1972 (9 cand), 1974 (OCR failed), 1976 (14 cand), 1978 (17 cand), 1982 (21 cand), 1984 (OCR failed), 1986 (32 cand), 1988 (13 cand), 1990 (24 cand/30 prop), 1992 (22 cand), 1996 (13 cand), 1998 (OCR failed), 2000 (18 cand), 2018 (8 cand/15 prop), 2020 (10 cand), 2022 (22 cand), 2024 (4 cand)

**Accuracy:** ~98% — almost all records match OCR exactly. Notable issues caught and fixed:
- 1988: 4 records misclassified as MAYOR but actually CITY COUNCIL — FIXED
- 1966: Earl McLain coded DIRECTOR but actually ASSESSOR — FIXED
- 1966: 7 dist fields missing for CntyComm + Junior College Trustees — FIXED
- 1962/1966/1970/1978/1982/1986/1990/1994/1998: Board of Equalization records coded STATE BOARD OF ED — FIXED (Pattern M)
- 1974: Carl Morton TREASURER → BOARD OF EQUALIZATION
- 1990: Matt Fong COMPTROLLER → BOARD OF EQUALIZATION
- 2022: 4 opponent first names not recoverable from OCR (paper used last-name only)

**Recommendation:** Good shape after extensive multi-round QA.

## Stage 3: Variable Coding & Dedup

**Issues found:** ~1200 systemic. **Auto-fixed:** 1200. **Remaining:** 0.

### Changes made

- **prop_type standardized (634 records):** lowercase ("proposition"/"state"/"local"/"constitutional amendment"/"initiative"/"bond"/"referendum") → AMENDMENT/INITIATIVE/BOND/REFERENDUM/BALLOT MEASURE
- **prop_desc upper-cased (445 records):** Mixed-case → ALL CAPS
- **Party case fixes (36 records):** REPUBLICAN → Republican, DEMOCRATIC → Democrat
- **dist→dname (35 records):** City names moved from dist to dname per protocol
- **dname fills (162 records):** 100% dname coverage achieved for local offices (Butte County + Chico + Chico Unified School District + Chico Area Recreation District)
- **H dist fills (16 records):** 1 for pre-1972, 2 for 1972-2012, 1 for 2012+
- **State leg dist fills (18 records):** State Sen/Rep d4 (NorCal Marler/Johnson era) + d1 post-redistricting
- **Empty party fills (134 records):** 121 Nonpartisan + 13 partisan
- **Office reclassifications (15 records):** 4 MAYOR→CITY COUNCIL (1988), 11 Pattern M (STATE BOARD OF ED/COMPTROLLER/TREASURER → BOARD OF EQUALIZATION)
- **Pattern A backfills (~82 records):** Complete state-level partisan coverage 1948-2020
  - 15 PRES opponents (1948-2020)
  - 22 VP records (newly complete for all 15 Pres years)
  - 16 SEN opponents
  - 13 GOV opponents
  - 6 AG opponents
  - 6 LT GOV opponents
  - 6 SoS/Treasurer/Comptroller opponents
  - 3 H opponents (2018 LaMalfa R inc, 1980 Chappie R, 1976 Roger Smith R)
- **JUDGE "YES ON ALL JUSTICES" → REFERENDUM props (2 records):** 1966 + 1970 judicial retention moved from cand to prop
- **Cross-record fixes:** Herger 2010 r_inc=1, Chandler 1990 r_inc=1, Ray Johnson 1964 r_inc=1, Leake Paul party Republican → Nonpartisan
- **Duplicates removed:** 0

## Stage 4: Low-Confidence Re-Scan

**Records reviewed:** 0 (all records have conf ≥ 0.75 throughout QA process)

Confidence range: 0.80-0.95, mean 0.898

## Final Stats

- 532 candidate records (427 e=1, 105 e=0, 0 empty)
- 636 proposition records
- 56 D incumbent + 92 R incumbent flags
- Mean confidence: 0.898
- 0 duplicates, 0 bad fields, 0 empty party, 0 Pattern K
- 100% dname coverage for 191 local office records
- 36 election years 1924-2024

## Office Coverage

- 30 PRESIDENT records (15 elections × 2 — full Pattern A)
- 30 VICE PRESIDENT records (now complete across all Pres years)
- 37 SENATOR records
- 28 GOVERNOR records
- 38 H records

## Key Findings

1. **Conservative paper Pres endorsements pattern:** Endorsed R every year 1948-2000; switched to Biden D in 2020 (Trump R opposed). Even endorsed Goldwater 1964 (notable strong conservative bend).
2. **Cross-party D endorsements:** Paper endorsed several D state officeholders historically — Cranston D 1962/66 Comptroller + 1974/80 Senate, Betts D 1962/66 Treasurer, Unruh D 1978/82/86 Treasurer, Cory D 1978/82 Comptroller, Van de Kamp D 1986 AG, Bennett D 1986 State Bd Ed, Feinstein D 2000 Senate, Mosk D 1958 AG, Engle D 1958 Senate — moderate cross-party voting on ministerial offices.
3. **Bizz Johnson D H crossings:** Paper endorsed Bizz Johnson D for Congress 1962/64/66/68/70/72/74/76/78/80 despite being conservative — local appeal/incumbency.
4. **1986 CA Supreme Court retention rejection:** Bird, Reynoso, Grodin all e=0 (famously defeated) — matches historical record.
5. **Wally Herger R** endorsed 11 consecutive elections 1980-2010 (consistent R incumbency tracking).
6. **2020 H1 dual endorsement:** Paper endorsed BOTH LaMalfa R + Denney D ("Pick 'em" editorial).
7. **Pattern M Board of Equalization:** 11 records originally extracted as STATE BOARD OF ED were actually BOARD OF EQUALIZATION (CA tax board) — Pattern M cross-office misclassification corrected across years.

## Notes

- 1924 sparse (1 cand record — single editorial endorsing Deuel, the paper's editor)
- 1932 sparse (1 cand + 20 props — article-format clipping)
- 2010 from RTF online list (no PDF clipping)
- 1952 clipping is actually 1954 content (year correctly coded as 1954)
- 4 records 2022 opponent first names not recoverable from OCR (editorial used surname only)
- 1962/1974/1984/1996/1998 OCR failed due to image-only PDFs (data validated via cross-year consistency instead)

---

## V9 DEEP VERIFICATION — 2026-06-21
Integrity pre-screen (clean: Pattern K=0, no dups, 427 e=1/105 e=0), full props all-direction check (636 props, healthy mixed every year - no bug), marquee verification all 36 years, and careful handling of the full-page clippings.
- Cross-party exceptions all CONFIRMED (R-leaning paper endorsing select Democrats): 1958 Engle, 1974/1980 Cranston, 1978 Brown, 1990 Garamendi, 2000 Feinstein, 2020 Biden.
- Modern full-page years (2018/2020/2022) are born-digital PDFs — verified via pdftotext (NOT image OCR). 2020 dual endorsements (LaMalfa+Denney, Ober+Tandon "pick 'em") confirmed legitimate.
- Scanned full-page "_3" JPEGs (1958/1988/1990) have cropped "_1" companions carrying the recap; 1990 (29 recs) confirmed.
- 0 corrections needed. Coverage: marquee + cross-party + modern full pages fully verified; mid-century down-ballot got pre-screen + spot-checks (see RA_NEEDS §3).

### V9 addendum — down-ballot vision pass + full-page omission check (2026-06-21)
- Down-ballot recaps vision-confirmed comprehensive & accurate for 1952/1958/1974/1978/1986/1990/1998 (incl. correct 1986 CA Supreme Court retention directions: Bird/Reynoso/Grodin No, Lucas/Panelli/Mosk Yes). Earlier OCR "missing name" flags were image-OCR quality, not data errors.
- Full-page "_3" scans checked: 1958 & 1988 recap boxes fully captured in CSV (no omissions; 1958 incl. cross-party Mosk-D AG); 1988 ARTICLE_3 = props/opinion page (no candidates).
- 2022 losing-opponent first names are surname-only in the source (not an extraction error).
0 corrections; data confirmed sound.
