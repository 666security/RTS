insert into villagers (nick,email,password) values ("pawel","pawel@gmail.com","123");
insert into villagers (nick,email,password) values ("kacper","kacper@gmail.com","1234");
insert into villagers (nick,email,password) values ("kamil","kamil@gmail.com","kamil123");
insert into resources (name) values ("drewno","glina","zelazo");
insert into buildings (name) values ("dol z gliny","huta zelaza","huta drwala");
insert into troops (name) values ("lucznik","rycerz","miecznik");
insert into villages (name) values("wioska oskar");
insert into villages (name) values("wioska pawel");
insert into villages (name) values("wioska kacper");
SELECT * FROM villagers WHERE nick="pawel" AND password="123";
INSERT INTO villages_has_troops (villages_id,troops_id,value) VALUES (3,2,10);
SELECT villages_id,troops_id,value FROM villages_has_troops WHERE villages_id="3";
INSERT INTO villages_has_buildings (villages_id,buildings_id) VALUES (3,2);

SELECT nick,name,troops_id FROM `villagers`
JOIN villages ON villagers.id = villages.villagers_id
JOIN villages_has_troops ON villages.id = villages_has_troops.villages_id 
WHERE villagers.id=3;

SELECT nick,name,buildings_id FROM `villagers`
JOIN villages ON villagers.id = villages.villagers_id
JOIN villages_has_buildings ON villages.id = villages_has_buildings.villages_id 
WHERE villagers.id=3;



