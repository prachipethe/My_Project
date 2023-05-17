-- Name=Karan Rajesh Sawant
-- Project Name= Soccer Data Analysis.


# 1.Write a SQL query to count the number of venues for EURO cup 2016. Return number of venues. 
select count(venue_name) as count
from soccer_venue;


# 2.Write a SQL query to count the number of countries that participated in the 2016-EURO Cup.
select count(team_id) as count
from soccer_team;


# 3.Write a SQL query to find the number of goals scored within normal play during the EURO cup 2016.
select distinct count(team_id) as count
from goal_details;

# 4. From the following table, write a SQL query to find the number of matches that ended with a result.  
select count(results) 
from match_master
where results="win";


# 5. From the following table, write a SQL query to find the number of matches that ended in draws.  
select count(results) 
from match_master
where results="draw";


# 6. Write a SQL query to find out when the Football EURO cup 2016 will begin.  
select play_date 
from match_master 
where match_no=1;


# 7. Write a SQL query to find the number of self-goals scored during the 2016 European Championship.  
select count(goal_type) 
from goal_details
where goal_type="O";


# 8. Write a SQL query to count the number of matches ended with a results in-group stage.  
select count(win_lose) 
from match_details
where win_lose="w" and play_stage="G";


# 9. Write a SQL query to find the number of matches that resulted in a penalty shootout.  
select count(distinct match_no) as `Penalty count` 
from penalty_shootout;


# 10. Write a SQL query to find number of matches decided by penalties in the Round 16.  
select count(distinct play_stage) as count16
from match_master
where play_stage="R";


# 11. Write a SQL query to find the number of goals scored in every match within a normal play schedule. Sort the result-set on match number. 
select  match_no, count(goal_time) as` no of goal`
from goal_details
group by match_no;


# 12. Write a SQL query to find the matches in which no stoppage time was added during the first half of play. 
select match_no, play_date, goal_score
from match_master
where stop1_sec=0; 
 

# 13. Write a SQL query to count the number of matches that ended in a goalless draw at the group stage. 
select count(distinct match_no) as match_count
from match_details
where play_stage="G" and win_lose="D" and goal_score="0"; 


# 14. Write a SQL query to calculate the number of matches that ended in a single goal win, excluding matches decided by penalty shootouts. 
select count( distinct match_no) as match_count
from match_details
where win_lose="W" and decided_by <>"P" and goal_score=1  ;


# 15. Write a SQL query to count the number of players replaced in the tournament. 
select count(in_out) as `Player replaced`
from players_in_out
where in_out="I";
 
 
# 16. Write a SQL query to count the total number of players replaced during normal playtime. 
select count(play_schedule)
from players_in_out
where play_schedule="NT" and in_out="I";


# 17. Write a SQL query to count the number of players who were replaced during the stoppage time. 
select count(in_out) as `Player Replaced`
from players_in_out
where in_out="I" and play_schedule="ST";


# 18. Write a SQL query to count the number of players who were replaced during the first half. 
select count(in_out) as `Player Replaced`
from players_in_out
where in_out="I" and play_schedule<>"ST" and time_in_out<=45;


# 19. Write a SQL query to count the total number of goalless draws played in the entire tournament. 
select count(goal_score)/2 as `goalless draws`
from match_details
where win_lose="D" and goal_score=0;


# 20. Write a SQL query to calculate the total number of players who were replaced during the extra time.  
select count( play_schedule) as` re_player extra time`
from players_in_out
where in_out="I" and play_schedule="ET";


# 21. Write a SQL query to count the number of substitutes during various stages of the tournament. Sort the result-set in ascending order by play-half, play-schedule and number of substitute happened.   
select play_half,play_schedule,count(in_out) as `number of substitutes`
from players_in_out
group by  play_half,play_schedule,in_out
having in_out="I"
order by  play_half ;


# 22. Write a SQL query to count the number of shots taken in penalty shootouts matches. Number of shots as "Number of Penalty Kicks".  
select count(kick_id) as  `Number of Penalty Kicks`
from penalty_shootout;


# 23. Write a SQL query to count the number of shots that were scored in penalty shootouts matches. 
select count(score_goal) as `penalty scored`
from penalty_shootout
where score_goal="Y";


# 24. Write a SQL query to count the number of shots missed or saved in penalty shootout matches. 
select count(score_goal) as `Goal missed`
from penalty_shootout
where score_goal="N";


# 25. Write a SQL query to find the players with shot numbers they took in penalty shootout matches.
select * from soccer_country;
select * from penalty_shootout;
select * from player_master;

select p.match_no, s.country_name, m.player_name,m.jersey_no,p.score_goal,p.kick_no
from penalty_shootout as p join player_master as m
on p.player_id=m.player_id join soccer_country as s
on s.country_id=m.team_id
order by match_no;


# 26. Write a SQL query to count the number of penalty shots taken by each team. 
select * from soccer_country;
select * from penalty_shootout;

select s.country_name, count(score_goal)
from soccer_country as s join penalty_shootout as p
on s.country_id=p.team_id
group by s.country_name
;


# 27. Write a SQL query to count the number of bookings in each half 
-- of play within the normal play schedule. Return play_half, play_schedule, number of booking happened.  
select * from player_booked;

select play_half,play_schedule,count(booking_time) as `number of booking`
from player_booked
group by play_half,play_schedule
having play_schedule="NT";


# 28. Wite a SQL query to count the number of bookings during stoppage time.  
select count(booking_time) as booking
from player_booked
where play_schedule="ST";


# 29. Write a SQL query to count the number of bookings that happened in extra time.  
select count(booking_time) 
from player_booked
where play_schedule="ET";


# 30. Write a SQL query to find out where the final match of the EURO cup 2016 was played. 
select * from soccer_venue;
select * from soccer_city;
select * from match_master;

select s.venue_name,c.city,m.play_stage
from soccer_venue as s join soccer_city as c
on s.city_id=c.city_id join match_master as m
on m.venue_id=s.venue_id
where m.play_stage="F";

# 31. Write a SQL query to find the number of goals scored by each team in each match during normal play. 
select * from match_details;
select * from soccer_country;

select m.match_no,s.country_name,count(m.goal_score),m.decided_by
from match_details as m join soccer_country as s
on m.team_id=s.country_id
group by m.match_no,s.country_name,m.goal_score,m.decided_by
having m.decided_by="N";

# 32. Write a SQL query to count the number of goals scored by each player within a normal play schedule. Group the result set on player name and country name and sorts the result-set according to the highest to the lowest scorer. Return player name, number of goals and country name. Sample table: goal_details
select * from goal_details;
select * from player_master;
select * from soccer_country;

select p.player_name, count(g.goal_type),s.country_name
from goal_details as g join player_master as p
on g.player_id=p.player_id join soccer_country as s
on s.country_id=g.team_id
group by p.player_name,g.goal_type,s.country_name
having goal_type="N"
order by count(g.goal_type) desc;


# 33. Write a SQL query to find out who scored the most goals in the 2016 Euro Cup. 
select * from goal_details;
select * from player_master;
select * from soccer_country;

select p.player_name,s.country_name,count(g.goal_type) as `number of goal`
from goal_details as g join player_master as p
on g.player_id=p.player_id join soccer_country as s
on s.country_id=g.team_id
group by p.player_name,s.country_name
order by count(g.goal_type) desc limit 1;


# 34. Write a SQL query to find out who scored in the final of the 2016 Euro Cup. 
select * from goal_details;
select * from player_master;
select * from soccer_country;

select p.player_name,p.jersey_no,s.country_name
from player_master as p join soccer_country as s
on p.team_id=s.country_id join goal_details as g
on g.player_id=p.player_id
where g.play_stage="F";


# 35. Write a SQL query to find out which country hosted the 2016 Football EURO Cup. 
select * from soccer_country;
select * from soccer_city;
select * from soccer_venue;

select distinct country_name
from soccer_country as s join soccer_city as c
on s.country_id=c.country_id join soccer_venue as v
on c.city_id=v.city_id;


# 36. Write a SQL query to find out who scored the first goal of the 2016 European Championship. 
select * from soccer_country;
select * from player_master;
select * from goal_details;

select p.player_name,p.jersey_no,s.country_name,g.goal_time,g.play_stage,g.goal_schedule,g.goal_half
from soccer_country as s join goal_details as g
on s.country_id=g.team_id join player_master as p
on p.player_id=g.player_id
where g.match_no=1 
order by g.goal_time limit 1;


# 37. Write a SQL query to find the referee who managed the opening match. 
select * from soccer_country;
select * from match_master;
select * from referee_master;

select r.referee_name, s.country_name
from soccer_country as s join referee_master as r
on s.country_id=r.country_id join match_master as m
on m.referee_id=r.referee_id
where m.match_no=1;


# 38. Write a SQL query to find the referee who managed the final match. 
select r.referee_name, s.country_name
from soccer_country as s join referee_master as r
on s.country_id=r.country_id join match_master as m
on m.referee_id=r.referee_id
order by m.match_no desc limit 1;


# 39. Write a SQL query to find the referee who assisted the referee in the opening match.
select * from asst_referee_master;
select * from soccer_country;
select * from match_details;

select a.ass_ref_name,s.country_name
from asst_referee_master as a join soccer_country as s
on a.country_id=s.country_id join match_details as m
on m.ass_ref=a.ass_ref_id
where m.match_no=1;


# 40. Write a SQL query to find the referee who assisted the referee in the final match. Return associated referee name, country name. Sample table: asst_referee_master
select * from asst_referee_master;
select * from soccer_country;
select * from match_details;

select a.ass_ref_name,s.country_name
from asst_referee_master as a join soccer_country as s
on a.country_id=s.country_id join match_details as m
on m.ass_ref=a.ass_ref_id
where m.play_stage="F";


# 41. Write a SQL query to find the city where the opening match of EURO cup 2016 took place. 
select * from soccer_venue;
select * from soccer_city;
select * from match_master;

select s.venue_name,c.city
from soccer_venue as s join soccer_city as c
on s.city_id=c.city_id join match_master as m
on m.venue_id=s.venue_id
where m.match_no=1;


# 42. Write a SQL query to find out which stadium hosted the final match of the 2016 Euro Cup. 
select * from soccer_venue;
select * from soccer_city;
select * from match_master;

select s.venue_name,c.city,s.aud_capacity,m.audence
from soccer_venue as s join soccer_city as c
on s.city_id=c.city_id join match_master as m
on m.venue_id=s.venue_id
where play_stage="F";


# 43. Write a SQL query to count the number of matches played at each venue. Sort the result-set on venue name. 
select * from soccer_venue;
select * from soccer_city;
select * from match_master;

select s.venue_name,c.city,count(s.venue_id) as `number of matches`
from soccer_venue as s join soccer_city as c
on s.city_id=c.city_id join match_master as m
on m.venue_id=s.venue_id
group by s.venue_name,c.city
order by s.venue_name;


# 44. Write a SQL query to find the player who was the first player to be sent off at the tournament EURO cup 2016. 
select * from player_booked;
select * from player_master;
select * from soccer_country;

select p.match_no,s.country_name,m.player_name,p.sent_off,p.play_schedule,m.jersey_no
from player_booked as p join player_master as m
on p.player_id=m.player_id join soccer_country as s
on p.team_id=s.country_id
where p.sent_off="Y" and p.match_no=1;


# 45. Write a SQL query to find the teams that have scored one goal in the tournament.
select * from soccer_team;
select * from soccer_country;

select c.country_name, t.team_group,t.goal_for
from soccer_team as t join soccer_country as c
on t.team_id=c.country_id
where t.goal_for=1;


# 46. Write a SQL query to count the number of yellow cards each country has received. 
select * from soccer_country;
select * from player_booked;

select  s.country_name,p.sent_off,count(p.sent_off)
from soccer_country as s join player_booked as p 
on s.country_id=p.team_id
group by s.country_name,sent_off
having p.sent_off="Y";



# 47. Write a SQL query to count the number of goals that have been seen. 
select * from soccer_venue;
select * from goal_details;
select * from match_master;

select v.venue_name,count(g.goal_type) as `goal count`
from soccer_venue as v join match_master as m
on v.venue_id=m.venue_id join goal_details as g
on g.match_no=m.match_no
group by v.venue_name;


# 48. Write a SQL query to find the match where there was no stoppage time in the first half. 
select * from match_details;
select * from match_master;
select * from soccer_country;

select m.match_no, s.country_name
from soccer_country as s join match_details as d
on s.country_id=d.team_id join match_master as m
on m.match_no=d.match_no
where m.stop1_sec=0;


# 49. Write a SQL query to find the team(s) who conceded the most goals in EURO cup 2016.
select * from soccer_team;
select * from soccer_country;

select  c.country_name,t.team_group,t.match_played,t.won,t.lost,t.goal_for,t.goal_agnst
from soccer_team as t join soccer_country as c
on c.country_id=t.team_id
order by t.goal_agnst desc 
limit 1;


# 50. Write a SQL query to find those matches where the highest stoppage time was added in 2nd half of play. 
select * from match_details;
select * from match_master;
select * from soccer_country;

select m.match_no,s.country_name,m.stop2_sec
from match_details as d join match_master as m
on d.match_no=m.match_no join soccer_country as s
on s.country_id=d.team_id
order by m.stop2_sec desc
limit 2;


# 51. Write a SQL query to find the matches that ended in a goalless draw at the group stage.     
select * from match_details;
select * from soccer_country;

select m.match_no,s.country_name
from match_details as m join soccer_country as s
on m.team_id=s.country_id
where play_stage="G" and m.win_lose="D" and m.goal_score=0
order by m.match_no;


# 52. Write a SQL query to find those match(s) where the second highest amount of stoppage time was added in the second half of the match. 
select m.match_no,s.country_name,m.stop2_sec
from match_details as d join match_master as m
on d.match_no=m.match_no join soccer_country as s
on s.country_id=d.team_id 
where m.stop2_sec=(
select max(m.stop2_sec) 
from  match_details as d join match_master as m
on d.match_no=m.match_no join soccer_country as s
on s.country_id=d.team_id 
order by m.stop2_sec desc);


# 53. Write a SQL query to find the number of matches played by a player as a goalkeeper for his team. 
select * from player_master;
select * from match_details;
select * from soccer_country;

select  s.country_name,p.player_name,count(player_gk) 
from match_details as m join soccer_country as s
on m.team_id=s.country_id join player_master as p
on p.player_id=m.player_gk
group by s.country_name,p.player_name,p.posi_to_play
order by s.country_name,p.player_name,count(player_gk) desc;


# 54. Write a SQL query to find the venue where the most goals have been scored. 
select * from goal_details;
select * from soccer_country;
select * from match_master;
select * from soccer_venue;

select v.venue_name,count(venue_name)
from goal_details as g join soccer_country as c
on g.team_id=c.country_id join match_master as m
on m.match_no=g.match_no join soccer_venue as v
on v.venue_id=m.venue_id
group by venue_name
HAVING  count(venue_name)=(
select max(count(venue_id))
from goal_details as g join soccer_country as c
on g.team_id=c.country_id join match_master as m
on m.match_no=g.match_no join soccer_venue as v
on v.venue_id=m.venue_id
group by venue_name);		
																												

# 55. Write a SQL query to find the oldest player to have appeared in a EURO 2016 match.
select * from player_master;
select * from soccer_country;

select s.country_name,p.player_name,p.jersey_no,p.age
from player_master as p join soccer_country as s
on p.team_id=s.country_id
where p.age in (
select max(age)
from player_master);


# 56. Write a SQL query to find the two teams in this tournament that have scored three goals in a single game. 
select * from match_details;
select * from soccer_country;
select m.match_no,s.country_name
from match_details as m join soccer_country as s
on m.team_id=s.country_id
where m.goal_score=3 and m.win_lose="D";

 
# 57. Write a SQL query to find which teams finished at the bottom.
select * from soccer_team;
select * from soccer_country;

select c.country_name,s.team_group,s.match_played,s.goal_agnst,s.group_position
from soccer_team as s join soccer_country as c
on s.team_id=c.country_id
where group_position=4 and goal_agnst=4
order by team_group;


# 58. Write a SQL query to find those players, who were contracted to the Lyon club and participated in the final of the EURO cup 2016. 
select * from player_master;
select * from soccer_country;
select * from match_details;

select p.player_name,p.jersey_no,p.posi_to_play,p.age,s.country_name
from player_master as p join soccer_country as s  
on p.team_id=s.country_id join match_details as m
on m.team_id=p.team_id
where p.playing_club="Lyon" and m.play_stage="F";


# 59. Write a SQL query to find the final four teams in the tournament. 
select * from soccer_country;
select * from match_details;

select s.country_name
from soccer_country as s join match_details as m 
on s.country_id=m.team_id
where m.play_stage="S";


# 60. Write a SQL query to find the captains of the top four teams that competed in the semi-finals (matches 48 and 49) of the tournament.
select * from soccer_country;
select * from match_captain;
select * from player_master;

select s.country_name,p.player_name,p.jersey_no,p.posi_to_play
from soccer_country as s join match_captain as m
on s.country_id=m.team_id join player_master as p
on m.player_captain=p.player_id
where m.match_no in (48,49);


# 61. Write a SQL query to find the captains of all the matches in the tournament.
select * from soccer_country;
select * from match_captain;
select * from player_master;

select m.match_no,s.country_name,p.player_name,p.jersey_no,p.posi_to_play
from soccer_country as s join match_captain as m
on s.country_id=m.team_id join player_master as p
on p.player_id=m.player_captain;


# 62. Write a SQL query to find the captain and goalkeeper of all the matches. 
select * from soccer_country;
select * from match_captain;
select * from match_details;
select * from player_master;

SELECT a.match_no,c.player_name as "Captain", 
d.player_name as "Goal Keeper",e.country_name
FROM match_captain a JOIN match_details b
on a.team_id=b.team_id JOIN soccer_country e 
ON b.team_id=e.country_id JOIN player_mast c 
ON a.player_captain=c.player_id ;


# 63. Write a SQL query to find out the player who was selected for the ‘Man of the Match’ award in the finals of EURO cup 2016. 
select * from soccer_country;
select * from match_master;
select * from player_master;

select player_name,country_name
from soccer_country as s join player_master as p
on s.country_id=p.team_id join match_master as m
on m.plr_of_match=p.player_id
where m.play_stage="F";


# 64. Write a SQL query to find the substitute players who entered the field during the first half of play within the normal time frame for the game. 
select * from players_in_out;
select * from player_master;
select * from soccer_country;

select p.match_no,s.country_name,m.player_name,m.jersey_no,p.time_in_out
from players_in_out as p join player_master as m
on p.player_id=m.player_id join soccer_country as s
on s.country_id=p.team_id
where p.play_half=1 and p.play_schedule="NT" and p.in_out="I"
order by p.match_no;


# 65. Write a SQL query to prepare a list for the “player of the match” against each match.
select * from match_master;
select * from player_master;
select * from soccer_country;

select m.match_no,m.play_date,s.country_name,m.plr_of_match, p.jersey_no
from match_master as m join player_master as p
on m.plr_of_match=p.player_id join soccer_country as s
on s.country_id=p.team_id;


# 66. Write a SQL query to find the player who took the penalty shot number 26. 
select * from penalty_shootout;
select * from player_master;
select * from soccer_country;

select p.match_no,s.country_name,m.player_name
from penalty_shootout as p join player_master as m
on p.player_id = m.player_id join soccer_country as s
on s.country_id = p.team_id
where p.kick_id=26;


# 67. Write a SQL query to find the team against which the penalty shot number 26 was taken. 
select * from penalty_shootout;
select * from soccer_country;

select p.match_no,s.country_name
from penalty_shootout as p join soccer_country as s
on p.team_id = s.country_id
where kick_id=26;


# 68. Write a SQL query to find the captain who was also the goalkeeper.
select * from match_captain;
select * from soccer_country;
select * from player_master;

select m.match_no,s.country_name,p.player_name,p.jersey_no 
from match_captain as m join soccer_country as s 
on m.team_id=s.country_id join player_master as p 
on p.player_id=m.player_captain
where posi_to_play="GK"
order by match_no;


# 69. Write a SQL query to find the number of captains who was also the goalkeeper. 
select * from match_captain;
select * from soccer_country;
select * from player_master;

select count(distinct player_name)
from match_captain as m join player_master as p
on m.player_captain=p.player_id 
where posi_to_play="GK";


# 70. Write a SQL query to find out how many times a player had been booked in the tournament. Show the result according to the team and number of times booked in descending order.
select * from soccer_country;
select * from player_booked;
select * from player_master;

select * from soccer_country as s join player_booked as p 
on s.country_id=p.team_id join player_master as m
on  m.player_id=p.player_id;
      
      
# 71. Write a SQL query to find those players on each team who wore jersey number 10. 
select * from player_master;
select * from soccer_country;
select s.country_name,p.player_name,p.posi_to_play,p.age,p.playing_club
from player_master as p join soccer_country as s
on p.team_id=s.country_id
where p.jersey_no=10;


# 72. Write a SQL query to find the defenders who scored goals for their team. 
select * from goal_details;
select * from player_master;
select * from soccer_country;

select p.player_name,p.jersey_no,s.country_name,p.age,p.playing_club
from goal_details as g join player_master as p 
on g.player_id=p.player_id join soccer_country as s
on s.country_id=g.team_id
where p.posi_to_play="DF"
order by p.player_name;


# 73. Write a SQL query to find out which players scored against his own team by accident. 
select * from goal_details;
select * from player_master;
select * from soccer_country;

select p.player_name,p.jersey_no,s.country_name,p.age,p.posi_to_play,p.playing_club
from goal_details as g join player_master as p 
on g.player_id=p.player_id join soccer_country as s
on s.country_id=g.team_id
where g.goal_type="O"
order by p.jersey_no;


# 74. Write a SQL query to find the results of penalty shootout matches. 
select * from match_details;
select * from soccer_country;

select m.match_no,m.play_stage,s.country_name,m.penalty_score
from match_details as m join soccer_country as s
on m.team_id=s.country_id
where m.decided_by="P"
order by m.match_no;


# 75. Write a SQL query to find the goal scored by each player according to their position. 
select * from goal_details;
select * from player_master;
select * from soccer_country;

select s.country_name,p.posi_to_play,count(g.goal_time) 
from goal_details as g join player_master as p 
on g.player_id=p.player_id join soccer_country as s
on s.country_id=p.team_id
group by p.posi_to_play,s.country_name
order by p.posi_to_play;


# 76. Write a SQL query to find those players who came into the field at the end of play. 
select * from players_in_out;
select * from player_master;
select * from soccer_country;

select p.match_no,s.country_name,m.player_name,m.jersey_no,p.time_in_out
from players_in_out as p join player_master as m 
on p.player_id=m.player_id join soccer_country as s
on s.country_id=p.team_id
where p.in_out="I"
order by p.time_in_out desc
limit 2;


# 77. Write a SQL query to find out which teams played the first match of the 2016 Euro Cup. 
select * from match_details;
select * from soccer_country;

select md.match_no, sc.country_name 
from soccer_country sc join match_details md
on sc.country_id = md.team_id 
where match_no = 
(select match_no 
from match_details 
where match_no = 1 limit 1);


# 78. Write a SQL query to find the winner of EURO cup 2016. Return country name. 
create view winner as
select country_name 
from soccer_country 
where country_id =
(select team_id from match_details where play_stage = "F" and win_lose = "W");
select * from winner;


# 79. Write a SQL query to find the highest audience match.
select * from match_master;

select match_no,play_stage,goal_score,audence 
from match_master 
order by audence desc 
limit 1;


# 80. Write a SQL query to find the match number in which Germany played against Poland. Group the result set on match number.

select a.match_no 
from match_details as a join match_details as b
on a.match_no=b.match_no 
where a.team_id = (select country_id 
from soccer_country
where country_name="Poland") and
b.team_id=(select country_id 
from soccer_country
where country_name="Germany");



# 81. Write a SQL query to find the result of the match where Portugal played against Hungary. 
select b.match_no, b.play_stage, a.play_date, a.results, a.goal_score 
from match_master a join match_details b 
on a.match_no=b.match_no
where team_id=
(select country_id 
from soccer_country
 where country_name="portugal")
or team_id=
(select country_id 
from soccer_city 
where country_name="hungary");


# 82. Write a SQL query to find the players who scored the most goals in each match. Group the result set on match number, country name and player name. Sort the result-set in ascending order by match number. Return match number, country name, player name and number of matches. Sample table: goal_details
select * from  goal_details;
select * from soccer_country;
Select * from playing_master;

select g.match_no, s.country_name, p.player_name,g.team_id 
from goal_details as g join playing_master as p 
on g.team_id = p.team_id join soccer_country as s 
on g.team_id = s.country_id 
where g.match_no ;


