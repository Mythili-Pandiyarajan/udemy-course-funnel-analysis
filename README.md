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

Tracks the full learner journey from visit to completion. Overall conversion from visit to completion sits at **~3.4%**. The steepest single drop-off is between **Visits and Sign-ups** — only 16.9% of visitors sign up (an 83% loss), making this the single biggest leak in the funnel. Free courses convert signups into enrollments more effectively than paid courses, and completion rate declines sharply for courses rated under 3.0.

### Page 2 — Category & Segment Deep-Dive
<img width="1202" height="675" alt="Category Deep-Dive" src="https://github.com/user-attachments/assets/e17fde01-991d-4b77-92ba-e27191452834" />

Compares categories on both enrollment volume and completion quality. Key findings:
- **Best performing:** IT & Software and Business — high enrollment paired with high completion (~0.33–0.34)
- **Opportunity zone:** Development — by far the highest-enrollment category, but its completion rate (~0.32) trails smaller categories, representing the largest absolute number of learners lost
- **Niche/underexplored:** Office Productivity, Personal Development, and Teaching & Academics — lower enrollment, but the highest completion rates (~0.34) in the dataset

### Page 3 — Course Explorer
<img width="1200" height="677" alt="Course Explorer" src="https://github.com/user-attachments/assets/2078f126-ff23-4209-844d-606951d7bfcc" />

Searchable, sortable table of all 98K courses (title, category, level, pricing, rating, reviews, subscribers, completion rate) for drilling into individual courses.

## Key Findings
1. The funnel's biggest leak is at the very top — 83% of visitors never sign up, far outweighing drop-off at any later stage (signup→enrollment loses 37%, enrollment→completion loses 68%, but starts from a much smaller base).
2. Development is Udemy's highest-volume category by a wide margin, but its completion rate is below smaller, more focused categories like Office Productivity and Personal Development — suggesting quality/engagement issues at scale rather than a demand problem.
3. Free courses convert signups to enrollments better than paid courses, suggesting price may be a friction point between initial interest and committing to a course.

## Recommendations
1. Prioritize visit-to-signup conversion (e.g. clearer value proposition on course landing pages, lower-friction signup flow) since this is where the largest share of learners is lost — improvements here would have outsized impact versus optimizing later funnel stages.
2. Investigate what high-completion niche categories (Office Productivity, Personal Development, Teaching & Academics) do differently in course structure or pacing, and test applying similar patterns to Development courses, where completion lags despite the highest enrollment.

## Data Validation Notes
Two data-quality issues were caught and fixed during this project:
- **NULL-handling bug in the MySQL load:** empty rate values were loading as `0` instead of `NULL`, skewing category-level averages. Fixed via a targeted `UPDATE` to null out invalid rows before analysis.
- **Rate aggregation bug in Power BI:** funnel conversion rates and course ratings had initially been summed rather than averaged across rows, producing misleading totals (e.g. one course rating appearing as 9.03). Root cause: some course titles are shared by multiple distinct listings (different instructors publishing under the same or similar course name), so any visual grouping by title alone silently summed their values together. Fixed by using dedicated `AVERAGE`/`DIVIDE`-based DAX measures instead of raw summed columns, and including course `id` in the Course Explorer table so title collisions display as separate rows rather than merging.

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
