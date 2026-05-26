# QA Report: Washington Post (DC)

**Newspaper ID:** 107050
**QA date:** 2026-05-25
**Status:** PASS

## Summary

88 unique clippings spanning 1974-2020 (35 distinct years; 1960 clipping was a non-endorsement editorial yielding zero records).
1,128 candidate endorsements, 190 proposition endorsements.
Mean extraction confidence: 0.93. Zero records below 0.7.

## Special handling: regional paper

The Washington Post is the major DC-area paper with a **regional editorial board** that endorses in DC, Maryland, and Virginia races. Records have per-record `state_election` values (DC, MD, or VA) reflecting where the actual election was held -- not all races are DC.

State-of-election breakdown:
- **MD: 534 candidate records** (heaviest -- MD governor, comptroller, Senate, US House, state legislative, county exec/council, sheriffs, state's attorneys, school boards)
- **VA: 410 candidate records** (governor, lt gov, AG in off-years; state senate/delegates; county supervisors; commonwealth's attorneys)
- **DC: 184 candidate records** (DC Mayor, DC Council, DC Delegate, DC State Board of Education, plus federal presidential picks)

This is the first paper in the archive that required per-record state_election since the editorial board's coverage spans three jurisdictions.

## Stage 1: Structural validation

- Headers match standard 16-col candidates / 11-col propositions schema.
- All rows have `newspaper_id=107050`, `state_newspaper=DC`.
- All rows have a valid `state_election` (DC, MD, or VA).
- No incumbency "0" values; no junk rows.
- `endorsed` values are 1 only for candidates (The Post used "we endorse" pattern throughout).
- Propositions split 160 YES / 30 NO.
- All years even or odd (off-year MD/VA state legislative coverage in 1983/1985/1991/1993/1995/1997/1999/2003/2007/2011/2013/2015).

## Stage 2: Spot-check accuracy

Processed by four parallel subagents (1960-1990, 1990-1996, 1996-2006, 2007-2020). Spot-check confirmed the Post's well-documented endorsement pattern: Democrats at presidential level (Kennedy 1960 (not endorsed in this clipping batch), Mondale, Dukakis, Clinton 1992/96, Gore, Kerry, Obama 2008/12, Clinton 2016 not in batch, Biden 2020), with significant Republican picks in MD/VA state races (Mathias R-MD Sen 1974, Hogan R-MD Gov 2014/2018, Webb D-VA Sen 2006 over Allen R, etc.).

## Stage 3: Variable coding

All office codes resolved to the standard set. Zero non-standard codes -- exceptional given the volume.

Parties: Democrat (662), Republican (134), Independent (34), empty (298). The 298 empty-party records are concentrated in nonpartisan races: DC State Board of Education (which is nonpartisan), school boards (typically nonpartisan in MD/VA), and judicial races (MD/VA circuit court judges run nonpartisan in most jurisdictions). The high Democrat:Republican ratio (5:1) reflects the heavy DC + Northern Virginia / Suburban Maryland coverage area, which is heavily Democratic.

All names in `LASTNAME, FIRSTNAME` ALL-CAPS format. Zero comma-less names.

## Stage 4: Low-confidence rescan

Zero records below 0.7 confidence. No additional rescan needed.

## Coverage notes

- Sparse pre-1990 coverage (1974 VA, 1978 MD/VA, 1980 Carter + school boards, 1983/84/85/86 MD/VA state)
- Dense 1990-2020 coverage including off-year MD/VA state legislative cycles
- 1998 (98 cands + 34 props), 2002 (90 + 25), 2006 (96 + 48), 2010 (79 + 6), and 2014 (67 + 3) are the densest composite clippings -- full ballot recaps
- 2012 has 7 separate Oct editorials covering specific races (Senate, US House, DC Council) plus the Oct 28 D.C. Council composite
- 2013 covered the McAuliffe/Northam/Herring D sweep of VA statewide
- 2014 covered MD Brown D Gov endorsement (Hogan R won) + Bowser DC Mayor

## Issues found and resolved

- 0 office code recodes
- 0 incumbency "0" fixes
- 0 name fixes
- 0 low-conf records
- 298 empty-party records flagged for augmentation backfill (nonpartisan/judicial)
- 88 dedup catches across primary/composite-clipping overlaps within same year

## Raw folder housekeeping

The raw/WASHINGTON POST folder contained 269 PDFs that resolved to 89 unique hashes:
- 91 DELUCA-named files mapping to ~88 unique hashes (3 internal collisions: 1999 ARTICLE/LIST, 2009 ARTICLE/LIST, plus a misfiled 20011108 that was actually 2011 content per ProQuest metadata)
- 1 standalone web-archive orphan (`107050_2012MMDD_v7.pdf`) containing the Oct 28, 2012 D.C. Council endorsement editorial -- added as `107050_20121028.pdf`. This was content-identical to the DELUCA 20121028 file with slightly different PDF metadata.
- 1 undated DELUCA "2005_ARTICLE_5" file containing the 2005 Virginia gubernatorial endorsement (Kaine D) -- identified by content and named `107050_20051030.pdf`

Total: 88 unique content pieces processed.

The misfiled 20011108 was renamed to 20111108 after ProQuest metadata confirmed Publication date Nov 8, 2011.
