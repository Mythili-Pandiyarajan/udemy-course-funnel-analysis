# Udemy Course Funnel & Segmentation Analysis

End-to-end data analytics project simulating and analyzing a learner funnel across **98,104 Udemy courses**, using Python, MySQL, and Power BI. Built to identify where Udemy loses the most learners in the conversion journey, and which course categories perform best.

## Business Question
Which course categories and formats convert best from learner interest to completion, and where in the funnel does Udemy lose the most learners?

## Dataset
[Udemy Course Dataset: Categories, Ratings etc.](https://www.kaggle.com) (Kaggle, by emrebayirr) — 98,104 courses, 13 fields including category, pricing, ratings, subscribers, and reviews. The dataset has no native funnel/lead-stage data, so a funnel (page visits → sign-ups → enrollment → completion) was simulated on top of real fields to enable funnel-style analysis.

## Tech Stack
- **Python (Google Colab)** — data cleaning, funnel simulation
- **MySQL** — data loading and validation, 6 SQL analysis scripts
- **Power BI** — 3-page interactive dashboard

## Dashboard

### Page 1 — Funnel Overview
Funnel Overview <img width="1207" height="676" alt="screenshots_page1_funnel_overview" src="https://github.com/user-attachments/assets/6bab0356-209e-432a-bb03-52ce02d1535c" />

Tracks the full learner journey from visit to completion. Overall conversion from visit to completion sits at **~3.4%**, with the steepest drop-off between [Total Visits → Total Sign-ups / whichever stage had the biggest fall]. Paid vs. free courses show different conversion behavior at each funnel stage, and completion rate declines fairly sharply as course rating drops below 4.0.

### Page 2 — Category & Segment Deep-Dive
Category Deep-Dive <img width="1202" height="675" alt="screenshots_page2_category_deepdive" src="https://github.com/user-attachments/assets/e17fde01-991d-4b77-92ba-e27191452834" />



Compares categories on both enrollment volume and completion quality. Key findings:
- **Best performing:** [category/categories with high enrollment AND high completion]
- **Opportunity zone:** [category/categories with high enrollment but low completion — most learner drop-off relative to interest]
- **Niche/underexplored:** [category with low enrollment but high completion]

### Page 3 — Course Explorer
Course Explorer <img width="1200" height="677" alt="screenshots_page3_course_explorer" src="https://github.com/user-attachments/assets/2078f126-ff23-4209-844d-606951d7bfcc" />


Searchable, sortable table of all 98K courses (title, category, level, pricing, rating, reviews, subscribers, completion rate) for drilling into individual courses.

## Key Findings
1. [Finding 1 — e.g. overall funnel conversion rate and where the biggest drop-off is]
2. [Finding 2 — e.g. category that's high-demand but underperforming on completion]
3. [Finding 3 — e.g. paid vs free courses conversion difference]

## Recommendations
1. [Recommendation tied to finding 1]
2. [Recommendation tied to finding 2]

## Data Validation Notes
While building this project, a bug was found and fixed in the initial MySQL load: empty rate values were loading as `0` instead of `NULL`, which was skewing category-level averages. Fixed via a targeted `UPDATE` to null out invalid rows before analysis.

## Repository Structure
