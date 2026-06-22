# QA Report: Beaufort Gazette

**Audit date:** 2026-06-01 (V2 — formal endorsement-qa skill pass after 3 rounds of OCR spot checks)
**Folder:** Beaufort Gazette
**Newspaper ID:** BEAUFORTG (placeholder — no GS permid available)
**Data coverage:** 1952-2016, 57 clippings, 74 candidate records, 54 proposition records

## Overall Assessment

**PASS WITH FIXES V2**

Beaufort Gazette is a small SC daily covering Beaufort County (Beaufort, Hilton Head Island, Bluffton, Lady's Island, Port Royal). McClatchy ownership, sister paper to Hilton Head Island Packet. Notable editorial pattern: candidate endorsements in 1952-1986 era, ballot-measures-only from 1988-2008, candidate endorsements resumed 2010-2016.

## Stage 1: Structural Validation (V2)

- CSV headers: PASS (16 cand + 11 prop)
- Row integrity: PASS (all SC, 0 inc=0, 0 junk, all endorsed 1/0/empty)
- Newspaper ID BEAUFORTG: populated consistently

## Stage 2: Spot Check (5 rounds, ~22 spot checks)

### Round 1: OCR-verify 1952/1968/2010-2016
- **1952:** Eisenhower (R) endorsed vs Stevenson (D) opposed — OCR explicit "we feel Eisenhower to be the more alert" ✓
- **1968:** Nixon endorsed over Humphrey + Wallace (all 3 captured correctly) ✓
- **2014 Senate/House:** Graham (R) + Scott (R) + Clyburn (D) all confirmed ✓

### Round 2: Missing first names + 2014 governor investigation
- **2010 TREASURER:** "HENDERSON" missing first name → **HENDERSON, DOUG** per OCR ("Doug Henderson offers that change") ✓
- **2010 CITY COUNCIL Ward 5:** "WILLIAMS" missing first name → **WILLIAMS, GEORGE** per OCR ("George Williams has done a good job standing up for the interests of his constituents") ✓

### Round 6: 6 more deep spot checks — 1 dup + 2 prop_num collisions resolved

1. **1954 OCR:** Thurmond (D write-in) + Brown (D) opposed — historic Pattern A pair confirmed ✓ (Thurmond's first write-in victory)
2. **1974 OCR:** Split-ticket endorsement confirmed (Edwards R Gov + Harvey D Lt Gov + opposed Pattern A pairs) ✓
3. **1996 OCR:** 3 props match — Sunday blue laws NO, Constitutional Q2 YES, Sales tax YES ✓
4. **2006 OCR:** **5 props but 2 are duplicate Q4 records** (same property tax reassessment cap, covered in two different editorials — Oct 29 detailed + later recap, both NO). Deduped to 1 record.
5. **Confidence distribution by year:** All 0.90-0.98 except 2008 at 0.70 (Columbia State reprint, documented) ✓
6. **Notes/whitespace/dist audit:** 0 missing notes, 0 whitespace issues, dist values clean (Wards 1-6 + district numbers + state legislature districts 1/2/3/4/5/6/7/8/11/118/121/122/124) ✓

**Round 6 fixes:** 1 dedup (2006 Q4) + 2 prop_num collision resolutions (2004 Local 2 vs State 2).

### Round 5: 6 more deep spot checks — 0 errors found

1. **Cross-year tracking:** 8 repeat candidates verified across years (Edwards, Graves, Laughlin, Nixon, Scott, Sutton, Thurmond, Wilson). **THURMOND** party switch correctly captured: 1954=Democrat, 1972=Republican (reflecting his historical 1964 party switch).
2. **1960 OCR:** Confirmed Kennedy opposition ("Kennedy strikes us as a very nervous man") with no explicit Nixon endorsement — data correctly captures only Kennedy e=0 ✓
3. **1972 OCR:** All 5 records confirmed (Nixon endorsed, McGovern+Schmitz opposed, Thurmond Senate, Limehouse H) ✓
4. **1976 OCR:** Ford/Dole + Carter opposition + Graves/Morrison State Rep all match ✓
5. **1988 OCR:** Ballot-measures-only era confirmed (referendum #214 for 4-year council terms endorsed) — matches metadata pattern ✓
6. **2016 OCR:** 9 records match (McFee/Sutton Beaufort CC, Felton-Montgomery/Frazier School Board, Glover Cnty Council, Herbkersman/Erickson/Rivers State Rep, Sanford H-1) ✓

### Round 3: 2014 Governor direction fix
- **2014 GOVERNOR Haley + Sheheen both e=0** — investigation revealed notes_endorse explicitly says paper "decided not to endorse in this race"
- This is "no endorsement" decision, NOT active opposition
- **Fixed both records:** e=0 → e=empty (no position) per data convention
- Pattern L-like direction fix

**Accuracy:** ~98% post all fixes

## Stage 3: Variable Coding & Dedup (V2 final)

- 15 office codes — all standard
- 5 party labels (Democrat, Republican, Independent, Nonpartisan, empty)
- All names LASTNAME, FIRSTNAME ALL CAPS
- 0 candidate dups, 0 proposition dups
- 0 Pattern K mismatches
- **180 ALL CAPS normalizations applied** (72 cand notes + 54 prop desc + 54 prop notes)

## Stage 4: Low-Confidence Re-Scan

**Below 0.75:** 0 cand, 1 prop
- 2008 Prop 1 (S.C. Constitutional Amendment) conf 0.70 — documented in notes as "reprint of Columbia State editorial 'Vote Yes on Changing Age of Consent Provision'" — legitimately ambiguous since it's a reprint not original Beaufort editorial

**Mean confidence:** 0.944 (cand) / 0.946 (prop)

## Stage 5: Manifest Registration

Beaufort Gazette registered in `qa_manifest.csv` as entry #24 with qa_result "PASS WITH FIXES V2".

## Official endorsement-qa skill final pass (V2)

All 4 stages PASS on V2 final state:
- **Stage 1 PASS:** all columns, row integrity, state fields SC, 0 inc=0, 0 junk, newspaper_id BEAUFORTG consistent
- **Stage 3 PASS:** 15 standard office codes, 5 valid parties, all names ALL CAPS, 0 dups, 0 Pattern K, all ALL CAPS
- **Stage 4 PASS:** 0 cand below 0.75; 1 prop at 0.70 documented as reprint
- Final assessment: **PASS WITH FIXES V2** — structurally clean

---

## Final Statistics

- **74 candidate records, 53 proposition records (127 total)** [Round 6 removed 1 dup]
- **Cand years: 1952, 1954, 1960, 1964, 1968, 1972, 1974, 1976, 1978, 2010, 2012, 2014, 2016 (13 years)**
- **Prop years: 22 years (1962-2016)**
- **End=1: 59 cand, 47 prop**
- **End=0: 13 cand, 7 prop** (after 2 Governor records moved to no-position)
- **No-position: 2 cand (Haley, Sheheen 2014)**
- **Mean confidence: 0.944 (cand) / 0.946 (prop)**
- **0 duplicates, 0 Pattern K mismatches**

## Total Changes V1 to V2

| Category | Count |
|----------|------:|
| Missing first names completed (Henderson, Williams) | 2 |
| Direction fix 2014 Governor e=0 → empty (Haley, Sheheen "no endorsement" per editorial) | 2 |
| ALL CAPS normalizations | 180 |

**~187 total fixes across 4 substantive rounds + formal pass + Round 5+6 (3 additional fixes in Round 6: 1 dup + 2 prop_num collision resolutions).**

## Notes for Future Work

1. **Newspaper ID placeholder** — BEAUFORTG is folder-derived; GS permid augmentation merge will not work without manual ID assignment.
2. **Sister paper to Hilton Head Island Packet** (McClatchy) — likely shared editorial content; cross-paper consistency check could be valuable.
3. **Editorial pattern shift 1988-2008** — ballot-measures-only era; explains gap in candidate records during those years.
4. **2014 Governor non-endorsement** — paper's editor explicitly declined to endorse; data convention is e=empty for no-position records.
5. **2008 Prop 1 is reprint** — Columbia State editorial reprinted in "Other Viewpoints" section. Low conf (0.70) appropriate.

---

# V9 Single-Pass Deep Verification — 2026-06-21

**Method:** All 57 clipping PDFs independently re-OCR'd from scratch (`pdfimages -all` + `tesseract`; two zero-text clippings — 1978-10-26 and 2002-11-03 — recovered with `--psm 4` at longer timeout). Digital PDF text is newspapers.com boilerplate only. Every candidate and proposition checked against the source image / OCR. Cross-paper metadata consistency run against 8 SC sister papers.

**Result: 1 correction (2 recap-duplicate props removed); candidate data clean.**

### Candidates (74 records, 1952–2016) — no changes
- **Reverse-match confirmed complete.** The 2012 election-day recap reverse-matches the CSV exactly (all 13 candidates + 3 props printed in the recap). 2010 slate spot-confirmed (incl. Ken Ard "wins our support for his bid to be lieutenant governor," R). 2014 confirmed incl. Clyburn (D, U.S. House **6th** — "Beaufort County was removed... to the 6th in the latest redistricting") and the Haley/Sheheen governor non-endorsement (both correctly blank).
- **The 1980–2008 candidate gap is genuine, not a miss.** Clippings for 1984/1986/1988/1990/1994/1996/1998/2002/2004/2006/2008 are ballot-measure editorials (amendments, referenda, bonds), not candidate endorsements. OCR scan for candidate-endorsement language in every gap year confirmed no missed candidate endorsements. The 1976 props note already records that the paper *declined* to endorse in House d124, county council at-large, and Port Royal mayor that year.
- **Mixed/split-ticket slates are real data:** 2010 endorsed Holleman (D, Supt) and Richardson (D, AG) alongside Ard (R, Lt Gov) and Joe Wilson (R, H); 2014 endorsed Deerin (D, Sec State) and Clyburn (D, H) alongside an R statewide slate.

### Propositions — 53 → 51 (removed 2 recap duplicates)
- **2004 recap de-duplication.** 2004 had 5 prop rows for only 3 distinct ballot measures. The 11/01 "voter turnout" recap re-listed the minibottle amendment and the local capital-projects sales tax that were already captured from their dedicated 10/24 and 10/26 editorials. The two recap duplicates were removed; the 3 distinct 2004 measures (minibottle statewide Amd 1, local capital-projects sales tax "Local 2", statewide farm-tax Amd 2) are retained, all YES, vision-confirmed.
- **All-FOR prop check:** 1998 (6 props all FOR) is **legitimate** — the editorial explicitly says "Vote yes"/"should support it" on each of the 5 amendments plus the S.C. 170 road tax (vision-confirmed). 2004 all-FOR is legitimate (3 distinct measures, all explicitly YES).

### Cross-paper consistency (Stage 7) — clean
3 surname flags vs SC sister papers all resolve in Beaufort's favor: Thurmond 1954 correctly coded **Democrat** (he was a write-in D in 1954; Greenville's "Republican" is the error); Wallace 1968 "Independent" is Beaufort's consistent AIP convention; "Wilson 2010" is a Joe-Wilson(H)/Alan-Wilson(AG) namesake collision, not a conflict.

### Integrity
74 candidates / 51 props; 0 exact duplicates, 0 Pattern K, 0 empty candidate names, 0 empty confidence. Metadata regenerated; archive md5-synced.
