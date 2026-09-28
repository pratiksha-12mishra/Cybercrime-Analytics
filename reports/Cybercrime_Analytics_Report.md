### A Data Analytics Study of Cybercrime Across Indian Cities (2018–2019)
*Prepared using Python, SQL, Power BI and Tableau*

---

## 1. Problem Statement

Cybercrime in India has grown rapidly alongside increasing internet and smartphone adoption, but the scale, drivers, and geographic distribution of this growth are not always clear from raw government data. This project analyzes cybercrime case data across 34 major Indian metropolitan cities for 2018 and 2019 to answer a practical question: where is cybercrime concentrated, how fast is it growing, and what motives are driving that growth? The goal is to turn raw NCRB-based statistics into insights that could inform city-level policy, law enforcement resourcing, and public awareness campaigns.

## 2. Dataset

**Source:** "Cyber Crime in Indian Cities (2018–2019)", published on Kaggle and based on National Crime Records Bureau (NCRB) data.

- 34 metropolitan cities across India
- Two years of data: 2018 and 2019, provided as separate files and combined during cleaning
- 20 distinct cybercrime motive columns (e.g. Fraud, Personal Revenge, Sexual Exploitation, Political Motives, Terrorist Activities)
- A `Total` cases column and a `Crime Rate` column (cases normalized against population)

The dataset required no missing-value handling and contained zero duplicate rows once loaded — a rare and useful starting condition that let the project focus on structural cleaning (combining years, fixing a column-name typo, and reshaping motives for analysis) rather than heavy data repair.

## 3. Methodology

| Tool | Role |
|---|---|
| **Python** (pandas, matplotlib) | Data cleaning, exploratory analysis, descriptive statistics, IQR-based outlier detection |
| **SQL** (PostgreSQL) | GROUP BY, ORDER BY, HAVING, CASE classification, window functions (RANK) |
| **Power BI** | Five-page interactive dashboard with DAX measures and slicers |
| **Tableau** | Four-chapter Story for geographic and narrative exploration |

## 4. Exploratory Data Analysis & Findings

### 4.1 Overall Trend
Total reported cybercrime cases across the 34 cities rose from **2,146 in 2018 to 2,783 in 2019** — an increase of roughly **30%**. This indicates a sharp, broad-based escalation rather than a one-off spike in a single city.

### 4.2 City-wise Patterns
Varanasi and Allahabad consistently rank as the highest-volume cities across both years, while a long tail of smaller cities (Jabalpur, Gwalior, Kannur, Malappuram) report far fewer cases.

| City | 2018 Cases | 2019 Cases | Change | % Change |
|---|---:|---:|---:|---:|
| Varanasi | 287 | 448 | 161 | 56.10% |
| Allahabad | 241 | 354 | 113 | 46.89% |
| Dhanbad | 31 | 101 | 70 | 225.81% |
| Vishakhapatnam | 427 | 400 | -27 | -6.32% |

Dhanbad recorded the sharpest relative increase (+226%) despite a modest base, followed by Nasik (+93%) — both far exceeding the citywide average of 30%, pointing to localized spikes rather than a uniform national trend. Not every city followed the upward trend: Vishakhapatnam and Aurangabad both saw modest declines despite being among the highest-volume cities overall.

### 4.3 Motive Analysis
Fraud is overwhelmingly the dominant cybercrime motive, accounting for **3,081** of all reported cases across both years — far ahead of the next closest category, Causing Disrepute (363 cases), and Sexual Exploitation. This suggests financially-motivated crime is the primary driver of the overall increase, rather than politically or personally motivated offences.

| Motive | Total Cases |
|---|---:|
| Fraud | 3,081 |
| Causing Disrepute | 363 |
| Sexual Exploitation | ≈311 |
| Personal Revenge | 154 |
| Prank | 112 |

### 4.4 Statistical Summary & Outliers
Descriptive statistics on the `Total` cases column showed a mean well above the median, confirming that a small number of large metros pull the citywide average upward while most cities report comparatively low volumes. Using the IQR (interquartile range) method for outlier detection, the following city-year combinations were flagged as statistical outliers:

- Varanasi (2019): 448 cases
- Vishakhapatnam (2018): 427 cases
- Allahabad (2019): 354 cases

These cities sit well outside the normal range of case volumes and warrant closer investigation or targeted resourcing.

## 5. SQL Analysis

The cleaned dataset was loaded into PostgreSQL and queried using progressively advanced SQL:

- **GROUP BY / ORDER BY** — total cases per city, ranked highest to lowest
- **HAVING** — filtering to cities exceeding a meaningful case-volume threshold
- **CASE** — classifying every city-year record into High / Medium / Low crime levels based on data-driven thresholds
- **Window functions** (`RANK() OVER (PARTITION BY Year ...)`) — ranking cities separately within each year

Full query text with comments is included in `sql/cybercrime_queries.sql`.

## 6. Dashboard (Power BI)

A five-page interactive Power BI dashboard was built on the cleaned dataset:

- **Executive Overview** — KPI cards, year comparison chart, Top 10 cities, geographic map
- **City Intelligence** — Top 10 / Bottom 10 cities, full 2018 vs 2019 comparison table with Year and City slicers
- **Motive Analysis** — Top 10 motives, motive trend by year, City × Motive heatmap
- **Geographic Intelligence** — map sized by case volume, conditionally-formatted table
- **Trend & Insights** — Biggest Increase / Biggest Decrease tables, IQR outlier callouts, written interpretation

> The full interactive dashboard (all 5 pages above) is available in [`powerbi/Cybercrime_Dashboard.pbix`](../powerbi/Cybercrime_Dashboard.pbix) — open it in Power BI Desktop (free) to explore each page, apply the slicers, and hover over visuals for tooltips.

## 7. Visualization (Tableau)

A complementary four-chapter Tableau Story was built to explore the data through a narrative lens rather than duplicating the Power BI dashboard:

- **Geographic Concentration** — India map sized/colored by total cases
- **Yearly Trend** — 2018 vs 2019 comparison bar chart
- **Motive Breakdown** — motive columns pivoted into a Motive/Cases structure, confirming Fraud's dominance
- **Biggest Movers** — sorted year-over-year change by city

> The full interactive story (all 4 chapters above) is available in [`tableau/Cybercrime_Story.twb`](../tableau/Cybercrime_Story.twb) — open it in Tableau Public (free) to step through each story point.

## 8. Key Findings

- Cybercrime cases rose by approximately **30%** from 2018 to 2019 across the 34 cities studied.
- **Fraud** is by far the dominant motive, suggesting the increase is primarily financially driven.
- Growth is highly uneven: **Dhanbad (+226%)** and **Nasik (+93%)** saw dramatic spikes, while Vishakhapatnam and Aurangabad actually declined.
- **Varanasi, Allahabad, and Vishakhapatnam** are statistical outliers by raw case volume.
- High case volume does not always mean high crime rate — normalizing for population reshuffles which cities look most affected.

## 9. Recommendations

- Cities with high and rising Fraud case counts should prioritize digital banking literacy and fraud-awareness campaigns.
- Cities with disproportionate year-over-year spikes (e.g. Dhanbad, Nasik) warrant investigation into whether the increase reflects genuine crime growth or improved reporting/detection capacity.
- Resource allocation for cybercrime units should consider Crime Rate (population-adjusted) alongside raw case counts, since the two metrics highlight different cities as priorities.

## 10. Tools & Deliverables

| Component | Location |
|---|---|
| Raw & cleaned data | `data/raw/`, `data/cleaned/` |
| Python notebook (EDA, stats, outliers) | `python/` |
| SQL queries | `sql/cybercrime_queries.sql` |
| Power BI dashboard | `powerbi/Cybercrime_Dashboard.pbix` |
| Tableau story | `tableau/Cybercrime_Story.twb` |
| This report | `reports/Cybercrime_Analytics_Report.md` |
