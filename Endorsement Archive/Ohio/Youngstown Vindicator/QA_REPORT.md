# QA Report: Youngstown Vindicator

**Audit date:** 2026-05-20
**Folder:** done/Youngstown Vindicator
**Newspaper ID:** 137250
**Data coverage:** 2002-2022 (with most coverage 2002-2018), 131 clippings, 395 candidate records, 73 proposition records

## Overall Assessment

**PASS WITH NOTES**

NEW paper added to dataset. The Youngstown Vindicator (1869-2019) was the daily newspaper of Mahoning County, OH, covering the Youngstown / Mahoning Valley area. Ceased publication August 31, 2019. The Vindicator had a distinctive editorial pattern of publishing separate single-race endorsement editorials throughout October before each election, plus a summary editorial on election day.

## Stage 1: Structural Validation
- CSV headers: OK
- Row integrity: 395 cands, 73 props, no junk rows
- Year sanity: all even-year general elections (plus 2019 and 2022 entries)
- State fields: all OH/OH, all newspaper_id=137250
- Incumbency fields: clean
- 0 structural issues

## Stage 2: Spot Check
**Sampled:** 137250_20141026.pdf (Gov. Kasich for second term)
**Accuracy:** 100%
- Verified: Kasich (R, incumbent) endorsed; FitzGerald (D) opposed
- Editorial discusses Vindicator's past disagreements with Kasich but endorses based on his political maturation; single-race editorial pattern confirmed

## Stage 3: Variable Coding
- All office codes standard
- Top offices: STATE REP (80), CNTY COMM (57), H (49), SUPREME COURT (41), JUDGE (33), COURT OF APPEALS (27), SENATOR (15), AUDITOR (14), ATTORNEY GENERAL (13)
- 77 cross-clipping duplicates merged (incumbents endorsed in multiple consecutive cycles, summary editorials repeating individual race endorsements)
- 314 non-numeric extraction_confidence values fixed ("high"/"medium"/"low" → 0.95/0.8/0.6)

## Stage 4: Low-Confidence Re-Scan
- Only 2 records below 0.75 confidence
- Most extractions were highly accurate due to clean single-race format

## Notes on Anomalies

- **2019-08-31**: Final-day editorial — historical retrospective, not an endorsement. 0 records.
- **2022 (×2 files)**: Successor publication, the Tribune Chronicle of Warren OH (which acquired the vindy.com domain). 13 candidate records coded with Vindicator id 137250 for continuity but flagged in notes that actual publication is Tribune Chronicle. May need to be reassigned or removed during downstream processing depending on user preference.
- **Misfiled file (originally 20101111)**: Content was actually a 2020 Vindicator endorsement recap (the agent flagged the URL contained /editorials/2020/11/). Renamed clipping to 137250_20201101.pdf. The agent extracted 0 records from this file due to extraction difficulty; only 1 prop captured.
- **Cross-clipping pattern**: ~20% of records come from election-day summary editorials that repeat endorsements made in individual race editorials. Fuzzy dedup merged 77 such pairs.
- **OH House district renumbering**: Districts renumbered after 2010 redistricting (e.g., Ryan moved from OH-17 to OH-13). 2002-2010 records use pre-redistricting numbers; 2012+ records use post-redistricting. State House districts likewise shifted (e.g., 60→63 for some Youngstown-area seats).

## Endorsement patterns observed
- Strong Democratic lean for federal/local in Mahoning Valley (Ryan, Strickland, Wilson, Cordray, etc.)
- Selective statewide Republican endorsements when Vindicator believed GOP candidate was the stronger candidate:
  - 2002: Taft (R-Gov); Petro (R-AG); Montgomery (R-Auditor); Deters (R-Treasurer)
  - 2006: Strickland (D-Gov), DeWine (R-Senate, lost to Brown), Mary Taylor (R-Auditor)
  - 2014: Kasich (R-Gov); DeWine (R-AG); Yost (R-Auditor); Husted (R-SOS); French + Kennedy (R-Sup Ct)
  - 2018: Cordray (D-Gov), Brown (D-Senate); Yost (R-AG)
- 2018 Issue 1 (drug sentencing): NO recommendation
- 2004 Issue 1 (same-sex marriage ban): NO recommendation
