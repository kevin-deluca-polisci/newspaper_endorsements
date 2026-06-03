# QA Report: Albuquerque Tribune (128400)

**QA Date:** 2026-05-28 (Phase 6; supersedes prior dates)
**Newspaper ID:** 128400
**Data coverage:** 1934-2004 (29 election years; Tribune ceased publication 2008), 142 clippings, 953 candidate records, 213 proposition records

**Six-phase re-QA:** Phase 1 (initial Pattern I dedup + Pattern J 1980/1994). Phase 2 (verification of 1958/1964/1968/1970/1972 — 50+ granular fixes). Phase 3 (verification of 1962/1966/1986/1996 — 20+ more fixes + parts/ JSON sync for 11 affected years). Phase 4 (recap-year verification of 1946/2004/2000/2002/1998/1984 — 15+ more fixes). Phase 5 (verification of remaining modern recaps 1982/1988/1976/1978 + pre-1960 Pattern-J years 1960/1956/1954/1952 — 16 cand fixes, 4 cand drops, 87 cand adds, 7 prop drops, 4 prop adds, 2 prop fixes). Phase 6 (verification of all remaining unverified pre-WWII years 1934/1936/1940/1948 — confirmed 1934/1936/1940 well-extracted given low PDF resolution; 1948 had major Pattern J — 1 cand fix + 18 cand adds from "THE COUNTY TICKET" Oct-30 recap).

## Overall Assessment

**PASS WITH FIXES**

The Tribune re-QA had two phases. The first phase (initial Pattern I dedup + Pattern J re-extraction of 1980/1994) was thorough on duplicates but skipped the granular accuracy spot-checks. After Kevin pushed back, the **additional verification pass** read 1964/1968/1970/1972/1958 clippings independently and surfaced 50+ granular accuracy errors (office mis-codings, party errors, name garbles, mis-extracted "no endorsement" rows) beyond the original duplicates. The 1958 read also confirmed Pattern J extends to pre-1960 OCR-failed years (PDFs are human-readable even when the original pipeline gave up).

## Final Counts (after both passes)

- **Clippings:** 142 (unchanged)
- **Candidate records:** 821 (was 766; net +55 = −31 Pattern I dedup −13 verification drops −various +91 new from 1980/1994 +3 new from 1958 + 15 office reclassifications + 8 name corrections)
- **Proposition records:** 197 (was 174; net +23 = −11 prop dedups +26 1994 props +6 1980 props +5 1958 amendments)
- **Year coverage:** 1934-2004, 29 even election years (was 28; 1994 added)
- **Direction split (cands):** 789 endorsed, 29 opposed, 3 no-direction
- **Mean confidence:** cands 0.890, props 0.887

## Verification Pass Findings (by year)

### 1968 (5 candidate drops + 1 office reclassification + 3 prop dedups)

Read the "Tribune Recommendations In Tuesday Voting" clipping (128400_19681104_v3) independently.

- **ALARID, MICHAEL GOVERNOR record dropped** — editorial pairs Chavez+Alarid as Gov+LtGov ticket; Alarid is Lt Gov, not Gov. ✓ My initial dedup was correct.
- **NEFF, DANE renamed to NEFF, DAN E.** — editorial explicitly says "DAN E. NEFF". My initial dedup had it backwards.
- **PADILLA, JOY C. STATE REP dist 5 dropped** — editorial has CINELLI at d5; "JOY C. PADILLA" was a misextraction.
- **SCEHESSE, ALEXANDER dropped** — OCR typo dup of SCERESSE.
- **SALAZAR, GIL dropped** — OCR variant of SALAZ, GIL.
- **CARMODY, ROBERT L. SUPREME COURT dropped** — editorial only endorses ARMIJO for Supreme Court Justice; CARMODY was extraneous.
- **BISHOP, BIN ASSESSOR dropped** — editorial says "no recommendation" for Assessor; "BIN" is garbled.
- **BISHOP, ROBBIN reclassified TREASURER → CNTY TREASURER** — editorial: Robbin Bishop is County Treasurer, Jesse D. Kornegay is State Treasurer.
- **1968 prop dedup:** 3 records (Bernalillo Medical Center levy appeared 3x; Constitutional Convention appeared 2x). Kept 1 each.

### 1970 (2 drops + 1 name fix + 8 prop dedups)

Read "Here is list of Tribune's election endorsements" (128400_19701030_v2).

- **WORMAN, THOMAS R. ASSESSOR dropped** — editorial says Vance, Thomas R. Sr. is the Assessor; "WORMAN, THOMAS R." was a misextraction (Worman appeared in 1972 as Assessor but with first name Vernon H., not Thomas R.).
- **CLINE, EUGENE R. STATE REP dist 5 dropped** — OCR variant of CINELLI, EUGENE R.
- **RAWSEN, CHARLES W. renamed to RAWSON** — editorial spelling is Rawson; RAWSEN was OCR variant.
- **8 amendment dups (1-8)** in 1970 props — same amendment appeared as "CONSTITUTIONAL AMENDMENT NO. X" AND "NM CONSTITUTIONAL AMENDMENT NO. X". Kept the "NM CONSTITUTIONAL AMENDMENT" forms.
- **Fluoridation appeared 3x** in 1970 props — kept the most descriptive form.

### 1972 (21 fixes + 1 drop)

Read "The Tribune's choices in the election" (128400_19721103_v2).

- **DOW, R. LEO STATE SENATOR party D → R** — editorial says "Sen. R. Leo Dow, Republican".
- **SEGO, WILLIAM A. STATE SENATOR party D → R** — editorial says "Sen. William A. Sego, Republican".
- **Empty STATE SENATOR d19 row dropped** — junk row representing the "no endorsement between Houston D and Tannehill R" entry.
- **HUFFMAN, LEO E. TREASURER → CNTY TREASURER** — same pattern as 1968.
- **3 Court of Appeals records reclassified JUDGE → COURT OF APPEALS** (Wood 8-yr, Lopez 4-yr unexpired, Sutin 2-yr unexpired).
- **2 Supreme Court records reclassified JUDGE → SUPREME COURT** (Martinez Pos 1, Montoya Pos 2).
- **1 Probate Judge record reclassified JUDGE → PROBATE JUDGE** (Christensen).
- **1 Small Claims Judge reclassified JUDGE → SMALL CLAIMS JUDGE** (Speer).
- **8 District Court Judge records reclassified JUDGE Division I-VIII → DISTRICT COURT JUDGE dist 2-1 through 2-8** (Stowers, Baca, Ryan, Riordan, Fowlie, Larrazolo, Maloney, Payne).
- **3 STATE BD OF EDUCATION records → STATE BOARD OF ED** (label normalization).

### 1964 (15 fixes + 1 drop + 1 add)

Read the full-page editorial (128400_19641031_v2).

- **AUDITOR GRANT, ALEX → ARMIJO, ALEX** — editorial says Auditor is Alex Armijo, Treasurer is Joseph Grant. Names had been swapped.
- **CNTY CLERK MARTIN, LUCY → JARAMILLO, LUCY** — editorial says Clerk Lucy Jaramillo, Assessor George E. Martin. Surnames had been mixed.
- **CNTY COMM REDMOND, GERALD → GOODMAN, GERALD** — editorial says Goodman.
- **3 office swaps for Land Commissioner / Corporation Commissioner** — Hays/Vigil/Ferguson roles had been crossed: editorial has Hays for Land, Vigil + Ferguson for Corporation. CSV had them inverted. Fixed all three.
- **JUDGE COMPTON, J.C. → SUPREME COURT COMPTON, J.C.** — editorial: "Justice J.C. Compton is unopposed for re-election to the Supreme Court."
- **JUDGE BROWN, JOHN E. → PROBATE JUDGE BROWN** — editorial: "Probate judge: John E. Brown".
- **JUDGE KJELLSTROM → SMALL CLAIMS JUDGE KJELLSTROM** — editorial: "Small Claims Court: Nils T. Kjellstrom".
- **STATE REP d3 BAEA → BARBOA, EDDIE R.** (OCR variant).
- **STATE REP d9 RICHARD, BEAUCHAMP → ROBB, RICHARD** — heavily garbled; editorial: "9. Richard Robb".
- **STATE REP d11 MARY, R. → BEAUCHAMP, MARY E.** — heavily garbled; editorial: "11. Mary E. Beauchamp".
- **STATE REP d6 LUCERO, ANTHONY A. → GONZALES, VICTOR JR.** + **d7 GONZALES, VICTOR → STEELY, PHINEAS** — districts had been shifted/misextracted.
- **SURVEYOR MERTZ, WALLACE A. → BLEHER, WALLACE A.** — editorial: "Surveyor: Wallace A. Bleher".
- **SHERIFF WILSON, JOE dropped** — empty endorsement; editorial only endorses Mrs. Lester Hay.
- **CNTY TREASURER MONABAN, EDNA added** — editorial mentions "Edna Monaban for re-elected splendid conduct of the treasurer's office" but the CSV had no County Treasurer record.

### 1958 (+3 candidates +5 propositions — Pattern J re-extraction)

Read 128400_19581031 to test whether the "OCR limited content" review-queue claim was accurate. **The PDF is in fact readable.** Added:

- **GOVERNOR MECHEM, EDWIN (R) endorsed** — incumbent; editorial: "We think Mr. Mechem is entitled to another term in the governor's chair."
- **GOVERNOR BURROUGHS, JOHN (D) opposed** — Democratic challenger from Portales.
- **LT GOVERNOR MEAD, ED (D) endorsed** — "successful Albuquerque businessman and the Democratic candidate".
- **5 NM Constitutional Amendments** (1-5) all endorsed YES per the editorial.

### Pattern I duplicate removal (initial pass, 31 records)

Initial verification before the deep spot-checks. Same cross-office/format-variant cluster as the Journal (1968 generic JUDGE re-coding of judicial records; office-label variants like RAILROAD COMMISSION vs CORPORATION COMMISSIONER; TREASURER vs CNTY TREASURER; STATE BOARD OF ED vs STATE BD OF EDUCATION; ticket-pair errors like 1968 ALARID Gov+LtGov and 1970 SKEEN Gov+LtGov).

### Pattern J re-extractions (Phase 1)

- **1980 (1 record → 35 cands + 6 props):** "It'll soon be over" clipping. Federal/statewide + 5 state senators + 15 state reps + 2nd Judicial + DA + Metro Judge + full Bernalillo County slate + 4 amendments + 2 bonds.
- **1994 (0 → 57 cands + 26 props):** Year was completely absent. Full Tribune Recommendations slate from very clear image.

## raw/parts/ JSON sync

JSONs synced for 1980 and 1994 (Phase 1 additions). The 1958 addition and the 1964/1968/1970/1972 verification fixes have not been written into parts/ JSONs in this pass — the done/ CSV is authoritative; if compile.py is rerun, it would regenerate the wrong (pre-verification) data. Flagged as an open item.

## Spot Check Results

Five clippings independently read (1958, 1964 full-page, 1968 Recommendations, 1970 list of endorsements, 1972 The Tribune's choices). Each surfaced at least 5+ accuracy issues that the original 2026-04-29 pass had missed. Earlier 1980/1994 reads were full re-extractions and surfaced complete-section gaps (Pattern J). Across all verifications: **50+ granular accuracy fixes applied beyond the duplicate removals**.

## Phase 3 Additions (verification of 1962/1966/1986/1996)

### 1962 (1 fix)
- **REDMAN, JACK H endorsed blank → 0** — editorial "we give the edge to Montoya" implies Redman opposed. Each 1962 clipping covers a single race (not a recap), so Pattern J does NOT apply; the 12 records are reasonable for the format.

### 1966 (2 office reclassifications + 3 prop dedups)
Read "Vote for Progress" (128400_19661107_v3) listing the Tribune's 10 endorsed candidates.
- **GALLEGOS, ISIDORE JUDGE → SMALL CLAIMS JUDGE**
- **MABRY, SCOTT JUDGE → PROBATE JUDGE**
- Dropped 2 duplicate $42.5M state colleges bond records and 1 duplicate $3.5M flood control bond record (props 6 → 3).

### 1986 (3 fixes + 1 drop + 1 add)
Read "The Tribune's choices" recap (128400_19861103).
- **SCOTT, ROBERT H. JUDGE → PROBATE JUDGE**
- **STATE REP d21 BACA, PATRICIA → PITTMAN, PATRICIA M.** (editorial: "Patricia M. Pittman")
- **LEWIS, JAMES B. → JAMES E.** (state treasurer)
- **Dropped STOVER, BOB SHERIFF** (editorial only endorses Campbell)
- **Added CORPORATION COMMISSIONER NIASEN, ROB** (missing per editorial; surname uncertain)

### 1996 (4 fixes + 10 candidate adds + 11 proposition adds)
Read "The Tribune recommends" (128400_19961104) — comprehensive late-period recap.
- **Fixes:** SCHNEIDER first name garbled `?` → DANIEL; SANCHEZ, RAYMOND added dist=15 + middle G.; BACA, F. SHIRLEY → E. SHIRLEY (H d2); SCHIFF, STEVEN → STEVEN H.
- **Added candidates (10):** 4 State Senate (Eisenstadt d9, Miller d21, Carraro d23, Maloof d26), 2 State House (Beam d18, Picraux d25), 2 DCJ retention (Ross Sanchez, Theresa Baca), 2 Flood Control Board (Meeker, Brown).
- **Added propositions (11):** Constitutional Amendments 4-7 (For/Against), State Bonds A-D, Bernalillo County Bonds Roads/Sewers/Libraries.

### Phase 5: Verification of remaining modern recaps + pre-1960 Pattern J (2026-05-28)

Eight more years verified by reading recap/dense clippings. Phase 5 totals: **16 cand fixes, 4 cand drops, 87 cand adds, 7 prop dups dropped, 4 prop adds, 2 prop fixes**.

**1982** (128400_19821101 "Our endorsements for Tuesday's election"): HAWK d18 was dup of d19 (editorial says d20 — kept d19, dropped d18); WALLER→WALKER (sheriff name fix); EMMONS reclassified TREASURER → AUDITOR (and added MCBERSON as Treasurer); Missing: SEC OF STATE Clara P. Jones, AG Bardacke, Treasurer McBerson, Corp Comm Serna, Supreme Court Stowers, State Reps d12/13/17/19. JUDGE THOMSON → PROBATE JUDGE. 3 prop dups: MERIT-SELECTION = AMD-1, SEVERANCE-FUND = AMD-2, LIQUOR-REF = SUNDAY-LIQUOR.

**1988** (128400_19881107 "The Tribune's choices — Recap"): 6 cand fixes (PASTERNAK,ANNIE → PASTER,JANICE d10; CAUDILL → CAUDELL d22; HOCEVAR → HOOVER d29; MCDANIEL,TOM PROBATE → MESCALL,TOM (real McDaniel was Corp Comm); GILBERT add D3; BISHOP → BISHOP,ROBBIN). 14 adds: Senate Bingaman, Supreme Court Baca, Corp Comm McDaniel, Senate D14 Aragon, State House D19/D22/D25/D30/D44 (Hawk/Shepherd/Minzner/McMullan/Eisenstadt), Metro Court Div V Medrano, Comm D4 Cassidy, Assessor Torres, Sheriff Campbell, Flood-control Hereford. 3 prop dups (AMD-5, AMD-7, BERN-ROADS unnamed dup); 4 adds (Amendment 2 Removal of appointees, Amendment 4 Libraries, BERN-ATHLETIC, BERN-RECYCLING); AMENDMENT-3 endorsed field was blank, set to 0.

**1976** (128400_19761101 "Tribune endorsements"): 3 cand fixes (EASTHAM dist 16 → 15; BIER party D → R; 1988 CORP COMM → RAILROAD COMMISSION for cross-year convention consistency). 2 adds: Flood Control Authority (2 seats) SWINBURNE B.H. + DOAK VERNON.

**1978** (128400_19781106 "Tribune endorsements"): 2 cand drops (OLIN,RONALD dup of OLGUIN d11; SHERIFF ELMERS,WILLIAM not in recap and no county/dname). 15 adds: US Rep D1 Lujan, Lt Gov Mondragon, SOS Hooper, State Auditor Emmons, State Treasurer Hartke, Public Lands Armijo, Court of Appeals 8-yr Hawson + 6-yr Andrews, State Reps D10/D15/D18/D19/D20/D21/D22 (Saavedra/Schalk/Carraro/Hillery/Friling/Padoven/Horan). Inline party fixes for PENA D23 (added D), COLLADO D14 (added R). 1 prop fix: BERN-1 endorsed 0 → 1.

**1960** (128400_19601107 "The County Ticket"): Pattern J — 14 cand adds (6 State Reps Thomson/Kirk/Smith/Beasley/Traub/Rutherford; DCJ McManus; DA Strong; Treasurer Kleinbein; Assessor Giannini incumbent; Clerk Gonzales; Sheriff Hay; Surveyor Bisbee; Probate Judge Cuhen). 1 prop dup: BERN-HOSPITAL-LEVY dup of BERN-HOSPITAL.

**1952** (128400_19521101 "Senate Race"/"Land Office" + 128400_19521103 "Horn for the Senate"/"Still Mr. Robinson"): 1 cand fix (HORN R → HORN,CALVIN D — was previously coded as Republican; clipping clearly says Calvin Horn is Democratic candidate endorsed over Addison Strong (R)). 10 adds: 6 State Reps Bernalillo Co. at-large (Darrow, Bingham, McManus, Horne, Soto, Borland), AG Robinson, Land Comm Walker, State Auditor Castner, Supreme Court Lujan. Pattern J — year had only 7 cands; now 17.

**1956** (128400_19561105 "The County Ticket"): Pattern J severe — year had only 2 cands (Governor's race); 23 adds: 3 Cnty Comm (Mead D1, Otto D2, Salazar D3), Sheriff Flaska, 2 DCJ (Macpherson, Tackett), DA Murphy, State Sen Rice, 9 State Reps at-large (Mann, Roberts, Rothgeb, Eastham, Thompson, Yudin, Hines, Morrow, Chacon), Clerk Montoya, Treasurer Monahan, Assessor Armijo, Surveyor Sanchez, Probate Cain, Small Claims Dunlap.

**1954** (128400_19541101 "The Bond Issues" — midterm): 1 cand drop (PRESIDENT EISENHOWER bogus — no presidential race in 1954 midterm). 3 prop dups dropped (STATE-INST ambiguous low-conf dup of STATE; my STATE-1954 add was dup of existing STATE; my BERN-COURTHOUSE-1954 add was dup of existing BERN-COURTHOUSE).

### Phase 6: Pre-WWII year verification (2026-05-28)

Four remaining unverified years (1934/1936/1940/1948) inspected.

**1934** (4 clippings read: 19341031 'Through the Fog', 19341101 'County Commission' + 'Democratic Legislature', 19341102 'The Reasons', 19341103 'Open Letter to Tingley'). All 10 existing CSV records confirmed correct (Senate Cutting + Hatch + Dillon-opposed, US Rep Miera over Dempsey, Gov Tingley over Miller, 3 County Commissioners). No additions; 1934 is fully captured given that Tribune endorsements that year were dispersed across multiple commentary editorials rather than a unified recap.

**1936** (1 clipping read: 19361102 multi-section editorial including 'SUMMARY' and 'THE COUNTY TICKET'). Existing 22 CSV records are reasonably comprehensive at the resolution available. PDF resolution prevented reliable extraction of any remaining detail; the Senate section currently shows all 3 candidates opposed (Chavez D-incumbent, Otero R, Everly R) which is unusual but matches the editorial tone of "we regret — Tribune cannot support" for Chavez and critical commentary on the Rs.

**1940** (4 clippings read: 19401028/19401029/19401031/19401102). All four pages are commentary editorials ('WE ARE FOR WILLKIE', 'The Men Who Might Be President', 'Climbing', 'Meeting The Call'). Existing 3 CSV records (Willkie endorsed, McNary endorsed for VP, Wallace opposed) are all the candidate-level endorsements found in the readable clippings. The Tribune's 1940 endorsement format was single-issue editorials, not a recap — extraction appears complete.

**1948** (2 clippings read: 19481101 'STATE TICKET'+'SUMMING UP' too low-resolution to extract; 19481030 'THE COUNTY TICKET' readable). **Major Pattern J found** — 1 cand fix + 18 cand adds:
- **FLASKA, JOHN** office fix: ASSESSOR → SHERIFF. The 1948 County Ticket clipping clearly says "Tribune already has endorsed the candidacies of John Flaska, Democrat, and Edna Monahan, Democrat, for the offices of sheriff and treasurer." The previous CSV record had John Flaska as Assessor (he was Assessor in 1936, but switched to Sheriff by 1948).
- **18 adds:** 3 County Commission (HAYDEN-R-D1 inc, CORNELIUS-D-D2 inc, GRIEGO-R-D3); CNTY TREASURER MONAHAN, EDNA; PROBATE JUDGE STRONG, ADDISON L (R, inc); CNTY CLERK MONTOYA, RAMONA MRS; ASSESSOR O'BANNON, DANIEL (D, inc — the *real* 1948 assessor endorsement); SCHOOL SUPT CHAVEZ, ADOLFO P; SURVEYOR CABANISS, JACK K (R); 3 STATE REP Bernalillo at-large (SIMMS-D, HORN-D, PEREA-D); DCJ Div 2 ARLEDGE, R. F. DEACON (D, inc); 2 STATE SENATOR Bernalillo (HEYN-R endorsed over MONTOYA-D); 2 STATE SENATOR Shoestring District (CORNELL-R endorsed over GINN-D); DA TACKETT, PAUL (D).
- 1948 went from 5 cands → 23 cands (a 4.6× increase).

## Phase 6 parts/ JSON sync

Synced parts/ JSON for 128400_19481030 ("THE COUNTY TICKET" recap) — 23 cands + 1 prop.

## Phase 5 parts/ JSON sync

Synced parts/ JSONs for 8 Phase-5 clippings (19821101, 19881107, 19761101, 19781106, 19601107, 19521103, 19561105, 19541101). 19521101.json cleared (records consolidated into 19521103).

## Phase 3 parts/ JSON sync

Regenerated parts/ JSONs for 11 years (1958, 1962, 1964, 1966, 1968, 1970, 1972, 1980, 1986, 1994, 1996) from the corrected done/ CSV. Each year's records were consolidated into the primary clipping JSON with a `regen_note` documenting the regeneration. Per-clipping detail for other clippings of those years was effectively lost during the verification — done/ CSV is authoritative going forward.

## Open Items

1. **raw/parts/ JSON sync** is now done for the 11 verified years. JSONs for OTHER years (1934/1936/1940/1946/1948/1952/1954/1956/1960/1976/1978/1982/1984/1988/1998/2000/2002/2004) are still the original extraction outputs.
2. **Other Tribune years not deeply verified** in this pass: 1934, 1936, 1940 (3 records over 4 clippings — likely under-extracted), 1946, 1948, 1952, 1954, 1956, 1960, 1962 (12 records over 7 clippings — suspicious), 1966 (11 records over 4 clippings — suspicious), 1976, 1978, 1982, 1984, 1986, 1988, 1996, 1998, 2000, 2002, 2004. The deep verifications I did surfaced 5+ errors per year in 1964/1968/1970/1972; **similar error rates likely exist in unverified years**.
3. **1996/1998/2000/2002/2004 late-period Tribune** — review queue notes some clippings "not fully extracted" — could yield additional records.
4. **4 other 1958 clippings** (128400_19581028, 19581029, 19581101, 19581103) — only the 10/31 clipping was read; the others likely have more candidate records (this 10/31 clipping only had statewide + amendments; legislative/county slate might be in the others).
5. **Pre-1960 OCR-failed years (1942/1944/1946/1950)** — based on the 1958 finding, these PDFs may also be readable. ~9 clippings total.
6. **1982 HAWK ROBERT M. dist 18 vs 19 conflict** — not resolved.
7. **1968 NEFF DAN E. vs DANE** — kept DAN E. per editorial; one potentially-correct alternative spelling was dropped.
8. **Cross-paper consistency check vs Journal** — done/CROSS_PAPER_CHECK_ABQ.md exists at coarse grain; not re-evaluated.
9. **1964 Amendment 3 description** — CSV says "Changes the number of New Mexico Western College trustees" but editorial says "Changes the name of New Mexico Western College to New Mexico Western University". Description should be corrected.
10. **Tribune ceased publication 2008** — no clippings for 2006/2008.

## Recommendation

PASS WITH FIXES. The full verification pass (after Kevin pushed back on the initial superficial pass) substantially improved data quality across 1964/1968/1970/1972/1958 — these years now have correct office codes, correct names, and correct party labels. Pattern J is confirmed to extend to pre-1960 OCR-failed years (PDFs are readable; the original pipeline failed). The substantial Open Items list (especially #1 parts/ JSON sync and #2 unverified-years error rates) suggests a future deeper pass is warranted before this paper is treated as analysis-ready for the affected years.
