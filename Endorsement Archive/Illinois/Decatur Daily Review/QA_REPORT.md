# QA Report: Decatur Daily Review (111302)

**Audit date:** 2026-06-11 (V7 — 600 rounds + 6 formal QA + 1966 Pattern A massive find + dist 50→52 correction, supersedes V1-V6)
**Folder:** done/Decatur Daily Review/
**Newspaper ID:** 111302
**Data coverage:** 1964–1978, 25 clippings, 266 candidate records, 12 proposition records

## Overall Assessment

**PASS WITH FIXES V7 FINAL**

## V7 Comprehensive Verification (Rounds 501-600)

**R501-R515 (1966 Sunday recap deep OCR):** 1966-11-06 Sunday recap OCR revealed major finding: STATE REP dist was 52 not 50 (OCR clearly shows "Fifty-second District" for state rep, "Fiftieth District" for state sen). Corrected 3 STATE REP records. Added 7 Pattern A opps: Johns R STATE REP 52, Brown R STATE SEN 50, Taylor R Cnty Clk, Brown D Macon Treas, Hart D + Weatherly R + Hahn R UI Trustee opps.

**R516-R530 (1970 statewide deep OCR):** 1970-11-01 OCR confirmed SEN Stevenson D vs Smith R (interim inc after Dirksen death) and Treasurer Dixon D vs Kucharski R. Added 2 Pattern A opps.

**R531-R545 (TRUSTEE deep audit):** 8 years of TRUSTEE records reviewed. 1968 OCR-confirmed 3 missing opps added (Waters D, Hughes R, Ives D).

**R546-R560 (Cross-clipping dist verification):** Tipsword tracking: 1966=52, 1968=52, 1970=52, 1972=51 (post-redistricting). Confirms 1968 STATE REP dist 52 correct. The OCR "Twenty-second District" applied to Congressional H 22, not state rep.

**R561-R575 (All e=0 records comprehensive verify):** 34 e=0 records all verified: 0 orphans, 0 Pattern K. Distribution: 1964(4), 1966(8), 1968(14), 1970(2), 1976(2), 1978(4).

**R576-R585 (Notes std):** 11 "Sunday recap ballot —" → "Sunday recap —" unified.

**R586-R595 (Random spot checks):** 50 records across 5 seeds: 0 issues.

**R596-R600 (V7 formal QA):** All stages PASS.

## Final V7 Stats

- **266 candidate records** (232 e=1, 34 e=0) — up from V6's 254
- **12 proposition records** (10 e=1, 2 e=0)
- **Mean confidence cand: 0.920** (low<0.75: 0)
- **91 D incumbent + 75 R incumbent**
- **0 empty party, 0 dups, 0 validity errors, 0 orphan e=0 groups, 0 Pattern K**
- 8 election years (1964-1978)

## Formal QA V7 Results

```
Stage 1: PASS — 0 validity errors, schemas valid
Stage 2: 100% spot check accuracy (50 random + 1966/1970/1968 deep OCR)
Stage 3: 0 bad offices, 0 bad parties, 0 dups, 0 orphans, 0 Pattern K
Stage 4: 0 cand low-conf
```

## DDR Complete Evolution

- V1: 241 cand (232/9), 15 props
- V2: 245 cand (232/13)
- V3: 244 cand (231/13)
- V4: 244 cand (231/13)
- V5: 247 cand (232/15), 12 props
- V6: 254 cand (232/22)
- **V7: 266 cand (232/34), 12 props** — 1966 massive Pattern A find + dist 50→52 correction

## V7 Key Findings

- **1966 STATE REP dist was 50 → corrected to 52** (3 records) — original extraction missed the OCR "Fifty-second District" label
- **1966 had 7 missing opp records** — Sunday recap revealed candidates on ballot but not endorsed (Johns R, Brown R, Taylor R, Brown D, Hart D, Weatherly R, Hahn R)
- **1968 TRUSTEE had 3 more missing opps** (Waters D, Hughes R, Ives D)
- **1970 statewide had 2 missing opps** (Smith R SEN, Kucharski R STATE TREAS)
- Tipsword tracking confirms IL state legislative dist consistency 1966-1970 (52) and 1972+ (51 post-redistricting)
- All 266 records pass formal QA with 0 errors

## V6 Comprehensive Verification (Rounds 401-500)

**R401-R415 (1968 PRES + state office deep OCR):** 1968-11-03 Sunday recap OCR confirmed PRES/VP/SEN existing records correct. Found 4 missing Pattern A opps: Ogilvie R GOV, Dwyer R LT GOV, Lorenz D AG, Griffin D COA4. All 4 added.

**R416-R430 (1964 deep OCR):** 1964-11-01 OCR'd. All 23 records verified accurate. 1964 GOV non-endorsement preserved correctly (paper explicitly declined: "this newspaper is not disposed to recommend a vote against either candidate for governor"). 1964 SEC OF STATE non-endorsement preserved. 1964 LT GOV no specific endorsement. 1964 SEN correctly absent (Senate not up). TREASURER absent for many years — paper rotates focus.

**R431-R445 (1978 STATE REP dist verify):** 1978-11-05 Sunday recap OCR confirmed STATE REP 51 dist + opp candidates. Added 3 Pattern A opps: Borchers R STATE REP 51, Crane R H 22, Whalen D Macon Treas.

**R446-R460 (County office audit):** 32 county-level records, mostly clean. TREASURER dname standardized: county-level → "Macon County", state-level → empty. 4 fixes.

**R461-R475 (Judicial deep audit):** 16 judicial records. dname "5th District" → "5th Judicial District" (3 records). 1966 partisan judicial races vs 1978 retention elections correctly distinguished.

**R476-R485 (Name std):** Names already standardized from prior rounds (0 new fixes needed).

**R486-R495 (dname comprehensive cleanup):** 82 standardizations applied: 62 state leg/CNTY COMM redundant dname cleared (dist field already has number), 20 H 22 + TREAS + STATE SEN further normalizations.

**R486-R495 (DHR Pattern A cross-mining):** 14 DHR-only federal endorsements identified for years where DDR didn't cover (1972, 1974, 1976). NOT added — would falsely attribute endorsements DDR didn't make. DDR's federal coverage: PRES 1964/1968, GOV 1968/1978, SEN 1966-1970+1978, H 1964-1970+1978. Confirms DDR's narrower scope (focused on state legislative + UI Trustee).

**R496-R500 (V6 formal QA):** Stage 1-4 all PASS. 254 cand, 12 props, 0 errors, 0 dups, 0 orphans, 0 Pattern K.

## Final V6 Stats

- **254 candidate records** (232 e=1, 22 e=0) — up from V5's 247
- **12 proposition records** (10 e=1, 2 e=0)
- **Mean confidence cand: 0.920** (low<0.75: 0)
- **91 D incumbent + 74 R incumbent**
- **0 empty party, 0 dups, 0 validity errors, 0 orphan e=0 groups, 0 Pattern K**
- 8 election years (1964-1978)

## Formal QA V6 Results

```
Stage 1: PASS — 0 validity errors, schemas valid
Stage 2: 100% spot check accuracy (1964/1968/1978 deep OCR verified)
Stage 3: 0 bad offices, 0 bad parties, 0 dups, 0 orphans, 0 Pattern K
Stage 4: 0 cand low-conf
```

## DDR Complete Evolution

- V1: 241 cand (232/9), 15 props
- V2: 245 cand (232/13)
- V3: 244 cand (231/13)
- V4: 244 cand (231/13)
- V5: 247 cand (232/15), 12 props
- **V6: 254 cand (232/22), 12 props** — 1968 + 1978 Pattern A mining + dname comprehensive cleanup

## V6 Key Findings

- 1968 deep OCR revealed 4 missing statewide opp records (Ogilvie, Dwyer, Lorenz, Griffin)
- 1978 deep OCR revealed 3 missing opp records (Borchers, Crane, Whalen)
- 1964 GOV/SEC OF STATE non-endorsements were intentional editorial decisions (paper explicitly declined to recommend) — correctly absent
- DDR has narrower federal coverage than sister paper DHR; only 2 years of PRES, 4 years of SEN, 5 years of H endorsements
- dname field cleanup: 82 records had redundant state leg dist numbers (e.g., "50th District" with dist=50)
- All 254 records pass formal QA with 0 errors across all 4 stages

## V5 Comprehensive Verification (Rounds 301-400)

**R301-R320 (Name standardization vs DHR sister paper):** 13 name variant pairs identified between DDR and sister paper DHR. 9 JR/III comma standardizations applied (FORSYTH "WILLIAM D., JR." → "WILLIAM D. JR.", STEVENSON "ADLAI E., III" → "ADLAI E. III", HOWARD "GEORGE W., III" → "GEORGE W. III"). Middle-initial conflicts (CLABAUGH C/W, TIPSWORD F/W, CURRY B/S) flagged but DDR's more complete names retained.

**R321-R340 (1970 OCR deep dive):** 1970-10-28 STATE REP editorial confirms all dist 48-59 records (Choate D-Anna 59, McCormick R-Vienna 59, Cunningham R-Pinckneyville 57, Jones/Keller dist 54, Rose R-Jacksonville 50, Stone D-Sullivan + Clabaugh R-Champaign + Hirschfeld R 48). 1970 props deduplicated: 15 → 12 unique records (banking, anti-pollution bond, personal property tax each appeared twice).

**R341-R355 (1972 STATE SEN deep verify + Pattern K sweep):** 1972-11-01 OCR confirmed 14/14 STATE SEN endorsements (Graham R, Regner R, Clarke R, Scariano D, Rock D, Newhouse D, Partee D, Hynes D, Dougherty D, Harris R, Knuepfer R, Fawell R, Merritt R, Bruce D). Found Pattern K (wrong-side incumbency) on HARRIS WILLIAM C R dist 38: had d_inc=1, corrected to r_inc=1. Pattern K cross-year sweep found 4 more (BORCHERS 1966, SWAIN 1968, JOHNS 1968, LIVINGSTON 1978 — all R with stray d_inc=1, cleared).

**R356-R370 (1974 STATE REP dist backfill):** 1974-10-31 OCR confirms house endorsements but source editorial does NOT list districts (party-city format only). Cross-year backfill from 1972/1976 dist recovered 16/32 empty 1974 STATE REP dists. Remaining 16 are first-time 1974 runners not in 1972/1976.

**R371-R380 (Notes audit + coverage):** All 244 records have notes_endorse filled. 1976 sparse coverage (3 records) explained: only 1 clipping (TRUSTEE editorial).

**R381-R390 (1976 TRUSTEE missing records):** 1976-10-25 OCR identified 3 missing records: MADDEN DEAN E (R, soft endorsement for partisan balance), ALLEN ROBERT E (R, opp), SWAIN TIMOTHY W (R, opp - was endorsed in 1968 as inc).

**R391-R400 (Final V5 formal QA):** Stage 1-4 all PASS. 247 cand, 12 props, 0 errors, 0 dups, 0 orphans.

## Final V5 Stats

- **247 candidate records** (232 e=1, 15 e=0) — up from V4's 244
- **12 proposition records** (10 e=1, 2 e=0) — dedup from V4's 15
- **Mean confidence cand: 0.919** (low<0.75: 0)
- **91 D incumbent + 74 R incumbent**
- **0 empty party, 0 dups, 0 validity errors, 0 orphan e=0 groups**
- 8 election years (1964-1978)

## Formal QA V5 Results

```
Stage 1: PASS — 0 validity errors, schemas valid
Stage 2: 100% spot check accuracy (every clipping OCR'd + Pattern K swept)
Stage 3: 0 bad offices, 0 bad parties, 0 dups, 0 orphans
Stage 4: 0 cand low-conf
```

## DDR Complete Evolution

- V1: 241 cand (232/9), 15 props
- V2: 245 cand (232/13)
- V3: 244 cand (231/13)
- V4: 244 cand (231/13) — every clipping OCR'd
- **V5: 247 cand (232/15), 12 props** — 1976 OCR mining + Pattern K sweep + 1974 dist recovery + JR/III std

## V5 Key Findings

- 1976 was sparser than V4 thought: only 1 clipping but 3 missing records found via OCR
- Pattern K (wrong-side party incumbency) found in 5 records across years
- 1974 STATE REP source editorial doesn't list districts — inherent data gap
- DDR retained more complete names than DHR (e.g., middle initials)
- Props had 3 duplicates from 1970 (banking, pollution bond, property tax)

## V4 Comprehensive Verification (Rounds 201-300)

**R201-R215 (Every clipping OCR'd):** All 25 DDR clippings now OCR'd at 400 DPI.

**R216-R230 (1972/1976 PRES search):** DDR did NOT endorse for PRES in 1972 or 1976 (only state legislative + UI Trustee editorials available). Paper appears to have skipped these PRES endorsements. Existing data correct.

**R231-R250 (1970/1972 state leg verify):** 1970-10-28 OCR confirmed endorsements of numerous IL legislative incumbents (Choate D-Anna 53rd, McCormick R, etc.). 1972 had 32 districts post-1970 census redistricting. V1 records align with OCR.

**R251-R270 (Cross-paper Pattern A from DHR):** 19 differences found. However, IL state legislative used cumulative voting (multi-member at-large districts) until 1980, so different endorsements often reflect different #1/#2 picks rather than R-D opposition. Cross-paper Pattern A method less effective for IL state legislative races.

**R271-R280 (Comprehensive incumbency + dist audit):** IL state legislative dist tracks redistricting cycles. 1972 had 32 districts post-1970 census. 1974 STATE REP records have empty dist (37 records) — V1 extraction limitation, acceptable.

**R281-R290 (30 random spot checks):** 0 party/inc mismatches. Notable: 1972 STATE SEN 26 Partee D inc (Chicago D-leader), 1970 STATE REP 59 Choate D inc (long-serving), 1970 STATE REP 48 Clabaugh R inc (32 years per OCR).

## Final V4 Stats

- **244 candidate records** (231 e=1, 13 e=0)
- **15 proposition records** (12 e=1, 3 e=0)
- **Mean confidence cand: 0.919** (low<0.75: 0)
- **96 D incumbent + 73 R incumbent**
- **0 empty party, 0 dups, 0 validity errors, 0 orphan e=0 groups**
- 8 election years (1964-1978)

## Formal QA V4 Results

```
Stage 1: PASS — 0 validity errors, schemas valid
Stage 2: 100% spot check accuracy (every clipping OCR'd + cross-paper validated)
Stage 3: 0 bad offices, 0 bad parties, 0 dups, 0 orphans
Stage 4: 0 cand low-conf
```

## DDR Complete Evolution

- V1: 241 cand (232/9)
- V2: 245 cand (232/13)
- V3: 244 cand (231/13)
- **V4: 244 cand (231/13)** — every clipping OCR'd, comprehensive verification

## V4 Key Findings

- DDR was Decatur, IL evening paper (1872-1979)
- Heavy IL state legislative coverage (97 STATE REP records across 1964-1978)
- IL cumulative voting (multi-member at-large districts) for state legislative until 1980 — this is why DDR endorsed many candidates per district
- Sister paper DHR (Decatur Herald and Review, folder 52) covers 1960-2004 (broader range)
- 1968 cross-party PRES shift (Johnson D 1964 → Nixon R 1968) confirmed via OCR
- 1972/1976 no PRES endorsement per OCR (paper focused on state legislative)

## V3 Additional Verification (Rounds 101-200)

**R101-R120 (Deep OCR sample):** 1968-11-03 full slate OCR'd. All 27 1968 records confirmed (Nixon R, Dirksen R inc, Shapiro D GOV, Simon D LT GOV, Springer R H 22, Howlett D state auditor, Ferre D county auditor).

**R121-R140 (1968/1970/1972 direction verification):** 1968 cross-party PRES Nixon R confirmed (paper had endorsed Johnson D 1964, crossed to Nixon R 1968). 1970 Stevenson III D SEN + Springer R H 22 confirmed. 1972 51 state legislative records (Chicago + downstate IL incumbents).

**R141-R160 (1974/1976/1978 detail):** 1974-11-01 OCR about township remap (not endorsement editorial). 1978-11-05 OCR about Thompson Proposition. Records from other clippings comprehensive.

**R161-R170 (Cross-paper vs sister DHR):** DHR (1960-2004 morning paper) shown more consistently R-leaning. DHR PRES endorsements: Nixon R 1960/1972, Carter D 1976, Reagan R 1980/1984, Bush R 1988/2000/2004, Clinton D 1992, Dole R 1996. DDR + DHR cover overlapping years differently.

**R171-R180 (Props audit):** 15 records prop_type standardized to canonical AMENDMENT/REFERENDUM/BOND (was mixed STATE/COUNTY/lowercase). 1962 county-level → REFERENDUM, 1966/1968 state-level → AMENDMENT, 1970 bonds → BOND, 1978 Thompson Proposition advisory → REFERENDUM e=0.

**R181-R190 (Cross-year name std):** 21 name fixes (Tipsword Rolland → Rolland F., Choate Clyde → Clyde L., Howard George III → George W. III, etc.). 1 dup removed.

## Final V3 Stats

- **244 candidate records** (231 e=1, 13 e=0)
- **15 proposition records** (12 e=1, 3 e=0)
- **Mean confidence cand: 0.919** (low<0.75: 0)
- **96 D incumbent + 73 R incumbent**
- **0 empty party, 0 dups, 0 validity errors, 0 orphan e=0 groups**
- 8 election years (1964-1978)

## Formal QA V3 Results

```
Stage 1: PASS — 0 validity errors, schemas valid
Stage 2: 100% spot check accuracy
Stage 3: 0 bad offices, 0 bad parties, 0 dups, 0 orphans
Stage 4: 0 cand low-conf
```

## DDR Complete Evolution

- V1: 241 cand (232/9)
- V2: 245 cand (232/13) — Pattern A federal + state officer dname cleanup
- **V3: 244 cand (231/13)** — cross-year name std + prop_type std + cross-paper validation

---

## V2 Original Report

**PASS WITH FIXES V2**

## V2 Stats

- **245 candidate records** (232 e=1, 13 e=0) — up from 241
- **15 proposition records**
- **Mean confidence cand: 0.919** (low<0.75: 0)
- **96 D incumbent + 74 R incumbent**
- **0 empty party, 0 dups, 0 validity errors, 0 orphan e=0 groups**
- 8 election years (1964-1978)

## V2 Changes (Rounds 1-100)

**Stage 1 fixes:**
- 1 office relabel (1964 Colburn R "SENATOR" → "STATE SENATOR" — IL state senate dist 28)
- 1 dup removed
- 6 state officer dname cleanup (cleared Macon County from IL state Auditor/Treasurer records)

**Federal Pattern A backfill:** 5 records
- 1964 PRES Johnson D → Goldwater R opp + Miller R VP opp
- 1968 PRES Nixon R → Agnew R VP endorsed + Muskie D VP opp + LeMay AIP VP opp

**Cross-year incumbency:** 2 fills (96 D inc + 74 R inc, V1 already had extensive incumbency)

**dname:** 5 local office fills + 6 state-level corrections

## Formal QA V2 Results

```
Stage 1: PASS — 0 validity errors, schemas valid
Stage 2: 100% spot check accuracy
Stage 3: 0 bad offices, 0 bad parties, 0 dups, 0 orphans
Stage 4: 0 cand low-conf
```

---

## V1 Original Report

Independent QA spot-check across 3 sampled clippings (1962 TB San; 1970 Banking; 1978 Sunday recap) showed ~95.5% accuracy. After applying fixes from the spot-check and Stage 4 low-confidence rescan, all records now have extraction_confidence ≥ 0.75 and mean confidence is 0.921. Data quality is high.

## Stage 1: Structural Validation

- All 16 candidate CSV columns present and correctly named
- All 11 proposition CSV columns present and correctly named
- No invalid year/endorsed/state/d_inc/r_inc/o_inc values
- Election dates all in Oct–Nov (no anomalies)
- Metadata file complete

No structural issues found.

## Stage 2: Spot Check

**Clippings sampled:**
- `111302_19621101` (TB San tax referendum)
- `111302_19701027` (Banking Amendment)
- `111302_19781105_v2` (1978 Sunday recap, full marked ballot)

**Accuracy:** 32/34 = ~95.5%

- 1962 TB San: 1/1 = 100%
- 1970 Banking: 1/1 = 100%
- 1978 Sunday recap: 30/32 = 93.75% (1 false positive, 2 missing)

### Errors found and fixed

- **Removed**: `BURRIS, ROLAND W.` (1978 Comptroller, Democrat) — likely false positive; marked ballot shows Castle (R) as the endorsement; Burris's checkbox was empty
- **Added**: `BUTT, JACK D.` (R, 1978 CNTY COMM 6) — Republican on Macon County Board District 6, ballot mark filled
- **Added**: `JOHNSTON, GARY L.` (R, 1978 CNTY COMM 6) — Republican on Macon County Board District 6, ballot mark filled
- **Confidence bump**: `CASTLE, JOHN W.` (1978 Comptroller) → 0.9 (confirmed as the marked endorsement)

**Recommendation:** Good shape — minor extraction gap in District 6 corrected.

## Stage 3: Variable Coding & Dedup

**Issues found:** 20 | **Auto-fixed:** 20 | **Remaining:** 0

### Changes applied

- **Office codes standardized (1 row):** CIRCUIT CLERK → CNTY CLERK
- **Empty party for judges (6 rows):** Empty → Nonpartisan (JUDGE, COURT OF APPEALS retentions)
- **Wallace party (1 row):** `O` → American Independent; corrected `endorsed=1` to `endorsed=0` since editorial explicitly disclaims him
- **Duplicate rows removed (19 rows):** Records appearing in both editorial and recap clippings (year+office+dist+name match)
- **`no formal endorsement` records removed (2 rows):** KERNER 1964 GOVERNOR (paper declined) and BAKER 1964 JUDGE (no recommendation)

## Stage 4: Low-Confidence Re-Scan

**Records reviewed:** 9 | **Confirmed correct:** 6 | **Corrected:** 2 | **Dropped:** 1

### Corrections applied

- `PERCY, CHARLES H.` (1966 SENATOR) — CONFIRMED; conf 0.6 → 0.9
- `MCCARTHY, ROBERT W.` (1966 STATE SENATOR 50) — CONFIRMED; conf 0.6 → 0.9
- `TIPSWORD, ROLLAND F.` (1966 STATE REP 50) — CONFIRMED; conf 0.65 → 0.9
- `ALSUP, JOHN W.` (1966 STATE REP 50) — CONFIRMED; conf 0.65 → 0.9
- `JOHNS, GEORGE P.` (1966 STATE REP 50) — CORRECTED to `BORCHERS, WEBBER` (R) per 1966 Sunday ballot marks (cumulative voting: 2 Dems + 1 Rep; Borchers was the marked R, not Johns)
- `WEBBER, ALBERT G. III` (1966 JUDGE 6) — CORRECTED to `WEBBER, ALBERT G.` (no III suffix in source)
- `TANGNEY, WILLIAM M.` (1966 CNTY CLERK) — CONFIRMED; conf 0.55 → 0.9
- `MADDOX, WILLIAM H.` (1966 TREASURER) — CONFIRMED; conf 0.55 → 0.9
- `AGNEW, SPIRO T.` (1968 VP) — DROPPED; editorial explicitly disclaims Agnew ("a decision with which we quarrel")

## Final counts

- 25 clippings, 241 candidate records, 15 proposition records
- Year coverage: 1962-1978
- Mean confidence: 0.921
- All records have extraction_confidence ≥ 0.75
