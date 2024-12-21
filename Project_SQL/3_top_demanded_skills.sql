--Q: What are the most in-demand skills for data analysts?



SELECT
    skills,
    COUNT(s.job_id) AS demand_count
FROM job_postings_fact jpf
INNER JOIN skills_job_dim s ON jpf.job_id = s.job_id
INNER JOIN skills_dim d ON s.skill_id = d.skill_id
WHERE
    job_title_short = 'Data Analyst' AND
    job_work_from_home = TRUE
GROUP BY
    skills
ORDER BY
    demand_count DESC
LIMIT 5;