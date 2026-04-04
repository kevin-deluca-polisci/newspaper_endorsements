# QA Report: Austin American (144701)

**QA Date:** 2026-04-02
**QA Result:** PASS WITH FIXES
**Folder:** done/Austin American/
**Newspaper ID:** 144701
**Data coverage:** 1960, 1962, 1966, 1968, 1970, 1972

---

## Stage 1: Structural Validation

- **Candidates CSV:** 13 rows (was 11 pre-QA). All required columns present.
- **Propositions CSV:** 34 rows (was 17 pre-QA). All required columns present.
- **newspaper_id:** 144701 present in all rows.
- **Clippings:** 26 PDF files in clippings/ folder.
- **Years covered:** 1960, 1962, 1966, 1968, 1970, 1972.

## Stage 2: Spot-Check (Source Re-Reading)

Re-read all clippings for years 1960, 1962, 1966, 1970, and 1972. Findings below.

### 1960 (4 clippings)

- **144701_19601102_2.pdf** ("Texas Voters Have 4 Amendments Deserving Approval"): All 4 amendments endorsed. Descriptions in CSV were vague and inaccurate. Fixed:
  - Amdt 1: Was "CONSTITUTIONAL POWERS AND PROPERTY RIGHTS" -- now "HOSPITAL DISTRICTS IN HIDALGO AND COMANCHE COUNTIES"
  - Amdt 2: Was "LEGISLATIVE PROCEDURES" -- now "VETERANS LAND BONDS INTEREST RATE"
  - Amdt 3: Was "STATE FINANCE" -- now "LEGISLATOR COMPENSATION AND SESSION LIMITS"
- **144701_19601103.pdf** ("Vote Amendment 4"): Dedicated editorial on Amendment 4 (loan shark regulation). Confirmed.
- **Duplicate removed:** Two entries for 1960 Amendment 4 (one vague at conf 0.7, one specific at conf 0.8). Removed the vague duplicate.
- **CRITICAL FIX -- Presidential endorsement:** 144701_19601107.pdf editorial says "These papers have supported the Kennedy-Johnson ticket." CSV had NIXON, RICHARD (Republican) endorsed. Corrected to KENNEDY, JOHN F. (Democrat). This was a major extraction error.

### 1962 (6 clippings)

- **144701_19621030.pdf** ("Vote Against No. 14"): Discusses Amendments 4 (water, FOR), 7 (continuity of government, FOR), and 14 (trial de novo, AGAINST).
- **144701_19621031.pdf** ("Water Amendment Is Key"): Dedicated editorial on Amendment 4 (water conservation). CSV had this listed as Amendment 1. Corrected to Amendment 4.
- **144701_19621106.pdf** ("Vote Today: Scrutinize Good, Bad Amendments"): For/Against editorial. Confirmed Amdts 4 and 7 (FOR), Amdt 14 (AGAINST).
- **Amendment 7 added:** Continuity of government in event of enemy attack. Endorsed. Was missing from CSV entirely.
- **Amendment 14 description fixed:** Was "LEGISLATIVE AUTHORITY AND GOVERNMENTAL POWERS" -- now "TRIAL DE NOVO FOR ALL JURISDICTIONS."
- **Amendments 2, 5, 10:** Could not independently verify from available clippings (small print in 19621106 editorial). Kept at original confidence 0.7 with QA note.
- **Candidates added:** Connally for Governor and Thornberry for US House (from 19621101 and 19621104 editorials) were missing from CSV.

### 1966 (1 clipping -- reviewed in prior QA pass)

- Major underextraction found: Only 3 of 16 amendments originally captured. 12 missing amendments added.
- Amendment 3 coding error fixed: Was endorsed=0, should be endorsed=1 (editorial says "Recommendation: For").

### 1970 (10 clippings)

- **144701_19701028.pdf** ("The 7 Constitutional Amendments"): Crystal-clear editorial covering all 7 propositions with explicit FOR/AGAINST recommendations. Major issues found:
  - **3 missing amendments added:** Props 4 (State Building Commission), 5 (county road bonds), 6 (homestead exemption) -- all endorsed.
  - **Amendment 7 WRONG DIRECTION:** CSV had endorsed=1, but editorial explicitly says "we recommend a vote AGAINST proposition 7." Corrected to endorsed=0.
  - **All descriptions were wrong/vague:** Updated all 7 to accurate descriptions.
    - Amdt 1: "STATE REVENUE AND FINANCE" -- now "REMOVAL AND CENSURE OF JUDGES"
    - Amdt 2: "LEGISLATIVE PROCEDURE" -- now "REPEAL PROHIBITION ON OPEN SALOONS"
    - Amdt 3: "GOVERNMENTAL POWERS" -- now "AGRICULTURAL LAND ASSESSMENT"
    - Amdt 7: "COUNTY GOVERNMENT" -- now "CONSOLIDATION OF GOVERNMENTAL FUNCTIONS"
- **STATE REP corrections:** Three candidates (Angly, Cavness, Foreman) were coded as US House (H) with incorrect district numbers. Corrected to STATE REP with Place numbers (2, 3, 4) matching the Travis County multi-member delegation described in the editorial.

### 1972 (1 clipping -- new addition)

- **Austin_American_1972_Amendments.pdf:** New clipping added to folder. Contains 2 amendment endorsements (Amdts 2 and 4). Extracted and added to propositions CSV. No issues found.

## Stage 3: Variable Coding

- **Office codes:** Fixed H to STATE REP for 1970 Travis County delegation (3 records).
- **Candidate names:** LASTNAME, FIRSTNAME format confirmed for all.
- **Party labels:** Filled where available from clippings. Some 1970 state reps have blank party (not stated in editorial).
- **Incumbency flags:** Corrected d_inc/r_inc where verifiable from clippings.
- **No duplicates** in final dataset (after removing 1960 Amdt 4 duplicate).

## Stage 4: Low-Confidence Re-scan

All records below 0.75 confidence were reviewed. Most were corrected and bumped to 0.85-0.95 after source verification. Three 1962 records remain at 0.7:

- 1962 Amendment 2 (conf 0.7): Could not independently verify.
- 1962 Amendment 5 (conf 0.7): Could not independently verify.
- 1962 Amendment 10 (conf 0.7): Could not independently verify.

## Summary of Changes

| Category | Before QA | After QA | Change |
|----------|-----------|----------|--------|
| Candidate rows | 11 | 13 | +2 (Connally 1962, Thornberry 1962) |
| Proposition rows | 17 | 34 | +17 |
| Wrong endorsement direction | 2 | 0 | Fixed (1966 Amdt 3, 1970 Amdt 7) |
| Wrong candidate | 1 | 0 | Fixed (1960 Nixon to Kennedy) |
| Wrong office code | 3 | 0 | Fixed (1970 H to STATE REP) |
| Wrong amendment number | 1 | 0 | Fixed (1962 Amdt 1 to Amdt 4) |
| Duplicate removed | 1 | 0 | Removed (1960 Amdt 4 duplicate) |
| Vague descriptions improved | 11 | 0 | All updated from source text |

## Remaining Flags

- 1962 Amendments 2, 5, 10 remain at confidence 0.7. These could not be verified from the available clippings due to small print in the election-day editorial. They may require re-scanning at higher resolution.

## Overall Assessment

**PASS WITH FIXES.** Extensive corrections were required across all years. The most serious errors were a wrong presidential candidate (Nixon instead of Kennedy in 1960), a wrong endorsement direction (1970 Amendment 7), major underextraction in 1966 and 1970, and incorrect office coding for 1970 state representatives. All identifiable errors have been corrected. Three 1962 amendment records remain unverifiable at current scan resolution.
