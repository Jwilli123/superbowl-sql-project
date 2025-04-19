# Super Bowl Analysis

This project contains SQL scripts to analyze historical Super Bowl data. The data covers Super Bowl games from 1967 up until 2020, and the project demonstrates various SQL techniques for querying and analyzing the data. The Super Bowl data was sourced from Kaggle.com

## Project Description
This project analyzes Super Bowl data to explore trends and statistics, such as team performance, MVP winners, and point differences between winning and losing teams. It includes SQL queries to retrieve and analyze data from a Super Bowl dataset.

## Tools Used
- **SQL (SQLite)**: SQLite was used to manage and query the Super Bowl data.

## SQL Queries for Data Analysis
This project contains SQL queries to:
- Show all Super Bowl data from 1967-2020
- Calculate the average points scored by teams with more than one win
- Identify the team with the most points in a Super Bowl game
- Identify the team with the least points in a Super Bowl game
- Find MVP winners who have won more than once
- Use a Common Table Expression (CTE) to compare individual game performances with average winning scores
- Show all Super Bowls where the winning team scored over 30 points and the losing team had less than 10 points
- Analyze Super Bowl appearances by each team
- Calculate the point difference between winning and losing teams for each game


## Project Structure

The repository includes two key SQL files:

1. **`superbowls.sql`**: This file contains the database schema (`CREATE TABLE` statements) and the necessary data (`INSERT` statements) to set up the Super Bowl database. You can use this file to create and populate the database.
   
2. **`Superbowl_Analysis.sql`**: This file contains a series of SQL queries used for analyzing the Super Bowl data. It includes queries for calculating average points, finding MVPs, comparing winning and losing teams, and more.

## Instructions

To run the project:

1. **Set up the Database**:
   - Open your SQL client (e.g., SQLite, DB Browser for SQLite).
   - Run the `superbowls.sql` file to create the database and insert the data.

2. **Run the Analysis Queries**:
   - After setting up the database, run the queries in the `Superbowl_Analysis.sql` file to explore the data. The queries include:
     - Calculating average points scored by teams who have won more than once.
     - Identifying teams with the most Super Bowl appearances.
     - Analyzing the most significant point differences in Super Bowl games.
     - And more...

## SQL Queries

Here are some of the analysis queries included in this project:

1. **All Super Bowl Data (1967-2020)**: 
   ```sql
   SELECT * FROM superbowls;

2. **Average Points for Teams Who Have Won More Than Once**: 
   ```sql
   SELECT Winner, AVG(Winner_Pts) AS Avg_Pts, COUNT(Winner) AS Times_Won
   FROM superbowls
   GROUP BY Winner
   HAVING Times_Won > 1
   ORDER BY Avg_Pts DESC;

3. **The Super Bowl with the Most Winning Points**:
   ```sql
   SELECT Date, Winner, (MAX(Winner_Pts)) AS Most_Won_Pts, Loser, Loser_Pts
   FROM superbowls;

4. **Teams Who Have Scored Over 30 Points with the Losing Team Under 10**:
 ```sql
   SELECT *
   FROM superbowls
   WHERE Winner_Pts > 30 AND Loser_Pts < 10;
```

## Future Improvements
- Extend the analysis to include additional statistics, such as the average number of touchdowns or turnovers. These stats could provide deeper insight into team performance and game dynamics over the years.
- Develop a Tableau dashboard to visualize trends, game outcomes, and team performance over time in a more interactive and user-friendly way.
- Incorporate filters in the Tableau dashboard to allow users to explore data by team, year, or MVPs, etc.
- Add more historical or play-by-play data to enhance the analysis with metrics like total yards, turnovers, or time of possession.

## License
This project is open-source and available under the [MIT License](https://opensource.org/licenses/MIT). This license permits reuse, modification, and distribution of the project, provided that proper attribution is given to the original author.
