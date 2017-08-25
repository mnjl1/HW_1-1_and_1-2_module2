SELECT customerName, min(projects.cost-developers.salary) from projects
  INNER JOIN customers
  INNER JOIN developers
