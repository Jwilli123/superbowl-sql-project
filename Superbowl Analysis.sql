/* 
  Superbowl Analysis SQL Script  
  ------------------------------------------
  This script explores Super Bowl data from 1967 to 2020 using SQL queries. 
  It includes analysis on winning scores, MVPs, point differences, and team appearances. 
  It also uses a CTE to evaluate whether a team's performance in a specific game 
  was above or below their average scoring performance. Great for data storytelling!
*/

/* Show all superbowl data from 1967 - 2020 */
SELECT * FROM superbowls;


/* For teams who have won more than once. How many points do they score on average? */

SELECT Winner, AVG(Winner_Pts) AS Avg_Pts, COUNT(Winner) AS Times_Won
FROM superbowls
GROUP BY Winner
HAVING Times_Won > 1
ORDER BY Avg_Pts DESC;


/* Shows the game date, winner, loser, and points for the team who won and has the most won points out of all the superbowls up until 2020 */
SELECT Date, Winner, (MAX(Winner_Pts)) AS Most_Won_Pts, Loser, Loser_Pts
FROM superbowls;


/* Shows the game, winner, loser, and points for the team who lost and had the least amount of points won points out of all the superbowls up until 2020 */
SELECT Date, Loser, MIN(Loser_Pts), Winner, Winner_Pts
FROM superbowls;


/* Who has gotten MVP more than once? */

SELECT MVP, COUNT(MVP) AS MVP_ct
FROM superbowls
GROUP BY MVP
HAVING MVP_ct > 1
ORDER BY MVP_ct DESC;

/* Uses a CTE to calculate each team's average Super Bowl winning score, this query compares individual game performances and categorizes them based on that average */

WITH team_avg AS (
    SELECT winner, AVG(Winner_Pts) AS avg_winner_pts
    FROM superbowls
    GROUP BY Winner
)
SELECT s.Date, SB, s.Winner, s.Winner_Pts, t.avg_winner_pts,
    CASE
        WHEN s.Winner_Pts > t.avg_winner_pts THEN "Above Average"
        WHEN s.Winner_Pts = t.avg_winner_pts THEN "Average"
        WHEN s.Winner_Pts < t.avg_winner_pts THEN "Below Average" 
    END AS Avg_target
FROM superbowls s
JOIN team_avg t ON s.Winner = t.Winner;


/* Shows all superbowls where the winning team scored over 30 points and the losing team had less than 10 points */

SELECT *
FROM superbowls
WHERE Winner_Pts > 30 AND Loser_Pts < 10;



/* How many times each team has appeared at the superbowl up until 2020 in Descending order */

SELECT team, COUNT(*) AS sb_appearances
FROM (
    SELECT winner AS team FROM superbowls
    UNION ALL
    SELECT loser AS team FROM superbowls
    )AS combined_teams
GROUP BY team
ORDER BY sb_appearances DESC;

/* Shows the difference in points between the winning and losing teams for each game */

SELECT Winner, Loser, (Winner_Pts-Loser_pts) AS Pt_Diff
FROM superbowls
ORDER BY Pt_Diff DESC;    