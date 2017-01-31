create database feeds;
create database content;
create database security;

create user 'metasearch'@'%' identified by 'c00xiu48';

grant all privileges on feeds.* to 'metasearch'@'%';
grant all privileges on content.* to 'metasearch'@'%';
grant all privileges on security.* to 'metasearch'@'%';

flush privileges;