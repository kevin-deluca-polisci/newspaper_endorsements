# QA Report: Citizens' Voice (Wilkes-Barre, PA)

**Audit date:** 2026-05-20
**Folder:** done/Citizens Voice
**Newspaper ID:** 600005 (provisional — see note below)
**Data coverage:** 1984-2020, 19 clippings, 98 candidate records, 4 proposition records

## Overall Assessment

**PASS WITH NOTES**

NEW paper added to the dataset. Citizens' Voice is a Wilkes-Barre, PA daily founded in 1978 during the Wilkes-Barre Sunday Independent strike (initially as an employee-owned cooperative; later owned by Times-Shamrock).

**Important newspaper_id caveat:** The files were sourced from a folder labeled "Austin Citizen 600005" with filenames using the 600005 prefix. However, the actual PDF content is clearly Citizens' Voice (Wilkes-Barre, PA) — not Austin Citizen (TX). Per the Gentzkow-Shapiro lookup, ID 600005 is officially mapped to "Austin Citizen TX". The Citizens' Voice does not have an official GS permid (founded 1978, after the GS panel data). This ID assignment was inherited from the source filenames for continuity; downstream augmentation may need to either (a) reassign a unique ID or (b) leave this paper out of permid-merged datasets.

## Stage 1: Structural Validation
- CSV headers: OK
- Row integrity: 98 cands, 4 props
- Year sanity: all even/odd-year general elections, 1984-2020
- State fields: all PA/PA, all newspaper_id=600005
- Incumbency fields: clean

## Stage 2: Spot Check
Independent re-read of 1984 clipping verified Walter Mondale (D-President) endorsement; 2020 clipping verified Biden (D-President), Cartwright (D-PA-8). All sampled records matched extracted data.

## Stage 3: Variable Coding
- Office codes: all standard (PRESIDENT, VICE PRESIDENT, SENATOR, H, GOVERNOR, LT GOVERNOR, ATTORNEY GENERAL, TREASURER, AUDITOR, STATE SENATOR, STATE REP)
- Party labels: Democrat, Republican, empty for judicial — all valid
- All names in LASTNAME, FIRSTNAME ALL CAPS format
- 2 cross-record duplicates merged (98 from 100 raw)

## Stage 4: Low-Confidence Re-Scan
Mean confidence 0.92. A few records flagged at 0.45-0.75 (notably the 2020 PA-9 "Nelson" entry where small-print OCR was uncertain). User should verify if they want to validate against original page.

## Endorsement patterns observed
- 1984: Mondale over Reagan
- 1990: Casey (D-Gov)
- 1992: Clinton, Yeakel (D-Senate, lost), Kanjorski (D-H11)
- 1996: Clinton
- 1998: No endorsement for governor (critical of all candidates)
- 2000: Klink (D-Senate, lost to Santorum)
- 2002: Rendell (D-Gov)
- 2004: Kerry over Bush; Specter (R-Senate)
- 2006: Casey (D-Senate, beat Santorum); Kanjorski (D-H11)
- 2008: Obama; Kanjorski; Carney
- 2010: Luzerne County Home Rule Charter (YES)
- 2012: Obama
- 2014: Wolf (D-Gov); Cartwright (D-H17); Barletta (R-H11)
- 2016: Mixed slate; Clinton at low confidence due to sidebar text size
- 2018: PA House only — mixed party (Boback R, Mullery D, Kaufer R, Pashinski D)
- 2020: Biden; Cartwright (D-H8); Shapiro (D-AG)
