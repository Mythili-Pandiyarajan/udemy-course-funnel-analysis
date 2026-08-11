-- 00_setup_and_load_data.sql
-- One-time setup: create the database/table and load the cleaned CSV

CREATE DATABASE IF NOT EXISTS udemy_funnel_analysis;
USE udemy_funnel_analysis;

CREATE TABLE courses (
    id BIGINT PRIMARY KEY,
    title VARCHAR(500),
    is_paid BOOLEAN,
    category VARCHAR(100),
    num_subscribers INT,
    rating DECIMAL(4,3),
    num_reviews INT,
    instructional_level VARCHAR(50),
    enrolled INT,
    sign_ups INT,
    page_visits INT,
    completed INT,
    visit_to_signup_rate DECIMAL(10,6),
    signup_to_enroll_rate DECIMAL(10,6),
    enroll_to_complete_rate DECIMAL(10,6),
    overall_conversion_rate DECIMAL(10,6),
    course_segment VARCHAR(50)
);

-- load the cleaned CSV (funnel simulation + segmentation done in Python beforehand)
-- update the file path to wherever courses_final.csv is saved locally
SET GLOBAL local_infile = 1;

LOAD DATA LOCAL INFILE 'D:/Datasets/courses_final.csv'
INTO TABLE courses
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(id, title, is_paid, category, num_subscribers, rating, num_reviews, instructional_level,
 enrolled, sign_ups, page_visits, completed, visit_to_signup_rate, signup_to_enroll_rate,
 enroll_to_complete_rate, overall_conversion_rate, course_segment);

-- verify the load
SELECT COUNT(*) FROM courses;