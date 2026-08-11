# Udemy Course Funnel & Segmentation Analysis

End-to-end data analytics project simulating and analyzing a learner funnel across **98,104 Udemy courses**, using Python, MySQL, and Power BI. Built to identify where Udemy loses the most learners in the conversion journey, and which course categories perform best.

## Business Question
Which course categories and formats convert best from learner interest to completion, and where in the funnel does Udemy lose the most learners?

## Dataset
[Udemy Course Dataset: Categories, Ratings and Trends](https://www.kaggle.com/datasets/emrebayirr/udemy-course-dataset-categories-ratings-and-trends) (Kaggle, by emrebayirr) — 98,104 courses, 13 fields including category, pricing, ratings, subscribers, and reviews. The dataset has no native funnel/lead-stage data, so a funnel (page visits → sign-ups → enrollment → completion) was simulated on top of real fields to enable funnel-style analysis.

## Tech Stack
- **Python (Google Colab)** — data cleaning, funnel simulation
- **MySQL** — data loading and validation, 6 SQL analysis scripts
- **Power BI** — 3-page interactive dashboard

## Dashboard

### Page 1 — Funnel Overview
<img width="1207" height="676" alt="Funnel Overview" src="https://github.com/user-attachments/assets/6bab0356-209e-432a-bb03-52ce02d1535c" />

Tracks the full learner journey from visit to completion. Overall conversion from visit to completion sits at **~3.4%**, with the steepest drop-off between **[FILL: e.g. "Total Visits and Total Sign-ups"]**. Paid vs. free courses show different conversion behavior at each funnel stage, and completion rate declines fairly sharply as course rating drops below 4.0.

### Page 2 — Category & Segment Deep-Dive
<img width="1202" height="675" alt="Category Deep-Dive" src="https://github.com/user-attachments/assets/e17fde01-991d-4b77-92ba-e27191452834" />

Compares categories on both enrollment volume and completion quality. Key findings:
- **Best performing:** [FILL: category/categories with high enrollment AND high completion]
- **Opportunity zone:** [FILL: category/categories with high enrollment but low completion — most learner drop-off relative to interest]
- **Niche/underexplored:** [FILL: category with low enrollment but high completion]

### Page 3 — Course Explorer
<img width="1200" height="677" alt="Course Explorer" src="https://github.com/user-attachments/assets/2078f126-ff23-4209-844d-606951d7bfcc" />

Searchable, sortable table of all 98K courses (title, category, level, pricing, rating, reviews, subscribers, completion rate) for drilling into individual courses.

## Key Findings
1. [FILL: overall funnel conversion rate and where the biggest drop-off is]
2. [FILL: category that's high-demand but underperforming on completion]
3. [FILL: paid vs free courses conversion difference]

## Recommendations
1. [FILL: recommendation tied to finding 1]
2. [FILL: recommendation tied to finding 2]

## Data Validation Notes
While building this project, a bug was found and fixed in the initial MySQL load: empty rate values were loading as `0` instead of `NULL`, which was skewing category-level averages. Fixed via a targeted `UPDATE` to null out invalid rows before analysis. A separate issue was also caught and fixed in the Power BI layer: funnel conversion rates had originally been summed rather than averaged across courses, which produced misleading totals — this was corrected using weighted-average DAX measures (`DIVIDE(SUM(...), SUM(...))`).

## Repository Structure
- `udemy_courses_analysis_1.ipynb` — Data cleaning & funnel simulation (Python/Colab)
- `00_setup_and_load_data.sql` — Table creation & data load
- `01_data_exploration.sql`
- `02_funnel_analysis.sql`
- `03_dropoff_deep_dive.sql`
- `04_segmentation.sql`
- `05_hidden_gems.sql`
- `udemy.pbix` — Power BI dashboard file
- `udemy.pdf` — Static export of all 3 dashboard pages
- `LICENSE`

## License
MIT License — see [LICENSE](LICENSE) for details.

## Author
**Mythili Pandiyarajan** — [GitHub](https://github.com/Mythili-Pandiyarajan)
