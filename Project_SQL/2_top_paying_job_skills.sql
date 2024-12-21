/*
Q: What skills are required for the top-paying data analyst jobs?
-
-
-

*/


WITH top_paying_jobs AS (

SELECT
    job_id,
    job_title,
    salary_year_avg,
    job_posted_date,
    name AS company_name
FROM 
    job_postings_fact f
LEFT JOIN company_dim c ON f.company_id = c.company_id
WHERE
    job_title_short = 'Data Analyst' AND
    job_location = 'Anywhere' AND
    salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 10
)
SELECT 
    t.*,
    skills
FROM top_paying_jobs t
INNER JOIN skills_job_dim s ON t.job_id = s.job_id
INNER JOIN skills_dim d ON s.skill_id = d.skill_id
ORDER BY
    salary_year_avg DESC