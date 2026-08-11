-- 03_dropoff_deep_dive.sql
-- Where is the biggest drop-off, and which courses drive it

USE udemy_funnel_analysis;

-- biggest High-Interest Drop-off courses by subscriber count
SELECT title, category, is_paid, num_subscribers, enroll_to_complete_rate
FROM courses
WHERE course_segment = 'High-Interest Drop-off'
ORDER BY num_subscribers DESC
LIMIT 10;

-- categories most represented in the drop-off segment
SELECT
    category,
    COUNT(*) AS dropoff_course_count,
    ROUND(COUNT(*) * 100.0 / (
        SELECT COUNT(*) FROM courses WHERE course_segment = 'High-Interest Drop-off'
    ), 1) AS pct_of_dropoff_segment
FROM courses
WHERE course_segment = 'High-Interest Drop-off'
GROUP BY category
ORDER BY dropoff_course_count DESC
LIMIT 5;

-- rating vs completion: do higher-rated courses actually complete better?
SELECT
    CASE
        WHEN rating >= 4.5 THEN '4.5+'
        WHEN rating >= 4.0 THEN '4.0-4.49'
        WHEN rating >= 3.0 THEN '3.0-3.99'
        ELSE 'Under 3.0'
    END AS rating_band,
    COUNT(*) AS course_count,
    ROUND(AVG(enroll_to_complete_rate), 4) AS avg_completion_rate
FROM courses
GROUP BY rating_band
ORDER BY rating_band DESC;

-- sign-up to enroll drop-off specifically for paid courses (biggest friction point)
SELECT category, ROUND(AVG(signup_to_enroll_rate), 4) AS avg_signup_to_enroll
FROM courses
WHERE is_paid = TRUE
GROUP BY category
ORDER BY avg_signup_to_enroll ASC
LIMIT 5;
