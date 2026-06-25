# RA Needs: Escondido Times-Advocate (101700) — after V9 deep image verification (2026-06-24)

The deep image pass (re-OCR all 27 clippings + 3 era-agents + lead re-verification) corrected extensive direction/name/office errors that survived the prior endorsement-qa "V9 FINAL". Candidates 286→289, props 341→**388**; Pattern K=0, 0 dups, 0 blank names.

## ✅ RESOLVED in V9 Round 2 (2026-06-24) — formerly the top RA items
- **Item 1 (1976 November slate): DONE.** The image-verified November general proposition slate (22 records) was added, clearly noted "1976 GENERAL", with the June primary set retained and labeled. (Primary vs general same-number reuse is a known pattern, like 1984/1988.)
- **Item 2 (opponent dname placeholders): DONE.** All "District 23" placeholders fixed to the correct district (1982 Akili 41 / Metzger 43, 1984 Archuleta 41, 1988 Ovrom 41 / Manning 43, 1994 Leschick 48 / Tamerius 51).
- **Item 3 (wrong-city dnames): DONE.** MAYOR records re-citied (McClellan=Vista, Thibadeau=San Marcos, Emery/Higginson=Poway; 1994 Hollins=Escondido); 1982 San Marcos/Poway council and 1984 Hedgecock(SD)/Flick(Vista) corrected.
- **Item 4 (prop descriptions): DONE for the big ones.** 1982 Props 6/10/13 + full 1982 letter-prop restructure; 1984 #16 jail bond / #19 $85M; 1990 #134 nickel-a-drink.
- **1982 propositions fully restructured** (mis-numbered 16–20 → lettered C/D/E/G; Prop 14 Helicopters → Prop A; real Prop 14 reapportionment added; spurious "Prop 20 Naval fuel" removed; Props B/F/Y added; D/E set no-position).
- **All applied prop direction flips lead-verified against the image** (every year).
- **1986 Treasurer** confirmed a legit "Boland or Silva" dual endorsement (dname corrected to San Diego County).

## Genuinely remaining (small tail)
Items below need a human look or an external decision; NOT auto-applied.

## 1. Source-attribution decision (biggest open item)
**1976 propositions:** the CSV's 1976 prop slate is sourced from the **June 7 primary** clipping (numbers/descriptions match it). The **November 1, 1976 general-election** clipping has its OWN, different proposition slate (state 1–15 + county A–G, including explicit "No Position" on state 9 and county A/F) that is entirely **omitted**. Decide whether both ballots should be captured; if yes, add the November set (directions transcribed in the agent report). Same primary-vs-general duplication of measure letters/numbers exists in other years but only 1976 has a wholly missing general slate.

## 2. Opponent-record dname/district placeholders (metadata, low impact)
Several **inferred-opponent** records (e=0, not printed in the clipping) carry a placeholder dname instead of their own district:
- 1988: OVROM (H d41) and MANNING (H d43) both have dname "U.S. House California District 23" → should be 41 / 43.
- 1994: LESCHICK (H d48) and TAMERIUS (H d51) both dname "District 23" → should be 48 / 51.
- 1982 statewide opponents (MCCARTHY fixed, NESTANDE fixed; others may still read "California Attorney Ge…").
These are cosmetic; the `dist` field is already correct.

## 3. Wrong-city dname on local council/mayor records (metadata)
- 1982: San Marcos council (SIMMONS, DANOVER) and Poway council (ORAVEC, REXRODE, SHEPARDSON) are filed under dname "City of Escondido (City Council)" — should be San Marcos / Poway. (notes_endorse are correct.)
- 1984: HEDGECOCK (San Diego Mayor) and FLICK (Vista Mayor) carry "City of Escondido (Mayor)" dname.

## 4. Proposition description corrections (directions already correct)
- 1984 Prop 16 desc "Marin County bond issue" → really a $250M jail bond (dir NO ok); Prop 19 amount "$45 million" → image "$85 million" wetlands bond.
- 1982 Props 6/10/13 descriptions are shifted vs the image (6 = pension funds not senior-homeowner; 10 = court unification not school; 13 = water conservation not reapportionment) — directions are correct; descriptions need a rewrite. Also 1982 Prop 14 was a description+direction fix (reapportionment YES); confirm Props B/F/Y (bailiffs/tourist tax/rural fire) were added.
- 1990 Prop 134 desc "Alcohol tax increase" → image "Nickel-a-drink tax" (dir NO ok).
- 1960 added props carry generic descriptions ("state proposition N") — could be enriched from the 1960 ballot.

## 5. Inferred-opponent convention (no action unless project changes policy)
Statewide e=0 opponent records in 1974/1976 (and elsewhere) are NOT named in the clipping ballot boxes (which list only the paper's picks). They follow the dataset's inferred-opponent convention; image does not independently confirm them.

## 6. Minor name formatting
- 1988 DUDYS now "SARAH \"KAREN\"" (printed "Sarah 'Karen' Dudys") — confirm preferred storage of the nickname.

## Newspaper ID
`101700`; confirm Gentzkow-Shapiro permid in augmentation.
