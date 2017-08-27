SELECT projectName, avg(salary) FROM (SELECT lastName, salary, projectName, min(profit)  FROM (SELECT lastName, salary, projectName, cost, sum(cost-developers.salary) as profit FROM projects
  INNER JOIN developers ON projects.developer_id = developers.developer_id GROUP BY projectName) AS p) as av
