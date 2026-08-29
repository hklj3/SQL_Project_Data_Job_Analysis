/* 
Question: What are the top skills based on salary?
- Look at the average salary associated with each skill for data analyst positions.
- Focuses on roles with specified salaries, regardless of location.
- Why? It reveals how different skills impact salary levels for data analyst and helps identify the most financially rewarding skills to acquire or improve.
*/

SELECT
    skills,
    ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    --AND job_work_from_home = TRUE
GROUP BY skills
ORDER BY avg_salary DESC
LIMIT 25

/*
The analysis of the top skills based on salary for data analyst positions reveals that certain skills are associated with significantly higher average salaries. The top 25 skills identified in this analysis include:
- Data Analytics is Merging with Data Engineering: Top salaries belong to professionals managing data pipelines and deployment environments using tools like Terraform ($146.7k), Kafka ($130.0k), and Airflow ($116.4k), reflecting a shift from static reporting to scalable data architecture.
- AI and LLM Frameworks Drive High Compensation: Advanced modeling capabilities utilizing Hugging Face ($124.0k), PyTorch ($125.2k), and TensorFlow ($120.6k) signal that companies pay more for predictive analytics and AI system deployment.
- Domain Specialization Beats Generalist Tools: Standard languages like Python or SQL appear less frequently in the top tiers because they are baseline requirements. Specialized tools like Solidity ($179.0k for blockchain smart contracts) and Golang ($155.0k for high-concurrency systems) command higher market premiums.
- Legacy and Maintenance Outliers: SVN ($400,000) stands out as a extreme outlier. In aggregated market salary data, ultra-high figures for legacy tools usually stem from low sample sizes or rare high-stakes enterprise migration contracts.

[
  {
    "skills": "svn",
    "avg_salary": "400000"
  },
  {
    "skills": "solidity",
    "avg_salary": "179000"
  },
  {
    "skills": "couchbase",
    "avg_salary": "160515"
  },
  {
    "skills": "datarobot",
    "avg_salary": "155486"
  },
  {
    "skills": "golang",
    "avg_salary": "155000"
  },
  {
    "skills": "mxnet",
    "avg_salary": "149000"
  },
  {
    "skills": "dplyr",
    "avg_salary": "147633"
  },
  {
    "skills": "vmware",
    "avg_salary": "147500"
  },
  {
    "skills": "terraform",
    "avg_salary": "146734"
  },
  {
    "skills": "twilio",
    "avg_salary": "138500"
  },
  {
    "skills": "gitlab",
    "avg_salary": "134126"
  },
  {
    "skills": "kafka",
    "avg_salary": "129999"
  },
  {
    "skills": "puppet",
    "avg_salary": "129820"
  },
  {
    "skills": "keras",
    "avg_salary": "127013"
  },
  {
    "skills": "pytorch",
    "avg_salary": "125226"
  },
  {
    "skills": "perl",
    "avg_salary": "124686"
  },
  {
    "skills": "ansible",
    "avg_salary": "124370"
  },
  {
    "skills": "hugging face",
    "avg_salary": "123950"
  },
  {
    "skills": "tensorflow",
    "avg_salary": "120647"
  },
  {
    "skills": "cassandra",
    "avg_salary": "118407"
  },
  {
    "skills": "notion",
    "avg_salary": "118092"
  },
  {
    "skills": "atlassian",
    "avg_salary": "117966"
  },
  {
    "skills": "bitbucket",
    "avg_salary": "116712"
  },
  {
    "skills": "airflow",
    "avg_salary": "116387"
  },
  {
    "skills": "scala",
    "avg_salary": "115480"
  }
]
*/