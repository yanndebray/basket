import pandas as pd
from nba_api.stats.endpoints import LeagueGameLog

def fetch_games(season: str):
    # season like "2024-25"
    gl = LeagueGameLog(season=season, season_type_all_star='Regular Season')
    df = gl.get_data_frames()[0]
    # keep only needed columns
    return df[['GAME_ID','GAME_DATE','TEAM_ID','TEAM_NAME',
               'MATCHUP','WL','PTS','PLUS_MINUS']]

def consolidate_games(y):
    # for instance y = 2024 >> season '2024-25'
    # single season
    games = fetch_games(f"{y}-{str(y+1)[2:]}")
    # # combine seasons
    # seasons = [f"{y}-{str(y+1)[2:]}" for y in range(start, end)]
    # games = pd.concat([fetch_games(s) for s in seasons], ignore_index=True)
    # parse date and home/away
    games['GAME_DATE'] = pd.to_datetime(games['GAME_DATE'])
    # Drop duplicate games — keep only home team per GAME_ID
    games['HOME']  = games['MATCHUP'].str.contains(' vs\. ').astype(int)
    games = games[games['HOME'] == 1].copy()
    # Deduce TEAM and OPPONENT from MATCHUP
    games[['TEAM', 'OPPONENT']] = games['MATCHUP'].str.split(' vs. ', expand=True)
    # Drop TEAM_ID, TEAM_NAME and HOME
    games = games.drop(columns=['TEAM_ID', 'TEAM_NAME', 'HOME'])
    return games

if __name__ == "__main__":
    y = 2024 
    games = consolidate_games(y)
    games.to_csv(f'games-{y}-{str(y+1)[2:]}.csv')
    print(f"Consolidated season {y}-{str(y+1)[2:]}")