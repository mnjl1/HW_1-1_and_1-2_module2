alter table projects add cost int(10);
update projects set cost = 2500000 where projectName = 'Mars map app';
update projects set cost = 500000 where projectName = 'Alien DNA app';
update projects set cost = 1500000 where projectName = 'Jungle extrim app';