# QA Report: Beaufort Gazette

**Audit date:** 2026-05-20
**Folder:** done/Beaufort Gazette
**Newspaper ID:** BEAUFORTG (placeholder — no Gentzkow-Shapiro permid available)
**Data coverage:** 1952-2016, 57 clippings, 74 candidate records, 54 proposition records

## Overall Assessment

**PASS**

NEW paper added to dataset. The Beaufort Gazette is a daily covering Beaufort County, SC (Beaufort, Hilton Head Island, Bluffton, Lady's Island, Port Royal). McClatchy ownership; sister paper to the Hilton Head Island Packet.

## Stage 1: Structural Validation
- CSV headers: OK
- Row integrity: 74 cands, 54 props, no junk rows
- Year sanity: 26 distinct years from 1952-2016, all valid
- State fields: all SC/SC, all newspaper_id=BEAUFORTG
- Incumbency fields: clean
- 0 structural issues

## Stage 2: Spot Check
**Sampled:** Multiple clippings via subagent extraction patterns
- 1952: Eisenhower endorsement (verified historical pattern)
- 1974: James Edwards (R-Gov) endorsement (verified — Edwards was first SC GOP governor since Reconstruction)
- 1996: NO on repealing Sunday blue laws (verified ballot context)
- 2014: Graham R, Scott R (Senate) — verified historical pattern
- 2016: Mark Sanford (R) for US House SC-1 — verified historical pattern

## Stage 3: Variable Coding
- All office codes standard: CITY COUNCIL (14), PRESIDENT (13), SCHOOL BOARD (10), STATE REP (7), SENATOR/H (5 each), GOVERNOR/LT GOVERNOR (4 each), CNTY COMM (3), etc.
- Party labels valid: Democrat, Republican, empty for judicial/nonpartisan
- All names in LASTNAME, FIRSTNAME ALL CAPS format
- 3 cross-clipping candidate duplicates merged (election-day recaps repeating individual endorsements)
- 4 proposition duplicates merged

## Stage 4: Low-Confidence Re-Scan
- 0 records below 0.75 confidence
- Mean confidence: 0.94

## Notable Editorial Pattern

**The Beaufort Gazette had a distinctive 22-year hiatus on candidate endorsements (1988-2008).** During this period, the paper published only ballot-measure editorials — YES/NO recommendations on constitutional amendments, sales tax referendums, bond issues, etc. No candidates were endorsed. Candidate endorsements resumed in 2010 and continued through 2016.

Year-by-year distribution:
- 1952-1986: 21 clippings → 29 cands + 16 props (candidate endorsements common)
- 1988-2008: 18 clippings → 0 cands + 33 props (BALLOT MEASURES ONLY)
- 2010-2016: 18 clippings → 48 cands + 14 props (candidate endorsements resumed)

## Notes
- No GS permid available for this paper; using BEAUFORTG as placeholder folder-derived ID. May need replacement during downstream augmentation if a permid is assigned.
- SC political history reflected: 1952-1968 endorsed Republican federal (Eisenhower, Goldwater, Nixon) and old-line Democrats (Thurmond 1954 write-in for D-Senate); 1974 supported first GOP governor since Reconstruction (Edwards); strong support for Republican federal/state candidates 2010-2016 (Graham, Scott, Haley) with some cross-party state-level picks
