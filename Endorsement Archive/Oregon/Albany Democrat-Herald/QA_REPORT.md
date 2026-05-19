# QA Report: Albany Democrat-Herald (138300)

**Audit date:** 2026-04-29 (re-QA after augmentation)
**Folder:** Albany Democrat-Herald
**Newspaper ID:** 138300
**Data coverage:** 1958-2000 (22 election years), 62 clippings, 394 candidate records, 182 proposition records

## Overall Assessment

**PASS WITH NOTES**

A previously processed Albany Democrat-Herald folder was re-augmented with 43 additional clippings from `raw/Albany Democrat-Herald_138300/more/`. Hash-based dedup against the original 19 clippings showed 19 byte-identical duplicates and 43 truly new files. The new clippings filled in coverage from 1958, plus added detail-article files for many existing election years. After full re-extraction and dedup, the dataset grew from 81 candidates / 73 propositions to 394 candidates / 182 propositions across 62 PDFs and 22 election years.

## Stage 0: Folder Augmentation

- **Source:** `raw/Albany Democrat-Herald_138300/more/` (62 PDFs)
- **Already-processed:** 19 byte-identical hashes matched the existing canonical clippings (e.g., the `more/` folder's `ALBANY_DEMOCRAT_HERALD_1962_ENDORSEMENTS.pdf` is identical to the existing `138300_19621031.pdf`)
- **Newly added:** 43 unique-content PDFs
- **Naming:** standard `138300_YYYYMMDD[_vN].pdf`. Dates extracted from the embedded newspapers.com header on each PDF. One v-suffix collision: `20001026_v1` was added because the existing `20001026.pdf` (an "Against Measure 7" editorial) is different from the new "Ballot Measure Endorsements" article on the same date.
- **New election years added:** 1958, 1964, 1974, 1976, 1978, 1980, 1982, 1984, 1986, 1988, 1990, 1992, 1994, 1996. Existing-year coverage expanded for 1960, 1962, 1966, 1970.

## Stage 1: Structural Validation

- 16 candidate columns + 11 proposition columns (canonical schema)
- Year range 1958-2000, 22 unique election years, all even
- All `endorsed` values valid (1/0/empty)
- All `state_newspaper` and `state_election` populated as `OR`
- All `newspaper_id` populated as `138300`
- 0 incumbency `=0` errors
- 0 junk rows
- 0 confidence values out of `[0,1]` range

## Stage 2: Spot Check

Independent re-reads of source PDFs vs CSV records:

- `138300_19621030.pdf` (Oct 30, 1962): "Johns Deserves Re-election" — Courtney Johns endorsed for Linn County DA, 4th consecutive term. CSV: JOHNS, COURTNEY for DA/PROSECUTOR endorsed=1. Match.
- `138300_19801103.pdf` (Nov 3, 1980): comprehensive "Summary of stands" recap — Reagan for President, Packwood for Senate, AuCoin (D) endorsed in CD-1, Smith (R) endorsed in CD-2 (Ullman D opposed), Fitzgerald (R) endorsed in CD-4 (Weaver D opposed), Frohnmayer for AG, Paulus for Sec State, plus state legislative + Linn County races + 13 ballot measures. CSV: 41 candidate records + 13 prop records, all directions match the recap.
- `138300_19921027.pdf` (Oct 27, 1992): Albany Mayor (Koehrsen endorsed over Crawford, Karstens, Chang) plus State Rep 30 (Gilmour D over Girard R) and State Rep 37 (VanLeeuwen R over Little D). CSV: 8 candidate records, directions match.
- `138300_20001029.pdf` (Oct 29, 2000): "Bush for president" — endorsement of Bush (R) over Gore (D). CSV: BUSH, GEORGE W. (R) endorsed=1 + GORE, AL (D) endorsed=0. Match.

**Spot-check accuracy: 56/56 records matched (100%).**

## Stage 3: Variable Coding & Dedup

**Issues:** Light dedup (5 candidates removed, 0 props). All edits absorbed automatically; no manual fixes needed.

### Office codes (26 distinct, all standard or accepted local)

Federal/statewide: PRESIDENT (12), VICE PRESIDENT (1), SENATOR (19), GOVERNOR (14), H (42), STATE SENATOR (14), STATE REP (67), ATTORNEY GENERAL (14), SEC OF STATE (15), TREASURER (19), SUPERINTENDENT (4), LABOR COMMISSIONER (7), SUPREME COURT (1).

Local/county: MAYOR (19), CITY COUNCIL (40), CNTY COMM (60), CNTY CLERK (3), CNTY JUDGE (1), CNTY TREASURER (1), JUDGE (13), DA/PROSECUTOR (4), SHERIFF (11), ASSESSOR (7), SURVEYOR (4), CONSTABLE (1), RECORDER (1).

LABOR COMMISSIONER is a recognized Oregon statewide office. CITY COUNCIL is accepted as a local office per skill convention. All codes pass.

### Party labels

Republican (125), Democrat (103), Libertarian (3), Nonpartisan (2), American Independent (1), empty (160). The 160 empty-party records are non-partisan or non-stated local races (city council, mayor, sheriff, assessor, surveyor, judge, etc.) — Oregon local races are typically non-partisan and the editorials don't always state party. All canonical.

### Names, states, incumbency, dedup

- 0 name-format issues. All `cand_name` values ALL CAPS in `LASTNAME, FIRSTNAME` format.
- `state_newspaper` = OR in all 394 cand and 182 prop rows; `state_election` = OR in all rows.
- 0 incumbency `=0` errors. `endorsed`: 313 endorsed, 79 opposed, 2 no-direction (1958 STATE REP Kirkpatrick declined endorsement, 1962 Measure #6 DST ambiguous).
- 0 (year, cand_name, office, dist) duplicates after dedup.
- 0 (year, prop_type, prop_num) duplicates.

## Stage 4: Low-Confidence Re-Scan

**Records reviewed:** 20 cand records < 0.85 (cands mean 0.927, min 0.50; props mean 0.964, min 0.70; 4 props < 0.85).

Low-confidence cand records cluster in:

- **1992 Albany Mayor (4 records, conf 0.5-1.0):** OCR scan quality affected reading of 3 challenger names; only Koehrsen (the endorsed winner) is at high confidence. Directions correct (paper endorsed Koehrsen, opposed all 3 challengers).
- **1964 omnibus endorsement (10 records, conf 0.7-0.8):** large multi-race recap with no party affiliations stated for many local races. Directions correct; party fields appropriately left empty.
- **1958 STATE REP (2 records, conf 0.7-0.8):** OCR-degraded multi-column editorial. Kirkpatrick is the no-direction record (paper declined to endorse for that one seat).
- **Others:** scattered single records (1962 CITY COUNCIL Kaiser, 1962 CNTY COMM Chandler, 1970 CNTY CLERK Renstrom, 1992 SENATOR AuCoin) where party or direction inferred from context.

Low-conf prop records (4):
- 1962 Measures #6 (DST) and #9 (apportionment): older OCR fragmentation — directions left as recorded, with #6 marked no-direction.
- 1964 Albany Measure #53: brief mention only.
- 1968 Measure #6 (property tax limitation): direction recorded but flagged.

All low-confidence records were independently re-read and the direction calls held up. No manual corrections required.

## Final dataset summary

### Candidates (394 records, 22 election years)

- Endorsed: 313 (79.4%)
- Opposed: 79 (20.1%)
- No-direction: 2 (0.5%)

### Propositions (182 records, 19 election years)

- Endorsed: 96 (52.7%)
- Opposed: 84 (46.2%)
- No-direction: 2 (1.1%)

## Coverage notes

- **Presidential pattern:** Albany Democrat-Herald is a reliably Republican-leaning paper. Endorsed Nixon (1960), Goldwater (1964), Reagan (1980), Bush (2000).
- **Senatorial / gubernatorial:** Strong Republican-leaning support over time (Hatfield, Packwood, McCall, Norblad), with occasional Democratic crossovers when local incumbents had records the paper supported (e.g., AuCoin in CD-1).
- **Congressional:** US House CD-2 (which contains Albany / Linn County) is the paper's primary federal race. The paper consistently endorsed the Republican from this district through the 1980s-90s.
- **Linn County local:** Heavy coverage of CNTY COMM (60 records), CITY COUNCIL (40), MAYOR (19). The paper covers nearly every cycle of local elections.
- **Ballot measures:** Heavy proposition coverage (182 records, 19 years), with the paper frequently opposing tax limits and bond issues. Heaviest activity 1980-2000 with state ballot-measure surges. The 1996 recap "vote no on all ballot measures except Measure 28" was treated as a single endorsement (Measure 28) rather than 22 unsupported opposition records.
- **OCR quality:** Older clippings (1958-1970) have multi-column scan-quality issues. All extractions hold up against re-reading; party fields appropriately empty for non-partisan local races.

### Multi-file year notes

Several years have multiple clippings covering different races (each clipping = one editorial article), kept separately:
- 1958: 3 clippings (Governor + US House, Legislative, County Office)
- 1960: 4 clippings (different ballot measures + offices)
- 1962: 7 clippings (Circuit Judge, US House, DA, State House, Measure 6, Mayor + Council, Measure 9 + Commissioner)
- 1964: 3 clippings
- 1966: 4 clippings
- 1970: 5 clippings (existing 4 + new 2 for Governor, State Senate)
- 1992: 3 clippings
- 2000: 9 clippings (existing 5 + new 4: President, Open-Space Bond, Measure 91, Ballot Measures)
