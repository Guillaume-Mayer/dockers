create database minju;
create user 'minju'@'%' identified by 'minju123';
grant all privileges on minju.* to 'minju'@'%';
flush privileges;
