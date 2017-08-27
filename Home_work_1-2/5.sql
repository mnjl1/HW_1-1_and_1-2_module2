SELECT c.customerName, min(Profit) FROM (SELECT customerName, projectName, cost, salary, sum(cost-developers.salary) AS Profit
                                         FROM customers INNER JOIN projects ON customers.customer_id = projects.customer_id
                                           INNER JOIN developers ON projects.developer_id = developers.developer_id
                                         GROUP BY projectName) as c
