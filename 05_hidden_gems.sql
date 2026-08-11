-- 05_hidden_gems.sql
-- Reliable "Hidden Gem" courses — filtering out tiny-sample noise

USE udemy_funnel_analysis;

-- Hidden Gems with a minimum subscriber threshold so the completion rate is trustworthy
SELECT title, category, num_subscribers, enroll_to_complete_rate
FROM courses
WHERE course_segment = 'Hidden Gem'
  AND num_subscribers >= 100
ORDER BY enroll_to_complete_rate DESC
LIMIT 10;

-- which categories have the most reliable Hidden Gems
SELECT category, COUNT(*) AS gem_count
FROM courses
WHERE course_segment = 'Hidden Gem'
  AND num_subscribers >= 100
GROUP BY category
ORDER BY gem_count DESC
LIMIT 5;

-- Hidden Gems vs Star Performers: how does average rating compare
-- (do Hidden Gems have quality on par with Star Performers, just less reach?)
SELECT
    course_segment,
    ROUND(AVG(rating), 2) AS avg_rating,
    ROUND(AVG(num_subscribers), 0) AS avg_subscribers
FROM courses
WHERE course_segment IN ('Hidden Gem', 'Star Performer')
  AND num_subscribers >= 100
GROUP BY course_segment;
