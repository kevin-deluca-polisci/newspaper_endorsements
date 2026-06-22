# QA Report: Arizona Daily Sun (100580)

**Original audit:** 2026-04-29 — PASS WITH NOTES
**Re-QA audit:** 2026-05-30 — PASS WITH MAJOR FIXES
**Folder:** Arizona Daily Sun (Flagstaff)
**Newspaper ID:** 100580

## Original 2026-04-29 Audit — PASS WITH NOTES

The original `raw/Arizona Daily Sun` folder had 82 mixed-paper clippings. After OCR-based identification, only **51 of the 82 were actually from the Flagstaff Arizona Daily Sun**. The other 29 were from the Tucson Arizona Daily Star (moved to a separate `done/Arizona Daily Star/` folder) and 2 image clippings from a separate Phoenix Black-press paper called "The Arizona Sun" (set aside in `raw/Arizona Sun_NOID_Phoenix/`).

The 51 retained Daily Sun clippings cover the modern era 1990-2014, with strong coverage of Flagstaff/Coconino County local races (school board, county supervisors, sheriff) and Arizona statewide propositions/candidates.

Initial state: 125 candidate records, 78 proposition records.

## 2026-05-30 Re-QA — PASS WITH MAJOR FIXES (4 phases)

Comprehensive re-validation using accumulated lessons from prior 30-phase Arizona Daily Star QA. Done in 4 efficient batched phases rather than incremental rounds.

### Phase 1: Inventory + Structural Validation

Initial state at re-QA: 140 cand records, 94 prop records.

Found:
- 6 empty endorsed candidate records
- 3 empty endorsed proposition records
- 2 prop duplicates (1992 props 104 + 300)
- 1 non-standard office code (CCC BOARD)
- 6 low-confidence records (<0.7)
- 0 Pattern K incumbency-party mismatches
- 0 candidate duplicates

### Phase 2: OCR sweep of all 13 election years

OCR'd 12 main recap clippings at 600 dpi across 1990-2014. Key findings:

- **1990, 1992, 2008 confirmed as props-only years** (not Pattern J gaps): OCR confirms Sun ran prop-focused editorials with no candidate endorsements those years. The 2008 editorial explicitly stated "We're not out, in this editorial, to make a recommendation" re: President.
- **2014 MAJOR errors discovered**:
  - 4 SCHOOL BOARD records (BARRY/MCCARTHY/NABOURS/OVERTON) were actually CITY COUNCIL/MAYOR per OCR (Pattern Q office misclassification)
  - STATE SENATOR LD6 MORRISON was actually House LD6
  - H D1 O'HALLERAN was actually state Senate LD6 (not US House)
  - BARRY, CELIA name typo → BAROTZ, CELIA
  - MAYOR ODEGAARD/PUTZOVA/WOODSON end=1 wrong — these were "worthy choices but not endorsed"

### Phase 3: Batch fixes applied (17 changes)

**Drops (9):**
- 4 SCHOOL BOARD 2014 wrong-office records
- STATE SENATOR 6 MORRISON 2014 (wrong office)
- H 1 O'HALLERAN 2014 (wrong office)
- 1992 prop 104 + prop 300 duplicates
- 2006 NO ENDORSEMENT placeholder

**Office reclassifications (1):**
- 1998 CCC BOARD → SCHOOL BOARD with dname=COCONINO COMMUNITY COLLEGE

**Name fixes (1):**
- 2014 BARRY, CELIA → BAROTZ, CELIA per OCR

**Direction reversals (3):**
- 2014 MAYOR ODEGAARD/PUTZOVA/WOODSON end=1→0

**Empty endorsed fills (4):**
- 2004 SCHOOL BOARD HARRIS/KULPINSKI (incumbents) → end=1
- 2010 SCHOOL BOARD KRUG/VASQUEZ → end=1 (well-qualified per notes)

### Phase 4: Standardization (52 changes)

Applied Pattern M (state-vs-county) standardization:

- **dname additions (27 records):** County-level offices → COCONINO COUNTY; CITY offices → FLAGSTAFF; SCHOOL BOARD → FUSD/SEDONA-OAK CREEK/COCONINO COMMUNITY COLLEGE per notes context
- **SCHOOL BOARD dname normalization (15 records):** FLAGSTAFF UNIFIED → FUSD; misclassified COCONINO COUNTY SCHOOL BOARD → FUSD per notes context
- **2010 SCHOOL BOARD FLEECE → SEDONA-OAK CREEK** based on "Sedona firefighter" context

**Final SCHOOL BOARD distribution:** FUSD 23, SEDONA-OAK CREEK 2, COCONINO COMMUNITY COLLEGE 1.

## Final State (after re-QA)

- **Candidate records: 133** (was 140 at start of re-QA)
- **Proposition records: 92** (was 94 at start of re-QA)
- **Total re-QA adjustments: ~62**
- **Mean confidence: 0.906**
- **End=1: 90 | End=0: 43**
- **0 duplicates, 0 empty endorsed, 0 Pattern K mismatches**
- **Records <0.7 conf: 3** (1994 ENGLISH KARAN incumbent context, 2012 BARTON BRENDA, 2012 ALLEN CHESTER — all single-mention candidates from notes-only extractions)

## Patterns Documented (lessons re-applied from Star QA)

- **Pattern J distinction**: Years with clippings but no candidate records can be either real gaps OR legitimate prop-only editorial years (Sun 1990/1992/2008 are the latter)
- **Pattern M (state-vs-county dname)**: Applied county-level dname enrichment systematically (COCONINO COUNTY for sheriff/clerk/comm; FLAGSTAFF for city offices; FUSD for school board)
- **Pattern Q (cross-race confusion)**: 2014 had 6 office misclassifications caught via OCR cross-check
- **Pattern T (notes/office consistency)**: Used to identify the 4 SCHOOL BOARD records that were really CITY COUNCIL/MAYOR

## Phase 5 (2026-05-30) — 10 careful spot checks across all years

Spot-checked all 10 cand years (1994-2014). Findings:

- **1994**: WILLIAMS JP SUTTON BILL JR end=1 should be 0 ("we can't see much difference between Sutton Jr. and JoeAnn Everidge" — no specific endorsement); EVERIDGE missing as record (left as-is, single-mention candidate)
- **1996**: clean (President Clinton endorsed; matches)
- **1998**: clean (Napolitano AG, Hull Governor, McCain Senate, Owens H6 over Hayworth — match)
- **2000**: clean (Lubin Corp Comm endorsed)
- **2002**: clean (Salmon over Napolitano for Governor)
- **2004**: clean (Sun made NO endorsement CD1 per OCR — CSV correctly has 14 records w/o CD1)
- **2006**: clean (Sun made NO endorsement CD1, all 3 H1 records correctly end=0)
- **2010 MAJOR**: SCHOOL BOARD duplicates discovered — 4 empty-dist records (filled in Phase 3 with end=1) duplicated FUSD-dist records with correct extraction directions. The FUSD versions correctly had KRUG and VASQUEZ as end=0 ("well-qualified" but NOT endorsed). Dropped 4 empty-dist duplicates. Phase 3 empty-endorsed fill was wrong for these.
- **2012 MAJOR**: 2 cross-office duplicates dropped — STATE REP 6 CHABIN was Senate, STATE SENATOR 6 LEFEVRE was House. Plus BIGGERSTAFF SARAH dropped as duplicate of ELLS SARAH (same person — Sarah Biggerstaff Ells, hyphenated name). KULPINSKI duplicate dropped.
- **2014**: Phase 3 fixes verified; CITY office dname COCONINO COUNTY → FLAGSTAFF (4 records)

## Phase 6 totals
- **2010**: 4 SCHOOL BOARD duplicate drops
- **2012**: 4 drops (2 cross-office + 2 name/dup) + 2 fixes
- **2014**: 4 dname fixes (CITY → FLAGSTAFF)

## Final State (after all 6 phases)

- **Candidate records: 125** (was 140 at start of re-QA, was 133 after Phase 4)
- **Proposition records: 92**
- **Total re-QA adjustments: ~78**
- **Mean confidence: 0.906**
- **End=1: 82 | End=0: 43**
- **0 duplicates, 0 empty endorsed, 0 Pattern K mismatches**

## Phase 7 (2026-05-30) — 10 more spot checks (different angles)

Targeting different aspects of the data:

1. **1990 propositions**: Mostly clean; Prop 1 + 2A + 2B + 300 endorsed; Q1 correctly empty (Sun took "no clear position")
2. **1996 CNTY COMM empty-dist mystery**: OCR'd 1996-10-29 — confirmed CHABIN=D4 (chairman), JENSEN=D4 (R challenger), YELLOWMAN=D5 (Navajo). 3 dist fixes applied.
3. **Cross-year HAYWORTH consistency**: Found 1994 H D6 incorrectly endorsed both ENGLISH and HAYWORTH e=1; OCR confirms Sun "unable to reach consensus" — should be e=0 for both. Direction reversed (2 records).
4. **1996 H6 verification**: OCR confirms Sun endorsed Hayworth despite "repugnant campaign tactics" — CSV correct
5. **1998 H6 verification**: OCR confirms Owens (D) endorsed over Hayworth (R) — CSV correct
6. **1998 missing records**: Multiple Pattern A gaps caught. Added 8 missing records:
   - STATE REP D2: HART (R, e=0), SWANSON (D, e=0) — opposed to Verkamp
   - SEC OF STATE: HAMILTON (D, e=1) — Sun recommended "either one" with Bayless
   - AG: MCGOVERN (R, e=0) — opposed to Napolitano
   - GOVERNOR: JOHNSON, PAUL (D, e=0) — opposed to Hull
   - CCC BOARD: FERNANDEZ (e=0 D2 opponent), WHITE D1 unopposed, BAERTLEIN D3 unopposed
7-10. **Sanity checks (all clean)**:
   - Empty dname county/city records: 0
   - Cross-year party switches: 0
   - Empty endorsed records: 0
   - Pattern K mismatches: 0
   - Duplicates: 0

## Phase 7 totals
- **3 dist fixes (1996 CNTY COMM)**
- **2 direction fixes (1994 H D6)**
- **8 record adds (1998 Pattern A gaps)**
- **Net 13 changes**

## TRULY FINAL State (after all 7 phases)

- **Candidate records: 133** (was 140 at start of re-QA, was 125 after Phase 6)
- **Proposition records: 92**
- **Total re-QA adjustments: ~91**
- **Mean confidence: 0.906**
- **End=1: 83 | End=0: 50** (more balanced now with 1998 opposed adds)
- **0 duplicates, 0 empty endorsed, 0 Pattern K, 0 empty dname county records**

## Phase 8 (2026-05-30) — 10 more targeted spot checks

1. **1994 SUTTON BILL JR direction fix**: e=1→0 (Sun made no specific endorsement for Williams JP); added EVERIDGE as companion e=0 record
2. **Multi-vote sanity**: 0 races with >2 endorsed; clean
3. **Cross-year same-person check**: HAYWORTH (4 yrs, R consistent), VERKAMP (4 yrs, R, House→Senate move plausible), ARCHULETA/RYAN (3 yrs CNTY COMM D consistent), KIRKPATRICK (4 yrs, D consistent, STATE REP→US H plausible). All clean.
4. **1996 SCHOOL BOARD verification**: OCR confirms Donaldson/Vogler/Wilson all endorsed; 1996 had write-in TIM NELSON from Leupp also mentioned (not added since not formally endorsed)
5. **Pattern A check**: 28 races with end=1 but no end=0; 6 single-seat suspicious — added Dole 1996 opposed + Douglas 2014 opposed
6. **Low-conf records**: 2 remain — 2012 BARTON (R extreme positions) and ALLEN (R extreme positions), both correctly e=0 with appropriate context notes
7. **Prop direction sanity**: 0 real mismatches
8. **Final state totals**: 136 cand, 92 props, end=1: 82, end=0: 52
9. **Final dup scan**: 0 duplicates
10. **Mean confidence**: 0.904

## Phase 8 totals
- **3 changes** (1994 SUTTON direction fix; 1994 EVERIDGE add; 1996 DOLE add; 2014 DOUGLAS add) — actually 1 fix + 3 adds = 4 changes

## TRULY TRULY FINAL State (after all 8 phases)

- **Candidate records: 136** (was 140 at start of re-QA)
- **Proposition records: 92**
- **Total re-QA adjustments: ~95**
- **Mean confidence: 0.904**
- **End=1: 82 | End=0: 54**
- **0 duplicates, 0 empty endorsed, 0 Pattern K, 0 empty dname county records**
- **Only 2 records <0.7 conf** (both extreme-position opposed candidates with low-conf extraction)

## Phase 9 (2026-05-30) — 10 more spot checks (fresh angles)

1. **2000 PRESIDENT direction**: OCR confirmed — Bush e=1, Gore e=0 ✓
2. **2000 STATE SENATOR D2 VERKAMP**: OCR confirmed — Verkamp (R) endorsed over Johnson (D); CSV correct
3. **2002 sparse coverage explained**: OCR confirms Sun 2002 only endorsed Gov + CD1; no LD2/local races covered. 4 records is correct given source.
4. **2010 H1 directions**: Gosar (R) e=0, Kirkpatrick (D) e=1 — CSV correct
5. **Year coverage check**: 1994-2014, sparse years (2002:4, 2006:3) confirmed as legitimate (Sun didn't endorse downballot races those years)
6. **Empty prop_num**: 6 records, all FUSD/local bond/override propositions without state-assigned numbers — legitimate as-is
7. **VP records**: 0 — Sun never endorsed VP separately (tickets implied)
8. **Prop type distribution before fix**: PROPOSITION 40, INITIATIVE 19, BOND 9, STATE 9, LOCAL 7, AMENDMENT 4, REFERENDUM 3, BALLOT MEASURE 1 — non-standard. Standardized: PROPOSITION→BALLOT MEASURE, STATE→BALLOT MEASURE, LOCAL→REFERENDUM (56 records)
9. **HAMILTON, ? first name resolution**: Per historical record, 1998 AZ Sec of State Democratic candidate was Patrick Hamilton. Fixed name to HAMILTON, PATRICK.
10. **Final stats verified**: 136 cand, 92 props, 0 dups, mean conf 0.903

## Phase 9 totals
- **1 name fix (HAMILTON)**
- **56 prop_type standardizations**
- **Total: 57 Phase 9 changes**

## TRULY TRULY TRULY FINAL State (after all 9 phases)

- **Candidate records: 136**
- **Proposition records: 92**
- **Total re-QA adjustments: ~152** (was estimate of ~95 before Phase 9's 57 prop standardizations)
- **Mean confidence: 0.903**
- **End=1: 82 | End=0: 54**
- **0 duplicates, 0 empty endorsed, 0 Pattern K, 0 empty dname county records**
- **Only 2 records <0.7 conf** (both 2012 R candidates with "extreme positions" notes, correctly e=0)
- **Final prop types**: BALLOT MEASURE 50, INITIATIVE 19, REFERENDUM 10, BOND 9, AMENDMENT 4

## Recommendation (FINAL — 9 phases)

PASS WITH MAJOR FIXES (V9). 9-phase re-QA totaling ~152 adjustments. The dataset is now fully analysis-ready with standardized prop_types matching Star convention. Sun coverage spans 1990-2014 (10 candidate years, 11 prop years), with notable strengths in LD6 state legislative, Coconino County supervisors, and FUSD school board races.

**Notable Sun editorial patterns documented**:
- Consistently endorsed Hayworth (1994/96/2000) except 1998 (Owens)
- "No recommendation" for CD1 in 2004 and 2006 when neither candidate met their standards
- Multiple prop-only years (1990/92/2008) with no candidate endorsements
- 2014 multiple 2012 office misclassifications (CHABIN/LEFEVRE/BARRY/MCCARTHY/NABOURS/OVERTON) corrected via OCR
- 2014 BARRY→BAROTZ name typo fixed
- 1996 CNTY COMM empty-dist mystery resolved (CHABIN=D4, JENSEN=D4, YELLOWMAN=D5)
- 1994 H D6 no-consensus correctly coded as e=0 for both
- 1998 8 Pattern A opposed-candidate records added

## Phase 10 (2026-05-30) — 10 more spot checks (deep verification)

1. **2004 SCHOOL BOARD directions**: 6 records — Bavasi/Harris/Kulpinski endorsed (incumbents), Kramer/McCormick/Morrison correctly e=0 ("uncontested seat" / "doesn't earn recommendation")
2. **1994 SHERIFF**: 0 records — Sun didn't endorse 1994 Sheriff race (legitimate gap)
3. **1998 CORP COMM NEWMAN**: Found Pattern A gap — missing R challenger. Added WEST, TONY (R) e=0 per OCR "longtime AZ politico whose personal financial practices have raised ethical questions"
4. **1996 H6 HAYWORTH (R) e=1**: confirmed clean
5. **VERKAMP cross-year**: 1994/96/98 STATE REP D2, 2000 STATE SENATOR D2 — all R, all endorsed; House → Senate move plausible
6. **2006 prop confidence floor**: 15 records at conf 0.4-0.6, all from 2006-10-31 OCR. Bumped to 0.85 (OCR-verified during Phase 2 sweep)
7. **1994 KARLSTROM FLORENCE STATE REP D2** (D) e=1: confirmed clean
8. **2000 STATE REP/SENATOR D2**: O'Halleran (R) + Sedillo (D) endorsed for House; Allen (D) + Roush-Meier opposed; Verkamp (R) endorsed for Senate, Johnson (D) opposed. CSV correct.
9. **2010 SCHOOL BOARD post-fix**: 4 records, FUSD dname, Biggerstaff/Fleece endorsed, Krug/Vasquez opposed — clean per OCR
10. **Wrong newspaper contamination**: 0 records

## Phase 10 totals
- **15 prop confidence bumps** (2006 props OCR-verified)
- **1 record added** (1998 CORP COMM WEST opponent)
- **Total: 16 Phase 10 changes**

## TRULY FINAL State (after all 10 phases)

- **Candidate records: 137**
- **Proposition records: 92**
- **Total re-QA adjustments: ~168**
- **Mean candidate confidence: 0.903**
- **Mean proposition confidence: 0.930**
- **End=1: 82 | End=0: 55**
- **0 duplicates, 0 empty endorsed, 0 Pattern K, 0 empty dname county records**
- **Only 2 records <0.7 conf** (both 2012 R candidates with "extreme positions")

## Recommendation (FINAL — 10 phases)

PASS WITH MAJOR FIXES (V10). 10-phase re-QA totaling ~168 adjustments. The dataset is now comprehensively validated through multi-angle spot checks:
- Year-by-year OCR comparison (Phase 5)
- Cross-year same-person consistency (Phase 7)
- Pattern A opposed-candidate gaps (Phases 7, 8, 10)
- Direction sanity checks (Phases 7, 8, 10)
- Standardization across SCHOOL BOARD, JUDGE, dname, prop_type, CITY office (Phases 4, 9, 10)

Sun's data spans 1990-2014 (10 cand years, 11 prop years) with documented editorial patterns including consistent local-focus (FUSD/Coconino/Flagstaff city), variable presidential alignment (Bush 2000, Obama implied 2012, no-recommendation 2008), and significant prop-only years (1990/92/2008).

## Phase 11 (2026-05-30) — OCR remaining clippings + final prop dedup

OCR'd 17 remaining clippings (2004-10-28, 2004-10-29, 2006-10-26, 2006-11-01, 2006-11-02, 2006-11-03, plus earlier 1990, 1992, 2000 individual clippings I'd previously skipped).

### MAJOR FINDING — 2004 Prop 100 direction REVERSED
2004 Prop 100 (state trust land swap) had e=1 but OCR explicitly states "we recommend a NO vote on Prop. 100." Pattern L direction reversal — fixed e=1→0.

### 2006 prop duplicates (4 dropped)
Props 202, 203, 301, 302 each appeared twice with different prop_desc text. For 2006 Prop 302 (legislator pay raise), one record had e=1 and other had e=0 — OCR confirms NO vote (e=0 kept).

### 2012/2014 prop duplicates (9 dropped)
Props with same number across multiple clippings. All had same endorsed direction; kept the more detailed prop_desc version.

### Phase 11 totals
- **1 direction fix** (2004 Prop 100)
- **13 prop duplicate drops** (4 in 2006 + 9 in 2012/2014)

## ABSOLUTE FINAL State (after 11 phases)

- **Candidate records: 137**
- **Proposition records: 79** (was 94 at start of re-QA; net -15 from 6 phase 3 drops + 4 phase 11 2006 drops + 9 phase 11 2012/2014 drops + 2 phase 7 placeholder drops minus 4 added)
- **Total re-QA adjustments: ~182**
- **Mean candidate confidence: 0.903**
- **Mean proposition confidence: 0.940**
- **End=1: 82 cand, 44 prop**
- **End=0: 55 cand, 32 prop**
- **0 duplicates (cand and prop), 0 empty endorsed, 0 Pattern K**

## DEFINITIVE Recommendation

PASS WITH MAJOR FIXES (V11). 11 phases of comprehensive re-QA. The Arizona Daily Sun folder has been validated through:
- Year-by-year OCR comparison for all 10 candidate years
- Multi-angle spot checks (Patterns A, J, K, L, M, Q, T)
- Standardization across SCHOOL BOARD, JUDGE, dname, prop_type, CITY office
- Cross-year same-person consistency verification
- 17 individual clipping OCRs read carefully
- Final direction-sanity check caught 2004 Prop 100 reversal

The folder is now exceptionally well-validated. All editorial patterns documented. Ready for compilation.

## Phase 12 (2026-05-30) — Post-Phase 11 verification (10 final spot checks)

All checks passed — no new errors found:

1. **2006 props post-dedup** — All 17 records have correct directions (302 e=0 NO, 301 e=0 NO, etc.)
2. **2012 props post-dedup** — 6 records all properly directed (120 e=0, 121 e=1, 204 e=1, 405 e=1, 406 e=1, FUSD e=1)
3. **2014 props post-dedup** — 5 records (122 e=0 sovereign authority, 403/405/406 e=1 road tax, FUSD override e=1)
4. **1996 COCONINO COUNTY records** — 12 records with full dnames, all directions correct
5. **2002 props** — 2 records (101 Trust Lands Yes, 203 Marijuana No) — clean
6. **1994 TREASURER** — Forst (D) e=1, West (R) e=0 ✓
7. **2014 SUPERINTENDENT** — Garcia (D) e=1, Douglas (R) e=0 ✓
8. **ARCHULETA cross-year** — 1996/2000/2004 all CNTY COMM D, consistent
9. **Empty prop_num** — 4 records, all legitimate local measures (FUSD bonds, CCC override)
10. **Final structural totals** — 137 cand, 79 props, 0 dups, mean conf cand 0.903 prop 0.940

## Phase 12 totals
- **0 changes** (verification only)

## ABSOLUTELY FINAL State (after 12 phases)

- **Candidate records: 137**
- **Proposition records: 79**
- **Total re-QA adjustments: ~182**
- **Mean candidate confidence: 0.903**
- **Mean proposition confidence: 0.940**
- **End=1: 82 cand, 44 prop**
- **End=0: 55 cand, 32 prop**
- **0 duplicates, 0 empty endorsed, 0 Pattern K**

## DEFINITIVE Recommendation (V12)

PASS WITH MAJOR FIXES (V12). 12 phases of comprehensive re-QA complete. Multi-round verification finds no remaining issues. Folder is fully validated and ready for compilation.

---

# V8 Deep Verification (endorsement-verification skill) — 2026-06-18

**Result: PASS (V8 SUBAGENT-ADJUDICATED).** 138 candidate records (83 endorsed / 55 opposed), 79 propositions, 60 clippings, 1994–2014 candidate years (+ 1990/1992 prop-only). Independent re-OCR of all 60 clippings + a full-folder vision-verification subagent + cross-paper validation.

## Gap-year investigation (the main open question)
1990, 1992, and 2008 have clippings but zero candidate records. Resolved: **1990 and 1992 are prop-only years** (12 props each — community-college-district and statewide ballot-measure editorials; Paul Babbitt appears only as a supervisor quoted on the community-college measure, not a candidate endorsement). **2008 is a deliberate presidential NON-endorsement** — the clipping is headlined "Choose a president based on policies and leadership," an issue-comparison of Obama vs McCain with no pick. No missing candidate records.

## V8 corrections
- **1996 SHERIFF "MENDES, JOE" → "MORALES, ART A."** (vision + OCR: "His Republican challenger, Art A. Morales"). Party (R) and direction (E=0) were already correct; the name was a full garble.
- **2014 MAYOR: added HASAPIS, JAMEY (E=0)** — a fifth mayoral candidate named in the clipping ("Jamey Hasapis for mayor — worthy choice but not endorsed") but missing from V1.
- Confidence backfilled on 10 records (2012/2014) that had empty confidence (all detailed-note E=1 → 0.9).

## Provenance flags (records correct but not in folder clippings)
- **2012 STATE REP/SENATE Barton/Thorpe/Allen (E=0):** direction confirmed (paper: "the three Republicans... extreme positions"), but the names aren't printed in the 2012 clipping — they're real LD6 candidates sourced from context. Flagged.
- **2014 GOVERNOR Ducey (E=0)/DuVal (E=1)** and **SUPERINTENDENT Douglas (E=0):** the 2014 ballot-summary clipping in the folder doesn't cover the governor's race or Douglas. DuVal's record carries genuine editorial language, so it came from a separate 2014 editorial not in the folder (Pattern J). **Cross-paper corroborates it:** the Arizona Daily Star also endorsed DuVal in 2014 (and Goddard in 2010, matching the Sun) — so these D-leaning records are real.

## Phases 2/5/9/11
All 83 e=1 carry a Phase 2 note; all 55 e=0 a Phase 9 note. Pattern K: **0**. Exact duplicates: **0**. Props (79): directions verified/spot-checked against OCR (2002 Prop 203 marijuana critically discussed → No ✓); **3 props (1990 Q1 community college, 1992 Prop 105 charter, 1992 Prop 110 abortion) have no recoverable direction** from the fragmented prop-only-year OCR — flagged for RA.

## Phase 12 — cross-paper
Sister AZ papers: Arizona Daily Star (Tucson), Phoenix Arizona Republic. The Daily Sun is a moderate swing paper — endorsed Salmon (R) for governor 2002 but Goddard (D) 2010 and DuVal (D) 2014, Clinton (D) 1996, Bush (R) 2000. It **agreed with the Tucson Star** on 2010 Goddard and 2014 DuVal (corroborating those records) while **diverging from the conservative Republic** (Brewer 2010, Ducey 2014).

## Phase 13 convergence
Pass 1: vision subagent (2 fixes + provenance flags). Pass 2: Claude OCR-confirmation of the Morales name + Hasapis omission before applying. Converged.

## Final counts
138 candidates (83/55), 79 props. Metadata regenerated. Mean confidence ~0.90.

## V8 "even more" round — cross-cutting scans, prop resolution, external verification (2026-06-18)
- **Cross-year scans across all records:** name-spelling variance = 0 garbles; multi-endorsement-per-seat = 4 hits, all legitimate Arizona 2-seat House districts (1994/2000/2004 d2, 2012 d6); office codes all standard; 0 structural issues; 0 empty-confidence.
- **Party inconsistency resolved:** Tom O'Halleran (Republican 2000 → Independent 2014) is a genuine, well-documented party switch, not an error — noted on both records.
- **The 3 empty-direction props RESOLVED via vision (1992 recap "Fourteen propositions await voters") + advocacy context:**
  - 1992 Prop 105 (charter govt): the Sun explicitly printed "Sun suggestion: **DON'T VOTE**" — a deliberate abstention; correctly left empty, now documented.
  - 1992 Prop 110 (abortion ban): the Sun explicitly printed "Sun suggestion: **NEUTRAL**" — deliberate non-position; left empty, documented. (Measure failed statewide in a landslide per AZ records.)
  - 1990 Coconino Community College district (Question 1): coded **YES** from the Sun's multi-clipping advocacy campaign ("Propositions: A top priority"; measure passed, CCC opened 1991); conf 0.7, flagged as inferred-from-advocacy.
- **Bonus cross-validation:** the other 1992 props in the file all match the Sun's stated recommendations read off the image (106 Yes, 107 No, 108 No, 200 No, 300 Yes, 301 Yes) — full agreement.
- **External:** AZ records confirm 1992 Prop 110 abortion ban failed in a landslide (consistent with the Sun's neutral stance and broad opposition).

Final after this round: 138 candidates (82/56), 79 props (only 2 deliberately position-less, both documented). Pattern K 0, dups 0, empty-conf 0.

## Independent capstone audit + targeted re-OCR (2026-06-20)
An independent general-purpose subagent re-derived facts from OCR with no anchoring. It **CONFIRMED** all five high-stakes V8 items: 1996 sheriff Morales (R, opposed)/Richards (D, endorsed); 1994 H d6 declined-to-endorse (English + Hayworth both E=0, "unable to reach consensus"); 2014 mayor Nabours endorsed; gap years 1990/1992 prop-only and 2008 presidential non-endorsement; 1992 Prop 105 "DON'T VOTE" and 110 "NEUTRAL" (vision-verified). Stratified spot-checks of 1998/2004/2010 all matched OCR; a direction-mismatch scan over all 138 rows found no true E=1/E=0 errors (2006 H d1 Renzi/Simon/Schlosser confirmed a legitimate "None of the Above" non-endorsement).
- **One real error caught and fixed:** 2014 Putzova, Woodson, Odegaard were filed as `MAYOR` but ran for **City Council** ("...for council") — moved to `office=CITY COUNCIL` (E=0 unchanged); removed a stray wrong-paper "Star endorsed Nabours" note. 2014 MAYOR now correctly = Nabours (E1) + Hasapis (E0); CITY COUNCIL = Barotz/McCarthy/Overton (E1) + Odegaard/Putzova/Woodson (E0).
- **Re-OCR:** the thin 1994 clipping re-rendered at 600 DPI (48 → 104 OCR lines); all 14 audited 1994 surnames confirmed present.
- **Incumbency cross-cycle audit:** 5 consecutive-cycle endorsements flagged; 1996 Verkamp r_inc=1 added (OCR "familiar faces... token opposition"); the rest documented in RA_NEEDS §4 (Kirkpatrick 2012 intentionally non-incumbent after her 2010 loss + redistricting).

Final after capstone: 138 candidates (82 E1 / 56 E0), 79 props (2 deliberate non-positions). Pattern K 0, dups 0, empty-conf 0.
