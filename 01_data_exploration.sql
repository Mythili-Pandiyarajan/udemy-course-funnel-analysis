-- 01_data_exploration.sql
-- Basic checks on the loaded dataset

USE udemy_funnel_analysis;

-- row count sanity check
SELECT COUNT(*) AS total_courses FROM courses;

-- category breakdown
SELECT category, COUNT(*) AS course_count
FROM courses
GROUP BY category
ORDER BY course_count DESC;

-- paid vs free split
SELECT is_paid, COUNT(*) AS course_count,
       ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM courses), 1) AS pct
FROM courses
GROUP BY is_paid;

-- instructional level split
SELECT instructional_level, COUNT(*) AS course_count
FROM courses
GROUP BY instructional_level
ORDER BY course_count DESC;

-- top 10 courses by subscribers
SELECT title, category, num_subscribers, rating
FROM courses
ORDER BY num_subscribers DESC
LIMIT 10;

-- basic stats on subscribers and rating
SELECT
    ROUND(AVG(num_subscribers), 0) AS avg_subscribers,
    MIN(num_subscribers) AS min_subscribers,
    MAX(num_subscribers) AS max_subscribers,
    ROUND(AVG(rating), 2) AS avg_rating
FROM courses;
