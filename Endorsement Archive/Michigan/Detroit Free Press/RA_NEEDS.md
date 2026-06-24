# RA Needs: Detroit Free Press (121300)

## STATUS AFTER V9c FULL 100% IMAGE RECONCILIATION (2026-06-23)
**Every election year has now been transcribed from the recap image and reconciled against the CSV (4 agents + lead re-verification of all high-stakes items). 198 records corrected, 82 added; candidates=2654, props=216; Pattern K=0, 0 dups.** Sections A-E below (the original V9 backlog) are now **substantially RESOLVED** — office scramble, US-House slates, 1986/1998 board swaps, county-commission garble, district mislabels, party/name fixes, and proposition directions have been applied. The cross-paper check vs the Detroit News validated the coding.

### Genuinely remaining for RA (small, low-impact tail):
1. **Priority 1 — STATE REP opponent backfill (~890 single-endorsee records).** Still requires the Michigan Manual / Almanac of American Politics per race. Do NOT LLM-infer opponents.
2. **Down-ballot omissions not auto-added** (agents listed them; lower priority, mostly nonpartisan): additional 1982/1988 trial-court judges; some county-commission & Detroit/DPS school-board seats (e.g., 1968 more Common Pleas, 1982 Detroit Bd-of-Ed districts beyond those added, 1996/1998 Wayne Circuit judges, 2016 DPS community-district board). See the four V9c agent reports for the full per-year lists.
3. **L-confidence items flagged, NOT changed (need a human look):** 1968 US House d17 Griffiths (agent didn't see her in the printed House list — but she's a major figure; likely a crop/print issue, left in place); 1974 State House d1 Law / d11 Bryant / d14 Ryan (agent didn't see them printed; left in place); 1998 blank-district STATE REP Waldrip / Nesbitt / McLaughlin (don't match the 1998 recap — possibly county-commission contamination; left in place, flagged).
4. **1998 Wayne County Tax-Allocation-Board referendum** direction is ambiguous (image wording "do away with… Vote YES" vs CSV e=0) — RA to confirm.
5. **New office codes introduced:** `CNTY EXEC` (18), `DRAIN COMMISSIONER` (1), `REGISTER OF DEEDS` (1), plus `CITY COUNCIL` now 4. Confirm these are acceptable in the master codebook or map them as the project prefers.
6. **Gap-year (1984/1986/1990/1992/2004) M/L-confidence items flagged, NOT auto-applied** (a dedicated agent read these recaps; lead applied only the high-confidence structural fixes): assorted trial-court JUDGE office-recodes + name spellings (e.g. 1992 Diehl->Probate, Blake/Cunningham/Van Tiem->Recorder's/36th-District; 2004 Officer "Briqatte"->Brigette, Guerrero->Guerriero, Walker->Cynthia Thomas Walker); **2004 county-commission party flips** (Costantino d1->R, Rengert d15->R) and the **Macomb prosecutor Marlinga(D) vs Viviano(R)** question; the **1986 Attorney General (Robert Cleland, R) add**; 1992 university-trustee names (Pridgeon/Reinhold) and school-board (Benjamin->Blanding); 2004 MSU-trustee Pittman party; 1990 judge name spellings (Morrow Bruce, Shamo, Paruk). See the V9c gap-year agent report for the full list.
7. **1984 US-House slate completeness:** only districts 3/4/5/6/10/11 are captured; the rest of the 1984 18-seat MI US-House slate needs a dedicated read of that column.
8. **Confirmed-correct, do NOT 'fix':** 1972 has **no presidential endorsement on purpose** (Free Press abstained — image-verified).

---
## (historical) V9 image verification backlog — now resolved by V9b + V9c

**The prior "V7 FINAL / ready for publication" was NOT accurate.** A full image-level verification (4 era agents + props agent reading the scanned recap clippings) found extensive errors. **UPDATE (V9b, same day):** Kevin asked for the focused correction pass, so I personally re-rendered the driving recaps and **APPLIED the big-ticket items — all of Section A's office scramble and the major Section C omissions/swaps (111 records, 46 added). See the ✅ marks below and the QA_REPORT V9b section.** What remains is a smaller tail of name-correct district mislabels, name/party spellings, scattered down-ballot judge office-codes, and a few image-confirm-then-remove items.

## A. Office-coding scramble — ✅ RESOLVED (V9b)
Michigan elects State Senate only in gubernatorial years (1970/74/78/82/86/90/94/98/2002/06/10/14/18/22). State-senate records in presidential years are mis-coded.
- **1980 — ✅ DONE:** 13 STATE SENATOR → STATE REP (Roberts 24, Leland 2, Hunter 5, V.Smith 10, Hertel 12, Bryant 13, Ryan 14, Collins 21, Padden 27, Sheridan 29, Keith 33, Skret 36, Raker 38).
- **1984 — ✅ DONE:** 13 recoded → STATE REP (districts per image) + added Hunter d5, Hood d6.
- **1990 — ✅ DONE:** 23 STATE REP → STATE SENATOR with correct districts + 7 missing senate seats added (Pollack 18, Schwarz 20, Rodebaugh 21, Gast 22, Van Regenmorter 23, Conroy 25, DeGrow 28); Kay Hart→Jerome Hart d14; Stabenow House d58→Senate d24. All 30 image senate districts now present. (Resolved the false same-party-same-dist collisions.)
- **2004 — ✅ DONE:** Gaffney STATE SENATOR removed (dup of real STATE REP d1). **1992 — ✅ DONE:** Parker recoded → STATE REP (district not in recap; RA confirm, likely d7). No presidential year now carries STATE SENATOR.
- **STILL TODO — scattered down-ballot office miscodes (lower priority, need per-record image read):** 1976 Riley/Beasley SUPREME COURT→Court of Appeals; 1978 MacKenzie→Appeals 3rd, Giese/Tomboulian senate→Oakland House, Kaufman Appeals→6th Circuit, Hobson/Roberts/Strong Wayne-Circuit→Recorder's, Ziolkowski/Hathaway/Kubicki Recorder's→3rd Circuit, Brader/Walker→Detroit School Board; 1982 Faust/Faxon/Suarez STATE REP→STATE SENATOR, Roach→U-M Trustee, Einheuser→WSU, Jeffrey→WSU, Mason→State Board of Ed, Marsh→36th District Court; 1988 Taylor→U-M Regent, Van Dusen→WSU, Brennan→Appeals 1st; 1990 several judge swaps; 2016 Nash/Miller (commissioners not JUDGE), Ayers/Barnett (Council/County-Exec not MAYOR), Arvant district 6→46.

## B. Spurious records to REMOVE (image-verified absent from the recap)
- ✅ **2004 DONE:** SENATOR-1 Gaffney + MAYOR "Evans" dup removed.
- ✅ **1986 DONE (swapped, not just removed):** Givens/Brennan/Griffin/Taylor/Mulder were WRONG NAMES — replaced in-place with the real endorsees (see C). Middaugh & Ramsey (STATE REP dup) — STILL TODO, image-confirm then remove.
- **STILL TODO (image-confirm-absent before deleting):** 1968 Calloway & Raviolo (WSU Governors); 1988 O'Neil (MSU Trustee) & Grenier; 1982 Finch (36th District).

## C. Omissions to ADD (in the recap, missing from CSV)
- **US House whole slates — ✅ 1976/2000/2008 DONE:** 1976 completed to all 19 (added 15, fixed d2 Esch→Pursell); 2000 added ALL 16 (Stupak-D1 … Dingell-D16); 2008 added d1 Stupak/d2 Hoekstra/d3 Ehlers + fixed Schauer→d7. **STILL TODO: 1988 US-House slate** (most missing).
- **Statewide endorsees — ✅ 1986 DONE:** Archer & MacKenzie (Supreme Court), McDonald & Neff (Appeals 3rd), Brown & Waters (Regents), Dumouchelle & Miller (SBOE) now correct. **STILL TODO:** 1976 Supreme Court Kavanagh/Moody/Ryan; 1978 Supreme Court Ryan, 6th-Circuit Gage/Kaufman/Schnelz.
- **STILL TODO — county-commission / school-board / judge omissions** per year (1968 Wayne Register of Deeds Youngblood + Detroit Council/School/Common-Pleas; 1980/82/88 county-commission & school-board seats; e.g. 1980 recap shows a Wayne County Commission column 6 Smith/8 Stephens/10 Salisbury/13 Stewart/15 Ward not yet captured — see agent reports).

## D. District mislabels (name correct, district wrong — image-verified, non-exhaustive)
1968 Saunders 14→11; 1974 McCollough 7→10, Kildee 27→29, Bryant 11→13, Dutko 24→25, Kefauver 34→30, Jondahl 50→59, Mastin 68→69 (+ Wayne CntyComm block garbled); 1976 McNeely 18→16, Vaughn 19→18, Owen 23→22, Montgomery 59→24, Trim 61→60; 1980 Stephens 11→8, Korney 14→17, Joyner 22→27, Ward 25→15, D.Bennett 6→8, M.Williams 5→6; 1982 DeSana 8→7, McNeely 18→3, Young Sr 3→14, Nichols 60→20, McNamee 63→65, Vanek 66→68, D.Evans 75→72; 1984 Weeks 28→70, Evans 75→72, Mathieu 76→92; 1986 Randall 93→89, Burtell 35→19, Stroia 38→33, Perovich→33rd District.

## E. Party / name fixes (image-verified)
- Party: 1978 McLeod R→D; 1980 Dumas D→R; 2004 Pitman→D, Hillegonds→D (+ name Paddy→Paul); 2006 Manor→D, McKinney-Hatchett→R; 2012 Jasti→D; 1994 Voorhees add R.
- Name: 1974 Sarti→Safie, Warner→Werner; 1978 Baker→James Waters; 1990 Morrow Wallace→Bruce, Stamp→Shamo, Hart Kay→Jerome; 2004 Briqatte→Brigette; 1988 Emmons G.→Joanne G.; 1996 Brown Jeff→Bob (d22→16); 1994 Hesdemear→Heidemann.

## F. Carried over from prior RA_NEEDS (still valid — require EXTERNAL sources)
- **Priority 1 — STATE REP opponents:** ~890 STATE REP records are all e=1 with no opponents. Backfill requires the MI Manual / Almanac of American Politics (per-race), NOT LLM inference. Do NOT auto-generate inferred opponents.
- **88 empty-dist STATE REP records** — recover districts from individual clippings (many are recoverable from the recap).
- LT GOVERNOR under-extraction (1 record); 1972 PRES; prop description mismatches (1990 Prop L = Library not Lighting; 1974 Prop B = Vietnam-vets bonus not legislator-compensation; 1976 Prop F = General Retirement Board not Board of Ed).

## G. Cross-paper (Stage 7) — Detroit News
The **Detroit News** (R-leaning rival, in `done/`) should be cross-checked for same-candidate metadata consistency (office/party/district) AFTER the above corrections — the DFP metadata is currently too error-laden for a meaningful comparison. Editorial *direction* differences (DFP D-lean vs DN R-lean) are real and must be preserved.

## Newspaper ID
`121300`; confirm Gentzkow-Shapiro permid in augmentation.
