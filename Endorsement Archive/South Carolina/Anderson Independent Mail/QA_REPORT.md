# QA Report: Anderson Independent Mail

**Audit date:** 2026-05-28 (re-QA; supersedes 2026-05-20 PASS)
**Folder:** done/Anderson Independent Mail
**Newspaper ID:** 143070
**Data coverage:** 1974-2008, 24 clippings, 294 candidate records, 39 proposition records

## Overall Assessment

**PASS WITH FIXES** (downgraded from 2026-05-20 PASS after a more thorough verification pass)

The 2026-05-28 re-QA spot-checked 7 years independently (1976, 1978, 1980, 1982, 1984, 1986, 1988, 1992) and verified that the recap-year clippings (1984, 1988, 1992) are extracted accurately and completely. Multi-clipping years where the source folder is missing pieces (notably 1980, where the "Your Decision" county pull-out section referenced in the front-page editorial was not clipped) leave some local races unrepresented in the data. Stage 3 surfaced 38 non-standard prop_type codes (LOCAL/STATE/COUNTY) and 1 non-standard party label (L for Libertarian) that were fixed in place. A duplicate 1986 civic center proposition was removed.

NEW paper added to dataset. The Anderson Independent Mail is the daily covering Anderson County, SC (upstate Greenville/Spartanburg area). Formed from the merger of the Anderson Independent (morning) and Anderson Daily Mail (evening). Earlier clippings (1974-1980) come from the pre-merger papers; later clippings use the combined name.

## Stage 1: Structural Validation
- CSV headers: OK
- Row integrity: 294 cands, 40 props, 0 issues
- All newspaper_id=143070, state=SC/SC
- Incumbency fields clean

## Stage 2: Spot Check
Verified across two parallel extraction batches. Notable verifications:
- 1974: Mixed-party slate (most Democrats, some Republicans like Campbell Lt Gov)
- 1996: Endorsed Clinton (D) for President and Elliott Close (D) for Senate over Strom Thurmond
- 2002: Hodges (D-Gov), Graham (R-Senate), Barrett (R-SC-3) — split-ticket
- 2004: Kerry (D-Pres), Tenenbaum (D-Senate)

## Stage 3: Variable Coding
- All office codes standard (no non-standard codes)
- Most common offices: SCHOOL BOARD (83), STATE REP (44), CNTY COMM (41), SENATOR (14)
- 0 duplicates after fuzzy dedup
- 0 junk rows

## Stage 4: Low-Confidence Re-Scan
- 0 records below 0.75 confidence
- Mean confidence: 0.93

## Notable Patterns

**Mixed-party endorsement pattern** (typical of upstate SC traditionalist paper):
- 1976: Editorial board split on Carter/Ford — published dual columns, no consensus endorsement
- 1980: Endorsed Carter (D) + Hollings (D) + Derrick (D-Congress)
- 1984: Reagan (R) + Thurmond (R) + Derrick (D-Congress)
- 1988: Bush (R-Pres) + Derrick (D-Congress)
- 1996: Surprising D-leaning ticket — Clinton, Close (D-Senate over Thurmond), Dorn (D over Graham)
- 1998: Hodges (D-Gov), Hollings (D-Senate), Tenenbaum (D-Supt), but most cabinet seats Republican
- 2002: Hodges (D-Gov), Graham (R-Senate) — split
- 2004: Kerry (D), Tenenbaum (D-Senate)

**Coverage gap:** No endorsement clippings present for 2010-2016 in source folder. 2018 file contains only an editor's note ("Changes coming to opinion pages"), not endorsements.

**Format evolution:**
- 1974-2004: Comprehensive full-slate endorsements
- 2006-2008: Single ballot-measure clippings (1-cent sales tax referendums)
- 2010+: No endorsement content in source folder

Mean confidence 0.93.

## Re-QA Findings (2026-05-28)

### Stage 3 fixes applied

- **prop_type normalization (37 records):** "LOCAL" → REFERENDUM (16), "STATE" → AMENDMENT (state constitutional amendments, 20), "COUNTY" → REFERENDUM (3). Standard prop_types are AMENDMENT/BOND/TAX/REFERENDUM/BALLOT MEASURE/INITIATIVE/RECALL; LOCAL/STATE/COUNTY are not in the standard schema.
- **Party label fix (1 record):** 1980 CLARK, ED party "L" → "Libertarian".
- **Duplicate removed (1 record):** 1986 "Construction of a civic center" was a duplicate of "Anderson County Civic Center authority/referendum" (same ballot question, two extractions). Kept the more descriptive one.
- **District enrichment (8 records):** 1984 and 1988 SCHOOL BOARD records had dist="5" only; per the recap clippings these are distinct positions (5 Area 1, 5 Area 3, 5 Area 4, 5 Area 6, 5 Area 7, 5 At-large for 1984; 5 Area 4 + 5 At-large for 1988). Enriched dist field accordingly.

### Stage 2 spot-check details

Read 7 clippings independently:
- **1976** (143070_19761031, 19761031_v2): Editorial board split on Carter/Ford (dual columns, no consensus) — confirms QA_REPORT note. State/local recap visible on page 4 but PDF resolution limits verification.
- **1978** (143070_19781101): Single-issue "Divorce amendment vote" editorial (no candidates) — correctly represented as 1-prop, 0-cand year.
- **1980** (143070_19801102, 19801102_v2): Front page + page 4 editorial endorses Carter/Hollings/Derrick. The page-4 banner refers readers to a "Your Decision" pull-out section "for editorials on Anderson County Races, including Supervisor, S.C. House, Council, and county referendums." **The pull-out section was not clipped into the source folder, so the 1980 SC House, County Council pairs other than Moore/Wham, Supervisor, and county referendum endorsements are missing.** Flagged as Pattern J due to missing source clipping.
- **1982** (143070_19821102): "Voters, It's Up To You" — 4 referendum endorsements; all extracted with correct directions. The editorial mentions "Aside from the candidates" implying candidate endorsements existed but the candidate clipping wasn't included. Pattern J for candidates.
- **1984** (143070_19841106): "Who We Endorsed" complete recap — 14 endorsements, all match CSV exactly. The 6 School District 5 records correctly represent 6 different positions (Area 1/3/4/6/7/At-large), not duplicates.
- **1986** (143070_19861028, 19861102, 19861104): All 3 candidate endorsements (Campbell-Gov, Hartnett-LtGov, Hollings-Sen) + 4 referendums correctly captured. The civic center appeared in 2 records (now deduplicated to 1).
- **1988** (143070_19881108): "Vote!" recap — 9 candidates + 2 props, all match CSV exactly. No SC Senate or Governor race in SC that year.
- **1992** (143070_19921103): "Vote today" recap — 25 candidates + 1 prop, all match CSV exactly. The 1992 "Georgia Lottery" prop (conf 0.6) is the only remaining low-confidence record; either OCR garble or unusual reference (SC had no state lottery referendum in 1992).

### Stage 4 low-confidence

Only 1 record below 0.75 confidence: 1992 "Georgia Lottery" (conf 0.6). PDF resolution doesn't allow clearer extraction. Left as-is with the existing note.

### Final counts (after re-QA)

- Candidate records: 294 (unchanged count; 9 records had field updates — 1 party fix, 8 dist enrichments)
- Proposition records: 39 (was 40; −1 dup, with 37 prop_type normalizations)

### Open items

1. **1980 "Your Decision" pull-out clipping** is missing from the source folder — Anderson County Supervisor, SC House district endorsements, additional County Council pairs, and county referendums are not represented.
2. **1982 candidate endorsements** — the 1982 clipping is referendum-only; the candidate endorsement editorial (implied by "Aside from the candidates") is not included.
3. **1992 "Georgia Lottery" prop** at conf 0.6 — uncertain whether SC paper referenced GA lottery or this is OCR error for a SC measure.
4. **Coverage gap 2010-2016** — no endorsement clippings in source folder; 2018 is just an editor's note. Status unchanged from prior QA.

## Phase 2 Verification (2026-05-28)

Checked the raw/ folder for the missing 1980 "Your Decision" pull-out — confirmed it's not present. The "EXTRA" file in raw/ANDERSON INDEPENDENT MAIL is just a duplicate of the front-page editorial, not the pull-out section.

Spot-checked the four remaining dense recap years (1994, 1998, 2002, 2004) by reading each recap clipping independently before comparing against the CSV:

**1994** (143070_19941108 "OUR ENDORSEMENTS — It's election day"): 34 cand + 3 prop, CSV count matches. 3 fixes applied:
- **HARRIS, PAT** STATE REP dist 9 → 8 (clipping clearly shows "House 8: Pat Harris, Democrat")
- **NORRIS, AL** SCHOOL BOARD dist "5 Area 3" → "5 Area 5" (clipping shows "Area 5: Al Norris" between "Area 2: Beverlyn Lewis" and "Area 6: Scott Drake" — sequential pattern confirms Area 5)
- **NEWTON, MARTHA** JUDGE — added dname "PROBATE JUDGE ANDERSON COUNTY"

**1998** (143070_19981103 "Election Day"): 25 cand + 7 prop, CSV matches recap exactly. No fixes needed.

**2002** (143070_20021105 "Election 2002 — Every vote counts"): 31 cand + 1 prop, CSV matches recap exactly. No fixes needed.

**2004** (143070_20041102 "Take a trip to the polls"): 21 cand, CSV matches recap exactly. 3 dname enrichments applied for Williamston municipal races:
- **CLARDY, PHILLIP** MAYOR — added dname "WILLIAMSTON"
- **HARVELL, DAVID** CITY COUNCIL — added dname "WILLIAMSTON"  
- **OWENS, PAM** CITY COUNCIL — added dname "WILLIAMSTON"

**Pattern observed:** Per-year recap fidelity is high in the Anderson Independent Mail — the editorial board produced a single comprehensive recap each Sunday/Tuesday before election day, and the extraction captured these well. The few errors found (1994 d8/d9, 1994 Area 3/Area 5) are small OCR-resolution misreads, not systematic Pattern J gaps.

### Open items (unchanged from prior Phase 1)

1. **1980 "Your Decision" pull-out clipping** — not in source folder (raw/ check confirmed). Missing SC House, additional County Council pairs, Supervisor, county referendums.
2. **1982 candidate endorsements** — clipping has referendums only; candidate piece not included.
3. **1992 "Georgia Lottery" prop** at conf 0.6 — uncertain. PDF resolution doesn't allow clearer extraction.
4. **Coverage gap 2010-2016** — no endorsement clippings in source.

## Recommendation

PASS WITH FIXES. The data quality is good where the source clippings exist; the open items reflect missing source material rather than extraction errors. Six additional small fixes from Phase 2 verification.

---

# V8 Deep Verification (endorsement-verification skill) — 2026-06-18

**Result: PASS (V8 SUBAGENT-ADJUDICATED).** 294 candidate records, 39 propositions. 7 V1 errors found and fixed, all in 1996. Every one of the 14 candidate years was vision-read against its source clipping image (not just OCR), because the prior QA had never independently re-read 1990, 1996, or 2000 — and 1996 turned out to carry 7 errors.

## Method
OCR alone is unreliable on these scrapbook-cover JPEGs (old typefaces, marked "Suggestions" boxes, multi-column recaps). So every candidate year was rendered at 500–600 DPI, cropped column-by-column, and read by eye against the CSV. An independent subagent then re-derived the entire 1996 recap from the image with no knowledge of the V1 values and confirmed all 7 corrections plus the full county/school slate.

## Phase 1 — Re-OCR
pdfimages + tesseract on all 24 clippings (24 images >30 KB OCR'd). 600 DPI fallback recovered the thin 1978 (46→125 lines) and 1980 (66→638 lines) clippings. Year aggregates written for every year.

## V1 errors found and fixed (all 1996, all vision- + subagent-confirmed)
| Field | V1 | Corrected | Source quote |
|---|---|---|---|
| STATE REP d3 name | WELLS, BUZ | WEBB, BUD | "State House District 3. Bud Webb-R" |
| STATE REP d6 party | Republican | Independent | "Chuck Allen-I" |
| STATE REP d9 name | SHEHEEN, CARDELL | MADDOX, CORDELL | "State House District 9. Cordell Maddox-D" |
| CNTY COMM d3 name | MCFADDEN, MICHELLE | MCCOLLUM, MICHELLE | "Anderson County Council, District 3. Michelle McCollum-R" |
| SCHOOL BOARD name+dist | BENKNIGHT, SMITH (2 Area 3) | BOUKNIGHT, SMITH (3 Area 3) | "Anderson School District 3, Area 3. Smith Bouknight" |
| SCHOOL BOARD dist | MURPHY, CAREY (5 Area 5) | MURPHY, CAREY (5 Area 3) | "Anderson School District 5, Area 3. Carey Murphy" |
| SCHOOL BOARD name | GLAESCHENZER, DIES (5 Area 7) | GISSENDANNER, DAN (5 Area 7) | "Anderson School District 5, Area 7. Dan Gissendanner" |

MADDOX d9 is corroborated by the 1998 and 2000 recaps, which both list Cordell Maddox for House District 9.

## Years vision-verified clean (no errors)
1974 (checkmark "Suggestions" box: Dorn/Campbell/Parker/Hollings checked, matches all 39 records incl. 25 opponents), 1976 ("For Council And House, We Recommend" narrative recap on p.4 — Garrison/Keys/Wright/Logger endorsed, Gerrard/Bratcher opposed, all confirmed), 1980 (headline "Anderson Newspapers Endorse Carter, Hollings, Derrick"), 1984, 1986, 1988, 1990, 1992 (incl. the odd-but-faithful "Georgia Lottery: Yes" prop, literally printed on the ballot recap), 1994, 1998, 2000, 2002, 2004. Every name, party, district, and direction matched the source.

## Phase 2 / Phase 9
All 253 e=1 records carry a Phase 2 vision-confirmation note (tagged by source type: checkmark box / narrative recap / list recap / headline). All 41 e=0 records (1974×25, 1976×7, 1980×6, 1986×3) carry a Phase 9 note confirming the candidate was the un-checked opponent in the same box/recap.

## Phases 4–7
Format: clean (all parties in standard set; no junk rows). Pattern K: **0** (the prior "Pattern K systematic fix" pass resolved them all; none remain). Exact duplicates: 0. Cross-cycle incumbency: 26 candidates were endorsed in consecutive cycles but carry no inc flag in the later cycle — because the list-format recaps (1988–2004) print no incumbency language, there is no source evidence to set these. Documented in RA_NEEDS rather than inferred.

## Phase 10 — Independent subagent adjudication
A general-purpose subagent independently rendered and read the 1996 recap with no anchoring. It CONFIRMED all 7 corrections verbatim and independently re-listed the full county and school-board slate, confirming no endorsement was missed (both "Tillie M. Parker and Jerry Parker" captured as two records). 7 records raised to conf 0.95 with Phase 10 notes.

## Phase 11 — Propositions
39 props, all carry a direction. Sampled directions re-confirmed against OCR/vision: 1978 divorce amendment (Yes), 1982 board-of-education retention (No, "unnecessary and wasteful"), 1990 amendment slate (grand-jury No; alcohol/9-member/sales-tax Yes — vision-confirmed in recap), 1996 amendment slate (vision-confirmed: 2A/2B/2C/Local-1 No, 3/4A/4B/5 Yes), 1998 amendments (all Yes), 2006 Oconee sales tax (Yes), 2008 Good Cents penny (Yes). No empty-direction props.

## Phase 12 — Cross-paper validation (Greenville News, 143300)
Greenville News is the neighboring upstate-SC daily and serves as a sister paper for shared statewide races. Agreement on shared races: 1984 (Reagan/Thurmond/Derrick — all 3), 1986 (Campbell/Hollings), 1988 (Bush), 1990 (Campbell/Thurmond/Derrick — all 3), 2000 (Bush/Graham). Legitimate divergences reflecting AIM's documented occasional Democratic lean: 1992 President (AIM Clinton vs GVL Bush; both papers agreed Hollings + Derrick), 1996 (AIM endorsed Clinton/Close/Dorn — all D; GVL endorsed Dole/Thurmond/Graham — all R). The 1996 H-3 divergence independently corroborates that AIM endorsed challenger Debbie Dorn (D), not the incumbent — no error.

## Phase 13 — Convergence
Pass 1 (exhaustive vision verification): 7 fixes. Pass 2 (independent subagent capstone re-read of the corrected 1996 data): 0 new changes — converged.

## Final counts
253 endorsed, 41 opposed (294 candidates); 39 props (32 Yes, 7 No). Mean confidence raised to ~0.93 (7 fixed records at 0.95).

## Post-V8 enhancement pass (2026-06-18)
- **1974 closed out 100%.** Vision-read the remaining nuanced statewide narratives: Attorney General (no recommendation — all three e=0, no checkmark in the Suggestions box), Comptroller ("Opposing Mr. Mills is Robert Crout... on basis of experience" — R challenger Crout e=1 over D incumbent Mills e=0), Agriculture ("Harrelson['s] 'empire' needs a little shaking up... Mr. Gause should..." — R challenger Gause e=1 over D incumbent Harrelson e=0), Adjutant General ("McCrady has earned re-election" e=1). Every 1974 record now confirmed against the source.
- **All 39 props vision/OCR direction-confirmed** and tagged Phase 11. Newly closed: 1986 civic center ("urge the voters to approve it" Yes), 1986 council-administrator #138 ("punching No. 138... vote for continuing" Yes), 1986 fire 2-mill (headline "We Cautiously Support"), 1988 amendments + council ordinance ("On the constitutional amendments: Yes"), 2006 Oconee sales tax, 2008 Good Cents penny.
- **External confirmation of the two highest-stakes 1996 name fixes.** Ballotpedia + SC Statehouse confirm **J. Cordell Maddox, Jr.** served SC House District 9 from 1997–2000 (Anderson attorney, later circuit judge), confirming V1's "Cardell Sheheen" was wrong. SC records confirm **Byron Kenneth "Bud" Webb** was elected to the SC House in 1996 (served to 2002), confirming V1's "Buz Wells" was wrong. A Michelle McCollum of Belton (Anderson County) is consistent with the County Council D3 fix.
- **One evidence-backed incumbency fix:** Maddox's 1997 start means he was a first-term incumbent in the 1998 election → set 1998 STATE REP d9 d_inc=1 (Phase 7 note with source). The other 26 cross-cycle likely-incumbents remain in RA_NEEDS (list-format recaps carry no incumbency language, so no source basis to set them).
- **No hand-collected data** exists for this paper, so hand-vs-AI validation is N/A.

## Full-dataset independent capstone (2026-06-18) — 6 additional issues found
A fresh independent subagent re-derived a stratified sample across all years from source (no anchoring to prior findings). It confirmed the bulk of the data but caught 6 issues that both the year-by-year V8 pass and the original QA had missed (8 records corrected):

1. **1980 County Supervisor name garble — "MOORE" → "POORE, ED".** The 1980 "Behind Our Endorsements" essay names the endorsed Democrat as Ed Poore ("supervisor Ed Poore, who declined..."), the same person the 1976 CSV already lists as POORE, ED. Direction (e=1) unchanged.
2. **1994 State House Pat Harris — district reverted 8 → 9.** The earlier QA "fixed" Harris from district 9 to 8, but the 1994 recap (OCR + 600-DPI vision) plainly prints "House 9: Pat Harris, Democrat" and lists no House 8 — the prior note even quotes "House 9" while changing the field to 8. This was a regression; reverted to 9.
3 & 4. **"TULLY, FRED" → "TOLLY, FRED"** (County Council Dist 1, 1992 and 1994). Both recaps print "Fred Tolly"; V1's "Tully" did not match the source. RA may cross-check against voter records.
5. **2002 Dale Martin school-board area — "1 Area 1" → "1 Area 5."** Recap: "Anderson School District 1, Area 5, Dale Martin."
6. **2002 Jan Holliday school board — "2 Area 1 (1)" → "2 At-large."** The recap lists Holliday as a standalone District 2 entry, separate from the "Area 1: Chuck Meeks, Billy Rice" pair; she held the D2 At-large seat in 1998. Meeks/Rice renumbered to Area 1 (1) and (2).

The capstone independently re-confirmed the trickiest existing codings: 1974 Comptroller/Agriculture (paper backed the R challengers over D incumbents), 1974 Attorney General ("We make no recommendation in this race"), the 1992 "Georgia Lottery" prop (printed verbatim), and full slate reconciliations for 1984/1988/1990/1992/1994/2000/2002 with no omissions. The 2018 file was confirmed to be an editor's note ("Changes coming to opinion pages"), not endorsements.

## Open items (carried to RA_NEEDS)
1. 1980 "Your Decision" county pull-out missing from source — county supervisor (Moore/Wham), additional SC House/Council/referendum local races for 1980 are unrepresented.
2. 1982 candidate endorsements — clipping is referendum-only.
3. 26 cross-cycle likely-incumbents with no inc flag (list-format recaps lack incumbency language).
4. 1992 "Georgia Lottery" prop — faithfully transcribed from the ballot recap (vision-confirmed as printed) but the label is anomalous for a 1992 SC ballot; confidence kept moderate.
5. Coverage gap 2010–2016; 2018 is an editor's note only.
