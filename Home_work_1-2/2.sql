select developers.firstName, developers.lastName, sum(developers.salary), projectName from projects
  inner join developers on projects.developer_id = developers.developer_id

