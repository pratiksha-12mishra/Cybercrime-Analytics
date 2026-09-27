# Cybercrime Intelligence Analytics — Indian Cities

A data analytics project analyzing cybercrime patterns across 34 major Indian cities (2018–2019), built end-to-end with **Python, SQL, Power BI, and Tableau**.

## 📊 Project Overview

This project analyzes NCRB-based cybercrime data to answer:
- Which cities have the highest cybercrime levels?
- How did cybercrime change from 2018 to 2019?
- Which cybercrime motives are most common?
- Which cities saw the largest increases or decreases?
- Is cybercrime concentrated in a few cities, or broadly distributed?

**Key finding:** Cybercrime cases rose ~30% from 2018 to 2019 across the 34 cities studied, driven overwhelmingly by **Fraud** as a motive. Growth was highly uneven — Dhanbad saw a +226% increase while Vishakhapatnam actually declined.

Full write-up: [`reports/Cybercrime_Analytics_Report.md`](reports/Cybercrime_Analytics_Report.md)

## 🗂️ Dataset

Source: [Cyber Crime in Indian Cities (2018–2019)](https://www.kaggle.com/datasets/dhruvanurag20/cyber-crime-in-indian-cities-2018-2019) — Kaggle, based on National Crime Records Bureau (NCRB) data. Covers 34 metropolitan cities, 20 cybercrime motives, total case counts, and crime rates.

## 🛠️ Tools & What Each One Did

| Tool | Purpose |
|---|---|
| **Python** (pandas, matplotlib) | Data cleaning, exploratory analysis, descriptive statistics, IQR outlier detection |
| **SQL** (PostgreSQL) | GROUP BY / HAVING / CASE / window function queries |
| **Power BI** | 5-page interactive dashboard with DAX measures and slicers |
| **Tableau** | 4-chapter interactive Story for geographic & narrative exploration |

## 📁 Folder Structure

```
Cybercrime-Analytics/
├── data/
│   ├── raw/archive/            # Original Kaggle files (untouched)
│   └── cleaned/                # Cleaned CSV outputs from Python
├── python/                     # Jupyter notebook: cleaning, EDA, stats, outliers
├── sql/                        # SQL queries used for analysis
├── powerbi/                    # Cybercrime_Dashboard.pbix (5 pages)
├── tableau/                    # Cybercrime_Story.twb (4-chapter story)
├── reports/                    # Final written report
└── README.md
```

## 📈 Power BI Dashboard (`powerbi/Cybercrime_Dashboard.pbix`)

Open in [Power BI Desktop](https://www.microsoft.com/en-us/power-platform/products/power-bi/desktop) (free) to explore all 5 pages:
1. **Executive Overview** — KPIs, yearly trend, top cities, map
2. **City Intelligence** — top/bottom cities, year-over-year comparison table
3. **Motive Analysis** — motive breakdown and city × motive heatmap
4. **Geographic Intelligence** — map and conditionally-formatted table
5. **Trend & Insights** — biggest movers, statistical outliers, written findings

## 📖 Tableau Story (`tableau/Cybercrime_Story.twb`)

Open in [Tableau Public](https://public.tableau.com/) (free) to step through the 4-chapter story:
1. Geographic Concentration
2. Yearly Trend
3. Motive Breakdown
4. Biggest Movers

## 🔍 Key Findings

- Cybercrime cases rose **~30%** from 2018 to 2019 across all 34 cities.
- **Fraud** is by far the dominant motive (3,081 of all cases).
- **Dhanbad** (+226%) and **Nasik** (+93%) saw the sharpest increases; **Vishakhapatnam** and **Aurangabad** declined.
- **Varanasi, Allahabad, and Vishakhapatnam** are statistical outliers by case volume (IQR method).

Full findings and recommendations: see [`reports/Cybercrime_Analytics_Report.md`](reports/Cybercrime_Analytics_Report.md).

## ▶️ How to Reproduce

1. Clone this repo.
2. Open `python/` notebook in Jupyter to see the full cleaning and EDA process.
3. Load `data/cleaned/cybercrime_cleaned.csv` into PostgreSQL and run `sql/cybercrime_queries.sql`.
4. Open `powerbi/Cybercrime_Dashboard.pbix` in Power BI Desktop.
5. Open `tableau/Cybercrime_Story.twb` in Tableau Public.
