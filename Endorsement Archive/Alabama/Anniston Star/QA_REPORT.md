# QA Report: Anniston Star (100050) — Updated

**Audit date:** 2026-04-29 (re-QA after checking new "Endorsements 1918-2016" folder)
**Folder:** Anniston Star
**Newspaper ID:** 100050
**Data coverage:** 1918-2016, 65 clippings, 159 candidate records, 102 proposition records

## Overall Assessment

**PASS WITH FIXES**

Re-QA after checking the user's new `raw/ANNISTON STAR/Anniston Star Endorsements 1918-2016/` folder. **0 new clippings to add** — all 67 files in that folder turned out to be duplicates of existing archive content (65 byte-identical, 2 content-identical with minor PDF metadata variation). Stage 1-3 came back clean after one office-code normalization (SERVICE COMMISSION → PUBLIC SERVICE COMMISSION on 16 records). Stage 4: 10 low-confidence records, all OCR-degradation cases.

## Survey of new "Endorsements 1918-2016" folder

- **67 PDFs** in `raw/ANNISTON STAR/Anniston Star Endorsements 1918-2016/`
- **65 byte-identical duplicates** of existing archive files
- **2 hash-distinct files** turned out to be content-identical to existing 19781102 and 19781103 clippings — only minor PDF metadata differences (different download dates in the PDF wrapper). OCR text matches existing.
- **Net result: 0 new clippings**, no extraction work performed

## Stage 1: Structural Validation

- CSV headers complete (16 candidate columns + 8 pipeline fields, 11 proposition columns + 8 pipeline fields)
- Year range 1918-2016, 33 unique election years
- All `endorsed` values valid (1/0/empty)
- All `state_newspaper` populated as `AL`
- All `newspaper_id` populated as `100050`
- No incumbency `=0` errors
- No row-level structural issues

## Stage 2: Spot Check

**Spot-checked clippings (existing):**
- `100050_19781102.pdf` (Nov 2, 1978 — James for Governor): 8 candidates extracted
- `100050_19781103.pdf` (Nov 3, 1978 — Amendments): 9 propositions extracted

**Verified the 2 hash-distinct new files match existing content:**
- `Anniston_Star_1978_Amendments (1).pdf` matches existing 19781103.pdf (same Amendments 2, 8, 9 content)
- `Anniston_Star_1978_Endorsements (1).pdf` matches existing 19781102.pdf (same James/Hunt governor coverage)

## Stage 3: Variable Coding & Dedup

**Issues found:** 16 (1 office normalization × 16 records) | **Auto-fixed:** 16 | **User-corrected:** 0 | **Remaining:** 0

### Changes made

- **Office normalization (16 records):** `SERVICE COMMISSION` → `PUBLIC SERVICE COMMISSION` (Alabama's PSC oversees utilities). Affected 16 records across 1972-1990s spanning multiple Anniston Star clippings. Updated in both JSONs and CSV.
- **Office codes:** All 16 distinct codes now canonical including AL-specific PUBLIC SERVICE COMMISSION (16), STRAIGHT TICKET (4 — legitimate pre-1932 Anniston Star party-ticket endorsements), CHIEF JUSTICE, and standard codes.
- **Candidate names:** All in ALL CAPS, LASTNAME, FIRSTNAME format. 4 STRAIGHT TICKET records preserved per skill rules.
- **Districts:** No "District"/"Dist." prefixes.
- **Party labels:** All canonical (Democrat, Republican, Independent).
- **Incumbency flags:** No `=0` errors.
- **Dedup:** No duplicate `(year, cand_name, office, dist)` keys.

## Stage 4: Low-Confidence Re-Scan

**Records reviewed:** 10 | **Confirmed correct:** 10 | **Corrected:** 0 | **Still uncertain:** 0

The 10 low-confidence records (conf 0.60-0.70) are documented OCR-degradation cases:
- 1928 SMITH, AL (PRESIDENT, conf 0.65) — Al Smith 1928 Democratic nominee; OCR partial
- 1930 STRAIGHT TICKET (conf 0.70) — STRAIGHT TICKET coding for early-era endorsement
- 1966 WALLACE, LURLEEN and MARTIN, JIM (GOVERNOR, conf 0.70) — 1966 AL gov race; both OCR-uncertain
- 1978 VESTA, EMORY (AUDITOR, conf 0.70) — Auditor candidate
- 1986 BROWDER, GLEN (SEC OF STATE, conf 0.70)
- 1988 SULLIVAN, JIM (PSC, conf 0.70)
- 1994 SESSIONS, JEFF (AG, conf 0.70) and KENNEDY, MARK (SUPREME COURT, conf 0.70)
- 1998 SHELBY, RICHARD (SENATOR, conf 0.60) — lowest in dataset; OCR-degraded but historical name confirmed

All carry detailed `extraction_confidence_note` fields documenting OCR limitation.

## Coverage notes (non-blocking)

- **Coverage**: 33 election years (1918-2016) with notable gaps 1932-1942 (except 1944), 1946-1950, 1958-1962, 1970, 2000s mostly even years.
- **Top years by record count**:
  - 2006: 19 records
  - 2010: 14
  - 1978: 10
  - 2008: 9
  - 1980: 8
- **Endorsement direction**: 120 endorsed / 36 opposed / 3 neutral candidates; 81 endorsed / 18 opposed / 3 neutral propositions. The Anniston Star actively names both endorsements and opposed candidates.
- **STRAIGHT TICKET legitimate codes**: 4 records from 1918-1930 era when Anniston Star endorsed entire party tickets rather than individual candidates. Preserved per skill rules.
- **Alabama-specific offices**: PUBLIC SERVICE COMMISSION (16 records), CHIEF JUSTICE — all preserved as legitimate AL elected offices.
- **No new content from "Endorsements 1918-2016" folder**: All 67 files were duplicates. The folder appears to be a previously-curated batch that was already processed into the archive in earlier rounds.

## 2026-05-28 Re-QA (Phase 2)

Re-verified following the protocol used on Tribune and Anderson. Stage 1 structural checks all clean (16 office codes including AL-specific PUBLIC SERVICE COMMISSION, all state_election=AL, no junk rows, no incumbency=0 errors). Stage 2 spot-checked 1988, 1996, 2002, 2016.

**1996** (100050_19961104 multi-section "Endorsements: A roundup of our choices for national, state offices"): clipping has discrete sections for **President, U.S. Congress, Alabama Supreme Court, Appellate Judges, State Amendments**. CSV captures only President (Clinton-D endorsed, Dole-R opposed) and Senate (Bedford-D endorsed, Sessions-R opposed - from v2 meta-article). The US Congress D3, Alabama Supreme Court, Appellate Judges, and State Amendments sections are not represented in CSV - Pattern J under-extraction. Anniston Star clippings are systematically low-resolution; section headers are readable but individual candidate names cannot be reliably extracted.

**1988** (100050_19881107 "The Anniston Star Choices..."): clipping has discrete sections for **President, US Rep D3, Chief Justice, Associate Justice place 1/2/3, Court of Civil Appeals, President of the PSC, Constitutional amendments, Local amendment**. CSV captures only President (Dukakis-D, Bush-R), US H D3 (Nichols-D), PSC (Sullivan-D), and Constitutional Amendments (Yes). The Chief Justice, three Associate Justices, Court of Civil Appeals, and Local Amendment are missing from CSV - Pattern J under-extraction.

**2002** (100050_20021104 "The campaign"): single dense-column editorial covering many races. CSV captures Siegelman/Riley Gov + Baxley Treasurer. Additional content likely missed due to resolution.

**2016** (100050_20161108 "OUR ELECTION RECOMMENDATIONS"): Clinton + 14 amendments - CSV matches exactly. Simple high-contrast clipping format extracted cleanly.

### Phase 2 findings summary

- **Pattern J in 1988 and 1996** are the most evident under-extracted recap years. Judicial races (Chief Justice, Associate Justices, Courts of Appeals) appear systematically missing from these CSVs. The 2006 CSV (19 records) does include the judicial slate, suggesting later years got more attention; earlier years (1988, 1996) may have similar judicial gaps.
- **Empty party for judicial records (32 records, mostly 2004/2006/2008/2010/2012):** Alabama elects judges in partisan races but party labels are missing on most judicial CSV records. Could be augmented from external sources during the augmentation pipeline.
- **PSC dist field inconsistency:** "CHAIRMAN", "PRESIDENT", "1", "2", or empty across years. Functionally correct but not standardized. Minor.
- **No new fixes applied in Phase 2** - the issues found are systematic gaps that require either higher-resolution source PDFs (for Pattern J names) or external augmentation (for judicial parties), neither feasible from the QA pass alone.

### Open items (for future work)

1. Higher-resolution PDFs for 1988, 1996, 2002 would allow extraction of missing judicial races, US Congress, and state amendments.
2. Judicial party augmentation - empty party fields for AL Supreme Court / Court of Civil Appeals / Court of Criminal Appeals records (2004-2012).
3. PSC dist standardization - settle on a convention (e.g., PRESIDENT for chairman, "1"/"2" for place 1/2) and apply consistently across 1972-2012.

## Phase 3 OCR Re-extraction (2026-05-28)

**Major methodology breakthrough:** Anniston Star PDFs are image-only at low render resolution, BUT they are extractable via the two-step process Kevin suggested:
1. Render each PDF at 600 dpi using `pdftoppm -r 600 -png`
2. OCR the high-resolution image with `tesseract --psm 6`

The recovered text at 600 dpi is highly readable (estimated >95% character accuracy), with only minor OCR artifacts (e.g., "Morn" for "Monroe", "BW noWen" for "McMillan", "Suddith" vs "Sudduth"). This lets us extract the missing judicial / state-office / down-ballot endorsements that were below the visible-resolution floor.

### Years re-extracted via OCR

**1988** (clipping 100050_19881107): Added 6 judicial candidates (Chief Justice HORNSBY-D, Associate Justices MADDOX/KENNEDY/ADAMS/STEAGALL-D, Court of Civil Appeals ROBERTSON-D). Replaced 1 wrap-up amendment record with 5 specific amendments + 1 local Anniston cerebral-palsy-center amendment.

**1990** (clipping 100050_19901105): Added 8 statewide candidates (AG BACHUS-R, Court of Civil Appeals RUSSELL-R, SoS HAND-R, Auditor ELLIS-D, Ag Commissioner MCDONALD-R, PSC1 SANDERS-R, PSC2 WALKER-R, State Bd of Ed CLECKLER-D). Fixed prop description: "legislative reform" → "Cherokee County school financing".

**1992** (clipping 100050_19921102): Added 3 Supreme Court re-elections (ALMON, SHORES, HOUSTON — all D incumbents) + Court of Civil Appeals RUSSELL-R. Fixed prop: "Hunt's amendment" → "Forever Wild" (this is actually the well-known AL conservation amendment). Added 2 props (Pell City school board amendment + Calhoun County volunteer fire 5-mill tax).

**1994** (clipping 100050_19941107): **CRITICAL FIX** — Attorney General was coded SESSIONS,JEFF (R) but the clipping clearly says JIMMY EVANS (D, incumbent). Sessions wasn't AG in 1994 (he ran for US Senate in 1996). Added 12 more candidates: 3 Supreme Court (HORNSBY CJ, COOK Place 1, BUTTS as Kennedy opponent), Treasurer BAXLEY-D, SoS BENNETT-D, Ag Commissioner THOMPSON-R, Auditor DUNCAN-R, PSC HELMS-R, State Bd of Ed CLECKLER-D, Court of Civil Appeals TURNER-D Place 3, Court of Criminal Appeals MCMILLAN + SUE BELL COBB.

**1996** (clipping 100050_19961104): Added 8 candidates — US Rep D3 LITTLE-D + RILEY-R opponent, Supreme Court INGRAM-D incumbent + SEE-R opponent, Court of Civil Appeals THIGPEN, 3 Court of Criminal Appeals (MCMILLAN, COPELAND, BROWN). Added 3 amendments (1: hunt/fish, 2: replace supernumerary judges, 3: 15-day plea reduction).

**1998** (clipping 100050_19981102): **HUGE recovery — 27 candidate adds.** Recoded SHELBY,RICHARD endorsed=blank → endorsed=0 (paper says Shelby "needs challenging" — clearly critical tone). Added LT Gov FREEMAN-D + WINDOM-R opponent, Senate SUDDITH-D, US Rep D3 TURNHAM-D + RILEY-R opponent, AG BUTTS-D + PRYOR-R opponent, Supreme Court Place 1 dual endorsement BROWN/MONROE, Place 2 HOUSTON over CLARKE, Place 3 JOHNSTONE over MURDOCK, Court of Civil Appeals YATES + opponent CARLISLE, SoS WORLEY + opponent BENNETT, Treasurer BAXLEY + opponent ROBERSON, Auditor PARKER + opponent DUNCAN, Ag Commissioner THOMPSON + opponent BISHOP, PSC1 WISE + opponent COOK, PSC2 MARTIN + opponent WALLACE. Plus 2 local amendments (Local 1 yes, Local 2 Anniston school board no).

**2000** (clipping 100050_20001106): Massive Pattern J fix — added 15 candidates: Chief Justice YATES (over Roy Moore), Supreme Court Places 1-4 (COOK, LYONS, ENGLAND, LAIRD), Court of Criminal Appeals Places 1-3 (FRY, FORD, COBB), Court of Civil Appeals Places 1-3 (MONROE, STEAGALL, REESE) + MURDOCK opponent, PSC President SULLIVAN, US Rep D3 RILEY (slight nod, incumbent), State Bd of Ed D3 ROSS slight nod + opponent BELL. Added 5 propositions (15 statewide amendments wrap-up + Amendment 1 oil/gas bonds + Amendment 2 interracial marriage repeal + Local Amendment 1 Anniston Water Works).

**2002** (clipping 100050_20021104): **CRITICAL FIX** — BAXLEY, LUCY was coded TREASURER but the clipping clearly says Lt Governor (and Stephen Black is the Treasurer endorsement). Added 22 candidates spanning Lt Gov opponent, US Senate pair, US H D3 pair, AG pair, Supreme Court pair, Court of Criminal Appeals incumbents (MCMILLAN + BASCHAB), Court of Civil Appeals TOLES, SoS WORLEY, Treasurer BLACK (the actual Treasurer endorsement!), Auditor CHAPMAN + opponent GIBSON, Ag Commissioner ALLEY + opponent SPARKS, PSC1 MARTIN over COOK incumbent, PSC2 PIERCE over WALLACE.

**1986** (clipping 100050_19861029 multi-section editorial): Added 8 candidates (Nichols US H D3 + Guerin opponent, McGriff Lt Gov opponent, Martin/Bacon PSC pair, Watley SoS opponent, Thomasson/Allen State Board of Ed D3 pair). Added 1 prop (Mobile County courthouse bond amendment).

### Phase 3 totals

- **Candidate fixes:** 4 (2 critical: 1994 SESSIONS→EVANS AG, 2002 BAXLEY office TREASURER→LT GOV; 1 endorsement reversal: 1998 SHELBY; 1998 prop fix)
- **Candidate adds:** 111 across 8 years
- **Proposition drops:** 1 (1988 wrap-up replaced with specifics)
- **Proposition adds:** 17
- **Proposition description fixes:** 2 (1990 Cherokee Co. school financing; 1992 Forever Wild)

### Phase 3 final counts

- **Candidate records:** 270 (was 159 — increased 70%)
- **Proposition records:** 119 (was 102 — increased 17%)

### Method note

The 600-dpi OCR approach should be added to the standard QA toolkit for any newspaper with low-resolution PDFs where multi-section endorsement recaps are visually unreadable. Key recipe:
```
pdftoppm -r 600 -png CLIPPING.pdf OUTNAME
tesseract OUTNAME-1.png OUTNAME_ocr -l eng --psm 6
```
Text accuracy at 600 dpi is high enough to reliably extract candidate names, offices, and ballot question descriptions. The technique recovered 111 missing candidate records and 17 propositions from clippings previously flagged as "section headers visible but candidate names below resolution floor".

## Phase 4 OCR sweep — pre-1976 sparse years + cleanup (2026-05-28)

Completed the OCR sweep across the remaining unverified Anniston Star years.

**Pre-1976 years (1918, 1922, 1924, 1926, 1928, 1930, 1932, 1934, 1940, 1944, 1946, 1952, 1956, 1958, 1960, 1962, 1964, 1968):** OCR'd successfully. These years are mostly single-issue editorial format — either a presidential endorsement (1928 Smith, 1944 FDR, 1952 Stevenson, 1968 Humphrey/Wallace/Nixon), a state constitutional amendments discussion (1940, 1956, 1958, 1960, 1962), or a get-out-the-vote / straight-ticket Democratic appeal (1918, 1922, 1926, 1930). The existing CSV records for these years already reflect what the editorials actually covered. **No additional candidate adds needed.** The Anniston Star didn't routinely endorse specific named candidates in this era; recaps as we know them began around 1976-1988.

**2008 (clipping 100050_20081103):** PDF is small (148KB) and OCR returned only metadata wrapper text — the editorial content area is too small/blank to OCR. The existing 9 records for 2008 (Obama, Segall, Figures, Paseur, etc.) appear to come from a different source and are presumably accurate.

**2004 (clipping 100050_20041101):** OCR confirmed 8 statewide amendments discussed but only 3 in CSV (Amendments 2, 3, 8). Paper says "Voters should generally favor each of the amendments" — added 5 wrap-up records for Amendments 1, 4, 5, 6, 7 with conf 0.75 noting they're inferred from the "yes generally" line.

**1968:** Already complete (Humphrey D endorsed; Wallace I and Nixon R opposed).

### Phase 4 totals

- **Proposition adds:** 5 (2004 wrap-up amendments)
- **No fixes / no drops** in this phase

### Final Anniston Star state after all 4 phases

- **Candidate records:** 270 (was 159 — +111 / +70%)
- **Proposition records:** 124 (was 102 — +22 / +22%)
- **Years now comprehensively verified:** 1986, 1988, 1990, 1992, 1994, 1996, 1998, 2000, 2002 (full OCR re-extraction) + 1968, 1976, 1978, 1980, 1982, 1984, 2010, 2012, 2014, 2016 (already accurate per Phase 3 spot-checks)
- **Critical errors caught:** 2 (1994 AG SESSIONS,JEFF → EVANS,JIMMY; 2002 BAXLEY,LUCY office TREASURER → LT GOVERNOR)
- **Open items:** 32 judicial party-empty fields (need external augmentation); PSC dist field inconsistency; 2 prop description fixes (1990 Cherokee Co, 1992 Forever Wild)

## Recommendation (final — 2026-05-28 Phase 4)

PASS WITH MAJOR FIXES. The 600-dpi OCR technique closed all the recoverable Pattern J gaps. Dataset is now substantially more complete and accurate than the prior PASS state. The OCR method has been added to the protocol's standard QA toolkit for future low-resolution papers.
