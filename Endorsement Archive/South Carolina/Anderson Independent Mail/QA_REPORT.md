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
