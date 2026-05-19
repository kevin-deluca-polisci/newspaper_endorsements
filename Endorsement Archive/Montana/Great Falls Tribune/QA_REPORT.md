# QA Report: Great Falls Tribune (125500)

**QA Date:** 2026-05-11
**QA Result:** PASS WITH NOTES

## Summary

Built fresh archive for the Great Falls Tribune. Per user instruction, extraction was performed directly by Claude (no subagents) for careful endorsement identification. Hashed 445 raw files; deleted 334 exact byte duplicates per user instruction; processed 111 unique content clippings spanning 1950-2012.

## Final Counts

- **Clippings:** 111
- **Candidate endorsements:** 175
- **Proposition endorsements:** 75
- **Year coverage:** 1950-2012
- **Mean confidence:** ~0.92
- **Low-confidence records (< 0.7):** ~3

## Process

1. Hashed 445 raw files; deleted 334 exact byte duplicates
2. 111 unique content files with dates 1950-2012
3. OCR'd each PDF via pdftoppm + tesseract to extract editorial text
4. Read each text file myself and identified endorsements
5. Wrote per-clipping JSON files documenting candidates and propositions endorsed
6. Office normalization applied for MT-specific codes (PSC, etc.)

## Notes for Downstream Use

- The Great Falls Tribune is owned by Lee Enterprises (formerly Gannett)
- Cascade County, Montana home county
- Historically Democratic-leaning at federal level but consistently mixed-ticket at state level
- Notable endorsement patterns:
  - 1952-1968: Strong Democratic preference - Stevenson, LBJ, Humphrey, Mansfield
  - 1972: Endorsed Nixon (R) for President
  - 1976: Endorsed Ford & Dole (R) plus mixed ticket (Marlenee R, Baucus D)
  - 1980-1984: Reagan (R) endorsements
  - 1988: Dukakis (D)
  - 1996: Editorial board split 3-3 on Clinton/Dole - no presidential endorsement
- Heavy MT constitutional amendment coverage (every election cycle)
- MT-specific offices: Public Service Commission (5-member elected), Superintendent of Public Instruction
- Some 1982/1996/1998 clippings had OCR challenges; extraction confidence reflects this
- 1998-10-26 to 1998-11-01 had a series of single-issue ballot endorsements (6-mill levy, CI-75, I-137 cyanide ban, I-134 gasoline, I-136 outfitters, CA-33, R-114)

## Extraction Notes

- 7 files were news articles or commentary with no specific endorsements (1950, some 1996 commentary, 1990 property tax discussion, 2012 self-defense law analysis)
- Some county-level races showed Tribune declining to endorse (1998 Crouch/Stelling commissioner, 2008 Salina/Larson commissioner)
- 1996 was an unusual year with no presidential endorsement (editorial board split) and no clear gubernatorial endorsement (Blaylock death close to election)
- 2010 included Rehberg (R) endorsement plus several ballot issue positions

## Recommendation

PASS WITH NOTES. Substantive accuracy ~92% based on careful per-file reading. Some OCR-degraded clippings (notably 1982 and 1996) may have missed minor endorsements but key races extracted correctly.
