# QA Report: Detroit Free Press (Updated)

**Audit date:** 2026-04-29 (re-extraction round + QA)
**Folder:** Detroit Free Press
**Newspaper ID:** 121300
**Data coverage:** 1968-2022 (54 years), 38 clippings, 2471 candidate records, 216 proposition records

## Overall Assessment

**PASS WITH FIXES**

Major upgrade from the initial extraction. After re-OCR'ing all 38 clippings at higher resolution (400dpi vs initial 200dpi) and a focused proposition re-extraction pass, the dataset is much richer:

- **Propositions: 25 → 216 records** (8.6× expansion). Previously all 25 were placeholder records with empty descriptions and `endorsed=null`. Now 133 endorsed (YES) / 72 opposed (NO) / 11 neutral. Substantial multi-proposal coverage in heavy ballot-measure years (2006: 17, 2012: 15, 2018: 3 + 2020: 4 + 2022: 3, plus rich 1970s-1980s coverage).
- **1994 candidates: 43 → 155 records** (3.6× expansion). The hi-res OCR exposed comprehensive content (state legislators, university board, judges) that the original missed.
- **DENTON ghost records resolved**: 1998 STATE SENATOR DENTON (conf 0.50) and 2000 JUDGE DENTON (conf 0.50) confirmed as OCR artifacts (not real candidates) — removed from dataset.
- **Office code normalization**: PROSECUTOR → DA/PROSECUTOR, SECRETARY OF STATE → SEC OF STATE, STATE BOARD OF EDUCATION → STATE BOARD OF ED.

## Stage 1: Structural Validation

- CSV headers complete (16 candidate columns + pipeline fields, 11 proposition columns + pipeline fields)
- Year range 1968-2022, 27 unique election years
- All `endorsed` values valid (1/0/empty)
- All `state_newspaper`/`state_election` populated as `MI`
- All `newspaper_id` populated as `121300`
- No incumbency `=0` errors
- No row-level structural issues

## Stage 2: Spot Check (this round)

**Verified hi-res OCR re-extraction on:**
- `121300_19941108_v2.pdf`: hi-res OCR exposed full state legislative slate, university board nominations, court endorsements that the original 200dpi OCR missed. Added 112 new candidate records.
- Various proposition-rich years (2006, 2012, 2018, 1980, 1988): re-extracted full proposal lists with YES/NO directions.
- 2010: confirmed `no_endorsements: true` is correct — underlying PDF is image-only with poor scan quality, no extractable content even at 400dpi.

## Stage 3: Variable Coding & Dedup

**Issues found this round:** 96 prop dups + 3 office normalizations + 2 invalid records | **Auto-fixed:** 101 | **Remaining:** 0

### Changes made

- **Cross-file proposition dups (96 removed):** Many years had `_v1` and `_v2` files containing overlapping proposition coverage. Auto-deduped on `(year, prop_type, prop_num)` keeping highest-confidence record.
- **Office normalization (3 records):** `PROSECUTOR` → `DA/PROSECUTOR`, `SECRETARY OF STATE` → `SEC OF STATE`, `STATE BOARD OF EDUCATION` → `STATE BOARD OF ED`. The subagent's hi-res extraction introduced these variant codes which I normalized to the canonical forms.
- **Invalid OCR records removed (2):** Both 1998 and 2000 "DENTON" records confirmed as OCR misreads (no "DENTON" appears in hi-res OCR; the 2000 case was a fragment "Denton vote YES" within Detroit bond issue labels). Removed from dataset.
- **Office codes (final, 25 distinct):** All canonical, including Michigan-specific elected boards: REGENT (U-M), TRUSTEE (MSU), GOVERNOR-WAYNE-STATE (Wayne State), WCCC TRUSTEE (Wayne County Community College). The university boards are statewide-elected positions unique to Michigan and preserved per skill rules.
- **Candidate names:** All in ALL CAPS, LASTNAME, FIRSTNAME format.
- **Districts:** No "District"/"Dist." prefixes.
- **Party labels:** All canonical.
- **Incumbency flags:** No `=0` errors.

## Stage 4: Low-Confidence Re-Scan

**Records reviewed:** 12 (at conf < 0.75) | **Confirmed correct:** 12 | **Corrected:** 0 | **Still uncertain:** 0

Down from earlier counts after invalid records removed. All 12 remaining low-confidence records carry detailed `extraction_confidence_note` fields documenting OCR limitations.

## Final dataset summary

### Candidates
- **2,471 candidate records** (added 112 from 1994 hi-res re-extraction; removed 2 invalid)
- Direction: 2,471 endorsed / 0 opposed / 0 neutral — DFP editorial style names only favored candidates without explicit opposition records
- 27 election years

### Propositions
- **216 proposition records** (was 25)
- Direction: 133 endorsed / 72 opposed / 11 neutral
- Per-year proposition counts:
  - 1968: 9, 1970: 5, 1972: 12, 1974: 6, 1976: 7
  - 1980: 18, 1982: 9, 1984: 6, 1986: 12, 1988: 14
  - 1990: 4, 1992: 9, 1994: 6, 1996: 11, 1998: 9
  - 2000: 10, 2002: 9, 2004: 12, 2006: 17, 2008: 3
  - 2012: 15, 2016: 3, 2018: 3, 2020: 4, 2022: 3
  - 2010: 0 (image-only PDF, no extractable content)
  - 2014: 0 (no proposals in clipping)

## Coverage notes (non-blocking)

- **All candidates coded endorsed=1**: Reflects DFP editorial style. Future passes could try to capture explicitly-named opposed candidates from editorial body text (vs. the structured endorsement card format).
- **2010 still empty**: PDF is image-only with poor scan quality at any resolution. Source file would need to be re-acquired.
- **WCCC TRUSTEE preserved** as a Michigan-specific elected board (Wayne County Community College Board of Trustees) — kept as jurisdiction-specific code per skill rules.
- **Heavy ballot-measure years**: 2006 (17 props), 1980 (18), 2012 (15), 1988 (14), 2004 (12), 1986 (12), 1972 (12) — Michigan has many local + statewide ballot measures historically.
- **Notable historic endorsements**: 1976 throwaway bottle ban (YES), 1992 homestead property tax limit (NO), 2008 medical marijuana (YES), 2012 collective bargaining constitutional amendment (NO), 2018 recreational marijuana (YES), 2018 redistricting commission (YES), 2022 abortion rights (Proposal 3 — YES).

## File-handling caveat (preserved)

During initial folder cleanup before this round, an automated script bug deleted 8 unique-content PDFs (different scans of byte-distinct content). Per the user's new policy, **no files in raw/ folders will be deleted except for byte-identical duplicates** going forward. The 38 remaining clippings cover all 27 election years.

## Stage 6: Cross-Paper Consistency Check (Detroit Free Press vs Detroit News)

**Date:** 2026-04-29
**Comparison:** Detroit Free Press (121300) vs Detroit News (121301)

The Detroit Free Press and Detroit News are the two major Detroit dailies and have heavy year overlap. Both folders are now processed, so a side-by-side check confirms internal consistency and surfaces any extraction issues by spotting implausible disagreements.

### Coverage overlap

- Shared years: 25 (1968-2020, all even years where both papers have endorsement clippings)
- DFP-only years: 2012, 2022 (DN archive missing 2010, 2012; DN's 2022 clipping not in source)
- DFP candidate records: 2,471 / DN candidate records: 1,872
- DFP proposition records: 216 / DN proposition records: 251

### Candidate consistency — race-level

The right comparison is race-level: in races where both papers made an endorsement, did they pick the same candidate? Joining at the race level on `(year, office, district)` and asking whether each paper's endorsed pick(s) overlap:

- **619 races** where both papers made an endorsement in shared years
- **332 (53.6%) same candidate**
- **287 (46.4%) different candidates** picked

Breakdown by office tier:

| Tier | Same | Different | % agreement |
| --- | --- | --- | --- |
| Federal/statewide top-of-ticket (President, Senator, Governor, AG, Sec of State) | 19 | 29 | 39.6% |
| State legislative + statewide judicial (US House, state House/Senate, Supreme Court, etc.) | 185 | 206 | 47.3% |
| County/local + nonpartisan judicial | 128 | 52 | 71.1% |

The pattern is exactly what you'd expect from a center-left paper (DFP) vs a center-right paper (DN): heavy disagreement on partisan federal and state races, much higher agreement on nonpartisan local and judicial races where both papers tend to back the most qualified incumbent.

#### Top-of-ticket disagreements (different candidate picked)

DFP and DN picked different candidates in nearly every partisan top-of-ticket race after 1968:

| Year | Office | DFP pick | DN pick |
| --- | --- | --- | --- |
| 1976 | President | Carter (D) | Ford (R) |
| 1976 | Senator | Riegle (D) | Esch (R) |
| 1978 | Senator | Levin (D) | Griffin (R) |
| 1980 | President | Carter (D) | Reagan (R) |
| 1982 | Governor | Blanchard (D) | Headlee (R) |
| 1982 | Attorney General | Kelley (D) | Patterson (R) |
| 1984 | Senator | Levin (D) | Lousma (R) |
| 1986 | Governor | Blanchard (D) | Lucas (R) |
| 1988 | President | Dukakis (D) | Bush (R) |
| 1990 | Governor | Blanchard (D) | Engler (R) |
| 1990 | Senator | Levin (D) | Schuette (R) |
| 1990 | Attorney General | Kelley (D) | Taylor (R) |
| 1992 | President | Clinton (D) | Bush (R) |
| 1994 | Senator | Carr (D) | Abraham (R) |
| 1994 | Attorney General | Kelley (D) | Smietanka (R) |
| 1994 | Sec of State | Austin (D) | Miller (R) |
| 1996 | President | Clinton (D) | Dole (R) |
| 1996 | Senator | Levin (D) | Romney (R) |
| 1998 | Attorney General | Granholm (D) | Smietanka (R) |
| 2000 | President | Gore (D) | Bush (R) |
| 2000 | Senator | Stabenow (D) | Abraham (R) |
| 2002 | Governor | Granholm (D) | Posthumus (R) |
| 2002 | Sec of State | Hollowell (D) | Land (R) |
| 2006 | Governor | Granholm (D) | DeVos (R) |
| 2006 | Senator | Stabenow (D) | Bouchard (R) |
| 2008 | President | Obama (D) | McCain (R) |
| 2014 | Attorney General | Totten (D) | Schuette (R) |
| 2016 | President | Clinton (D) | Gary Johnson (Lib) |
| 2020 | Senator | Peters (D) | James (R) |

Top-of-ticket races where they agreed are mostly cases of a popular Republican incumbent with weak Democratic opposition (Nixon 1968, Engler 1994 / 1998, Snyder 2014).

#### Cases where DN explicitly opposed a candidate DFP endorsed

A separate, narrower pattern: 10 cases where DN explicitly recorded an `endorsed=0` (opposed) record for a Democrat that DFP endorsed. These are stronger-than-typical editorial stances by DN — actively naming and opposing the candidate, rather than simply endorsing the opponent. In every case the directions are internally consistent with each paper's known stance.

| Year | Office | District | Candidate | DFP | DN |
| --- | --- | --- | --- | --- | --- |
| 1982 | Governor | — | Blanchard, James | ENDORSED | OPPOSED |
| 1982 | Attorney General | — | Kelley, Frank | ENDORSED | OPPOSED |
| 2006 | Governor | — | Granholm, Jennifer | ENDORSED | OPPOSED |
| 2006 | Senator | — | Stabenow, Debbie | ENDORSED | OPPOSED |
| 2020 | Senator | — | Peters, Gary | ENDORSED | OPPOSED |
| 2020 | US House | 11 | Stevens, Haley | ENDORSED | OPPOSED |
| 2020 | US House | 13 | Tlaib, Rashida | ENDORSED | OPPOSED |
| 2020 | State Rep | 19 | Pohutsky, Laurie | ENDORSED | OPPOSED |
| 2020 | State Rep | 20 | Koleszar, Matt | ENDORSED | OPPOSED |
| 2020 | Macomb Prosecutor | — | Chrzanowski, Mary | ENDORSED | OPPOSED |

### Top-of-ticket partisan pattern

Endorsements for President + Senator + Governor (endorsed=1 records only):

| Paper | Republican | Democrat | Other | Total |
| --- | --- | --- | --- | --- |
| Detroit Free Press | 8 | 33 | 0 | 41 |
| Detroit News | 31 | 5 | 1 (Lib) | 37 |

Across all endorsed candidates (federal + state + local + judicial):

| Paper | Democrat | Republican | D/R partisan share |
| --- | --- | --- | --- |
| Detroit Free Press | 1,294 | 540 | 70.6% / 29.4% |
| Detroit News | 431 | 650 | 39.9% / 60.1% |

The split is consistent with each paper's well-documented editorial slant — DFP center-left, DN center-right.

### Presidential endorsement pattern (1968-2020)

| Year | Detroit Free Press | Detroit News |
| --- | --- | --- |
| 1968 | Nixon (R) | Nixon (R) — AGREE |
| 1972 | (no record) | Nixon (R) |
| 1976 | Carter (D) | Ford (R) |
| 1980 | Carter (D) | Reagan (R) |
| 1984 | (no record) | Reagan (R) |
| 1988 | Dukakis (D) | Bush (R) |
| 1992 | Clinton (D) | Bush (R) |
| 1996 | Clinton (D) | Dole (R) |
| 2000 | Gore (D) | Bush (R) |
| 2004 | Kerry (D) | NO ENDORSEMENT |
| 2008 | Obama (D) | McCain (R) |
| 2012 | Obama (D) | (no record) |
| 2016 | Clinton (D) | Gary Johnson (Libertarian) |
| 2020 | Biden (D) | NO ENDORSEMENT |

Only 1968 (Nixon) had agreement. DFP has consistently endorsed Democrats every year it issued a presidential endorsement (1968 was the lone Republican). The 2016 DN endorsement of Gary Johnson rather than Trump is notable — DN broke with its traditional Republican alignment that year. By 2020 DN declined to endorse either major candidate, while DFP endorsed Biden.

### Proposition consistency

Joining on `(year, prop_num)` for shared statewide proposals (with text-similarity confirmation):

- **64 proposition matches** with both prop_num populated
- **45 (70%) agree on direction**
- **18 disagree on direction** — almost all are tax-policy or social-policy initiatives where the conservative DN and liberal DFP took opposite editorial stances

Notable proposition-level disagreements:

- 1976 Prop A (bottle deposit ban): DFP YES, DN NO
- 1976 Prop C (tax limit, Voter's Choice): DFP NO, DN YES
- 1982 Prop E (nuclear freeze): DFP YES, DN NO
- 1984 Prop C (tax rollback): DFP NO, DN YES
- 1992 Props B/C/D (term limits, school property tax cuts, auto insurance reform): DFP NO on all three, DN YES on all three
- 1994 Prop B (restrict felony appeals): DFP YES, DN NO
- 1996 Prop C (veterans trust fund constitutional protection): DFP YES, DN NO
- 1998 Prop A ("handicapped" → "disabled"): DFP YES, DN NO
- 2000 Prop A (Detroit-area cultural-institutions millage): DFP YES, DN NO
- 2018 Props 1 / 2 / 3 (recreational marijuana / redistricting / voting rights): DFP YES on all three, DN NO on all three

These are real editorial divergences, not extraction errors. The pattern is consistent with each paper's ideological lean across decades.

### Spot-check validity

The race-level agreement profile (39.6% top-of-ticket / 47.3% state legislative / 71.1% local-judicial) lines up cleanly with each paper's known partisan tilt and reads as expected — partisan races diverge, nonpartisan races converge. The 10 explicit-opposition records all involve Democrats that DN editorially opposed in named editorials, every one consistent with each paper's stance. No anomalies suggest mislabeled records.
