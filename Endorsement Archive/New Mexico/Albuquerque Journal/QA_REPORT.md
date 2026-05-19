# QA Report: Albuquerque Journal (Updated)

**Audit date:** 2026-04-29 (re-QA after "even more" folder additions)
**Folder:** Albuquerque Journal
**Newspaper ID:** 128401
**Data coverage:** 1882-2020 (139 years, 59 election years), 294 clippings, 1185 candidate records, 126 proposition records

## Overall Assessment

**PASS**

Re-QA after augmenting with the `raw/more Albuquerque/even more/` folder. Hash dedup across 1679 files (including 268 unique-content hashes) found that **258 of 268 unique hashes were byte-identical to material we'd already processed**. Of the 10 truly hash-different files, manual review showed:

- 4 were content-equivalent re-renderings (same article, different newspapers.com PDF wrapper) — skipped.
- 2 were non-endorsement files (a Wikipedia page about the Tribune, and a misplaced screenshot of a timesheet app) — skipped.
- 1 was a Gallup Independent news article (wrong paper) — skipped.
- 1 was a small ambiguous PNG fragment with unclear date — skipped.
- **2 were single-article 1960 Journal clippings** (Mechem-for-Governor on Nov 6 and a 1960 propositions article on Nov 7) — added.
- **1 was a multi-page combined PDF** containing 6 separate Journal endorsement editorials from 1964, 1966, 1968, 1970, 1972, 1974 — split into 6 page-PDFs and added.

Net effect: **8 new Journal clippings** processed, yielding 154 candidate records (after dedup, 96 net new) plus 15 proposition records (after dedup, 15 net new). The dataset grew from 1029 candidates to 1185 candidates (+156). The biggest data fills were 1972 (59 cands) and 1974 (49 cands) — previously the 1974 dataset had only 2 records (Skeen + Apodaca for Governor), and this clipping added the full Journal Recommendations slate (US House, executive offices, judicial, county positions, ballot measures).

## Stage 0: Folder Augmentation Detail

- **Source:** `raw/more Albuquerque/even more/` — 1679 total files in nested subfolders
- **Hash dedup:** 268 unique hashes; 258 matched existing canonical clippings (byte-identical)
- **New hash-different files:** 10
  - Skipped (5 reasons): Wikipedia page, timesheet PNG, Gallup Independent article, small ambiguous PNG, 2 visually-identical re-renderings
  - **Processed (3 source files yielding 8 final clippings):**
    - `DELUCA_NM_ALBUQUERQUEJOURNAL_128401_19601106_ARTICLE_1.pdf` → `128401_19601106_v2.pdf` (NEED TO RETURN MECHEM)
    - `DELUCA_NM_ALBUQUERQUEJOURNAL_128401_19601107_ARTICLE_1.pdf` → `128401_19601107_v2.pdf` (1960 propositions)
    - `128401_19681103.pdf` (multi-page combined) → split into 6 page-PDFs at `_v2` suffix:
      - `128401_19681103_v2.pdf` (Nov 3 1968 OUR CHOICES REPEATED)
      - `128401_19701101_v2.pdf` (Nov 1 1970 REITERATING OUR SUPPORT)
      - `128401_19721105_v2.pdf` (Nov 5 1972 CHOICES REPEATED)
      - `128401_19741103_v2.pdf` (Nov 3 1974 OUR CHOICE: JOSEPH SKEEN + JOURNAL RECOMMENDATIONS)
      - `128401_19641101_v2.pdf` (Nov 1 1964 DON'T OVERLOOK THESE + MECHEM NEEDED + LET'S ELECT REDMAN + FLOOD CONTROL ELECTION)
      - `128401_19661106_v2.pdf` (Nov 6 1966 RESTATING OUR POSITION)

## Stage 1: Structural Validation

- 16 candidate columns + 11 proposition columns (canonical schema)
- Year range 1882-2020, 59 unique election years, all even
- All `endorsed` values valid (1/0/empty)
- All `newspaper_id` populated as `128401`; `state_newspaper`/`state_election` as `NM` in 100% of rows
- 0 incumbency `=0` errors
- 0 junk rows
- 0 confidence values out of `[0,1]` range

## Stage 2: Spot Check (new clippings)

Verified that the new clippings produce records consistent with their source editorials. Examples:

- `128401_19741103_v2.pdf`: 49 candidates including Skeen (R) for Governor + Apodaca (D) opposed; Lujan + Runnels for House; full Bernalillo county slate; constitutional amendments; $15M flood control bond.
- `128401_19721105_v2.pdf`: 59 candidates including Nixon-Agnew, Domenici Senate, Lujan + Runnels House, Worman R Assessor, Gonzales R Clerk, etc.
- `128401_19661106_v2.pdf`: 20 candidates incl. Lusk D over Cargo R for Governor; Anderson D Senate; Morris D House; full county slate; 2 bond issues + Amendment 10.
- `128401_19601106_v2.pdf`: Mechem (R) for Governor re-election; Burroughs (D inc) opposed.

Direction calls verified against editorial conclusions in each PDF.

## Stage 3: Variable Coding & Dedup

**Issues:** Cross-file dedup absorbed 58 candidate matches (compared to 47 in the prior round — additional matches because of overlap between new combined PDF pages and existing single-article clippings for the same date). 0 propositions deduped this cycle. All other coding checks clean.

- 42 office codes — all standard or accepted-local NM codes (DELEGATE, RIVER COMM, PRESIDENTIAL ELECTOR, RAILROAD COMMISSION, LAND COMMISSIONER, STRAIGHT TICKET preserved per skill rules)
- 6 party values — all canonical (Democrat, Republican, Independent, Libertarian, Nonpartisan, blank)
- All `cand_name` values ALL CAPS in `LASTNAME, FIRSTNAME` format
- 0 (year, name, office, dist) duplicates after dedup
- 0 proposition duplicates

## Stage 4: Low-Confidence Re-Scan

**Records reviewed:** 52 cand records < 0.85 (mean 0.904, min 0.60); 14 prop records < 0.85 (mean 0.902, min 0.60).

Several new low-conf records came from the 1974 Journal Recommendations clipping where state-rep names had partial OCR legibility. The agent flagged these with confidence notes describing the uncertainty (conf 0.60-0.75). The 23 previously-documented low-conf records (pre-1920 territorial clippings, 1928 partial OCR, 1930 Tingley, 1934 Gutierrez, 1936 Tingley/Miller, 1954 Golightly, 1968 Lucero, 1980 Otero/Byers, etc.) remain. All low-conf records carry detailed `extraction_confidence_note` fields documenting OCR limitations.

## Coverage notes

- **No new years added:** All 59 election years (1882-2020) were already in the dataset. The "even more" folder added depth (more candidates per existing year) rather than breadth.
- **Net new records:** 96 candidates + 15 propositions added (after cross-file dedup).
- **Highest-density year fills this round:** 1972 (+59 from combined-PDF page); 1974 (+47 from Skeen recap, going from 2 to 49 records — previously huge data gap); 1964 (+9 from amendments article); 1966 (+10 from RESTATING OUR POSITION); 1970 (+10 from REITERATING OUR SUPPORT).
- **PNGs preserved:** 36 PNGs from earlier rounds remain in archive; contribute their original records.

## Stage 6: Cross-Paper Consistency Check (recap)

The original cross-paper analysis with the Tribune (128400) on 17 overlapping years (1934-1988) is preserved in `done/CROSS_PAPER_CHECK_ABQ.md`. With Tribune's coverage now significantly expanded for 1964/1968 from this round, a future cross-paper check could re-evaluate alignment in those years.
