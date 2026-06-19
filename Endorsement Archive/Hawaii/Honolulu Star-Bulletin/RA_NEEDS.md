# RA Manual Review Needs: Honolulu Star-Bulletin

**Status:** AI processing complete through V3. Items below require manual RA intervention.

## Priority 1: All 57 props with empty endorsed direction

V1 extracted props but did not capture endorsed direction. Direction recovery requires systematic per-prop OCR.

Year distribution:
- 1978: 14 props (HI ConCon 1978)
- 1970: 7 props
- 2008: 6 props
- 1974: 5 props
- 2004: 4 props
- 1986: 4 props
- 1972: 4 props
- 1982: 3 props
- 1988: 3 props
- Others: smaller years

## Priority 2: 1988 PRES contradiction (V1 metadata vs V1 data)

CRITICAL: V1 metadata says "Endorsed: ... Bush (1988)" but V1 data has 1988 PRES = Dukakis D.

V3 OCR attempts on 1988-11-05 + 1988-11-07 clippings returned only metadata/title text — actual editorial content not extracted (image-only PDFs likely scrapbook covers). Cannot resolve via available OCR.

V2 added Bush R as Pattern A opp (consistent with V1 data Dukakis D as endorsed). If V3 OCR later confirms V1 metadata was correct (Bush R endorsed), would need to:
- Flip 1988 PRES: Dukakis D E=1 → E=0
- Flip Bush R Pattern A E=0 → E=1

## Priority 3: 34 V2 Pattern A records at 0.82 confidence

34 V2 federal Pattern A opps at 0.82 — research-backed but lower conf.

## V3 Work Summary

- 1990-11-02 OCR confirmed: "Saiki for U.S. Senate" + "Waihee for re-election" — confirms 1990 SEN Saiki R + 1990 GOV Waihee D both correct
- 1990-11-03 OCR confirmed: "For outer island mayors: Yukimura, Lingle, Inouye" — Lingle was endorsed as Maui Mayor 1990 (later won GOV 2002)
- 1988 OCR attempts inconclusive (PDFs only show titles)
- 2002 GOV OCR inconclusive (PDF only shows title)
- 0 state leg/BOE cross-yr inc fixes needed
- 57 prop_type fills (39 AMENDMENT + 18 CHARTER)
- Cross-paper sister HA framework documented

## What is NOT a concern (V3 PASS)

- Structural integrity: 100% pass
- Pattern K: 0
- Dups: 0
- 0 empty dname/party/notes
- Inc flag 12%

## SB Editorial Identity (V3 partial OCR confirmed)

HI Honolulu paper 1882-2010. R-leaning historically. Founded by Wallace Rider Farrington.

Federal pattern (V3 partial verification):
- R PRES: Nixon 60/68/72, Reagan 80/84 (V1 data + V2 Pattern A logic)
- D PRES (V1 data): Dukakis 88, Kerry 04, Obama 08 — Dukakis 88 contradicts V1 metadata, RA flagged
- R SEN: Fong 70, Saiki 90 (V3 OCR direct quote: "Saiki for U.S. Senate")
- D SEN: Inouye 80/86/04, Matsunaga 88
- D GOV: Ariyoshi 82, Waihee 90 (V3 OCR: "Waihee for re-election")
- R GOV: Anderson 86, Lingle 02
- Lingle endorsed as Maui Mayor 1990 (V3 OCR confirmed) before 2002 GOV run

Notable: 1990 SEN Saiki R was V1 metadata's "Last Republican holdout: Saiki over Inouye 1990" — V3 OCR confirms.

Cross-paper sister HA documented (V2 R31-R60 work): SB R-committed vs HA dual-endorsement editorial practice. 1986 GOV/H-1 and 1990 SEN are key divergence points.
