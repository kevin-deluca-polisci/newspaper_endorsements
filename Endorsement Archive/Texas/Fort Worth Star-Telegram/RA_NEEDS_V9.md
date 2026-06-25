# RA Needs: Fort Worth Star-Telegram (145400) — after V9 deep image verification (2026-06-24)

Deep image pass (re-OCR all 31 clippings + 4 era-agents + lead re-verification). **High-quality folder** — only minor field errors found and fixed (see QA_REPORT V9 section). Candidates 499→500, props 126 (2 directions changed); Pattern K=0, 0 dups, 0 blank names. Items below are residual judgment/structural calls, NOT auto-applied.

## Genuinely remaining for RA
1. **1990 source mismatch — RESOLVED in V9 round 2 (no longer an open item).** A 400 DPI + tesseract --psm 1 re-OCR of the archived Nov-4-1990 clipping recovers the FULL endorsement editorial (the earlier pass under-read it). All 13 previously "unverifiable" records are now directly confirmed in the clipping (Sturns, Lewis/Carter/Goodman/Grusendorf, Moncrief, Madrin Huffman, Hughes, J.D. Johnson, Mitchell, Fender, and Amendment 1 "Yes"). The 1990 set is fully image-verified. One fix was applied: County Clerk Huffman d_inc cleared (editorial: "defeated in a Republican sweep four years ago, should be returned" → challenger, not incumbent). No RA action needed.
   - Minor: 1982 County Treasurer "Jack **Beam**" (CSV) reads as "Jack **Bean**" in the 1982 clipping OCR — confirm surname spelling.
2. **1990 Kim Brimer district — RESOLVED in V9 round 2.** The 400 DPI re-OCR shows both copies of the clipping read "State Representative, District 96: Republican Kim Brimer" — district corrected 97→96 (conf 0.92). The 1990 state-rep districts (89, 91, 93, 94, 96) now match the clipping headers exactly. No RA action needed.
3. **2016 "Caution" props** (Tarrant Prop 1, Roanoke Prop 1): recoded For → no-position (endorsed blank). "Caution" is the paper's cautionary non-endorsement category — confirm whether the project wants these as blank/no-position vs a distinct code.
4. **2016 President:** the editorial frames it as "To reject Donald Trump" (Trump e=0); there is no affirmative Clinton record. Image-faithful (anti-endorsement framing) — confirm the project's handling of "reject X" editorials.
5. **2020 three tax props** (FWISD/Arlington ISD tax, Arlington sales tax): coded e=0, but the editorial says "We did not make specific recommendations on these votes" while leaning against — confirm whether these should be no-position rather than against.
6. **Incumbency** in image formats without "(I)" markers (1992, 2006, 2008, 2010, 2012, 2016): incumbency flags are roster-derived, neither confirmed nor contradicted by those clippings (only 2004 marks "(I)").
7. **Image-faithful dual listings** (1982 State Rep 96 Ware-R/Millsap-D under one district heading; 1982 County Treasurer Sprinkle-R/Beam-D) are reproduced from the source (likely original-print quirks).

## Newspaper ID
`145400`; confirm Gentzkow-Shapiro permid in augmentation.
