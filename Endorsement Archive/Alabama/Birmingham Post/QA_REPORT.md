# QA Report: Birmingham Post

**Audit date:** 2026-04-04
**Folder:** Birmingham Post
**Newspaper ID:** 100103
**Data coverage:** 1922-1948, 32 clippings, 9 candidate records, 35 proposition records

## Overall Assessment

**PASS WITH FIXES**

Data quality is high after extensive manual correction during extraction. All 7 spot-checked clippings (8 including a bonus check) matched the data at 100% accuracy. The only QA-stage fix needed was standardizing 3 party labels from "Democratic" to "Democrat". However, 8 of 32 clippings required significant manual rewriting during the extraction phase itself due to persistent agent errors (missed implicit endorsements, reversed endorsement directions, wrong amendment numbers, false "OCR too poor" claims).

## Stage 1: Structural Validation

- CSV columns: OK (candidates: 16 columns, propositions: 11 columns, all expected fields present)
- Row integrity: OK (all years even, all endorsed values 0/1, all confidence scores 0.80-0.95, all state fields 2-letter codes, all newspaper_id populated)
- Election date sanity: OK (all clippings October-November, all years match data)
- Metadata consistency: OK (counts match CSVs: 9 candidates, 35 propositions)
- Newspaper ID: populated in all rows (100103)
- No undated clippings found

## Stage 2: Spot Check (Initial 3 + 4 Additional = 7 Clippings)

**Clippings sampled:** 100103_19221102 (1922), 100103_19261030 (1926), 100103_19341103 (1934), 100103_19361102 (1936), 100103_19381103 (1938), 100103_19381107 (1938), 100103_19441103 (1944), 100103_19481027 (1948)

**Accuracy:** 100% (18/18 records correct across 8 clippings)

- 19221102: Talladega Tax Amendment Question No. 2 endorsed. 1/1 correct.
- 19261030: Three-mill school tax continuation endorsed. 1/1 correct.
- 19341103: Griffith (Independent, Circuit Judge) opposed. 1/1 correct.
- 19361102: Roosevelt endorsed + 5 amendments all endorsed. 6/6 correct.
- 19381103: Amendment No. 1 (gasoline tax) endorsed. 1/1 correct.
- 19381107: Unnamed constitutional amendment opposed. 1/1 correct.
- 19441103: 6 amendments (1,2,5,6 endorsed; 3,4 opposed). 6/6 correct.
- 19481027: Amendment No. 6 (Jefferson County sewer bonds) endorsed. 1/1 correct.

**Recommendation:** Data is in good shape. No missing endorsements, no extra records, no field errors found in spot checks.

## Stage 3: Variable Coding & Dedup

**Issues found:** 3 | **Auto-fixed:** 3 | **User-corrected:** 0 | **Remaining:** 0

### Changes made

- **Party labels fixed (3 records):** "Democratic" -> "Democrat" for Miller 1930 Governor, Roosevelt 1932 President, Roosevelt 1936 President. Fixed in both CSVs and underlying JSON files.
- **Office codes:** All valid (PRESIDENT, VICE PRESIDENT, GOVERNOR, JUDGE).
- **Candidate names:** All ALL CAPS, LASTNAME FIRSTNAME format.
- **Proposition fields:** All prop_desc and notes_endorse ALL CAPS. All prop_type values valid.
- **Incumbency fields:** All correctly coded (only Roosevelt 1936 has d_inc=1, which is correct).
- **Duplicates:** None remaining (3 candidate dupes and 12 proposition dupes were removed during compilation).

## Stage 4: Low-Confidence Re-Scan

**Records reviewed:** 1 | **Confirmed correct:** 1 | **Corrected:** 0 | **Still uncertain:** 0

- `100103_19241101_2.json`: LA FOLLETTE, ROBERT M. (President 1924, conf=0.80). This was manually corrected during extraction from a missed implicit endorsement. The editorial strongly advocates for La Follette without using literal "we endorse" language. Verified correct; confidence bumped from 0.80 to 0.85.

## Extraction Phase Notes

While QA-stage fixes were minimal, the extraction phase required heavy manual intervention. For the record, these clippings were rewritten during extraction:

1. **100103_19241101_2**: Agent marked no_endorsements. Fixed: La Follette presidential endorsement.
2. **100103_19241103**: Agent had badly-formatted single proposition. Rewritten: La Follette + 3 bond measures.
3. **100103_19341030**: Agent marked no_endorsements. Fixed: Mobile County amendment endorsed.
4. **100103_19341103**: Agent coded Griffith as endorsed=1. WRONG — paper explicitly opposes him. Fixed.
5. **100103_19341105**: Agent marked no_endorsements. Fixed: Griffith opposition + Mobile County amendment.
6. **100103_19361031**: Agent claimed "OCR quality too poor." Fixed: 5 amendments all endorsed.
7. **100103_19381103**: Agent claimed "OCR severely degraded." Fixed: Amendment No. 1 explicitly endorsed.
8. **100103_19321104**: Agent swapped descriptions/directions for Amendments 6 and 8. Fixed via PDF verification.
9. **100103_19441103**: Agent had wrong amendment numbers, wrong directions, missing records. Complete rewrite: 6 amendments.
10. **100103_19441104**: Agent marked no_endorsements. Fixed: implicit Dewey presidential endorsement.

Additional fixes applied during extraction: candidate names standardized to ALL CAPS, Roosevelt 1932 incumbency corrected (was challenger not incumbent), Hoover/Willkie/McNary/Dewey incumbency fields cleared, state_election standardized to "AL", schema field names corrected (prop_name/prop_description -> prop_type/prop_num/prop_desc).


## Cross-Paper QA (2026-04-04)

Cross-paper consistency check run across all 4 Birmingham papers. No corrections needed for Post. One minor name variant noted: MILLER, BENJAMIN M. (Post 1930) vs MILLER, B. M. (Age Herald 1930) -- both acceptable forms, no change made.
