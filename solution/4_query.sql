SELECT
  name, season,
  MIN(home_team_goal) AS min_home_goal,
  AVG(home_team_goal) AS avg_home_goal,
  (MAX(home_team_goal) - MIN(home_team_goal)) / 2 + MIN(home_team_goal) as mid_range,
  MAX(home_team_goal) AS max_home_goal,
  SUM(home_team_goal) AS sum_home_goal,
	FROM `sql-sandbox-20240505.final_exercise.match` AS match
	LEFT JOIN `sql-sandbox-20240505.final_exercise.leagues` as league
	ON match.league_id=league.id
  GROUP BY name, season
	ORDER BY sum_home_goal DESC

-- i choose to interpret mid-range as NOT median but mid-point between min and max.
-- ENGLAND PREMIER LEAGUE of 2009/2010 had the most home goals.
