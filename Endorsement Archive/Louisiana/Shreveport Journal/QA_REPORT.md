# QA Report: Shreveport Journal (118401)

**QA Date:** 2026-05-01
**QA Result:** PASS

## Summary

Built fresh archive from raw/Shreveport/SHREVEPORT JOURNAL. Hash-deduped 133 raw files down to 22 unique clippings spanning 1920-1990. Extraction was straightforward with the agent finding most pre-1948 clippings to be dominated by Louisiana constitutional amendment editorials rather than candidate endorsements.

## Final Counts

- **Clippings:** 22
- **Candidate endorsements:** 22
- **Proposition endorsements:** 227
- **Year coverage:** 1920-1990
- **Mean confidence:** ~0.88
- **Low-confidence records (< 0.7):** ~5

## Stage 2 Spot-Check Results

- **118401_19481101.pdf (1948 Thurmond era):** Thurmond/Wright States Rights ticket endorsed; Truman/Barkley, Wallace/Taylor opposed; amendments 10 and 27 endorsed FOR; 15/22/32/33/34/41 AGAINST per Friday recap. **100% accuracy** — all records match.
- **118401_19761101.pdf (1976 Ford-Carter):** Ford and Dole endorsed; Carter and Mondale opposed. **100% accuracy.**

## Notes for Downstream Use

- The Journal was strongly anti-establishment / pro-States' Rights through mid-20th century: endorsed Smith (1928), Thurmond/Wright Dixiecrats (1948), T. Coleman Andrews/States Rights (1956), supported Wallace strategy (1968), Ford (1976)
- Heavy focus on Louisiana constitutional amendments throughout (LA has high amendment volume per election)
- The Journal ceased publication in 1991 (afternoon paper consolidated into Times)
- LA-specific office codes: POLICE JURY → CNTY COMM, CITY MARSHAL → CONSTABLE
- Pre-1980 LA elections were dominated by Democratic primaries (effectively one-party state)

## Recommendation

PASS. All sampled records match. Folder ready for downstream use.
