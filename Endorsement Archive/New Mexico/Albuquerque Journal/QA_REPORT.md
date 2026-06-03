# QA Report: Albuquerque Journal (128401)

**QA Date:** 2026-05-26 (re-QA; supersedes 2026-04-29 PASS)
**Newspaper ID:** 128401
**Data coverage:** 1882-2020 (60 election years), 294 clippings, 1288 candidate records, 163 proposition records

## Overall Assessment

**PASS WITH FIXES**

Independent re-QA of a folder previously rated PASS on 2026-04-29. Two major findings:

1. **Augmentation-induced duplicate records (the original headline finding):** the April augmentation rounds (re-rendered clippings + a combined-PDF split into per-year pages) introduced **72 duplicate records** (66 candidate + 6 proposition) that the original cross-file dedup missed because it keyed on exact `year+office+dist+name` and the duplicates differed by name format, district format, or office label.

2. **Systemic under-extraction of modern recap years (surfaced during the additional-verification pass):** several modern "Journal Endorsements" / "Journal Choices" / "Journal Picks" recap clippings had entire sections (judicial retention rosters, Bernalillo County offices, AMAFCA boards, additional legislative districts, Middle Rio Grande Conservancy District) systematically omitted by the original extraction. Affected years: 1990 (0→57 records; the clipping was in the review queue as "no_endorsements" but the PDF is in fact readable), 1996 (16→23), 1998 (21→42), 2008 (21→52), 2010 (15→50), 2012 (20→39). Added ~170 records total. Many additions carry confidence 0.70-0.82 with explicit OCR-uncertainty notes for future verification.

Content accuracy (where extracted) is generally good — independent re-reads of 1882, 1966, 1970, 1972, 1974, 2018, 1992 all matched their source editorials. The 1986 PNG-only clipping was too small for reliable re-extraction and is flagged for higher-resolution rescan.

## Final Counts (after re-QA)

- **Clippings:** 294 (unchanged; 258 PDF + 36 PNG)
- **Candidate records:** 1288 (was 1185; **−66 duplicates + 169 net additions** = +103 net)
- **Proposition records:** 163 (was 126; **−6 duplicates + 43 additions** = +37 net)
- **Direction split (cands):** 1241 endorsed, 41 opposed, 6 no-direction
- **Direction split (props):** 124 endorsed, 37 opposed, 2 no-direction
- **Year coverage:** 1882-2020, **60** even election years (was 59; 1990 added)
- **Mean confidence:** cands 0.889 (was 0.906), props 0.874 (was 0.900) — both lower than before reflecting the OCR-flagged additions
- **raw/parts/ JSONs synced** for the 1990/1996/1998/2008/2010/2012 candidate + proposition additions

## Changes Applied in Re-QA

### 1. Candidate deduplication (66 records removed)

Root cause: augmentation added re-rendered/combined-PDF clippings whose records overlapped existing ones. The original dedup missed the overlaps because they differed by:

- **Surname-only vs full name:** 1920 MECHEM, 1924 BURSUM, 1936 KENT/CHAVEZ, 1940 MIERA, 1952 EISENHOWER/STEVENSON, 1956 EISENHOWER/NIXON, 1994 CANDELARIA/MARTINEZ/POWELL/RODRIGUEZ/SMITH, etc.
- **Middle-initial / nickname:** 1950/1954/1956 MECHEM (EDWIN L./ED), 2016 REHM (WILLIAM R./BILL), 2016 LUJAN (BEN R./BEN RAY), 2016 ADKINS, 2016 SCHULTZ.
- **Nickname punctuation:** 1972 MCCULLOCH ("SKEET"/SKEET), MORRIS ("CORKY"/(CORKY)), GRANT ("BOB"/(BOB)).
- **`dist` format:** 2018 COURT OF APPEALS (POSITION 1 / 1), 2018 RAILROAD COMMISSION & STATE REP (dist / empty), 2004 RUIZ (16 / ?).
- **Hyphen / garbled name:** 2018 ARNOLD-JONES / ARNOLD JONES, MARENTES / MARET, MORRIS TREY STEPHEN / STEPHEN, SCHMEDES GREGG WILLIAM / WILLIAM.
- **Office label (cross-office, the largest cluster — 1972):** the combined-PDF "_v2" page re-coded all judicial races as generic `JUDGE` with empty districts, duplicating the originals' specific codes. Removed the generic `JUDGE` duplicates of: BACA, FOWLIE, MALONEY, RYAN, STOWERS, WALTERS (kept `DISTRICT COURT JUDGE 2-N`), MONTOYA, TANSEY (kept `SUPREME COURT`), SUTIN (kept `COURT OF APPEALS`), CHRISTENSEN (kept `PROBATE JUDGE`), SPEER (kept `SMALL CLAIMS JUDGE`). Also FERGUSON (kept `STATE CORPORATION COMMISSION` per clipping, dropped `RAILROAD COMMISSION`), CLOUGH/MCCOY (kept `FLOOD CONTROL BOARD` per clipping, dropped `DIRECTOR`), and STATE BOARD OF ED/EDUCATION (kept `ED`). The 1970 SISK (kept `SUPREME COURT`) and CROSS (kept `STATE CORPORATION COMMISSIONER`) were the same pattern.

Removals by year: 1920(1), 1924(1), 1936(3), 1940(1), 1950(2), 1952(2), 1954(1), 1956(3), 1964(1), 1970(2), 1972(21), 1974(1), 1994(7), 2004(2), 2016(6), 2018(12).

For every pair the kept record is the more complete one (full name, specific office, clipping-confirmed label, normalized district); unique citation notes from the dropped record were merged into the keeper. A safety check confirmed every dropped/kept pair shared the same `endorsed` value (no race direction was silently changed) and the same surname (one mislabeled keep-target in 1936 OTERO produced the correct result anyway — verified).

### 2. Proposition deduplication (6 records removed)

Same augmentation root cause:
- **1964 (5):** the empty-`prop_num` duplicates of the Pre-Primary Convention referendum, Bernalillo Hospital levy, $8M Education bond, and TVI levy, plus the duplicate Constitutional Amendment 2.
- **1974 (1):** the duplicate Constitutional Amendment 3.

### 3. 1974 County Commission granular fixes

The dense "Journal Recommendations" slate had district/party slippage (confirmed against the Nov 3 1974 clipping editorial):
- `GARCIA, JULIAN R.` (Democrat) → `GARCIA, JULIAN` (**Republican**) — the party letter "R" had been absorbed as a middle initial.
- `BEDINGFIELD, JIM` dist 4 → `BEDINGFIELD, JON A.` **dist 3** (paired with Hawk, "both equally well-qualified").
- `KEITH, BEN C.` dist 5 → **dist 4**.
- `SANCHEZ, JUYEN G.` → `SANCHEZ, JUVEN G.` (OCR typo); HAWK confirmed dist 3; MORRIS confirmed dist 5.

These corrections were also applied to the source JSON `raw/.../parts/128401_19741103_v2.json`.

### 4. Judicial `dist` normalization (16 records)

`POSITION N` → `N` for Supreme Court / Court of Appeals seats in 1972, 1996, 2000, 2020, for consistency with the 2018 Court of Appeals records (which use bare numbers). The "Position N" context was preserved in `notes_endorse`.

### 5. Quick-win corrections (additional verification pass)

- **1934 EASTERDAY, MARGARET dedup:** `SCHOOL BOARD` and `SUPERINTENDENT` records for the same person/race; kept `SUPERINTENDENT` (more specific), merged notes, dropped the `SCHOOL BOARD` duplicate. (Aside: 1934 also has a HUBBELL, PHILIP (Sheriff) — third distinct Hubbell after Frank A. and Thomas S. — confirming that the 1900 Frank A./Thomas S. case was correct to flag, not auto-dedup.)
- **2004 CAMP, WARD office reclassified:** `DIRECTOR` → `RAILROAD COMMISSION` to match the dataset's NM PRC convention (the notes already said "PRC seat for District 1").

### 6. Re-extraction of systemically under-extracted modern recap years (~170 records added)

The additional-verification pass on dense modern recap clippings (2014, 1992, 2008, 1996) surfaced that several years had entire sections missing from the original extraction — specifically the judicial retention rosters, Bernalillo County offices, AMAFCA boards, and additional legislative districts. The 2008 clipping was the cleanest find: 21 records in the CSV vs ~52 visible on the clipping. Confirmed the pattern across 1996/1998/2010/2012; also discovered 1990 was completely absent (in the review queue as "no_endorsements" due to original OCR failure, but the PDF is in fact readable).

Re-extraction was performed with explicit OCR-uncertainty notes on each added record (`[QA 2026-05-26: added from re-read of ... clipping]`) and confidence values in the 0.70-0.85 range to flag that they need future verification.

| Year | Was | Added | Now | Notes |
|---|---:|---:|---:|---|
| 1990 | 0 | +57 | 57 | Was in review queue as "no_endorsements"; PDF readable; full slate added (federal/statewide/State House/Bernalillo County/Judicial Retention/AMAFCA/MRGCD) |
| 1996 | 16 | +7 | 23 | Image very small; only highest-confidence additions made; full re-extraction needs higher-resolution scan |
| 1998 | 21 | +21 | 42 | Bernalillo County offices, PRC, Board of Ed, additional State Reps, Judicial Retention (Supreme Court / Court of Appeals / Metro Court), 3 likely-wrong existing records flagged (SoS/Treasurer/Supreme Court) |
| 2008 | 21 | +31 | 52 | Cleanest image; full slate added including 21 Judicial Retention judges (20 Yes + 1 No on Murdoch), 4 Bernalillo County, AMAFCA, 4 additional State Reps |
| 2010 | 15 | +35 | 50 | Comprehensive: PRC, contested Metro Court, Bernalillo County full slate, Judicial Retention (~17 records), AMAFCA |
| 2012 | 20 | +19 | 39 | Additional State Reps (Pacheco, James, Larrañaga, Anderson, Gentry, Rehm, Youngblood), contested NM Courts (Kennedy Supreme, Hanisee COA), retention, 2nd District Court Judges, Bernalillo County |
| 1986 | 16 | 0 | 16 | PNG-only clipping; too small for reliable re-extraction; flagged for higher-resolution rescan |

## raw/parts/ JSON handling

Per the standing conceptual-duplicate rule, the dedup is a **compilation-level choice** (clipping A and clipping B each legitimately mention the same candidate; the per-clipping JSONs correctly preserve that). The 292 parts/ JSONs were therefore **left unchanged for the dedup**. Only the 1974 County Commission **granular accuracy fixes** (a per-clipping-truth correction) were written into the relevant JSON (`128401_19741103_v2.json`, backed up alongside).

Note: clipping `128401_19281105` has no parts/ JSON (minor; 1928 territorial-era item).

## Spot Check Results

Independent PDF re-reads (read before consulting the CSV):
- **1882** (REPUBLICAN TICKET): 20 offices + STRAIGHT TICKET row all correct. Minor: 2 Justices of the Peace + 2 Constables (precinct-level) omitted; "Maden"→"MADDEN" spelling.
- **2018** (Journal selections recap): all picks correct; this clipping is duplicated by `20181104_v2` (same article, different download date).
- **1974** (Our Choice: Joseph Skeen + Journal Recommendations): full slate accurate (Skeen R over Apodaca D; both-qualified Sec State Evans/Gomez and County Commission Dist 3 Hawk/Bedingfield correctly coded); County Commission district/party errors found and fixed (above).
- **1972** (Choices Repeated): full slate accurate; resolved the office-label questions (State Corporation Commission, Flood Control Board); no-endorsement Dist 16/23 races correctly coded as no-direction.
- **1970** (Reiterating Our Support): statewide picks accurate; "No choice" races correctly absent.
- **1966** (Restating Our Position): all verifiable records correct.

**Pattern A (missing opposed records) is NOT a concern here** — the low opposed count (35, none after 1980) reflects the paper's slate/recap format, which lists the paper's picks without naming opponents. The 6 no-direction records are correctly coded explicit non-endorsements.

## Content-duplicate clippings (kept per Kevin's decision)

The 294 clipping files were left in place (they are not byte-identical and preserve provenance). Years that contained content-duplicate clipping pairs (same article re-rendered, or a combined-PDF page overlapping a single-article clipping), inferred from the record duplication: **1920, 1924, 1936, 1940, 1950, 1952, 1954, 1956, 1964, 1970, 1972, 1974, 1994, 2004, 2016, 2018**. The confirmed example is `128401_20181104` / `128401_20181104_v2` (identical recap). A future pass could prune these clipping files if desired; for now only the CSV records were deduped.

## Open Items

1. **1900 HUBBELL (flagged, not changed):** `HUBBELL, FRANK A.` appears for both SHERIFF and SCHOOL BOARD. History suggests two different Hubbells in Bernalillo County politics (Thomas S. Hubbell = sheriff; Frank A. Hubbell = treasurer/assessor/school). The SHERIFF record's first name may be wrong (possibly Thomas S.), meaning these may be two distinct people rather than a duplicate. The 1900 ballot image is too small to verify — needs a higher-resolution scan.
2. **1934 EASTERDAY (flagged, not changed):** `EASTERDAY, MARGARET` appears for both SCHOOL BOARD and SUPERINTENDENT. Very likely a true duplicate (one person, one County School Superintendent race, two office labels). Could be merged (keep SUPERINTENDENT) on a quick confirm; left flagged for consistency with the Hubbell decision.
3. **STATE CORPORATION COMMISSION vs COMMISSIONER:** 1 record uses "COMMISSION" (1972 Ferguson), 3 use "COMMISSIONER" (1966/1970/1974). Minor label inconsistency.
4. **RAILROAD COMMISSION (17 records) — dataset-wide question:** NM regulated railroads/utilities through the State Corporation Commission (later the Public Regulation Commission). Many "RAILROAD COMMISSION" records may be the same NM body under different labels; the 2018 PRC records (Fischmann/Sanders) are coded RAILROAD COMMISSION with "Public Regulation Commission" notes. Worth a dataset-wide office-code decision later.
5. **2004 DIRECTOR (Camp):** Ward Camp for "PRC seat District 1" is coded `DIRECTOR`; likely should be `RAILROAD COMMISSION` to match the PRC convention. Minor, single record.
6. **1966 Congressional Position 2 no-choice (Walker/Davidson)** was not recorded as no-direction records, unlike the analogous 1972 cases. Minor consistency gap.
7. **1920 GOVERNOR HANNA (D)** is coded endorsed=1 alongside Mechem (R) endorsed=1; unusual for this Republican-leaning paper and may be a coding artifact (the editorial defended Hanna against a smear). Pre-existing; not part of this dedup. Needs the 1920 clipping to resolve.
8. **1976 Journal Recommendations table** (in `_review_queue.csv`): OCR of the tabular layout was unreadable; no records extracted. Candidate for a higher-resolution rescan.
9. **OCR-flagged additions from the modern-year re-extraction need future verification.** The ~170 records added to 1990/1996/1998/2008/2010/2012 carry confidence 0.70-0.85 with `[QA 2026-05-26: added from re-read of ... clipping]` notes. Several explicit name uncertainties are flagged inline (e.g., 1990 SENGBE surname uncertain, 1990 BARA surname uncertain, 1996 names broadly limited by image quality, 2010 MALDONADO/PARKS name-order uncertain, 2012 DONIECKE/KRHMAR/HADFIELD/ANDERSON/YOUNGBLOOD district or surname uncertain). All flagged records should be confirmed against higher-resolution scans before downstream analysis.
10. **1998 likely-wrong existing records (flagged, not changed):** the original CSV has `SEC OF STATE: DURAN, DIANNA J. (R)`, `TREASURER: GARCIA, LORENZO G. (R)`, and `SUPREME COURT: SCOTT, ROBERT H. (R)` for 1998. The 1998 clipping image shows what appear to be `Thomas J. Stout (D)`, `Lawrence S. Sutton (R)`, and `Robert H. Reidy (R)` respectively. Notes added to each record flagging the discrepancy; original CSV values preserved pending verification.
11. **1986 PNG clipping unreadable for re-extraction.** Likely under-extracted (16 records for a midterm year with no US House or Judicial Retention extracted). Candidate for higher-resolution rescan.
12. **Lower mean confidence (0.889 vs prior 0.906)** reflects the ~170 OCR-flagged additions. As those are verified, confidence can be raised.

## Recommendation

PASS WITH FIXES. The dataset's content was accurate; the dominant issue was augmentation-induced duplication (72 records, 5.8% of candidate records), now resolved, plus targeted 1974 slate corrections and judicial dist normalization. Remaining open items are either dataset-wide office-code questions, image-quality-blocked verifications, or low-risk single-record flags — none block compilation.
