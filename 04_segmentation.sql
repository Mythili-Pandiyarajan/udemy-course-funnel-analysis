-- 04_segmentation.sql
-- Segment counts and characteristics (segments were computed in Python/pandas
-- and loaded in as the course_segment column)

USE udemy_funnel_analysis;

-- segment counts
SELECT course_segment, COUNT(*) AS course_count
FROM courses
GROUP BY course_segment
ORDER BY course_count DESC;

-- average metrics per segment
SELECT
    course_segment,
    ROUND(AVG(num_subscribers), 0) AS avg_subscribers,
    ROUND(AVG(rating), 2) AS avg_rating,
    ROUND(AVG(enroll_to_complete_rate), 4) AS avg_completion_rate
FROM courses
GROUP BY course_segment;

-- top category per segment
SELECT course_segment, category, category_count
FROM (
    SELECT
        course_segment,
        category,
        COUNT(*) AS category_count,
        ROW_NUMBER() OVER (PARTITION BY course_segment ORDER BY COUNT(*) DESC) AS rn
    FROM courses
    GROUP BY course_segment, category
) ranked
WHERE rn <= 3
ORDER BY course_segment, category_count DESC;

-- paid vs free split within each segment
SELECT course_segment, is_paid, COUNT(*) AS course_count
FROM courses
GROUP BY course_segment, is_paid
ORDER BY course_segment, is_paid;
