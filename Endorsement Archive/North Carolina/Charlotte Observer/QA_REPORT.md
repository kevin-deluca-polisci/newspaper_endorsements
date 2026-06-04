# QA Report: Charlotte Observer (NC)

**Newspaper ID:** 132300
**Audit date:** 2026-06-04 (V2 — 36 rounds re-QA)
**Folder:** Charlotte Observer
**Data coverage:** 1960-1990 + 2006-2020 (24 election years), 26 clippings
- 967 candidate records (704 baseline → 967, +263 net)
- 80 proposition records (75 baseline → 80, +5)

## Overall Assessment

**PASS WITH MAJOR FIXES V2**

By far one of the most extensive folder QAs of the project so far — 600+ fixes across 36 rounds. This is the second of two sister Charlotte papers (along with Charlotte News, 132301) and revealed comparable systematic extraction errors with the list-format BOLD CAPS years 1978-1990.

## Round-by-Round Summary

### Rounds 1-4: Initial spot checks + 1976 critical
- 1976 H 9th direction reversal: paper endorsed Martin R, not Goodman D
- 1968/1972 PRES/VP verification

### Rounds 5-8: Pattern A batch additions + cross-year incumbency
- 1984/1988/1990 + 2008/2012/2016/2020 Pattern A additions
- Cross-year incumbency sweep (182 flags applied)

### Rounds 9-12: 2006 + 2008 + 2014/2018 + structural sweep
- 2006: 22 Pattern A records (rich "X over Y" format clipping)
- 2008: 8 Pattern A records (PSM 6 OCR breakthrough)
- 2014: 8 Pattern A records
- 1990 PENDERGRAPH party-switch validation

### Rounds 13-16: 1976/1980/1988 deep + VP-PRES consistency
- 1976 H9 direction reversal (Martin R, not Goodman D)
- 1976 name fix: ROBINSON→McKINNON
- 1988: massive 27-fix round including GOV + H9 direction reversals
- **VP-PRES consistency fix**: 5 VP records (1984/1988/2008/2012/2016) corrected to match PRES direction

### Rounds 17-20: 1990 + 1988 + 1984 deep OCR
- 1990: BOLD CAPS format detected — 34 fixes including 5 direction reversals (H9, Court of Appeals x2, State House x2)
- 1988: 27 fixes including GOV + H9 + Court of Appeals direction reversals
- 1984: 24 Pattern A records added (R opposed for statewide D endorsements)

### Rounds 21-22: 1972 + 1968 deep
- 1972 PRES "No endorsement" verified — data correctly empty
- 1972 Superior Court Wood/Booker "No endorsements" — both removed (declined)
- 1968 name fixes: BEACHAM→BEACHUM, GAILING→GATLING, STOKES→STUKES + 9 alternate notes

### Rounds 23-24: 1960-1966 + 1970/1974
- **1960 GOVERNOR direction reversal**: paper endorsed Sanford D, not Gavin R
- 1962 H 9th "Take your choice" — both declined
- 1964 AG Comm "(No Choice)" — both declined
- 1974 CntyComm: added missing Gerdes R + Peacock R

### Rounds 25-26: 1978/1982/1986 + phantom resolution
- 1978: MASSIVE 31 fixes — SEN declined, CntyComm restructure (10 records), State House restructure (7 records)
- 1978 phantoms removed: BERRY/BLACK/ROUSH (3 records misplaced from other years)

### Rounds 27-28: 1982 + 1986 deep OCR
- 1982: 20 Pattern A records added
- 1986: 27 fixes including 3 name fixes (PUCCIO→PAXTON, BARROW→BURROW, CHESTNUT→GHEESLING), 2 party fixes, district fix

### Rounds 29-30: 2012/2016 + cross-paper sanity
- 2012: 14 fixes including LEAKE direction (paper declined D2), CLODFELTER district fix, 5 Pattern A
- 2016: 5 Pattern A records added
- Cross-paper vs Charlotte News: confirmed legitimate cross-paper splits (1976 PRES, 1984 PRES, 1984 GOV)
- 1962 SHRIVER party D→R fix

### Round 31: 1984 direction verification (CRITICAL)
**Via high-DPI image inspection of 1984 PDF:**
- **1984 GOVERNOR direction reversal**: paper endorsed Martin R (bold), not Edmisten D
- **1984 H 9th direction reversal**: paper endorsed McMillan R (bold), not D.G. Martin D
- 1984 CntyComm: added 5 alternate records per OCR bold detection

### Round 32: Propositions audit
- 1978: backfilled 5 missing bonds (paper recommended "Yes on all six")
- 1990, 1988, 1972, 1968 props verified against OCR — directions correct

### Round 33: Cross-year incumbency sweep (post-additions)
- 29 new incumbency flags via same-office-same-party-prev-election logic
- 27 rollbacks for perennial losers incorrectly flagged
- 9 restorations for known historical winners (Helms R Sen 1978/1984/1990, Reagan PRES 1984, Bush VP 1984, Johnson StSen 22 1988, Lockwood/Higgins/Blackmon CntyComm 1988)

### Round 34: Structural cleanup
- 86 district fills (1962-1982 H9, State Sen 22, State Rep 36 multi-member; 2008 State Sen district assignments)

### Round 35: 3rd party VP coverage
- 7 additions for minor-party VPs (1980 Lucey + Koch, 1984 Lewis + Gonzalez, 1988 Dattner, 2016 Weld + Baraka)

### Round 36: Final stats + metadata + this report

## Final Stats

- **Total candidate records**: 967 (704 baseline → +263 net = +37%)
- **Endorsed**: 704
- **Opposed**: 263 (4 baseline → 263 = 66× improvement)
- **D incumbent**: 169
- **R incumbent**: 70
- **Other incumbent**: 5
- **Total proposition records**: 80 (71 YES, 9 NO)
- **Mean confidence**: 0.911

## Key Findings

### Editorial Pattern Discovered
Charlotte Observer was **D-leaning at presidential level** (Carter 1976/80, Mondale 1984, Dukakis 1988, Obama 2008/12, Clinton 2016) but **R-leaning at NC Governor + H 9th in 1984-1990** (Martin R Gov twice, McMillan R H9 four times). Original extraction missed this nuance, treating all Democrats as endorsed when many R endorsements existed.

### List-Format BOLD CAPS Detection
Years 1978/1982/1984/1986/1988/1990 used BOLD CAPS = endorsed convention. Original extraction marked ALL candidates as endorsed (no Pattern A). Manual image inspection + OCR breakthrough yielded ~200 Pattern A records.

### "No Endorsement" / "Take Your Choice" Patterns
Identified 8 races where paper explicitly declined to endorse:
- 1972 PRES, 1972 Superior Court, 1972 Register of Deeds
- 1962 H 9th, 1964 GOV/AG Comm/Sec State
- 1978 SEN
- 2012 CntyComm D2
- 2020 SEN

### Sister Paper Comparison
Charlotte Observer (AM) and Charlotte News (PM) had **separate editorial boards** and often differed on top-of-ticket (1976 PRES, 1984 PRES). However, they agreed on many state-local races, validating cross-checks.

## Outstanding Notes

- **1992-2004 coverage gap**: intrinsic to source data; no clippings in dataset
- **2020 PRES**: paper endorsed Biden in separate editorial not in our archive (data has no record per Carpinteria precedent)
- **Multi-member districts** (pre-2002): paper sometimes endorsed alternates; documented via notes_endorse field

## Notes for Downstream Use

- This folder's Pattern A coverage is now comparable to Charlotte News (sister paper)
- Cross-party endorsements at state/local level common (especially 1972 Holshouser R Gov, 1984/1988 Martin R Gov, McMillan R H9 1984-90)
- Coverage gap 1992-2004 will affect time-series analyses
- Cross-year incumbency relies on paper's endorsement choices (not voting outcomes); verified Helms R 1978/1984/1990 as incumbent

Compiled: 2026-06-04 after 36 rounds + formal endorsement-qa skill pass to follow.
