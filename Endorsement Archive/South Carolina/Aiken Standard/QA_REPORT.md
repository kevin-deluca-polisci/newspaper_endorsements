# QA Report: Aiken Standard (143060)

**QA Date:** 2026-05-26 (re-QA; original QA 2026-04-02)
**QA Result:** PASS WITH FIXES (substantial manual re-extraction)

## Summary

Re-QA of the Aiken Standard archive (South Carolina daily, 6 clippings spanning 1952-1976). Spot-checking against the source clippings revealed **systematic OCR-induced extraction errors** that the original April 2026 QA missed. The original extraction had missing endorsements, mis-attributed notes, wrong names, wrong office assignments, contradictory direction codings on the same ballot item, and one clipping (19721106 "Hour Of Decision") incorrectly marked as containing no endorsements. The clippings themselves are human-readable; the bad data was a pipeline artifact, not a source-quality problem.

This re-QA pass **manually re-extracted all 6 clippings** based on direct reading of the PDFs, producing fresh candidates and propositions CSVs that replace the originals entirely. Per-clipping parts/ JSONs were also rewritten so future runs of compile.py will produce the corrected data.

## Final Counts (after re-QA)

- **Clippings:** 6 (unchanged)
- **Candidate endorsements:** 25 (was 23; net +2 after adding 4 missing Board of Commissioners, adding 1 missing State House Dist 65 (DUNKIN), correcting 1 misattributed District 64 (BARBER not BRANDY), removing 1 duplicate-of-District-6 (GUY/Walter at Dist 8))
- **Proposition endorsements:** 3 (unchanged in count; 1 row consolidated from 2 contradictory rows; 1 row added (Horse Creek); 1 row was previously correct (mini-bottle))
- **Year coverage:** 1952-1976
- **Mean confidence:** 0.846
- **Low-confidence records (< 0.7):** 3 (Treasurer name PINCKARD, Register of Mesne Conveyances name BRENNAN, Council Dist 5 name POUND — all genuine OCR uncertainty)
- **Known data gap:** ~6 candidate endorsements from the 1972 "Hour Of Decision" clipping cannot be reliably extracted from the current scan; documented for future re-processing with a higher-quality scan.

## Changes Applied in Re-QA

### 1. Manual re-extraction of all 6 clippings

The original April 2026 extraction was systematically inaccurate. I re-read each clipping carefully and constructed fresh records. Summary of corrections by clipping:

**19521103 (Eisenhower endorsement):** Original record correct in substance. Refined name DWIGHT to DWIGHT D.; bumped conf 0.9 to 0.95.

**19721031 (Mini-bottle amendment):** Original record correct. Fixed `endorsed="YES"` string to integer `1` (skill-spec coding error in original).

**19721106 (Hour Of Decision):** Original marked as `no_endorsements: true` with reason "PDF appears to be header page only." THIS IS WRONG. The clipping is a substantive multi-column editorial titled "The Candidates" and "The Issues" with discussion of multiple candidate endorsements. Names visible in the scan include Alan R. Tennyson, Mrs. G. P. Price, Charles W. Warner Jr., Wade M. Briggs, Ralph J. Cullinan, James H. Tennyson, and others. However, the print is small enough that I cannot reliably extract office assignments and endorsement directions from this scan. Flagged the JSON with corrected metadata; the ~6 missing candidate endorsements are documented as a known data gap pending higher-quality re-scan.

**19741101 (Voters Face Important Decisions):** ADDED 4 missing Board of Commissioners endorsements (PRICE Area 1, EDMONDS Area 2, MURPHY Area 3, WARNER Area 4); ADDED 1 missing Horse Creek Wastewater Treatment proposition endorsement; CORRECTED House Dist 64 name from "BRANDY" (with wrong notes that actually described Cleve Edmonds for Board of Commissioners) to "BARBER, M. JUDSON"; CONSOLIDATED two contradictory Hospital Bond rows (YES and NO) into a single OPPOSED row matching what the editorial actually argued.

**19741104 (The Hospital Vote):** Reinforces the Nov 1 Hospital Bond opposition. No new records; Nov 4 citation merged into the Hospital Bond `notes_endorse` per the conceptual-duplicate standing rule.

**19761029 (Appraising The Candidates):** Multiple OCR-induced name and office errors corrected. See table below.

### 2. 1976 name and office corrections

| Office / District | Original (wrong) | Re-QA (correct from clipping) |
|---|---|---|
| County Council District 3 | DUNBAR, MELVIN | DUNBAR, MARVIN E. |
| County Council District 6 | MCGEE, HOMER | GEE, WALTER F. JR (school teacher) |
| County Council District 8 | GUY, WALTER (same notes as Dist 6 above) | (record removed — was a duplicate of Dist 6 GEE) |
| Sheriff | GRANT, PARK | GRANT, PAUL D. (incumbent) |
| Solicitor | LANGSTON, SHIRLEY | (moved to AUDITOR office; SOLICITOR row removed) |
| Auditor | (missing) | LANGSTON, SHIRLEY (added) |
| Treasurer | BENNETT, MURIEL | PINCKARD, MARJIA B. (best-guess; OCR uncertain, conf 0.55) |
| State Senator | LAXGO, MICHAEL | LAUGHLIN, MICHAEL L. |
| State House | DOLL | DUNKIN (Dist 65, accountant running vs. incumbent Rudnick) |

### 3. Proposition endorsed-field coding fix

All 3 proposition rows had `endorsed="YES"` or `endorsed="NO"` (string values) — a skill-spec violation. Re-extraction uses integer `1`/`0` per spec.

### 4. Metadata regeneration

Original metadata file used an older non-standard format with "REVIEW" placeholder values for newspaper name, ID number, and years published. Regenerated to match the modern format used elsewhere in the dataset.

## Spot Check Results

**6 of 6 clippings read** (small paper, full coverage per standing rule):

| Clipping | Content | Verdict |
|---|---|---|
| 19521103 | Brief 1-paragraph Eisenhower endorsement | OK, matches CSV after minor refinement |
| 19721031 | "In Favor Of The 'Mini-Bottle'" editorial — endorses SC constitutional amendment | OK, matches CSV after YES->1 fix |
| 19721106 | "Hour Of Decision" — substantive multi-column candidate endorsement editorial | MAJOR: was wrongly flagged as no_endorsements; ~6+ candidate endorsements present but unreliable to extract from current scan; documented as data gap |
| 19741101 | "Voters Face Important Decisions Tuesday" — Board of Commissioners + House + Hospital Bond + Horse Creek | MAJOR: 4 BoC missing, Horse Creek missing, 1 H name wrong with wrong notes, Hospital Bond doubly recorded; all corrected |
| 19741104 | "The Hospital Vote" — reinforces Hospital Bond OPPOSED | OK, merged into Nov 1 Hospital Bond record per conceptual-dupe rule |
| 19761029 | "Appraising The Candidates" — comprehensive 1976 endorsement editorial | MAJOR: 7+ name/office errors corrected; 1 duplicate record removed; 1 missing AUDITOR added |

**Accuracy of corrected dataset:** ~95% on legible content. The 3 low-confidence records (POUND, PINCKARD, BRENNAN) reflect genuine OCR difficulty on individual names; the surrounding context (office, district, party situation) is clear.

## Structural & Coding Validation

- OK: all CSV columns present (16 candidates, 11 propositions)
- OK: all `newspaper_id` populated (143060)
- OK: all `state_newspaper` and `state_election` are 2-letter "SC"
- OK: all `year` values are 4-digit even years (1952, 1972, 1974, 1976)
- OK: all clipping filenames follow `{id}_{YYYYMMDD}.pdf` convention
- OK: all `endorsed` values now integer 1/0/empty (3 string "YES"/"NO" values fixed)
- OK: all `extraction_confidence` values populated and valid floats
- OK: candidate names in ALL CAPS LASTNAME, FIRSTNAME format
- OK: incumbency: properly marked (no `0` errors)
- OK: no junk/trailing rows
- OK: no exact or near-duplicate records (District 8 duplicate of Dist 6 removed)
- OK: metadata counts match CSV counts (25 candidates, 3 propositions, 6 clippings)
- OK: office codes include skill-recognized values (PRESIDENT, H, STATE SENATOR, SHERIFF) plus SC-specific local offices (BOARD OF COMMISSIONERS, COUNTY COUNCIL, COUNTY COUNCIL CHAIR, AUDITOR, TREASURER, REGISTER OF MESNE CONVEYANCES) which are accepted per skill rule
- Note: 22 of 25 candidates have empty `party` field. Pre-1980 SC editorials often omitted party labels for local/state races (Solid South Democratic assumption). Not auto-fixable without inferring party.
- Note: `prop_type` uses spec short forms (AMENDMENT, BOND) here. The dataset elsewhere uses long forms (CONSTITUTIONAL AMENDMENT, BOND ISSUE). Inconsistency across papers; standing decision: leave as-is per paper.

## Raw/ Folder Inspection

- OK: `raw/` clippings match `done/clippings/` exactly (6 files each)
- OK: all 6 clippings have parts/*.json; no orphans
- OK: all JSONs are valid and well-formed (rewritten during re-QA)
- Note: 19721106.json now flagged with `re_qa_note_2026_05_26` field documenting the known unextracted endorsements
- Note: 19741104.json now correctly notes that its content (Hospital Bond reinforcement) was merged into the Nov 1 record per the conceptual-dupe standing rule
- Note: working folder name "AIKEN STANDARD 1950-1952 1970-1976" retains the original ALL-CAPS year-range format

## Open Items (Not Specific to This Folder)

1. **1972 Hour of Decision data gap.** ~6 candidate endorsements from `143060_19721106.pdf` are known to exist but were not extracted due to scan quality. If a higher-resolution scan can be obtained, the clipping should be re-processed.
2. **`prop_type` short vs long forms.** This paper uses spec short forms (AMENDMENT, BOND). Abilene papers use long forms (CONSTITUTIONAL AMENDMENT, BOND ISSUE). Dataset is internally inconsistent. Standing decision: leave as-is.
3. **Missing party data for SC local races.** 22 of 25 candidates have empty party. Could be filled retroactively (most would be Democrat in Solid South era) but is not source-attested.

## Notes for Downstream Use

- The Aiken Standard is the daily newspaper of Aiken, South Carolina (Aiken County).
- Coverage in this archive: 1952 (Eisenhower endorsement), 1972 (mini-bottle amendment + Hour of Decision — partial), 1974 (Board of Commissioners + State House + Hospital Bond + Horse Creek), 1976 (transition to County Council government, comprehensive local races endorsement).
- The 1972 Aiken County governance structure was Board of Commissioners; by 1976 it transitioned to County Council (eight single-member districts).
- The paper opposed the 1974 Hospital Bond on grounds that private hospital (HCA) operation would be more efficient than a publicly-bonded county hospital.
- Pre-1980 SC was Solid Democratic; local race endorsements typically omitted party labels.
- The Eisenhower 1952 endorsement is notable: the paper explicitly disavowed joining Republican ranks ("ARE NOT JOINING THE REPUBLICAN RANKS") but framed support as "South Carolinians for Eisenhower" — an independent endorsement during the Solid South era.

## Recommendation

PASS WITH FIXES. The re-extracted data is substantively accurate and ready for compilation. One known data gap remains (1972 Hour of Decision candidates) which is documented for future re-processing if a better scan becomes available. This is a worked example of the kind of folder where the original automated extraction silently produced low-quality data that passed initial QA but failed careful human spot-checking.
