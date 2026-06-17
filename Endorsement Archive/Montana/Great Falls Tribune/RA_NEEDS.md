# RA Manual Review Needs: Great Falls Tribune

**Status:** AI processing complete through V3. The items below require manual RA intervention.

## Priority 1: 22 empty party records

After V2 fills (40 → 22), 22 records remain with empty party. Mostly local Cascade County officials + some state offices.

## Priority 2: 2 records below 0.85

Cleanest dataset — only 2 records below 0.85 conf.

## Priority 3: 2 records with "?" in cand_name

V1 had:
- 1986 PUBLIC SERVICE COMMISSION: HARRISON, ?
- 1986 PUBLIC SERVICE COMMISSION: OBERG, ?

These need first-name resolution via clipping verification.

## V3 Work Summary

- 1968 OCR confirmed Humphrey D PRES + criticism of Wallace ("racist demagogue")
- 1980 OCR FULL SIDEBAR verified: Reagan R PRES + Marlenee R H East + Williams D H West + Schwinden D GOV + Lynch D SoS + Argenbright Super + Schneider PSC
- 1988 OCR confirmed Dukakis D PRES endorsement ("Quayle factor" rationale)
- 2008 OCR confirmed Bullock D AG endorsement + state office picks
- 4 additional state Pattern A pairs added (Greely 76 AG, Baucus 92 AG, Lane 80 SoS, Hansen 08 Super)

## What is NOT a concern (V3 PASS)

- **Structural integrity:** 100% pass
- **Cross-paper validation:** N/A (no MT sister papers in archive)
- **Federal Pattern A coverage:** Complete 1952-2012
- **Mean confidence:** 0.919
- **Pattern K:** 0 (after V2/V3 fixes)
- **Dups:** 0

## GFT Editorial Identity

Heavy D federal endorsement tradition (MT historical D pattern):
- D PRES: Stevenson 52, Johnson 64, Humphrey 68 (criticized Wallace as "racist demagogue"), Dukakis 88 (Quayle factor)
- R PRES: Nixon 72, Ford 76, Reagan 80/84
- D SEN: Murray 54, Mansfield 64/70, Metcalf 66/72, Melcher 88
- D GOV: Anderson 68, Judge 72/76, Schwinden 80, Bradley 92, Schweitzer 08
- 1980 cross-party: Reagan R PRES + Schwinden D GOV (split)
- 1988 cross-party: Dukakis D + Melcher D SEN (D federal); only R was Marlenee H East
