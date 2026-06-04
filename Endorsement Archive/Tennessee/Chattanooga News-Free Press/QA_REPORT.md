# QA Report: Chattanooga News-Free Press

**Audit date:** 2026-06-04
**Folder:** Chattanooga News-Free Press
**Newspaper ID:** 143901
**Data coverage:** 1940-1974, 14 clippings, 109 candidate records, 24 proposition records

## Overall Assessment

**PASS WITH FIXES V3.1**

Post-merger Republican-leaning afternoon paper (1939-1999), formed from Chattanooga News + Free Press merger. 14 rounds of manual spot checks + formal endorsement-qa skill pass. Zero remaining structural or coding issues.

## Stage 1: Structural Validation

- CSV columns: 16 candidate + 11 prop columns ✓
- Row-level checks: 0 issues (no year/endorsed/state/inc-0/junk/conf problems)
- 1 duplicate found and fixed: 1974 STATE REP CARTER, BILL appeared in BOTH dist=26 AND dist=28. Per OCR, paper endorsed TWO different Bill Carters (W.C. Carter for Bakewell/Dallas area + W.L. Carter for Fairmount/Hixson/Lookout area). Disambiguated by adding middle initials: CARTER, W.C. (BILL) dist=26 and CARTER, W.L. (BILL) dist=28.
- Election dates: all Oct/Nov ✓
- Newspaper ID consistent across all rows ✓

## Stage 2: Spot Check

**Clippings sampled:** 143901_19441107 (early), 143901_19621106 (middle), 143901_19701102 (late)
**Accuracy:** 24/24 = 100% ✓

- **1944 (5 records)**: All match OCR — Dewey R + FDR D + Kefauver D opposed + Forstner R + Johnson Indep endorsed. Paper's famous three-way "vote in protest" endorsement against Kefauver verified.
- **1962 (8 records)**: All match OCR — Brock R H3 + Thrasher D opposed; Patten D + Crutchfield D State Sen (unopposed); Tucker/Harris R + Leader/Caldwell D state house.
- **1970 (11 records)**: All match OCR — Brock R Sen, Dunn R Gov, Baker R H3, Pentecost D Director, Albright R State Sen 11, plus 6 state house including TWO Carters (W.C. dist=4, W.L. dist=6).

**Recommendation:** Good shape. No corrections from spot check.

## Stage 3: Variable Coding & Dedup

**Issues found:** 1 (1974 Carter duplicate) | **Auto-fixed:** 1 | **Remaining:** 0

### Changes made

- **1974 STATE REP CARTER, BILL disambiguation (2 records)**: CARTER, BILL dist=26 → CARTER, W.C. (BILL); CARTER, BILL dist=28 → CARTER, W.L. (BILL). Cross-references 1972 W.C. (Bill) Carter and the 1970 protocol learning about two different Bill Carters in TN.

All other variable coding clean: 0 non-canonical offices, 0 non-canonical parties, 0 non-uppercase names, 0 bad state fields, 0 dist field issues, 0 non-canonical prop_types, 0 cross-year party flips.

## Stage 4: Low-Confidence Re-Scan

**Records reviewed:** 0 | **Confirmed:** 0 | **Corrected:** 0

All candidate records have confidence >= 0.75. All proposition records have confidence >= 0.75. No low-confidence records remaining.

## Historical Findings (across 14 rounds + formal QA)

### 30+ fixes applied across the full QA cycle:

1. **1944 dual H 3 endorsement** verified — paper endorsed BOTH Foster Johnson (Independent) AND Forstner (R) against Kefauver D in protest of "behind-the-scenes New Deal situation".
2. **1946 City Manager Referendum** — added missing prop (paper led major editorial campaign FOR Chattanooga commission-manager form of government).
3. **1956 STATE REP party fills** — Moore + Crutchfield filled as Democrat via cross-year references.
4. **1958 Constitutional Convention Delegates** — Prescott, Chambliss, Fletcher filled as Nonpartisan + Highway Tax Amendment opposed added.
5. **1968 PRES + VP Pattern A** — added Humphrey D + Wallace AIP + Agnew R VP + Muskie/LeMay VP. Also 1968 H 3 Pope D opposed + State Sen 11 Moore D opposed.
6. **1970 STATE REP RESTRUCTURE** — name fix EDGAR→WIDGAR; removed phantom Carter dist=3 (paper declined: "No recommendation in the Third District"); added William L. Carter dist=6 (separate person from William C. Carter dist=4); Engstrom dist=6→7.
7. **1972 SEN + Public Service Pattern A** — added Blanton D Sen opposed + Clement D Director opposed.
8. **1974 GOV + State Sen Pattern A** — added Blanton D Gov opposed + Penley D State Sen 11 opposed + Carter Bill disambiguation.
9. **1940/1944/1948/1952/1956/1960 VP pairs** — 10 missing VP records added.
10. **1948 SEN Pattern A** — added Kefauver D opposed to Reece R endorsed.

## Editorial Pattern

Consistent R-leaning: Willkie R 1940, Dewey R 1944+1948, Eisenhower R 1952+1956, Nixon R 1960+1968+1972, Brock R H3 1962+1968+Sen 1970, Baker R H3 1968-74, Howard Baker R Sen 1972, Dunn R Gov 1970, Alexander R Gov 1974.

**Cross-paper contrast** with predecessor News (D-leaning): Same-day 1936 News endorsed FDR + McReynolds D while Free Press endorsed Landon + Hilleary R — opposite editorial directions documenting genuine pre-merger split.

## Final State

- 109 candidate records (82 baseline → +27, +33%)
- 24 proposition records
- 80 endorsed, 29 opposed
- 11 D incumbent + 10 R incumbent
- Mean confidence: 0.887
- 0 duplicates, 0 bad fields, 0 empty party, 0 non-canonical fields

Compiled: 2026-06-04 (V3.1 — formal endorsement-qa skill pass complete).
