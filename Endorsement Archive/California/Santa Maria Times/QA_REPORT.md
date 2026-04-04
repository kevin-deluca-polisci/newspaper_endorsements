# QA Report: Santa Maria Times

**Audit date:** 2026-04-03
**Folder:** Santa Maria Times
**Newspaper ID:** 104700
**Data coverage:** 1958-2008, 33 clippings, 145 candidate records, 226 proposition records

## Overall Assessment

PASS WITH FIXES

Legacy hand-coded data (converted from xlsx) with generally accurate coding for records that are present. The main weakness is underextraction: the 1968 clipping contains proposition endorsements that were never coded, and the 1986 clipping is missing 3 statewide candidate endorsements and 1 proposition. Existing records are highly accurate in direction and coding. Seven duplicate 1966 candidate records and 34 non-standard party abbreviations were fixed during QA.

## Stage 1: Structural Validation

CSV columns: OK (16/16 candidates, 11/11 propositions). Row integrity clean -- all years valid, all endorsed values 0/1, all confidence values 0.85, all state fields valid 2-letter codes. No empty state_election values, no incumbency "0" values, no junk rows.

Issues found and fixed:
- 6 duplicate 1966 candidate records (ATTORNEY GENERAL, GOVERNOR, H, LT GOVERNOR, SEC OF STATE, TREASURER all appeared twice with slightly different incumbency data). Deduplicated by keeping the version with more populated fields.
- 34 non-standard party abbreviations: IND -> Independent, PROG -> Progressive, LBT -> Libertarian.
- 217 proposition prop_num values had ".0" suffix (float artifact from xlsx conversion). Cleaned to integers.
- 16 dname values had ".0" suffix. Cleaned.
- FLOURNOY, HUGH (1966 Comptroller) corrected to FLOURNOY, HOUSTON I. (formal name).
- 1968 SENATOR dist=13 cleared (US Senate races have no district).
- 1990 SENATOR dist=14 MADDY, KENNETH recoded as STATE SENATOR (he was a CA State Senator, not US Senator).

Metadata counts (149 candidates, 225 propositions) no longer match after dedup and additions. Updated counts: 145 candidates, 226 propositions.

Odd years flagged: 1969, 1971, 1979, 1991, 1993 in data. All are legitimate California off-cycle elections (special elections, local measures, constitutional amendments).

## Stage 2: Spot Check

**Clippings sampled:** 104700_19681104_1.jpg (1968), 104700_19861103.pdf (1986), 104700_20061106.jpg (2006)
**Accuracy:** ~81% (38 correct out of ~47 total unique endorsements across all 3 clippings)

**1968 clipping (104700_19681104_1.jpg):**
3 candidate endorsements (NIXON for President, RAFFERTY for US Senate, MACGILLIVRAY for Assembly 36) -- all match CSV perfectly. However, the clipping also contains proposition endorsements (Propositions 1A, 1, 2, 3, and several more visible) that are entirely absent from the CSV. Estimated 8-12 propositions missing. Image quality makes exact extraction difficult. This is the largest data gap in the folder.

**1986 clipping (104700_19861103.pdf):**
11 candidate endorsements in CSV all verified correct. 3 additional statewide candidates visible in the clipping were missing: Controller (BILL CAMPBELL, Republican), Attorney General (JOHN VAN DE KAMP, Democrat, incumbent), and Board of Equalization 2nd District (CONWAY H. COLLIS, Democrat). All 3 added. Local office endorsements (Mayor, City Council) were not in CSV -- these may have been intentionally excluded by the original coder.

12 propositions in CSV for 1986. Prop 53 (School Building Bond, NO) was missing -- added. Prop 55 (Safe Drinking Water Bond) was coded as endorsed=0 but the clipping shows YES recommended -- corrected to endorsed=1.

Supreme Court retention votes (BIRD, REYNOSO, GRODIN all NO) verified correct.

**2006 clipping (104700_20061106.jpg):**
13 proposition endorsements all match CSV perfectly (Props 1A-1E, 83-90). 100% accuracy.

**Recommendation:** Pass with fixes. Existing records are reliable. The 1968 proposition gap is a known limitation of the legacy coding.

## Stage 3: Variable Coding & Dedup

**Issues found:** 1 | **Auto-fixed:** 1 | **User-corrected:** 0 | **Remaining:** 0

### Changes made

- **Duplicate FLOURNOY removed (1 record):** After name correction HUGH -> HOUSTON I., a duplicate 1966 COMPTROLLER record was created. Removed the duplicate, keeping the version with d_inc=1.
- **Dual incumbency fix (1 record):** 1971 LAGOMARSINO, ROBERT (STATE SENATOR, Republican) had both d_inc=1 and r_inc=1. Cleared d_inc since he was a Republican incumbent only.

All office codes, party labels, name formats, state fields, district fields, and endorsed values verified correct after Stage 1 fixes.

## Stage 4: Low-Confidence Re-Scan

**Records reviewed:** 0 | **Confirmed correct:** 0 | **Corrected:** 0 | **Still uncertain:** 0

All records have uniform confidence of 0.85 (legacy data). No records below the 0.75 threshold. Stage skipped.

### Known data gaps (not fixable from available clippings)

- 1968 propositions: Multiple state proposition endorsements visible in clipping but not coded in original xlsx. Image quality limits confident extraction.
- 1986 local offices: Mayor and City Council endorsements visible but may have been intentionally excluded from the dataset scope.
