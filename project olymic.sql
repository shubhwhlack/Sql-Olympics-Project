Create database project;
use project;

SHOW VARIABLES LIKE "secure_file_priv";

create table olympic
(ID int,
Name varchar(500),
Sex varchar(500),
Age varchar(500),
Height int,
Weight int,
Team varchar(500),
NOC varchar(500),
Games varchar(500),
Year int,
Season varchar(500),
City varchar(500),
Sport varchar(500),
Event varchar(500),
Medal varchar(500));

select * from olympic;

load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Athletes_Cleaned.csv' 
into table olympic
fields terminated by ','
enclosed by '"'
lines terminated by '\r\n'
ignore 1 rows;

select * from olympic;



-- SQL PROJECT

-- 1. Show how many medal counts present for entire data
select medal ,count(medal) as count_medal from olympic where medal<>"nomedal" group by medal;
select count(medal) from olympic where medal<>"nomedal";

-- 2. Show count of unique sports present in Olympics

select count(distinct(sport)) from olympic;
select sport,count(sport) as count_sport from olympic group by sport;


-- 3. Show how many different medals won by team India

select team ,medal ,count(medal) as total_medal from olympic where team="india" and medal<>"nomedal" group by team, medal ; 

-- 4. Show event wise medals won by India show from highest to lowest medals won in order


select event ,team , medal, count(medal) as total_medals from olympic where team="india" and medal<>"nomedal" group by medal, team, event order by total_medals desc;

-- 5. Show event wise medals won by India in order of year

select event,team,count(medal) as total_medals,year from olympic where team="india" and medal<>"nomedal" group by event ,team, year order by year; 

-- 6. show country who won maximum medals.

select team, count(medal) as total_medals from olympic where medal<>"nomedal" group by team order by total_medals desc limit 1;


-- 7.show top 10 countries whowon gold
select team, count(medal) as total_gold_medals from olympic where medal="gold" group by team order by total_gold_medals desc limit 10;


--  8. show in which year did United states won most gold medal

select team, year, count(medal) as total_gold_medals from olympic where medal="gold" and team="united states" group by team, year order by total_gold_medals desc;


-- 9. In which sports United States has most medals.

select team , sport ,count(medal) as total_medals from olympic where team="united states" and medal<>"nomedal"group by team, sport order by total_medals desc;

-- 10. Find top three players who won most medals along with their sports and country

select name , sport, team, count(medal) as total_medals from olympic where medal<>"nomedal" group by name , sport , team order by total_medals desc limit 3;

-- 11. Find player with most gold medals in cycling along with his country.

select name, team, count(medal) as total_medals from olympic where medal="gold" and sport="cycling" group by name ,team order by total_medals desc;

-- 12.Find player with most medals (Gold+Silver+Bronze) in Basketball also show his country.

select name, team, sport, count(medal) as total_medals from olympic where medal<>"nomedal" and sport="basketball" group by name , team, sport order by total_medals desc;

-- 13. Find out the count of different medals of the top basketball player Teresa Edwards

select name, count(medal), medal as total_medals from olympic where name="Teresa Edwards" group by medal;


-- 14. Find out medals won by male,female each year , Export this data and plot graph in excel

select name,sex, year from olympic where medal<>"nomedal" group by name, sex, year order by year;

