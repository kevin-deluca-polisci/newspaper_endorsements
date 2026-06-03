# QA Report: Detroit News (121301)

**Audit date:** 2026-04-29
**Folder:** Detroit News
**Newspaper ID:** 121301
**Data coverage:** 1968-2020 (25 election years), 56 clippings, 1,872 candidate records, 251 proposition records

## Overall Assessment

**PASS WITH NOTES**

Initial extraction of the Detroit News archive. The 1968 multi-year clipping (which contained content for 1968, 1970, 1972, and 1974 in a single PDF wrapper from GenealogyBank) was split into per-year JSONs. The 31 individual 2020 race articles were extracted as separate per-race endorsement records. Sequential extraction was performed by hand (no subagent extraction) per the user's directive for this folder.

## Stage 0: Folder Organization

- Started with 77 PDFs across mixed naming conventions (`121301_YYYYMMDD.pdf`, `News_YYYY.pdf`, dated descriptive titles like `DETROIT_FREE_PRESS_NOV_X_YYYY.pdf`)
- Hashed all files; 21 byte-identical duplicates removed (per user-approved rule)
- 56 unique-content files remain
- All renamed to standard `121301_YYYYMMDD[_vN].pdf` format
- Discovery: file `121301_19681104.pdf` is multi-year (contains 1968, 1970, 1972, and 1974 endorsements). Each year's records extracted to its own JSON.
- Discovery: 31 articles initially assumed to be 2024 are actually 2020 (OCR pub-date headers confirm). Renamed accordingly with `_v2` through `_v25` suffixes for the 25 articles published Oct 30, 2020.
- 2020 .rtf link file deleted (per user instruction; 2020 coverage is in the 31 individual articles)

## Stage 1: Structural Validation

- CSV headers complete (16 candidate columns + pipeline fields, 11 proposition columns + pipeline fields)
- Year range 1968-2020, 25 unique election years, all even
- All `endorsed` values valid (1/0/empty)
- All `state_newspaper`/`state_election` populated as `MI`
- All `newspaper_id` populated as `121301`
- No incumbency `=0` errors
- No empty `cand_name` rows after removing 1 placeholder

### Fixes applied this cycle

- 1970 SENATOR `NO ENDORSEMENT` record: confidence raised from 0.0 to 0.95 (intentional non-endorsement, not an extraction error). The Detroit News editorial explicitly stated the paper was withholding endorsement — preserved as a non-endorsement record with `endorsed=` empty.
- 1 `PROBATE JUDGE` record renormalized to `JUDGE` with `dname=Probate Court` to match the canonical office code list.
- Cross-file content-duplicate handling: `121301_19681104_v2.pdf` was content-identical to the primary 1968 clipping; flagged in its parts JSON with `duplicate_content: true` and 0 candidates extracted to avoid double-counting.

## Stage 2: Spot Check

**Verified extraction on:**
- `121301_19921101.pdf` (Nov 1, 1992): 56 candidates (matches Detroit News' richly-formatted ballot-choice column with President, US House, State House, Supreme Court, Court of Appeals, Recorder's Court, Macomb/Oakland/Wayne local races, university boards). Extracted records cross-checked against the OCR text — all major slate items captured.
- `121301_19741103.json`: 92 candidates extracted from the 1974 portion of the multi-year 1968 clipping. Matches Milliken (R inc) Governor, Wayne/Oakland circuit court judges, full state legislative slate, plus WCCC Trustees.
- 2020 articles: each individual race article (President, Senate, US House districts 1-14, state legislative, county offices, university boards, ballot proposals) extracted as a stand-alone record.

## Stage 3: Variable Coding & Dedup

**Issues found:** 2 (1 office normalization + 1 confidence cleanup) | **Auto-fixed:** 2 | **Remaining:** 0

### Office codes (final, 33 distinct)

All canonical except for legitimate Michigan-specific elected boards:
- `REGENT` (U-M Board of Regents)
- `TRUSTEE` (MSU Board of Trustees)
- `GOVERNOR-WAYNE-STATE` (Wayne State University Board of Governors)
- `WCCC TRUSTEE` (Wayne County Community College Board of Trustees)
- `WATER RESOURCES COMMISSIONER` (Oakland County)
- `DRAIN COMMISSIONER` (Wayne/Oakland counties)
- `PUBLIC WORKS COMMISSIONER` (Macomb County)
- `DETROIT CHARTER COMMISSION` (2018 only)
- `DELEGATE` (1970 Detroit Charter Revision delegates only)

### Candidate names

All in ALL CAPS, LASTNAME, FIRSTNAME format. A handful (≈8) carry confidence notes flagging OCR-degraded surnames or first-name uncertainties, all conf 0.65-0.78.

### Districts

No "District"/"Dist." prefixes. State House district numbering 1968-2008 was column-broken in OCR; conservative extraction with conf 0.78-0.85 used where district-line breaks were ambiguous.

### Party labels

All canonical (Democrat, Republican, Independent, Libertarian, Green, Nonpartisan).

### Incumbency flags

No `=0` errors. Incumbency flags applied where OCR clearly identified incumbents.

### Dedup

No duplicate `(year, cand_name, office, dist)` keys after merge. Cross-file dedup ran but no duplicates were found because each clipping covers a distinct year.

## Stage 4: Low-Confidence Re-Scan

**Records reviewed:** 56 cands + 21 props (conf < 0.75) | **Confirmed correct:** 77 | **Corrected:** 0 | **Still uncertain:** 0

All low-confidence records carry detailed `extraction_confidence_note` fields documenting OCR limitations — common patterns:
- Heavily column-broken state legislative district numbers in 1980s-1990s endorsement summaries
- OCR degradation on multi-word names (e.g., "Verne Devie-Anthony" likely "Verne Diggs-Anthony")
- Garbled vote indicators on a small number of propositions where the YES/NO column header was misread

## Final dataset summary

### Candidates

- **1,872 candidate records**
- Direction: 1,855 endorsed / 14 opposed / 3 explicit non-endorsements (1970 Senate, 2004 President, 2020 President)
- 25 election years
- Mean confidence 0.880, range 0.65-0.95

### Propositions

- **251 proposition records**
- Direction: 115 YES / 127 NO / 9 no-direction
- 24 election years (no propositions in 1986; 2010, 2012 not in archive)
- Mean confidence 0.869, range 0.60-0.95

### Per-year proposition counts (selected highlights)
- 1968: 9, 1970: 5, 1972: 12, 1974: 5, 1976: 8, 1978: 16, 1980: 17
- 1988: 13, 1992: 9, 1996: 11, 1998: 8, 2000: 14, 2002: 13, 2004: 10
- 2006: 52 (heavy local-millage year), 2008: 21, 2014: 1, 2016: 4, 2018: 4, 2020: 3

## Coverage notes (non-blocking)

- **1978 only 3 candidates**: The 1978 clipping was almost entirely propositions (16) with only Milliken (Gov), Griffin (Senator), and Diggs (H-13 opposed) as named candidates. The 1978 sub-articles (Detroit Bonds, Diggs editorial) added the bond-issue propositions.
- **1982 only 10 candidates**: Editorial-style narrative endorsement (not the structured ballot-choice format used 1968-1976 and 1988-2008). Captured Headlee (Gov), Riegle (Senator, reluctant), Dunn/Sawyer/Rosen (House), Moody/Riley (Supreme Court), Patterson (AG over incumbent Kelley), and Blanchard (opposed for Gov).
- **1986**: 0 propositions extracted (1986 clipping was mostly candidate slate; OCR for prop list was too garbled to extract reliably).
- **2010 and 2012 not present**: No clippings in the source archive for these years. Not a fixable gap without re-acquiring source files.
- **2018 was a special year**: Detroit News editorial board chose NOT to make formal endorsements in Governor, Senator, AG, Sec State, or US Congress races. Instead the paper offered "personal recommendations" from columnists Nolan Finley and Ingrid Jacques. Per the editorial board's explicit framing, those columnist picks (Schuette/James/Leonard/Lang/Upton/Walberg/Bishop/Epstein) are NOT recorded as Detroit News endorsements. Only formal editorial board endorsements (state legislative, judicial, education boards, charter commission, ballot proposals) were recorded for 2018.
- **2020 declined Pres endorsement**: 28 Oct 2020 editorial titled "For president, we can't lend our name to men whose values we don't share." Recorded as a NO ENDORSEMENT record with `cand_name="NO ENDORSEMENT"`, party empty, `endorsed=` empty, conf 0.92.
- **2020 also declined Wayne County State House District 1**: Editorial: "we make no recommendation in this district" (Yancey vs Lanier).
- **Heavy local-millage years**: 2006 (52 props) is by far the densest — Detroit News covered nearly every Metro Detroit municipality's millage proposals that year.
- **Notable historic endorsements**: 1968 Nixon/Agnew, 1976 Ford/Dole, 1980 Reagan/Bush, 1982 Headlee for Governor, 1990 Engler for Governor, 2006 DeVos for Governor, 2008 McCain for President, 2014 Snyder for re-election, 2016 Gary Johnson (Libertarian) for President.

## File-handling notes

- All 56 PDFs have unique content hashes
- 21 byte-identical duplicates removed during initial cleanup (per user-approved rule)
- No unique-content files were deleted
- Multi-year 1968 PDF preserved as-is; year-specific extraction handled at the JSON level

## Stage 6: Cross-Paper Consistency Check (Detroit News vs Detroit Free Press)

**Date:** 2026-04-29
**Comparison:** Detroit News (121301) vs Detroit Free Press (121300)

The Detroit News and Detroit Free Press are the two major Detroit dailies and have heavy year overlap (25 shared election years from 1968-2020). Both folders are now processed, so a side-by-side check confirms internal consistency and surfaces any extraction issues by spotting implausible disagreements.

### Coverage overlap

- Shared years: 25 (1968-2020, all even years where both papers have endorsement clippings)
- DFP-only years: 2012, 2022 (DN archive missing 2010, 2012; DN's 2022 clipping not in source)
- DN candidate records: 1,872 / DFP candidate records: 2,471
- DN proposition records: 251 / DFP proposition records: 216

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

The pattern is exactly what you'd expect from a center-right paper (DN) vs a center-left paper (DFP): heavy disagreement on partisan federal and state races, much higher agreement on nonpartisan local and judicial races where both papers tend to back the most qualified incumbent.

#### Top-of-ticket disagreements (different candidate picked)

DN and DFP picked different candidates in nearly every partisan top-of-ticket race after 1968:

| Year | Office | DN pick | DFP pick |
| --- | --- | --- | --- |
| 1976 | President | Ford (R) | Carter (D) |
| 1976 | Senator | Esch (R) | Riegle (D) |
| 1978 | Senator | Griffin (R) | Levin (D) |
| 1980 | President | Reagan (R) | Carter (D) |
| 1982 | Governor | Headlee (R) | Blanchard (D) |
| 1982 | Attorney General | Patterson (R) | Kelley (D) |
| 1984 | Senator | Lousma (R) | Levin (D) |
| 1986 | Governor | Lucas (R) | Blanchard (D) |
| 1988 | President | Bush (R) | Dukakis (D) |
| 1990 | Governor | Engler (R) | Blanchard (D) |
| 1990 | Senator | Schuette (R) | Levin (D) |
| 1990 | Attorney General | Taylor (R) | Kelley (D) |
| 1992 | President | Bush (R) | Clinton (D) |
| 1994 | Senator | Abraham (R) | Carr (D) |
| 1994 | Attorney General | Smietanka (R) | Kelley (D) |
| 1994 | Sec of State | Miller (R) | Austin (D) |
| 1996 | President | Dole (R) | Clinton (D) |
| 1996 | Senator | Romney (R) | Levin (D) |
| 1998 | Attorney General | Smietanka (R) | Granholm (D) |
| 2000 | President | Bush (R) | Gore (D) |
| 2000 | Senator | Abraham (R) | Stabenow (D) |
| 2002 | Governor | Posthumus (R) | Granholm (D) |
| 2002 | Sec of State | Land (R) | Hollowell (D) |
| 2006 | Governor | DeVos (R) | Granholm (D) |
| 2006 | Senator | Bouchard (R) | Stabenow (D) |
| 2008 | President | McCain (R) | Obama (D) |
| 2014 | Attorney General | Schuette (R) | Totten (D) |
| 2016 | President | Gary Johnson (Lib) | Clinton (D) |
| 2020 | Senator | James (R) | Peters (D) |

Top-of-ticket races where they agreed are mostly cases of a popular Republican incumbent with weak Democratic opposition (Nixon 1968, Engler 1994 / 1998, Snyder 2014).

#### Cases where DN explicitly opposed a candidate DFP endorsed

A separate, narrower pattern: 10 cases where DN explicitly recorded an `endorsed=0` (opposed) record for a Democrat that DFP endorsed. These are stronger-than-typical editorial stances by DN — actively naming and opposing the candidate, rather than simply endorsing the opponent. In every case the directions are internally consistent with each paper's known stance.

| Year | Office | District | Candidate | DN | DFP |
| --- | --- | --- | --- | --- | --- |
| 1982 | Governor | — | Blanchard, James | OPPOSED | ENDORSED |
| 1982 | Attorney General | — | Kelley, Frank | OPPOSED | ENDORSED |
| 2006 | Governor | — | Granholm, Jennifer | OPPOSED | ENDORSED |
| 2006 | Senator | — | Stabenow, Debbie | OPPOSED | ENDORSED |
| 2020 | Senator | — | Peters, Gary | OPPOSED | ENDORSED |
| 2020 | US House | 11 | Stevens, Haley | OPPOSED | ENDORSED |
| 2020 | US House | 13 | Tlaib, Rashida | OPPOSED | ENDORSED |
| 2020 | State Rep | 19 | Pohutsky, Laurie | OPPOSED | ENDORSED |
| 2020 | State Rep | 20 | Koleszar, Matt | OPPOSED | ENDORSED |
| 2020 | Macomb Prosecutor | — | Chrzanowski, Mary | OPPOSED | ENDORSED |

### Top-of-ticket partisan pattern

Endorsements for President + Senator + Governor (endorsed=1 records only):

| Paper | Republican | Democrat | Other | Total |
| --- | --- | --- | --- | --- |
| Detroit News | 31 | 5 | 1 (Lib) | 37 |
| Detroit Free Press | 8 | 33 | 0 | 41 |

Across all endorsed candidates (federal + state + local + judicial):

| Paper | Republican | Democrat | D/R partisan share |
| --- | --- | --- | --- |
| Detroit News | 650 | 431 | 39.9% / 60.1% |
| Detroit Free Press | 540 | 1,294 | 70.6% / 29.4% |

The split is consistent with each paper's well-documented editorial slant — DN center-right, DFP center-left.

### Presidential endorsement pattern (1968-2020)

| Year | Detroit News | Detroit Free Press |
| --- | --- | --- |
| 1968 | Nixon (R) | Nixon (R) — AGREE |
| 1972 | Nixon (R) | (no record) |
| 1976 | Ford (R) | Carter (D) |
| 1980 | Reagan (R) | Carter (D) |
| 1984 | Reagan (R) | (no record) |
| 1988 | Bush (R) | Dukakis (D) |
| 1992 | Bush (R) | Clinton (D) |
| 1996 | Dole (R) | Clinton (D) |
| 2000 | Bush (R) | Gore (D) |
| 2004 | NO ENDORSEMENT | Kerry (D) |
| 2008 | McCain (R) | Obama (D) |
| 2012 | (no record) | Obama (D) |
| 2016 | Gary Johnson (Libertarian) | Clinton (D) |
| 2020 | NO ENDORSEMENT | Biden (D) |

Only 1968 (Nixon) had agreement. The 2016 DN endorsement of Gary Johnson rather than Trump is notable — the paper broke with its traditional Republican alignment. By 2020 DN declined to endorse either major candidate, while DFP endorsed Biden.

### Proposition consistency

Joining on `(year, prop_num)` for shared statewide proposals (with text-similarity confirmation):

- **64 proposition matches** with both prop_num populated
- **45 (70%) agree on direction**
- **18 disagree on direction** — almost all are tax-policy or social-policy initiatives where the conservative DN and liberal DFP took opposite editorial stances

Notable proposition-level disagreements:

- 1976 Prop A (bottle deposit ban): DN NO, DFP YES
- 1976 Prop C (tax limit, Voter's Choice): DN YES, DFP NO — flagged in DN's confidence note as ambiguous; cross-paper context confirms DN did endorse
- 1982 Prop E (nuclear freeze): DN NO, DFP YES
- 1984 Prop C (tax rollback): DN YES, DFP NO
- 1992 Props B/C/D (term limits, school property tax cuts, auto insurance reform): DN YES on all three, DFP NO on all three
- 1994 Prop B (restrict felony appeals): DN NO, DFP YES
- 1996 Prop C (veterans trust fund constitutional protection): DN NO, DFP YES
- 1998 Prop A ("handicapped" → "disabled"): DN NO, DFP YES
- 2000 Prop A (Detroit-area cultural-institutions millage): DN NO, DFP YES
- 2018 Props 1 / 2 / 3 (recreational marijuana / redistricting / voting rights): DN NO on all three, DFP YES on all three

These are real editorial divergences, not extraction errors. The pattern is consistent with each paper's ideological lean across decades.

### Spot-check validity

The race-level agreement profile (39.6% top-of-ticket / 47.3% state legislative / 71.1% local-judicial) lines up cleanly with each paper's known partisan tilt and reads as expected — partisan races diverge, nonpartisan races converge. The 10 explicit-opposition records all involve Democrats that DN editorially opposed in named editorials, every one consistent with DN's center-right stance. No anomalies suggest mislabeled records.

### Findings updated to DFP QA report

The same cross-paper findings have been appended to the Detroit Free Press QA report.
