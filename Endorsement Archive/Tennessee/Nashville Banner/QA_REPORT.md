# QA Report: Nashville Banner

**Audit date:** 2026-04-14
**Folder:** Nashville Banner
**Newspaper ID:** 144450
**Data coverage:** 1916-1958, 37 clippings, 54 candidate records, 5 proposition records

## Overall Assessment

PASS WITH FIXES

Data quality is strong overall. Spot-check accuracy was 100% across three sampled clippings (1932, 1952, 1958). Main issues were mechanical: 163 incumbency "0" values that should have been empty, 6 duplicate records from multi-clipping endorsements, 3 office codes needing standardization, and 1 placeholder record removed. No extraction errors or fabricated endorsements found.

## Stage 1: Structural Validation

- CSV columns: OK (16 candidate columns, 11 proposition columns)
- Row integrity: 163 incumbency "0" values auto-fixed to empty; no empty state_election; no bad endorsed values
- Election date sanity: OK (all even years, all Oct/Nov dates)
- Metadata consistency: OK (metadata says 61 candidates/5 propositions; CSV matched before dedup)
- Newspaper ID: populated in all rows (144450)
- Duplicates found and removed: 6 (1916 Rye x2, 1922 Peay x2, 1922 Taylor, 1928 Smith, 1940 Willkie)
- Row count after dedup: 55

## Stage 2: Spot Check

**Clippings sampled:** 144450_19321108.pdf (1932), 144450_19521103.pdf (1952), 144450_19581028.pdf (1958)
**Accuracy:** 100%

- **1932 Democratic Ticket (144450_19321108):** Printed ticket listing President (Roosevelt), Governor (McAlister), Railroad Commissioner (L.D. Hill), H-5 (Byrns), State Senators (Howard, Alexander), State Reps (Gilbert, Woodall, Murphy, Woodruff, Millerlie, Cross), Floterial Rep (Martin). All 12 records in data matched clipping exactly. VP (Garner) not coded per standard convention. Presidential electors correctly excluded.
- **1952 President (144450_19521103):** "Crusade For Decency, Peace Vs. More Trumanism" - Eisenhower endorsed, Stevenson opposed. Both records match exactly.
- **1958 Constitutional Amendment (144450_19581028):** "Vote To End Tax Diversion" - Highway tax amendment endorsed. Proposition record matches exactly.

**Recommendation:** Good shape. No extraction errors found.

## Stage 3: Variable Coding & Dedup

**Issues found:** 172 | **Auto-fixed:** 172 | **User-corrected:** 0 | **Remaining:** 0

### Changes made

- **Incumbency "0" cleared (163 values):** All d_inc, r_inc, o_inc values of "0" converted to empty across all 61 original rows
- **Duplicates removed (6 records):** 1916 Governor Rye (conf=0.92), 1922 Governor Peay x2 (conf=0.85 each), 1922 Governor Taylor (conf=0.92), 1928 President Smith (conf=0.85), 1940 President Willkie (conf=0.95). In each case the higher-confidence copy was retained.
- **Office codes standardized (3 records):** RAILROAD COMMISSIONER -> RAILROAD COMMISSION (rows for 1916 Enloe, 1928 Dunlap, 1932 Hill)

## Stage 4: Low-Confidence Re-Scan

**Records reviewed:** 9 | **Confirmed correct:** 8 | **Corrected:** 0 | **Removed:** 1

- **1920 Davidson County legislative ticket (8 records, conf 0.65 -> 0.75):** Re-read clipping 144450_19201030_02.pdf. Very dense multi-column page with small text. Names partially legible and consistent with extracted data (Gilbert, Jamison, Smith, Walsh, Hill, Simpson, McGugin, Dorris). Confidence bumped to 0.75 -- names appear correct but scan quality prevents full verification of all biographical details.
- **1928 "DEMOCRATIC CONGRESSIONAL NOMINEES" (conf=0.50): REMOVED.** This was a placeholder record, not a real candidate. The original scan had congressional nominee names that were illegible, producing a generic placeholder. Removed from dataset.
