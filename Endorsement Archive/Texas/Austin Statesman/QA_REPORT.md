# QA Report: Austin Statesman

**Audit date:** 2026-04-02
**Folder:** Austin Statesman (evening paper, pre-merger)
**Newspaper ID:** 144700
**Data coverage:** 1960-1972, 15 clippings, 9 candidate records, 9 proposition records

## Overall Assessment

**PASS WITH FIXES**

Small dataset from the evening paper before the 1973 merger with the Austin American. Candidate records are in good shape. Proposition records include 2 low-confidence constitutional amendment records from 1972 where endorsement positions were unclear due to poor scan quality -- these were kept as-is per user decision. The newspaper_id was confirmed as 144700.

## Stage 1: Structural Validation

- CSV columns: OK. All expected columns present.
- Row integrity: OK. All years valid, endorsed values valid, confidence scores in range.
- Election date sanity: OK. All clippings from October-November of even years.
- Metadata consistency: OK. Record counts match between metadata and CSV.
- Newspaper ID: Populated (144700).

## Stage 2: Spot Check

**Clippings sampled:** 144700_19701029.pdf (1970), 144700_19721103_1.pdf (1972)
**Accuracy:** 90%+

The 1970 clippings contained candidate endorsements for statewide races and some constitutional amendments. The 1972 clippings had dense multi-column text about constitutional amendments that was challenging to parse. Core candidate endorsements matched the data accurately.

**Recommendation:** Good shape. Low-confidence proposition records are appropriately flagged.

## Stage 3: Variable Coding & Dedup

**Issues found:** 0 | **Auto-fixed:** 0 | **User-corrected:** 0 | **Remaining:** 0

No duplicates found. All office codes standard. All names in correct format. Party labels consistent. No changes needed.

## Stage 4: Low-Confidence Re-Scan

**Records reviewed:** 2 | **Confirmed correct:** 0 | **Corrected:** 0 | **Still uncertain:** 2

Both low-confidence records are 1972 constitutional amendment propositions where the endorsement position was unclear from the scan:

- `144700_19721103_2.json`: AMENDMENT NO. 4 (conf=0.70, endorsed=null). Dense multi-column text, final recommendation position unclear.
- `144700_19721103_3.json`: AMENDMENT NO. 4 (conf=0.65, endorsed=null). Extremely small text, poor scan quality.

These were kept as-is per user decision. The uncertainty is genuine -- the scan quality makes it impossible to determine the endorsement position with confidence.
