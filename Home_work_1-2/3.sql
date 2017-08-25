select sum(developers.salary) from developer_skills
  inner join developers on developer_skills.developer_id = developers.developer_id where skill = 'java'