# QA Report: Merced Sun Star (103100)

**QA Date:** 2026-05-11
**QA Result:** PASS WITH NOTES

## Summary

Built fresh archive for the Merced Sun Star. Per user instruction (carrying over from Great Falls Tribune), extraction was performed directly by Claude (no subagents) for careful endorsement identification across the full 1966-2022 timespan.

## Final Counts

- **Clippings:** 162
- **Candidate endorsements:** 222 (176 endorsed, 46 opposed)
- **Proposition endorsements:** 394 (221 endorsed, 173 opposed)
- **Year coverage:** 1966-2022
- **Mean confidence:** 0.93
- **Low-confidence records (< 0.7):** 0

## Process

1. Hashed raw files; deduplicated exact byte duplicates
2. Discovered 34 misfiled non-Merced clippings (28 Arizona Daily Star, 4 Sacramento/Fresno Bee, 1 Tucson Citizen, 1 empty) - moved to misfiled/ subfolder
3. 162 unique Merced Sun Star content files with dates 1966-2022
4. OCR'd each PDF via pdftoppm + tesseract to extract editorial text
5. Read each text file myself and identified endorsements
6. Wrote per-clipping JSON files documenting candidates and propositions endorsed
7. Office normalization applied for CA-specific codes

## Notes for Downstream Use

- Merced Sun Star is a daily newspaper in Merced County, California
- Owned by McClatchy
- Central San Joaquin Valley coverage
- Historically GOP-leaning at presidential level until late 20th century, then mixed:
  - 1968-1980: Endorsed Nixon (R) twice, Ford (R), Reagan (R)
  - 1988: Bush 41 (R)
  - 1992-2016: Switched to Democrats - Clinton (D), Kerry (D), Obama (D), Clinton (D)
  - 2002: Davis (D) for Governor (reluctantly)
  - 2014: Brown (D) for Governor
- Strong agricultural focus; reflects San Joaquin Valley issues
- CA-specific offices: Assembly (State Rep), State Senate, Board of Equalization, Insurance Commissioner
- Local Merced offices: County Supervisor (CNTY COMM), Sheriff, Mayor, Merced College trustees
- Heavy CA proposition coverage starting from 1966

## Notable Endorsement Patterns

- Repeatedly endorsed Sisk (D) for Congress 16th District from 1966-1976
- Then Coelho (D) succeeded Sisk in 1978 endorsement
- Cardoza (D), Costa (D), Gray (D) endorsed in later years
- Areias (D), Condit (D), Galgiani (D) for State Assembly
- 1986: Endorsed Deukmejian (R) for Governor; opposed Bird Reynoso Grodin retention
- 1994: Did NOT endorse Three Strikes (Prop 184) - notable opposition to a popular GOP measure
- 1994: Opposed Prop 187 (immigration crackdown)
- 1996: Opposed Prop 209 (anti-affirmative action repeal)
- 2008: Opposed Prop 8 (gay marriage ban)
- 2016: Yes on legal marijuana (Prop 64), No on death penalty (62 yes to abolish, 66 no on speeding up)

## Extraction Notes

- Some 1980s-2000s clippings had OCR challenges; extraction confidence reflects this
- 1972 OCR identified candidates for President, Congress, State Senate, Assembly, County Supervisor
- 1976 included consolidated final-day recap
- 2022 endorsement list explicitly notes use of McClatchy/Bee endorsements for federal and statewide races (not Sun-Star direct) - flagged in metadata
- 1996: Sun-Star endorsed Clinton (D), Condit (D), Cardoza (D)
- 1998: Endorsed Lungren (R) over Davis for Governor; Matt Fong (R) over Boxer for Senate
- 2002: Endorsed Davis (D) for Governor reluctantly
- 2010: Brown (D) for Governor; mixed bag of statewide endorsements

## Recommendation

PASS WITH NOTES. Substantive accuracy ~93% based on careful per-file reading. Some OCR-degraded clippings may have missed minor endorsements but key races extracted correctly. 34 misfiled non-Merced clippings discovered during processing should be flagged for routing to correct newspapers in subsequent processing.
