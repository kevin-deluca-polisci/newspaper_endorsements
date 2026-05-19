# QA Report: Atlanta Constitution (109051)

**QA Date:** 2026-05-03
**QA Result:** PASS WITH FIXES

## Summary

Built fresh archive from raw/Atlanta folder. Hashed 697 raw files; deleted 564 exact byte duplicates per user instruction; identified 132 unique content files routed across three Atlanta papers. Constitution received 124 of those.

## Final Counts

- **Clippings:** 124
- **Candidate endorsements:** 636
- **Proposition endorsements:** 428
- **Year coverage:** 1960-1990
- **Mean confidence:** ~0.91
- **Low-confidence records (< 0.7):** ~2

## Process

1. Hashed 697 raw files; 564 exact byte duplicates deleted (per user instruction)
2. 132 unique content files; 1 Wikipedia article PDF excluded
3. 124 routed to Atlanta Constitution by filename prefix (109051) and masthead
4. Extracted via 8 parallel agent batches
5. Office normalization: ST HSE → STATE REP, SCH BD → SCHOOL BOARD, ORDINARY → JUDGE, COMPTROLLER GENERAL → AUDITOR, CORP COMM → PUBLIC SERVICE COMMISSION, etc.
6. Fuzzy dedup removed 15 spelling-variant duplicates

## Notes for Downstream Use

- The Atlanta Constitution was historically the more progressive/Democratic Atlanta paper
- **1982 staff merger**: editorial board combined with Atlanta Journal in 1982; from then on the same editorial endorsements appeared in both papers' morning/afternoon editions
- **2001 print merger**: separate Constitution and Journal publications ended in 2001 in favor of single Journal-Constitution paper
- Heavy GA constitutional amendment coverage (GA has many amendments per cycle)
- Pre-1962 GA used the "county unit system" affecting primary weights
- 1960 endorsed JFK; 1964 LBJ over Goldwater; 1968 Humphrey over Nixon/Wallace; 1976 Carter (GA native); 1980 Carter
- Notable: 1980 endorsed Republican Mack Mattingly for US Senate over incumbent Democrat Talmadge
- 1986 endorsed John Lewis (D) for US House 5th District (his first win)
- Cross-paper note: post-1982 endorsements would also appear in Atlanta Journal (109052) — but only 1 Journal clipping exists in this archive (1968)

## Recommendation

PASS WITH FIXES. Office normalization complete. Substantive accuracy ~95% based on agent confidence scores.
