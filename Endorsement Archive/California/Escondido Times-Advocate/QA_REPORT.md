# QA Report: Escondido Times-Advocate (CA)

**Newspaper ID:** 101700
**QA date:** 2026-05-23
**Status:** PASS WITH NOTES

## Summary

27 unique clippings spanning 1950-1994 (14 distinct years).
240 candidate endorsements, 363 proposition endorsements.
Mean extraction confidence: 0.90. Only 1 record below 0.7 after auto-fix splitting.

## Special handling: full-page filtering

This paper's clippings were **full opinion-page scans**, not isolated endorsement articles. Each clipping required careful filtering to extract only the paper's own editorial-board endorsements while ignoring:
- Syndicated bylined columns (John Chamberlain, Art Hoppe, James Kilpatrick, William Buckley, Tom Wicker, Mary McGrory, etc.)
- Political cartoons (Herblock, Mr. Tweedy, Small Society, Brickman)
- Letters to the editor (Public Forum sections with signed names + addresses)
- Editor's columns on endorsement methodology
- Chamber of Commerce position pieces (which were sometimes published on the opinion page but represent the Chamber's positions, not the paper's)
- Non-endorsement editorials on civic process, transparency, council openness, etc.

Filtering worked well. Three clippings yielded ZERO endorsements as legitimate empty results:
- 1972-05-24 and 1974-05-14: Chamber of Commerce ballot position pieces (not T-A's positions)
- 1981-10-25, 1984-04-08, 1988-10-30: Editor's columns about endorsement methodology / Public Forum-only pages with no T-A picks

## Stage 1: Structural validation

- Headers match standard 16-col candidates / 11-col propositions schema.
- All rows have `newspaper_id=101700`, `state_newspaper=CA`, `state_election=CA`.
- No incumbency "0" values; no junk rows; no empty critical fields.
- `endorsed` values are 1 only for candidates (T-A used "we recommend" pattern). Props split 248 YES / 115 NO -- significant NO count reflects T-A's conservative-leaning opposition to several state propositions on environmental, tax, and bond questions.
- Years include both even (general) and even-year primaries (May/June). 1981-10-25 is the only odd-year clipping (off-year local election); it yielded zero endorsements so doesn't appear in data.
- 27 clippings; metadata counts match CSV row counts.

## Stage 2: Spot-check accuracy

Spot-checked the 1970-10-23 clipping (the example you sent earlier). The subagent initially extracted SCHMITZ (the incumbent the editorial criticizes) but the piece actually makes the case for LENHART (the Democratic challenger). I corrected this manually before compile -- the editorial says the district's Republican-leaning voters could improve their representation if "enough Republicans thought their national administration might get better support from a moderate Democrat than from the Republican incumbent." That's an implicit Lenhart endorsement.

This was a real risk of the full-page format: the surrounding context (Schmitz's name appears 10+ times) made it look like the endorsement subject, but the conclusion direction is the actual endorsement. The other 26 clippings were spot-checked at varying levels and looked correct.

## Stage 3: Variable coding

All office codes resolved to the standard set after auto-fixes:
- 1 record auto-recoded `DA` -> `DA/PROSECUTOR` (1994 Pfingst, Paul).
- 10 records had last-name-only with no comma (CLOYED, HUTCHINGS, REYNOLDS, VAN CAMP, BAGLEY, etc.) -- auto-fixed by adding trailing comma and flagging "first name not in source" in notes. These were from compact T-A endorsement sidebars that listed only last names.
- 1 placeholder record `POMERADO, INCUMBENTS` was split into 6 named incumbent records (DAVIS DEMAR, DAILEY JOHN, LYON ED, BARTELT CLYDE, NEATE NORMAN, LOUNSBERY KEN) -- the subagent extracted the slate name with details buried in notes; I expanded these into proper per-candidate records.

Parties: Republican (75), Nonpartisan (143), Democrat (16), Independent (1). The Nonpartisan plurality reflects heavy local race coverage (Escondido and other North County city councils, school boards, water/hospital districts), which are all officially nonpartisan in CA. Republican dominance among partisan races is consistent with North County SD's conservative leaning.

## Stage 4: Low-confidence rescan

Only 1 record below 0.7 after the Pomerado split -- and it was the original Pomerado placeholder, which has now been replaced with 6 properly-named records at 0.85 each. No remaining low-confidence records.

## Coverage notes

- Heavy proposition coverage relative to candidate counts (363 props vs 240 cands) reflects CA's ballot-question-heavy elections. 1988 alone has 59 props.
- Both primary (Apr/May/June) and general (Nov) endorsements captured for most cycles 1972-1994.
- Editorial-board format evolved from compact "T-A recommends" sidebars (1960s-70s) to full multi-paragraph editorials with bolded composite "Our endorsements" sidebars (1980s-90s).
- The T-A endorsed Cranston (D) and Unruh (D) in 1974, breaking from its usual Republican pattern -- captured in the data.
- 1990 sheriff endorsement + full "OUR ENDORSEMENTS" sidebar (Oct 31 + Nov 5 versions) gave us 32-36 records per clipping for 1990 -- the densest pair in the dataset.

## Issues found and resolved

- 1 candidate auto-fix (1970-10-23 SCHMITZ -> LENHART; full-page filtering risk)
- 1 office code auto-fix (DA -> DA/PROSECUTOR)
- 10 records auto-fixed (last-only names: trailing comma + note flag)
- 1 placeholder record split into 6 named records (1982 Pomerado/Palomar Hospital District)
- 3 clippings with zero endorsements correctly identified as Chamber-of-Commerce or editor-column pages (not extraction errors)

No other issues. The full-page filtering pipeline worked cleanly across the bulk of clippings; the one error caught in spot-check (Schmitz vs Lenhart) is a known risk of the format that future processing might mitigate with explicit "who is the editorial pointing TOWARD" prompting.

## Raw folder housekeeping

109 raw files (mix of JPG with multiple naming patterns) boiled down to 27 unique by SHA-256. All 27 had DELUCA canonical names. JPGs were resized to 1800px max height + reconverted to PDF (5MB→500KB) to fit subagent context limits.
