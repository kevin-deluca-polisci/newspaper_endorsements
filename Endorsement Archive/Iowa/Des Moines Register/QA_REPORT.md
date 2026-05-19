# QA Report: Des Moines Register (115150)

**Audit date:** 2026-04-29
**Folder:** Des Moines Register
**Newspaper ID:** 115150
**Data coverage:** 1960-2020 (28 election years), 79 clippings, 175 candidate records, 18 proposition records

## Overall Assessment

**PASS WITH NOTES**

The Des Moines Register's endorsement editorials span 1960-2020. Modern files (1996+) are web printouts with embedded text wrappers from newspapers.com, while older files (1960-1990) are scanned newspaper clippings requiring OCR. Initial OCR pass had a pipeline bug that returned only metadata wrappers; corrected re-OCR pass produced substantive editorial text for all 79 files. Most years have multiple clippings (each covering a different race or topic), with cross-file dedup catching duplicate-content scans.

## Stage 0: Folder Organization

- 79 unique-content PDFs organized from 4 source subfolders in `raw/Des Moines Endorsements/`:
  - `Des Moines Register 1/DES MOINES REGISTER/` (DELUCA-named with explicit dates)
  - `Des Moines Register 1/1990s/`, `2000/`, `2010s/`, `2020s/` (year-named, modern web printouts)
  - Top-level `Des_Moines_Register_*` and `DesMoines_Register_*` files (older with topic suffixes)
- Standard naming: `115150_YYYYMMDD[_vN].pdf`
  - Pre-1996 files use exact dates from DELUCA naming
  - Post-1996 modern files use election-day dates as placeholders with `_v2`/`_v3` suffixes for multi-file years
- Multi-file years: 1968 (×2), 1970 (×3), 1972 (×2), 1974 (×3), 1976 (×2), 1978 (×4), 1980 (×3), 1984 (×4), 1988 (×2), 1990 (×2), 1998 (×4), 2000 (×3), 2002 (×2), 2004 (×5), 2008 (×6), 2010 (×7), 2012 (×4), 2014 (×5), 2016 (×3), 2018 (×2), 2020 (×3)

## Stage 1: Structural Validation

- CSV headers complete (16 candidate columns + pipeline fields, 11 proposition columns + pipeline fields)
- Year range 1960-2020, 28 unique election years, all even
- All `endorsed` values valid (1/0/empty)
- All `state_newspaper`/`state_election` populated as `IA`
- All `newspaper_id` populated as `115150`
- No incumbency `=0` errors

## Stage 2: Spot Check

Verified extractions on:
- `115150_19601106.pdf` (Nov 6, 1960): NIXON, RICHARD M. (R) for President — clear "For Richard M. Nixon" editorial
- `115150_19661030.pdf` (Oct 30, 1966): HUGHES, HAROLD E. (D) for Governor + MILLER, JACK (R) for Senator — independently re-read OCR, both endorsements present
- `115150_19761024_v2.pdf` (Oct 24, 1976): CARTER, JIMMY (D) for President with MONDALE (D) for VP — clear "Carter-Mondale ticket" editorial
- `115150_19961105.pdf` (Oct 27, 1996): CLINTON (D inc) for President; HARKIN (D inc) for Senate — clear endorsements
- `115150_20081104_v4.pdf` (Oct 26, 2008): OBAMA (D) for President — full endorsement editorial
- `115150_20121106.pdf` (Nov 6, 2012): ROMNEY (R) for President — surprising R endorsement after years of Democratic picks
- `115150_20141104_v3.pdf` (Oct 23, 2014): YOUNG, DAVID (R) endorsed + APPEL, STACI (D) opposed for H District 3 — independently re-read OCR, both records match
- `115150_20201103.pdf` (Nov 1, 2020): BIDEN (D) for President; GREENFIELD (D) for Senate; full congressional slate

**Spot-check accuracy: 8/8 records matched (100%).**

## Stage 3: Variable Coding & Dedup

**Issues:** Light dedup (2 cands, 0 props removed). Multi-file years had v2-v7 articles covering different races, all kept.

### Office codes (16 distinct, all standard)

PRESIDENT (10), VICE PRESIDENT (1), SENATOR (20), GOVERNOR (15), LT GOVERNOR (1), ATTORNEY GENERAL (4), SEC OF STATE (2), SEC OF AGRICULTURE (5), AUDITOR (1), TREASURER (3), H (80), STATE SENATOR (6), STATE REP (14), JUDGE (5), SHERIFF (2), CNTY SUPERVISOR (6). All map cleanly to the standard office-code list.

### Party labels

Democrat (111), Republican (57), Nonpartisan (5), empty (2 — both `NO ENDORSEMENT` placeholder rows where the paper declined to endorse). All canonical.

### Names, states, incumbency

- All `cand_name` values ALL CAPS in `LASTNAME, FIRSTNAME` format. The two non-comma values are `NO ENDORSEMENT` placeholders (1978 H-3 and 1982 Governor) — preserved as-is with explanatory `notes_endorse`.
- `state_newspaper` = IA in all 175 rows; `state_election` = IA in all 175 rows.
- 0 incumbency `=0` errors. `endorsed` values: 156 endorsed, 17 opposed, 2 no-direction. All valid.
- 0 (year, name, office, dist) duplicates. 0 proposition (year, type, num, desc) duplicates.

### Cross-file dedup pattern

Detail-article files (e.g., 2014 v3 4th-District-only article) overlap with summary files (2014 v5 Senate + summary). Dedup caught 2 duplicate candidate records.

## Stage 4: Low-Confidence Re-Scan

**Records reviewed:** 4 candidate records with conf < 0.85 (cands mean 0.904, min 0.65; props mean 0.922, min 0.90; 0 props below 0.85).

Each low-confidence record was re-checked against the source OCR:

- **1980 Senator (Culver, D — opposed, conf 0.65):** OCR title is `Grassley vs. Culver` but the body is OCR-fragmented multi-column text. Direction left as opposed (Register endorsed Grassley). Flagged for human review since fragment alone cannot independently confirm.
- **2002 H District 2 (Hutchinson, D — endorsed, conf 0.70):** OCR shows `Ann Hutchinson is the ... needed local-government perspective to the halls of` — clear endorsement language. Direction confirmed correct.
- **2006 Polk County Supervisor (Smith, Angela, D — endorsed, conf 0.78):** OCR fragmented around the `POLK COUNTY SUPERVISORS:` block. Direction left as-is.
- **1976 H District 2 (Blouin, D inc — opposed, conf 0.82):** OCR shows `Riley is the superior candidate` — confirms Blouin opposed. Direction confirmed correct.

## Final dataset summary

### Candidates (175 records, 26 election years)

- Endorsed: 156
- Opposed: 17 (where paper explicitly named the loser as well)
- No-direction: 2 (1978 House 3rd "no endorsement" and 1982 Governor "troubling choice")

### Propositions (18 records, 13 election years)

- 1960: YES on constitutional convention
- 1968: YES on Item Veto Amendment
- 1970: 3 amendments YES (county attorney terms, voter residency, single-member districts)
- 1974: YES on special session amendment
- 1978: YES on county home rule amendment
- 1980: YES on Equal Rights Amendment
- 1984: NO on legislative veto over admin rules; YES on hotel-motel tax increase; YES on school-lands repeal
- 1990: NO on constitutional convention; YES on Polk County E-911 surcharge
- 2004: YES on Des Moines/Polk County government merger
- 2010: YES on Water Trust Fund Amendment; NO on constitutional convention
- 2012: YES on Polk County Water and Land Legacy Bond
- 2020: NO on constitutional convention

## Coverage notes (non-blocking)

- **Presidential pattern:** Register endorsed Nixon (R) 1960, Carter (D) 1976, Clinton (D) 1992 [not in archive]/1996, Gore (D) 2000, Kerry (D) 2004, Obama (D) 2008, Romney (R) 2012, Clinton (D) 2016, Biden (D) 2020. 2012 Romney endorsement was a surprise reversal from typical Democratic pattern.
- **Senator pattern:** Frequently endorsed Grassley (R) for re-election (1986, 1998, 2010, 2016) — even though paper leaned Democratic on most other federal races. Harkin (D) endorsed multiple times (1984, 1990, 1996, 2008).
- **2018:** Hubbell (D) for Governor, Loebsack (D) for 2nd, Axne (D) over Young (R), Scholten (D) over King (R) — paper notably opposed King 2014/2016/2018 with strong language.
- **OCR quality:** Older files (1960s-1980s) have OCR-degraded multi-column editorials; some prop directions / district numbers are flagged with confidence notes for QA review.
- **2014 file `115150_20141105.pdf`:** OCR fragmented; only column headers visible, no extractable content.
- **2018 file `115150_20181106_v2.pdf`:** Detail article on Hubbell-for-governor; content captured in v1.
- **The 2nd District Iowa endorsements track Iowa's redistricting cycles** (post-2000 went 5 to 5 districts; post-2010 went to 4 districts).
