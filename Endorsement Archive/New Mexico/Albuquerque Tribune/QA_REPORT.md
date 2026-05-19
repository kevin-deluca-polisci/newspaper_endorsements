# QA Report: Albuquerque Tribune (Updated)

**Audit date:** 2026-04-29 (re-QA after "even more" folder additions)
**Folder:** Albuquerque Tribune
**Newspaper ID:** 128400
**Data coverage:** 1934-2004 (28 election years), 142 clippings, 766 candidate records, 174 proposition records

## Overall Assessment

**PASS**

Re-QA after augmenting with the `raw/more Albuquerque/even more/` folder. Hash dedup found that the vast majority of files in the folder were byte-identical re-exports of material already processed. The only genuinely new content for the Tribune was a multi-page combined PDF containing 6 separate Tribune endorsement editorials from 1964, 1966, 1968, 1970, and 1972.

Net effect: **6 new Tribune clippings** processed (each a single page from the combined PDF), yielding 211 candidate records (after dedup, 145 net new) plus 34 proposition records (after dedup, 32 net new). The dataset grew from 555 candidates to 766 candidates (+211) and from 142 props to 174 props (+32). The biggest fills were 1964 (+42 from "The State Ticket" full-page editorial), 1968 (+44 from Tribune Recommendations), 1970 (+44 from list of endorsements), and 1972 (+71 from "The Tribune's choices in the election").

## Stage 0: Folder Augmentation Detail

- **Source:** `raw/more Albuquerque/even more/` — 1679 total files
- **Hash dedup:** 268 unique hashes; 258 matched existing canonical clippings (byte-identical)
- **Tribune-specific new content:** 1 multi-page combined PDF (`128400_19681104.pdf`, 2.3MB) containing 6 separate Tribune endorsement editorials. Split into 6 page-PDFs:
  - `128400_19681104_v3.pdf` (Nov 4 1968 TRIBUNE RECOMMENDATIONS IN TUESDAY VOTING)
  - `128400_19701030_v2.pdf` (Oct 30 1970 HERE IS LIST OF TRIBUNE'S ELECTION ENDORSEMENTS)
  - `128400_19721103_v2.pdf` (Nov 3 1972 THE TRIBUNE'S CHOICES IN THE ELECTION)
  - `128400_19661107_v3.pdf` (Nov 7 1966 VOTE FOR PROGRESS)
  - `128400_19641103_v3.pdf` (Nov 3 1964 INDEPENDENT, BUT NOT NEUTRAL — Johnson endorsement)
  - `128400_19641031_v2.pdf` (Oct 31 1964 full-page editorial: STATE TICKET, CONGRESSIONAL RACES, COUNTY TICKET, REPRESENTATIVES, LEVIES, FLOOD CONTROL BOARD, AMENDMENTS)

## Stage 1: Structural Validation

- 16 candidate columns + 11 proposition columns (canonical schema)
- Year range 1934-2004, 28 unique election years, all even
- All `endorsed` values valid (1/0/empty)
- All `newspaper_id` populated as `128400`; `state_newspaper`/`state_election` as `NM` in 100% of rows
- 0 incumbency `=0` errors
- 0 junk rows
- 0 confidence values out of `[0,1]` range

## Stage 2: Spot Check (new clippings)

Verified that the new clippings produce records consistent with their source editorials. Examples:

- `128400_19641031_v2.pdf` (full editorial page): 41 candidates including Campbell-Easley D Gov-LG, Miller D Sec State, Grant D Auditor, Witt D AG, Vigil D Treasurer, Compton Supreme Court (unopposed), Morris D + Walker D for House, full Bernalillo Democratic county ticket, Sceresse D DA, Mrs. Hay D Sheriff, plus 18 state-rep districts + 13 propositions (10 amendments, 2 levies, pre-primary repeal).
- `128400_19681104_v3.pdf`: 44 candidates — Nixon-Agnew President, Morris D-1 + Walker D-2 House, Chavez-Alarid D Gov-LG, full state ticket (Evans D inc Sec State, Thompson R inc Auditor, Kornegay D Treasurer, Clear R AG, etc.), Armijo R Supreme Court, 4 Court of Appeals judges, county slate, plus 18 state-rep districts and 2 propositions.
- `128400_19701030_v2.pdf`: 44 candidates incl. Domenici-Skeen R Gov-LG, Lujan + Foreman R House, full state ticket, Watson Supreme Court, plus 8 amendments + 1 referendum (fluoridation).
- `128400_19721103_v2.pdf`: 71 candidates — Nixon-Agnew, Domenici Sen, Lujan + Runnels House, full Supreme Court / Court of Appeals slate, 11 state senate districts, 22 state rep districts, 8 district court judges, Brandenburg DA, full county roster, plus 3 amendments + 2 bonds + 1 referendum.

Direction calls verified against editorial conclusions in each PDF.

## Stage 3: Variable Coding & Dedup

**Issues:** Cross-file dedup absorbed 66 candidate matches (overlap between new combined-PDF pages and existing same-date clippings). 0 propositions deduped this cycle. All other coding checks clean.

- 31 office codes — all standard or accepted-local NM codes (DELEGATE, RIVER COMM, RAILROAD COMMISSION, LAND COMMISSIONER preserved per skill rules)
- 4 party values — all canonical (Democrat, Republican, Nonpartisan, blank)
- All `cand_name` values ALL CAPS in `LASTNAME, FIRSTNAME` format
- 0 (year, name, office, dist) duplicates after dedup
- 0 proposition duplicates

## Stage 4: Low-Confidence Re-Scan

**Records reviewed:** 73 cand records < 0.85 (mean 0.899, min 0.55); 7 prop records < 0.85 (mean 0.903, min 0.60).

Many new low-conf records came from state-rep districts in the 1968/1970/1972 combined-PDF pages where party affiliations weren't always printed in the recap-style editorials. The agent flagged these appropriately. The previously-documented low-conf records remain, all carrying detailed `extraction_confidence_note` fields.

## Coverage notes

- **No new years added:** All 28 election years (1934-2004) were already in the dataset. The "even more" folder added significant depth for 4 historically thin years (1964, 1968, 1970, 1972).
- **Net new records:** 145 candidates + 32 propositions added (after cross-file dedup).
- **Highest-density year fills this round:**
  - 1972 (+71 from "The Tribune's choices in the election" recap)
  - 1968 (+44 from Tribune Recommendations recap)
  - 1970 (+44 from list of endorsements)
  - 1964 (+42 from the full-page Oct 31 editorial)
- **Pre-augmentation gap-filling:** Before this round, the Tribune's 1964/1968/1970/1972 records were thin (often just president/senate/governor). The combined-PDF pages added full state-house slates (18-22 districts each), which is critical for state-legislative analysis.
- **2008 Tribune closure:** Tribune ceased publication in 2008. Dataset extends through 2004 (last extant endorsement clipping in archive).

## Cross-Paper Consistency Check (recap)

With Tribune's coverage now significantly expanded for 1964/1968/1970/1972 — and Journal coverage similarly expanded for 1964/1966/1968/1970/1972/1974 — a future cross-paper check could re-evaluate alignment in those years (the original `done/CROSS_PAPER_CHECK_ABQ.md` covers 1934-1988 at coarse grain).
