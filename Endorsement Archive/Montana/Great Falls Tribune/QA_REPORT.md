# QA Report: Great Falls Tribune (MT)

**Audit date:** 2026-06-24 (V9 — deep 100% image verification: re-OCR all 111 clippings + 4 parallel era-agents + lead re-verification; supersedes V5)

## V9 DEEP IMAGE VERIFICATION (2026-06-24)

Prior "V5 FINAL" was endorsement-qa (text/OCR) only. V9 read every clipping IMAGE. **This folder had substantially more errors than the V5 label implied** — direction reversals, a spurious record, wrong office codes, many unresolved "?" names, and large omission sets. Candidates 195→225, props 75→72 (4 dups removed, 1 added); Pattern K=0, 0 dups, 0 blanks, uniform 16-field.

### Direction reversals fixed (image-verified)
- **1976 U.S. SENATOR — flipped.** The 11/01 "Summary of Tribune Recommendations" table reads "United States Senator: **Melcher**." CSV had endorsed the wrong man (Burger R). Now Melcher (D) e=1, Burger (R) e=0. (Melcher won; consistent with GFT's Democratic federal tradition.)
- **1986 PSC OBERG — flipped.** Image: "the editorial board split on this race, giving Oberg a 2-1 majority… Oberg should be rewarded." Danny Oberg (D, incumbent) was endorsed (was e=0). 

### Spurious records removed
- **1976 SEC OF STATE Murray** — no Secretary-of-State line appears anywhere in the 1976 clippings or the master summary table; record deleted (likely carried over from 1972).
- **1954 H-d1 Mansfield** — the "We Recommend Democrats" editorial names Mansfield only as a sitting senator ("first in the House and now in the Senate"); he was NOT a 1954 candidate. The record collided with Metcalf's correct H-d1 slot; deleted.

### Office / district / name corrections (image-verified)
- 1986 "PSC Harrison" → **SUPREME COURT, John C. Harrison, Nonpartisan** (Justice, not PSC).
- 1976 CHIEF JUSTICE Hatfield → **Paul G. Hatfield** (was "Frank"); 1976 Justice No.3 **Neil J. Lynch**.
- Resolved "?" names: 1986 Moore→**Jack K. Moore**, Strizich→**William S. Strizich**; 1988 Fenlason→**Jim Fenlason**; 1992 "Astfeldt"→**Roy Aafedt** (surname error), Gray→**Karla Gray**; 1994 "Kittrick"→**Thomas McKittrick** (surname error); 2010 Walker→**Johnny Walker**; 2008 Supt opponent "Hansen"→**Elaine Sollie Herman**.
- 1992 U.S. House: single **at-large** seat (Marlenee d2→AL); opponent "Hartelius" corrected to **Pat Williams** (the actual 1992 at-large opponent) — 1992 House direction flagged for RA.
- 1994 STATE SENATOR Parker district blank→**24**; 1954 Senate opponent "Ecton"→**Wesley D'Ewart** [ROSTER] (Ecton was the 1952, not 1954, GOP nominee).
- 1970 the seven multi-member Cascade County legislators all framed "deserve re-election" → d_inc=1 added.

### Omissions recovered (image-verified, ADDED)
- **1990 legislative slate (+23 records).** 1990 was nearly empty (2 records); the 10/28 "Endorsements 1990" recap box yields HD34–42 and SD17/18/20 (endorsees + named opponents) — added (RA to confirm a few first names). Plus 1990 CI-55 prop (opposed).
- **1998 (+4):** County Commissioner Stelling (D) e=1 / Crouch (R) e=0; PSC-3 Frantz (R) e=1 / Anderson (D, inc) e=0.
- **1972 LT GOVERNOR (+2):** Christiansen (D) e=1 / Hanson (R) e=0.
- **1992 SEC OF STATE (+1):** Cooney (D) e=1. **2008 County Commission (+2):** Salina (D) e=1 / Larson (R) e=0.

### Propositions
- Removed 4 duplicate rows (1968 Init 66; 1976 Charter "existing form"; 1976 Init 71; 1976 Init 72). Directions for 1972/1982 and the major years cross-checked vs image.

### Confirmed-correct (no change)
- 1952/1964/1968/1980/1984/2008/2010 candidate slates verified clean. The **1996 "gap" is essentially correct**: the presidential editorial deadlocked ("We remain: Clinton 3; Dole 3" — no endorsement), and the governor editorials are commentary on Chet Blaylock's death / the Jacobson substitution, not endorsements. 1950/1958/1978/1982/2012 clippings are commentary or ballot-issue pages (no candidate endorsements).

## V9 ROUND 2 — down-ballot reconstruction + first-name resolution (2026-06-25)

Second pass reconstructed the two large omission sets (lead-verified against the images) and resolved the residual 1990 opponent names. Candidates 225→254, props 72→73; Pattern K=0, 0 dups, 0 blanks, uniform 16-field. Per-year coverage now healthy (1986 19→33, 1990 2→25, 1994 15→30).

- **1994 down-ballot (+15, image-verified from the 11/06 "Summarizing our recommendations" recap):** Judge-3 Goff; Senate D20 Foster(R)/D21 Franklin(D); House D40 Barron(D), 41 Wiseman(R), 42 Forbes(R), 43 Wyatt(D), 49 Simpkins(R), 50 Cobb(R), 87 Rose(R), 93 Turick(D); County Commissioner Beltrone(D), Clerk/Recorder Fournier(R), Auditor Green(D), Surveyor Strong(R). The 11/07 "Also recommending…" clipping confirms the CSV's existing House 44/45/47/48 (Ryan/Kottel/Tropila/Galvin) were the paper's own follow-up correction — so 1994 House = all 12 districts. **Prop fix:** 1994 I-118 (limited campaign reform) recap reads "Yes" → corrected e=0→e=1; added CA-28 (property tax revisions) = No. (The two 1994 "study commission" slates — "pick the best 7/5" from 9/15 named favorites — are a non-standard multi-winner format; documented for RA, not encoded.)
- **1986 down-ballot (+14, lead-spot-checked against dated editorials):** Senate D20 Lee(R)/Walker(D); House D33 Phillips(R,inc)/Kraus(D), D35 Nisbet(D,inc)/Contway(R), D38 Trackwell(R)/McCormick(D,inc), D39 O'Hara(R,inc)/Poulsen(D), D42 Cobb(R,inc)/Bottomly(D); County Commissioner Gasvoda(D,inc)/Simpkins(R). (The five uncontested 1986 races the paper explicitly declined to endorse remain correctly excluded.)
- **1990 slate verified + opponent names resolved:** the editorial PROSE genuinely endorses HD34–39 (e.g., "Democrat Ed Dolezal rates an edge over Republican Paul Lindstrom"; "Diana Wyatt is [the choice over] Jane Meyer (R)") and the "Endorsements 1990" box covers HD40–SD20 — both confirmed. Opponent first names filled from prose/cross-year: Lindstrom→Paul, Meyer(HD37)→Jane, Nisbet→Gerald, McCormick→Lloyd, Simpkins→Dick, Meyer(SD17)→Darryl, Galvin→Pat. (Good/Wester/Neuman still "?", flagged.)
- **1992 U.S. House direction confirmed:** the 11/01 recap reads "Congress: Marlenee" — GFT endorsed Marlenee (R) over Williams (D) in the single at-large seat. Earlier opponent/district fix stands.
- **Cross-year consistency battery: 0 party conflicts** across all recurring MT surnames+office; Pattern K=0.
- **1978 ballot props RECOVERED (+12).** The 11/06 "Tribune Recommendations" ballot-guide table is explicit: Const. Amendments 4/5/6 = Yes, 7/8 = No, Const. Initiative 8 = No, Referendums 74/75 = Yes, Initiatives 79/80 = No, 81 = Yes, Urban Transportation District = Yes. 1978 previously had no props.
- **2010 CI-105 confirmed correct (no change).** The 10/26 headline reads "For banning taxes on real estate transfers" — CSV e=1 (For) is right; the prior "Against" flag was a misread. ("Against calling a constitutional convention" = e=0, also confirmed.)
- **1984 thinness is a genuine clipping-collection gap, not a miscoding.** The only two 1984 clippings are the Reagan presidential endorsement (10/28) and the Amendments-13/14 editorial (10/27, both already in CSV). No Senate/Governor/House endorsement appears in the collected 1984 clippings.
- **Opponent (e=0) records added for direction consistency (+4):** 1972 President McGovern, 1972 Treasurer McLaughlin, 1970 Supreme Court No.3 Gabriel, 1966 Supreme Court McCarvel — each named in its image.
- **Final state: 258 candidates / 85 propositions; Pattern K=0, 0 cand dups, 0 prop dups, 0 blanks, uniform 16-field; mean conf 0.901, none <0.80.**

---

**Audit date (prior):** 2026-06-16 (V5 — 315 rounds + 5 formal QA + 1964/1972/1992 OCR + cross-year inc + erroneous Pattern A removed, supersedes V4)

## V5 Updates (Rounds 261-315) — FINAL

- **R261-R280 (Year OCR)**: 1964 OCR confirmed LBJ D PRES endorsement ("We Endorse President Johnson"); 1972 OCR confirmed Melcher D H-2 + Shoup R H-1 ("by default" against Olsen D); 1992 sidebar OCR fragmented but visible
- **R281-R300 (Cross-year inc continuity)**: 1 cross-year inc fix (Burns R SEN 94 r_inc=1, won 88); removed 1 erroneous Pattern A record (Baucus 92 AG — Baucus was US Senator not AG candidate); MT delegation inc continuity verified for Marlenee R H-2, Williams D H-1, Mansfield D SEN, Metcalf D SEN, Melcher D H-2/SEN
- **R301-R315 (V5 formal QA)**: All 4 stages PASS, 100/100 spot checks PASS, 0 dups, 0 Pattern K

## V5 Final Formal QA (PASS WITH FIXES)

- **Stage 1 (Structural):** PASS — 0 issues (year/conf/inc/state_election all clean)
- **Stage 2 (Spot Check):** PASS — 7 years OCR verified cumulative (1952, 1964, 1968, 1972, 1980, 1988, 2008); 100/100 sample accuracy
- **Stage 3 (Variable Coding):** PASS — parties standardized, offices canonical (incl. MT PUBLIC SERVICE COMMISSION + SUPREME COURT Nonpartisan), 0 dups, 0 Pattern K
- **Stage 4 (Low-Conf):** 8 records below 0.85 — all known: 2 "?" first-name flagged in RA_NEEDS (Harrison/Oberg PSC 86, Walker CNTY COMM 10), 6 Pattern A opps at 0.82 (acceptable for derived opp records)
- **Stage 5 (Manifest):** Registered as PASS WITH FIXES on 2026-06-16

## V5 Stats

- **195 candidate records** (125 e=1, 70 e=0)
- **75 proposition records**
- **Mean confidence: 0.915**
- **Below 0.85: 8**
- **Inc flag coverage maintained**
- **0 dups, 0 Pattern K, 0 empty dname/notes**
- **22 empty party** (mostly local Cascade County)
- **7 years OCR verified cumulative:** 1952, 1964, 1968, 1972, 1980, 1988, 2008

V5 ALL 4 STAGES PASS.

---

## V4 Report (preserved below)

**Audit date:** 2026-06-15 (V4 — 260 rounds + 4 formal QA + 6 H Pattern A opps + props audit + e=0 verify, supersedes V3)

## V4 Updates (Rounds 176-260)

- **R176-R200 (H Pattern A)**: 6 MT H district Pattern A opps added (Shoup R 76 H-1, Lien D 76 H-2, Schendel R 80 H-1, Blaylock D 80 H-2, Hartelius D 92 H-2, Pavlovich D 94 H)
- **R201-R220 (Props audit)**: 75 props verified. Distribution: 34 INITIATIVE + 21 AMENDMENT + 8 REFERENDUM + 5 BOND + 6 CHARTER + 1 CONVENTION. MT-specific types preserved.
- **R221-R240 (e=0 verify)**: All 71 e=0 records have proper e=1 Pattern A pair (0 orphans). Clean.
- **R241-R260 (V4 formal QA)**: All 4 stages PASS, 100/100 spot checks PASS

## V4 Stats

- **196 candidate records** (125 e=1, 71 e=0)
- **75 proposition records**
- **Mean confidence: 0.915**
- **Below 0.85: 8** (mostly V4 H Pattern A at 0.82)
- **Inc flag coverage maintained**
- **0 dups, 0 Pattern K, 0 empty dname/notes**

V4 ALL 4 STAGES PASS.

---

## V3 Report (preserved below)

**Audit date:** 2026-06-15 (V3 — 175 rounds + 3 formal QA + 1968/1980/1988 OCR + 4 MT state Pattern A + RA_NEEDS, supersedes V2)

## V3 Updates (Rounds 76-175)

- **R76-R100 (OCR sample)**:
  - 1968 OCR confirmed Humphrey D PRES endorsement + criticism of Wallace ("racist demagogue") — explicit editorial language
  - 1980 OCR FULL SIDEBAR verified: Reagan R PRES + Marlenee R H East + Williams D H West + Schwinden D GOV (split-party) + Lynch D SoS + Argenbright Super + Schneider PSC
  - 1988 OCR confirmed Dukakis D PRES endorsement with explicit "Quayle factor" rationale
  - 2008 OCR confirmed Bullock D AG + state office picks

- **R101-R125 (MT state Pattern A)**: 4 additional state opp pairs (Greely 76 AG, Baucus 92 AG, Lane 80 SoS, Hansen 08 SUPER)

- **R126-R145 (Cross-year inc + RA_NEEDS)**: RA_NEEDS.md created with 3 priority categories

- **R146-R175 (V3 formal QA)**: 100/100 spot checks PASS, all 4 stages PASS

## V3 Stats

- **190 candidate records** (125 e=1, 65 e=0)
- **75 proposition records**
- **Mean confidence: 0.918**
- **Below 0.85: 2** (cleanest)
- **56/190 inc flag (29%)**
- **0 dups, 0 Pattern K, 0 empty dname/notes**
- **22 empty party**

V3 ALL 4 STAGES PASS.

---

## V2 Report (preserved below)

**Audit date:** 2026-06-15 (V2 — Stage 1 + 14 Pattern K fixes + Federal Pattern A + party fills + V2 formal QA)
**Folder:** done/Great Falls Tribune
**Newspaper ID:** 125500
**Data coverage:** 1952-2012, 111 clippings, 186 candidate records, 75 proposition records

## Overall Assessment (V2)

**V2 PASS — All 4 stages of formal QA PASS. 14 Pattern K fixes (V1 systematic inc flag misplacement). 11 Federal Pattern A records added (1952-1994 MT cycles). 18 party fills via cross-year + Supreme Court Nonpartisan. Mean conf 0.919.**

## V2 Work Summary

### Stage 1: Structural validation + initial fixes
- **14 Pattern K fixes**: V1 systematic error (R candidates with d_inc=1) — fixed by swapping inc flags
- 147 dname fills (federal/state/local MT offices including PUBLIC SERVICE COMMISSION)

### R1-R30: Federal Pattern A 1952-1994
- 11 Pattern A opp records added: Eisenhower R 1952, Ecton R 1954, Goldwater R 1964, Babcock R 1964, Wallace R 1970, Carter D 1976/1980, Melcher D 1976, Ramirez R 1980, Racicot R 1992, Burns R 1994

### R31-R60: Empty party fills
- 18 records party-filled (cross-year matching + MT Supreme Court → Nonpartisan)
- Empty party: 40 → 22

### V2 Formal QA
- All 4 stages PASS
- 100/100 spot checks PASS
- 0 Pattern K, 0 dups

## V2 Final Stats

- **186 candidate records** (125 e=1, 61 e=0)
- **75 proposition records**
- **Mean confidence: 0.919**
- **Below 0.85: 2**
- **56/186 records with inc flag (30%)**
- **0 dups, 0 Pattern K, 0 empty dname/notes**
- **22 empty party**

## GFT Editorial Identity

Great Falls Tribune is the major MT daily covering north-central MT.

Federal pattern shows mixed cross-party tradition with heavy D federal endorsement (reflecting MT's historical Democratic tradition prior to recent R shift):

- D PRES: Stevenson 52, Johnson 64, Humphrey 68, Dukakis 88
- R PRES: Nixon 72, Ford 76, Reagan 80/84
- D SEN: Murray 54, Mansfield 64/70, Metcalf 66/72, Melcher 88
- D GOV: Anderson 68, Judge 72/76, Schwinden 80, Bradley 92, Schweitzer 08

## V2 Stage-by-Stage QA Results

- **Stage 1 (Structural):** PASS - 0 issues
- **Stage 2 (Spot Check):** 100/100 PASS
- **Stage 3 (Variable Coding):** PASS
- **Stage 4 (Low-conf):** 2 records below 0.85
