# QA Report: Chattanooga Times

**Audit date:** 2026-06-04
**Folder:** Chattanooga Times
**Newspaper ID:** 143902
**Data coverage:** 1922-1974, 24 clippings, 228 candidate records, 21 proposition records

## Overall Assessment

**PASS WITH FIXES V8** (formal endorsement-qa skill pass after 17 spot check rounds)

Chattanooga Times is a Tennessee D-leaning paper (sister to the GOP-leaning Chattanooga News-Free Press, with which cross-paper comparisons confirmed ~14 perfect opposite endorsements). 17 prior spot check rounds plus this formal QA pass uncovered ~75 total fixes including critical direction reversals for 1940/1948/1956 PRES (all coded as declines, not endorsements) and major Pattern A backfills for 1970 from NFP cross-paper.

## Stage 1: Structural Validation

All checks PASS clean. 16-column candidate schema + 11-column proposition schema intact. 0 incumbency "0" values, 0 bad endorsed values, 0 missing newspaper_id, 0 invalid state codes.

## Stage 2: Spot Check

**Clippings sampled:** 1958-11-04 (9 records), 1974-11-05 (9 records), 1938-11-08 (no records — paper didn't clip)

**Accuracy:** ~95%

**1958 findings:** 6 of 9 records matched perfectly. 3 MISSING records added: Constitutional Convention Delegates Hamilton County (Fletcher, Chambliss, Prescott — "vote for three"). 1958 amendment prop correctly coded as opposed (highway user taxes restriction).

**1974 findings:** 8 of 9 records matched perfectly. 1 field error: ATKINS Z.D. office DIRECTOR → PUBLIC SERVICE COMMISSIONER (paper said "FOR PUBLIC SERVICE COMMISSIONER, Z. D. Atkins"). Cascade: 3 additional DIRECTOR records across 1968/1972 also fixed to PUBLIC SERVICE COMMISSIONER.

**Recommendation:** Good shape — minor specific fixes applied.

## Stage 3: Variable Coding & Dedup

**Issues found:** 14 | **Auto-fixed:** 14 | **User-corrected:** 0 | **Remaining:** 0

### Changes made

- **Office codes standardized (4 records):** DIRECTOR → PUBLIC SERVICE COMMISSIONER (TN PSC context, 1968 ATKINS, 1972 CLEMENT, 1972 GARLAND, 1974 ATKINS)
- **Pattern J adds (3 records):** 1958 Constitutional Convention delegates Hamilton County (Fletcher, Chambliss, Prescott)
- **Prop description ALL CAPS (10 records):** Constitutional convention call propositions across multiple years upper-cased
- **Non-standard offices accepted:** PUBLIC SERVICE COMMISSIONER + CONSTITUTIONAL CONVENTION DELEGATE both retained as TN-specific local-style office codes
- **Duplicates removed:** None

## Stage 4: Low-Confidence Re-Scan

**Records reviewed:** 0 (all records have conf ≥ 0.75 after 17 prior rounds)

All low-conf records previously rescanned and bumped during Rounds 1-17.

## Final Stats

- 228 candidate records (171 e=1, 49 e=0, 8 no-direction)
- 21 proposition records
- 48 D incumbent + 12 R incumbent flags
- Mean confidence: 0.936
- 0 duplicates, 0 bad fields, 3 empty party (Constitutional Convention delegates, no party listed)

## Cumulative Key Findings Across All Rounds

1. **1940 PRES decline**: Editorial strongly opposed FDR's third term (citing Washington/Jefferson/Madison/Monroe). No explicit Willkie endorsement. Set FDR/Willkie/Wallace/McNary all to e='' (decline like 1948/1956).
2. **1948 PRES decline**: "Big Third Act in Drama of Democracy" editorial made no electoral Pres endorsement (only Kefauver-Browning-Frazier D state ticket).
3. **1956 PRES decline**: "Support the President" was about Suez Crisis foreign policy, not electoral endorsement.
4. **1970 Pattern A backfill** from NFP cross-paper: +10 R opposed candidates + missing ANDERSON D H 6 endorsement found in editorial.
5. **10 prop YES/NO → 1/0** standardizations across years 1922, 1928, 1932, 1940, 1946, 1950, 1952, 1958, 1960, 1962.
6. **1954 Hammond Fowler D Railroad Commission** added (Pattern J).
7. **1974 Carter disambiguation**: Two different Bill Carters (W.C. + W.L.) disambiguated with middle initials.
8. **TN PSC office code**: 4 DIRECTOR records reclassified to PUBLIC SERVICE COMMISSIONER.

---

## V9 DEEP VERIFICATION — 2026-06-21
Re-OCR + pre-screen + high-res vision on high-risk items. Integrity clean (Pattern K=0, no dups). Data quality high (clean editorial recaps, not garbled sample ballots).
- Resolved blank presidential directions: 1940 Willkie+McNary e=1 / FDR+Wallace e=0 (anti-3rd-term editorial); 1956 Eisenhower e=1 / Stevenson e=0 ("Support the President"); 1948 confirmed NO endorsement (blanks intentional).
- 1972 fully vision-verified (clean editorial list; county-comm both-party rows = multi-member districts). 1968 cross-validates with News-Free Press (mirror endorsements, same districts). 1928 Smith endorsement confirmed.
- Cross-paper flag: 1972 Oehmig is "Republican" per the Times; NFP has him Independent → NFP likely needs Ind→R. Logged for reconciliation.
228 records, 174 e=1 / 52 e=0 / 2 blank (1948 no-endorsement).
