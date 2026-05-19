# QA Report: Nashville Tennessean

**Audit date:** 2026-04-14
**Folder:** Nashville Tennessean
**Newspaper ID:** 144470
**Data coverage:** 1918-1956, 24 clippings, 78 candidate records, 1 proposition record

## Overall Assessment

PASS WITH FIXES

Data quality is strong. Spot-check accuracy was 100% across three sampled clippings (1922, 1944, 1952). Main issues were mechanical: 227 incumbency "0" values, 9 duplicate records from multi-clipping endorsements, 4 office codes needing standardization, and 1 district conflict (Evins/Priest both coded as TN-5 in 1948). No extraction errors or fabricated endorsements found.

## Stage 1: Structural Validation

- CSV columns: OK (16 candidate columns, 11 proposition columns)
- Row integrity: 227 incumbency "0" values auto-fixed to empty; no empty state_election; no bad endorsed values
- Election date sanity: OK (all even years, all Oct/Nov dates)
- Metadata consistency: OK (metadata says 87 candidates/1 proposition; CSV matched before dedup)
- Newspaper ID: populated in all rows (144470)
- Duplicates found and removed: 9 (1924 Davis, 1934 McAlister, 1934 McKellar, 1940 Priest, 1948 Truman, 1948 Kefauver, 1948 Browning, 1956 Stevenson, 1956 Eisenhower)
- Row count after dedup: 78

## Stage 2: Spot Check

**Clippings sampled:** 144470_19221107.pdf (1922), 144470_19441031.pdf (1944), 144470_19521027.pdf and 144470_19521102.pdf (1952)
**Accuracy:** 100%

- **1922 "A Final Message" (144470_19221107):** Front-page election day editorial. Independent reading found 4 endorsements: Peay (D, Governor endorsed), Taylor (R, Governor inc opposed), McKellar (D, Senator inc endorsed), Dunlap (D, Public Utilities Commissioner endorsed). All 4 records match data exactly.
- **1944 "The Tennessean's Choice" (144470_19441031):** Long editorial endorsing Roosevelt for 4th term, opposing Dewey. Both records match exactly.
- **1952 US House + President (144470_19521027, 144470_19521102):** Priest endorsed/Wall opposed for H-5; Stevenson endorsed/Eisenhower opposed for President. All 4 records match exactly.

**Recommendation:** Good shape. No extraction errors found.

## Stage 3: Variable Coding & Dedup

**Issues found:** 241 | **Auto-fixed:** 241 | **User-corrected:** 0 | **Remaining:** 0

### Changes made

- **Incumbency "0" cleared (227 values):** All d_inc, r_inc, o_inc values of "0" converted to empty across all 87 original rows
- **Duplicates removed (9 records):** 1924 President Davis (conf=0.9), 1934 Governor McAlister (conf=0.92), 1934 Senator McKellar (conf=0.92), 1940 H Priest (conf=0.93), 1948 President Truman (conf=0.93), 1948 Senator Kefauver (conf=0.93), 1948 Governor Browning (conf=0.88), 1956 President Stevenson (conf=0.95), 1956 President Eisenhower (conf=0.95). Higher-confidence copy retained in each case.
- **Office codes standardized (4 records):** RAILROAD COMMISSIONER -> RAILROAD COMMISSION (1918 Hannah, 1920 Welch, 1924 Hannah, 1928 Dunlap)
- **District conflict fixed (1 record):** 1948 Evins district changed from "5" to "" — editorial did not specify his district and "5" conflicted with Priest (TN-5). Left blank for downstream verification.

## Stage 4: Low-Confidence Re-Scan

**Records reviewed:** 1 | **Confirmed correct:** 1 | **Corrected:** 0 | **Still uncertain:** 0

- **1926 STATE SENATOR HILL (conf=0.70):** Previously reviewed during extraction and confirmed by user as STATE SENATOR. No US Senate race in TN in 1926 makes state senator the most reasonable interpretation. Only last name given in editorial. Confidence retained at 0.70 — accurate but incomplete data (no first name).
