insert into players (name,email,password) values ("pawel","pawel@gmail.com","123");
insert into players (name,email,password) values ("kacper","kacper@gmail.com","1234");
insert into players (name,email,password) values ("kamil","kamil@gmail.com","kamil123");
insert into resources (name) values ("drewno","glina","zelazo");
insert into buildings (name) values ("dol z gliny","huta zelaza","huta drwala");
insert into troops (name) values ("lucznik","rycerz","miecznik");

SELECT * FROM players WHERE username="pawel" AND password="123";
