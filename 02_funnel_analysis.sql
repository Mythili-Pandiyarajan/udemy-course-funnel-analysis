-- 02_funnel_analysis.sql
-- Conversion rates at each funnel stage, sliced by category, is_paid, and level
UPDATE courses
SET visit_to_signup_rate = NULL,
    signup_to_enroll_rate = NULL,
    enroll_to_complete_rate = NULL,
    overall_conversion_rate = NULL
WHERE enrolled = 0;
USE udemy_funnel_analysis;

-- overall funnel totals
SELECT
    SUM(page_visits) AS total_visits,
    SUM(sign_ups) AS total_signups,
    SUM(enrolled) AS total_enrolled,
    SUM(completed) AS total_completed
FROM courses;

-- conversion rate by category
SELECT
    category,
    ROUND(AVG(visit_to_signup_rate), 4) AS avg_visit_to_signup,
    ROUND(AVG(signup_to_enroll_rate), 4) AS avg_signup_to_enroll,
    ROUND(AVG(enroll_to_complete_rate), 4) AS avg_enroll_to_complete
FROM courses
GROUP BY category
ORDER BY avg_enroll_to_complete DESC;

-- conversion rate: paid vs free
SELECT
    is_paid,
    ROUND(AVG(visit_to_signup_rate), 4) AS avg_visit_to_signup,
    ROUND(AVG(signup_to_enroll_rate), 4) AS avg_signup_to_enroll,
    ROUND(AVG(enroll_to_complete_rate), 4) AS avg_enroll_to_complete
FROM courses
GROUP BY is_paid;

-- conversion rate by instructional level
SELECT
    instructional_level,
    ROUND(AVG(visit_to_signup_rate), 4) AS avg_visit_to_signup,
    ROUND(AVG(signup_to_enroll_rate), 4) AS avg_signup_to_enroll,
    ROUND(AVG(enroll_to_complete_rate), 4) AS avg_enroll_to_complete
FROM courses
GROUP BY instructional_level
ORDER BY avg_enroll_to_complete DESC;

-- category x paid/free cross-tab on completion rate
SELECT
    category,
    is_paid,
    ROUND(AVG(enroll_to_complete_rate), 4) AS avg_completion_rate,
    COUNT(*) AS course_count
FROM courses
GROUP BY category, is_paid
ORDER BY category, is_paid;
