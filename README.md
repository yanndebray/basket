
# Basket 🏀

Use MATLAB with Python to play with NBA data

https://github.com/user-attachments/assets/a6ad44f3-d82a-4777-b401-bb4ef405e393

<a name="beginToc"></a>

## Table of Contents
&emsp;&emsp;[Players](#players)
 
&emsp;&emsp;[Teams](#teams)
 
&emsp;&emsp;[Games](#games)
 
<a name="endToc"></a>

**Resources**

-  [https://github.com/swar/nba\_api](https://github.com/swar/nba_api)  

## Players
```matlab
player_id = 1628369; % jayson tatum
image_url = "https://ak-static.cms.nba.com/wp-content/uploads/headshots/nba/latest/260x190/"+player_id+".png";
[im, cmap] = imread(image_url);
imshow(im,cmap)
```

![figure_0.png](README_media/figure_0.png)

```matlab
career = py.nba_api.stats.endpoints.playercareerstats.PlayerCareerStats(player_id=string(player_id));
c = career.get_data_frames();
table(c{1})
```
| |PLAYER_ID|SEASON_ID|LEAGUE_ID|TEAM_ID|TEAM_ABBREVIATION|PLAYER_AGE|GP|GS|MIN|FGM|FGA|FG_PCT|FG3M|FG3A|FG3_PCT|FTM|FTA|FT_PCT|OREB|DREB|REB|AST|STL|BLK|TOV|PF|PTS|
|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|
|1|1628369|"2017-18"|"00"|1610612738|"BOS"|20|80|80|2443|397|835|0.4750|105|242|0.4340|213|258|0.8260|50|352|402|128|83|58|114|170|1112|
|2|1628369|"2018-19"|"00"|1610612738|"BOS"|21|79|79|2455|466|1036|0.4500|116|311|0.3730|195|228|0.8550|70|407|477|168|84|57|122|168|1243|
|3|1628369|"2019-20"|"00"|1610612738|"BOS"|22|66|66|2265|552|1226|0.4500|189|469|0.4030|254|313|0.8120|64|396|460|200|93|57|155|136|1547|
|4|1628369|"2020-21"|"00"|1610612738|"BOS"|23|64|64|2290|605|1318|0.4590|187|485|0.3860|295|340|0.8680|50|422|472|276|75|31|171|122|1692|
|5|1628369|"2021-22"|"00"|1610612738|"BOS"|24|76|76|2731|708|1564|0.4530|230|651|0.3530|400|469|0.8530|85|524|609|334|75|49|217|174|2046|
|6|1628369|"2022-23"|"00"|1610612738|"BOS"|25|74|74|2732|727|1559|0.4660|240|686|0.3500|531|622|0.8540|78|571|649|342|78|51|213|160|2225|
|7|1628369|"2023-24"|"00"|1610612738|"BOS"|26|74|74|2645|672|1426|0.4710|229|609|0.3760|414|497|0.8330|67|534|601|364|75|43|188|145|1987|
|8|1628369|"2024-25"|"00"|1610612738|"BOS"|27|72|72|2624|662|1465|0.4520|250|728|0.3430|358|440|0.8140|48|575|623|431|76|38|209|157|1932|

## Teams
```matlab
% get_teams returns a list of 30 dictionaries, each an NBA team.
nba_teams = py.nba_api.stats.static.teams.get_teams()
```

```matlabTextOutput
nba_teams = 
  Python list with values:

    [{'id': 1610612737, 'full_name': 'Atlanta Hawks', 'abbreviation': 'ATL', 'nickname': 'Hawks', 'city': 'Atlanta', 'state': 'Georgia', 'year_founded': 1949}, {'id': 1610612738, 'full_name': 'Boston Celtics', 'abbreviation': 'BOS', 'nickname': 'Celtics', 'city': 'Boston', 'state': 'Massachusetts', 'year_founded': 1946}, {'id': 1610612739, 'full_name': 'Cleveland Cavaliers', 'abbreviation': 'CLE', 'nickname': 'Cavaliers', 'city': 'Cleveland', 'state': 'Ohio', 'year_founded': 1970}, {'id': 1610612740, 'full_name': 'New Orleans Pelicans', 'abbreviation': 'NOP', 'nickname': 'Pelicans', 'city': 'New Orleans', 'state': 'Louisiana', 'year_founded': 2002}, {'id': 1610612741, 'full_name': 'Chicago Bulls', 'abbreviation': 'CHI', 'nickname': 'Bulls', 'city': 'Chicago', 'state': 'Illinois', 'year_founded': 1966}, {'id': 1610612742, 'full_name': 'Dallas Mavericks', 'abbreviation': 'DAL', 'nickname': 'Mavericks', 'city': 'Dallas', 'state': 'Texas', 'year_founded': 1980}, {'id': 1610612743, 'full_name': 'Denver Nuggets', 'abbreviation': 'DEN', 'nickname': 'Nuggets', 'city': 'Denver', 'state': 'Colorado', 'year_founded': 1976}, {'id': 1610612744, 'full_name': 'Golden State Warriors', 'abbreviation': 'GSW', 'nickname': 'Warriors', 'city': 'Golden State', 'state': 'California', 'year_founded': 1946}, {'id': 1610612745, 'full_name': 'Houston Rockets', 'abbreviation': 'HOU', 'nickname': 'Rockets', 'city': 'Houston', 'state': 'Texas', 'year_founded': 1967}, {'id': 1610612746, 'full_name': 'Los Angeles Clippers', 'abbreviation': 'LAC', 'nickname': 'Clippers', 'city': 'Los Angeles', 'state': 'California', 'year_founded': 1970}, {'id': 1610612747, 'full_name': 'Los Angeles Lakers', 'abbreviation': 'LAL', 'nickname': 'Lakers', 'city': 'Los Angeles', 'state': 'California', 'year_founded': 1948}, {'id': 1610612748, 'full_name': 'Miami Heat', 'abbreviation': 'MIA', 'nickname': 'Heat', 'city': 'Miami', 'state': 'Florida', 'year_founded': 1988}, {'id': 1610612749, 'full_name': 'Milwaukee Bucks', 'abbreviation': 'MIL', 'nickname': 'Bucks', 'city': 'Milwaukee', 'state': 'Wisconsin', 'year_founded': 1968}, {'id': 1610612750, 'full_name': 'Minnesota Timberwolves', 'abbreviation': 'MIN', 'nickname': 'Timberwolves', 'city': 'Minnesota', 'state': 'Minnesota', 'year_founded': 1989}, {'id': 1610612751, 'full_name': 'Brooklyn Nets', 'abbreviation': 'BKN', 'nickname': 'Nets', 'city': 'Brooklyn', 'state': 'New York', 'year_founded': 1976}, {'id': 1610612752, 'full_name': 'New York Knicks', 'abbreviation': 'NYK', 'nickname': 'Knicks', 'city': 'New York', 'state': 'New York', 'year_founded': 1946}, {'id': 1610612753, 'full_name': 'Orlando Magic', 'abbreviation': 'ORL', 'nickname': 'Magic', 'city': 'Orlando', 'state': 'Florida', 'year_founded': 1989}, {'id': 1610612754, 'full_name': 'Indiana Pacers', 'abbreviation': 'IND', 'nickname': 'Pacers', 'city': 'Indiana', 'state': 'Indiana', 'year_founded': 1976}, {'id': 1610612755, 'full_name': 'Philadelphia 76ers', 'abbreviation': 'PHI', 'nickname': '76ers', 'city': 'Philadelphia', 'state': 'Pennsylvania', 'year_founded': 1949}, {'id': 1610612756, 'full_name': 'Phoenix Suns', 'abbreviation': 'PHX', 'nickname': 'Suns', 'city': 'Phoenix', 'state': 'Arizona', 'year_founded': 1968}, {'id': 1610612757, 'full_name': 'Portland Trail Blazers', 'abbreviation': 'POR', 'nickname': 'Trail Blazers', 'city': 'Portland', 'state': 'Oregon', 'year_founded': 1970}, {'id': 1610612758, 'full_name': 'Sacramento Kings', 'abbreviation': 'SAC', 'nickname': 'Kings', 'city': 'Sacramento', 'state': 'California', 'year_founded': 1948}, {'id': 1610612759, 'full_name': 'San Antonio Spurs', 'abbreviation': 'SAS', 'nickname': 'Spurs', 'city': 'San Antonio', 'state': 'Texas', 'year_founded': 1976}, {'id': 1610612760, 'full_name': 'Oklahoma City Thunder', 'abbreviation': 'OKC', 'nickname': 'Thunder', 'city': 'Oklahoma City', 'state': 'Oklahoma', 'year_founded': 1967}, {'id': 1610612761, 'full_name': 'Toronto Raptors', 'abbreviation': 'TOR', 'nickname': 'Raptors', 'city': 'Toronto', 'state': 'Ontario', 'year_founded': 1995}, {'id': 1610612762, 'full_name': 'Utah Jazz', 'abbreviation': 'UTA', 'nickname': 'Jazz', 'city': 'Utah', 'state': 'Utah', 'year_founded': 1974}, {'id': 1610612763, 'full_name': 'Memphis Grizzlies', 'abbreviation': 'MEM', 'nickname': 'Grizzlies', 'city': 'Memphis', 'state': 'Tennessee', 'year_founded': 1995}, {'id': 1610612764, 'full_name': 'Washington Wizards', 'abbreviation': 'WAS', 'nickname': 'Wizards', 'city': 'Washington', 'state': 'District of Columbia', 'year_founded': 1961}, {'id': 1610612765, 'full_name': 'Detroit Pistons', 'abbreviation': 'DET', 'nickname': 'Pistons', 'city': 'Detroit', 'state': 'Michigan', 'year_founded': 1948}, {'id': 1610612766, 'full_name': 'Charlotte Hornets', 'abbreviation': 'CHA', 'nickname': 'Hornets', 'city': 'Charlotte', 'state': 'North Carolina', 'year_founded': 1988}]

    Use string, double or cell function to convert to a MATLAB array.

```

```matlab
T = table(py.pandas.DataFrame(nba_teams))
```
| |id|full_name|abbreviation|nickname|city|state|year_founded|
|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|
|1|1610612737|"Atlanta Hawks"|"ATL"|"Hawks"|"Atlanta"|"Georgia"|1949|
|2|1610612738|"Boston Celtics"|"BOS"|"Celtics"|"Boston"|"Massachusetts"|1946|
|3|1610612739|"Cleveland Cavaliers"|"CLE"|"Cavaliers"|"Cleveland"|"Ohio"|1970|
|4|1610612740|"New Orleans Pelicans"|"NOP"|"Pelicans"|"New Orleans"|"Louisiana"|2002|
|5|1610612741|"Chicago Bulls"|"CHI"|"Bulls"|"Chicago"|"Illinois"|1966|
|6|1610612742|"Dallas Mavericks"|"DAL"|"Mavericks"|"Dallas"|"Texas"|1980|
|7|1610612743|"Denver Nuggets"|"DEN"|"Nuggets"|"Denver"|"Colorado"|1976|
|8|1610612744|"Golden State Warriors"|"GSW"|"Warriors"|"Golden State"|"California"|1946|
|9|1610612745|"Houston Rockets"|"HOU"|"Rockets"|"Houston"|"Texas"|1967|
|10|1610612746|"Los Angeles Clippers"|"LAC"|"Clippers"|"Los Angeles"|"California"|1970|
|11|1610612747|"Los Angeles Lakers"|"LAL"|"Lakers"|"Los Angeles"|"California"|1948|
|12|1610612748|"Miami Heat"|"MIA"|"Heat"|"Miami"|"Florida"|1988|
|13|1610612749|"Milwaukee Bucks"|"MIL"|"Bucks"|"Milwaukee"|"Wisconsin"|1968|
|14|1610612750|"Minnesota Timberwolves"|"MIN"|"Timberwolves"|"Minnesota"|"Minnesota"|1989|

```matlab
teams = T.abbreviation;
team = teams(2);
team_id = T{teams == team,"id"};
% team_id = 1610612738 % celtics https://www.nba.com/stats/team/1610612738
game_log = py.nba_api.stats.endpoints.teamgamelog.TeamGameLog(team_id=team_id, season='2024-25').get_data_frames();
table(game_log{1})
```
| |Team_ID|Game_ID|GAME_DATE|MATCHUP|WL|W|L|W_PCT|MIN|FGM|FGA|FG_PCT|FG3M|FG3A|FG3_PCT|FTM|FTA|FT_PCT|OREB|DREB|REB|AST|STL|BLK|TOV|PF|PTS|
|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|
|1|1610612738|"0022401187"|"APR 13, 2025"|"BOS vs. CHA"|"W"|61|21|0.7440|240|35|90|0.3890|14|45|0.3110|9|13|0.6920|15|34|49|22|12|6|13|14|93|
|2|1610612738|"0022401174"|"APR 11, 2025"|"BOS vs. CHA"|"W"|60|21|0.7410|240|49|95|0.5160|23|51|0.4510|9|12|0.7500|10|42|52|35|9|8|10|11|130|
|3|1610612738|"0022401156"|"APR 09, 2025"|"BOS @ ORL"|"L"|59|21|0.7380|240|32|82|0.3900|7|40|0.1750|5|6|0.8330|9|34|43|20|5|5|15|11|76|
|4|1610612738|"0022401151"|"APR 08, 2025"|"BOS @ NYK"|"W"|59|20|0.7470|265|40|87|0.4600|19|49|0.3880|20|25|0.8000|9|29|38|26|8|4|15|17|119|
|5|1610612738|"0022401137"|"APR 06, 2025"|"BOS vs. WAS"|"W"|58|20|0.7440|240|48|98|0.4900|24|52|0.4620|4|6|0.6670|25|37|62|33|6|5|13|9|124|
|6|1610612738|"0022401120"|"APR 04, 2025"|"BOS vs. PHX"|"W"|57|20|0.7400|240|45|87|0.5170|14|39|0.3590|19|22|0.8640|10|39|49|28|1|4|7|13|123|
|7|1610612738|"0022401106"|"APR 02, 2025"|"BOS vs. MIA"|"L"|56|20|0.7370|240|39|87|0.4480|12|43|0.2790|13|16|0.8130|19|24|43|24|3|6|13|17|103|
|8|1610612738|"0022401093"|"MAR 31, 2025"|"BOS @ MEM"|"W"|56|19|0.7470|240|39|96|0.4060|21|62|0.3390|18|19|0.9470|12|42|54|30|4|3|12|11|117|
|9|1610612738|"0022401080"|"MAR 29, 2025"|"BOS @ SAS"|"W"|55|19|0.7430|240|45|94|0.4790|17|51|0.3330|14|18|0.7780|15|39|54|32|2|4|9|18|121|
|10|1610612738|"0022401058"|"MAR 26, 2025"|"BOS @ PHX"|"W"|54|19|0.7400|240|45|89|0.5060|22|52|0.4230|20|22|0.9090|11|37|48|33|8|7|10|18|132|
|11|1610612738|"0022401044"|"MAR 24, 2025"|"BOS @ SAC"|"W"|53|19|0.7360|240|41|90|0.4560|19|50|0.3800|12|20|0.6000|10|35|45|28|9|4|10|14|113|
|12|1610612738|"0022401034"|"MAR 23, 2025"|"BOS @ POR"|"W"|52|19|0.7320|240|48|88|0.5450|23|50|0.4600|10|14|0.7140|11|27|38|31|6|6|9|14|129|
|13|1610612738|"0022401020"|"MAR 21, 2025"|"BOS @ UTA"|"W"|51|19|0.7290|240|45|97|0.4640|17|51|0.3330|14|16|0.8750|16|32|48|27|13|4|10|15|121|
|14|1610612738|"0022400994"|"MAR 18, 2025"|"BOS vs. BKN"|"W"|50|19|0.7250|240|35|79|0.4430|16|48|0.3330|18|22|0.8180|6|42|48|24|6|5|13|14|104|

## Games
```matlab
% Python code input
pycode = [...
"from nba_api.stats.endpoints import leaguegamefinder",...
"league_game_finder = leaguegamefinder.LeagueGameFinder(league_id_nullable='00', season_nullable='2024-25')",...
"games = league_game_finder.get_data_frames()[0]"...
];

try
    [games2] = pyrun(pycode, ...
         [ "games" ])
catch ME
    % Clear temporary variables from workspace and from Python
    clear pycode;
    rethrow(ME)
end
```

```matlabTextOutput
games2 = 
  Python DataFrame with properties:

          T: [1x1 py.pandas.core.frame.DataFrame]
         at: [1x1 py.pandas.core.indexing._AtIndexer]
      attrs: [1x1 py.dict]
       axes: [1x2 py.list]
    columns: [1x1 py.pandas.core.indexes.base.Index]
     dtypes: [1x1 py.pandas.core.series.Series]
      empty: 0
      flags: [1x1 py.pandas.core.flags.Flags]
        iat: [1x1 py.pandas.core.indexing._iAtIndexer]
       iloc: [1x1 py.pandas.core.indexing._iLocIndexer]
      index: [1x1 py.pandas.core.indexes.range.RangeIndex]
        loc: [1x1 py.pandas.core.indexing._LocIndexer]
       ndim: [1x1 py.int]
      shape: [1x2 py.tuple]
       size: [1x1 py.numpy.int32]
      style: [1x1 py.pandas.io.formats.style.Styler]
     values: [1x1 py.numpy.ndarray]

         SEASON_ID     TEAM_ID TEAM_ABBREVIATION  ... TOV  PF PLUS_MINUS
    0        42024  1610612760               OKC  ...  13  20       16.0
    1        42024  1610612754               IND  ...  15  25      -16.0
    2        42024  1610612760               OKC  ...   6  19       -1.0
    3        42024  1610612754               IND  ...  24  22        1.0
    4        42024  1610612754               IND  ...  12  23       17.0
    ...        ...         ...               ...  ...  ..  ..        ...
    2787     12024  1610612747               LAL  ...  20  20      -17.0
    2788     12024  1610612743               DEN  ...  23  24       -4.0
    2789     12024  1610612738               BOS  ...  17  24        4.0
    2790     12024  1610612750               MIN  ...  14  19       17.0
    2791     12024  1610612762               UTA  ...  21  19       29.0
    
    [2792 rows x 28 columns]

```

```matlab

% Clear temporary variables from workspace and from Python
clear pycode;
table(games2)
```
| |SEASON_ID|TEAM_ID|TEAM_ABBREVIATION|TEAM_NAME|GAME_ID|GAME_DATE|MATCHUP|WL|MIN|PTS|FGM|FGA|FG_PCT|FG3M|FG3A|FG3_PCT|FTM|FTA|FT_PCT|OREB|DREB|REB|AST|STL|BLK|TOV|PF|PLUS_MINUS|
|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|
|1|"42024"|1610612760|"OKC"|"Oklahoma City Thunder"|"0042400402"|"2025-06-08"|"OKC vs. IND"|"W"|240|123|40|82|0.4880|14|36|0.3890|29|33|0.8790|11|32|43|25|10|4|13|20|16|
|2|"42024"|1610612754|"IND"|"Indiana Pacers"|"0042400402"|"2025-06-08"|"IND @ OKC"|"L"|241|107|37|82|0.4510|14|40|0.3500|19|26|0.7310|7|28|35|27|9|6|15|25|-16|
|3|"42024"|1610612760|"OKC"|"Oklahoma City Thunder"|"0042400401"|"2025-06-05"|"OKC vs. IND"|"L"|239|110|39|98|0.3980|11|30|0.3670|21|24|0.8750|10|29|39|13|14|6|6|19|-1|
|4|"42024"|1610612754|"IND"|"Indiana Pacers"|"0042400401"|"2025-06-05"|"IND @ OKC"|"W"|240|111|39|82|0.4760|18|39|0.4620|15|21|0.7140|13|43|56|24|1|7|24|22|1|
|5|"42024"|1610612754|"IND"|"Indiana Pacers"|"0042400306"|"2025-05-31"|"IND vs. NYK"|"W"|241|125|46|85|0.5410|17|33|0.5150|16|19|0.8420|6|30|36|30|10|9|12|23|17|
|6|"42024"|1610612752|"NYK"|"New York Knicks"|"0042400306"|"2025-05-31"|"NYK @ IND"|"L"|240|108|41|86|0.4770|9|32|0.2810|17|26|0.6540|13|28|41|23|10|6|17|16|-17|
|7|"42024"|1610612752|"NYK"|"New York Knicks"|"0042400305"|"2025-05-29"|"NYK vs. IND"|"W"|241|111|44|89|0.4940|8|29|0.2760|15|22|0.6820|11|34|45|22|11|3|15|22|17|
|8|"42024"|1610612754|"IND"|"Indiana Pacers"|"0042400305"|"2025-05-29"|"IND @ NYK"|"L"|240|94|30|74|0.4050|10|30|0.3330|24|29|0.8280|8|32|40|20|10|7|20|22|-17|
|9|"42024"|1610612750|"MIN"|"Minnesota Timberwolves"|"0042400315"|"2025-05-28"|"MIN @ OKC"|"L"|241|94|35|85|0.4120|12|34|0.3530|12|15|0.8000|8|31|39|16|7|6|21|20|-30|
|10|"42024"|1610612760|"OKC"|"Oklahoma City Thunder"|"0042400315"|"2025-05-28"|"OKC vs. MIN"|"W"|238|124|46|88|0.5230|14|35|0.4000|18|21|0.8570|7|39|46|26|14|8|14|20|30|
|11|"42024"|1610612754|"IND"|"Indiana Pacers"|"0042400304"|"2025-05-27"|"IND vs. NYK"|"W"|240|130|45|88|0.5110|13|32|0.4060|27|32|0.8440|5|28|33|29|11|4|11|27|9|
|12|"42024"|1610612752|"NYK"|"New York Knicks"|"0042400304"|"2025-05-27"|"NYK @ IND"|"L"|240|121|38|82|0.4630|12|28|0.4290|33|39|0.8460|13|31|44|17|7|4|17|27|-9|
|13|"42024"|1610612760|"OKC"|"Oklahoma City Thunder"|"0042400314"|"2025-05-26"|"OKC @ MIN"|"W"|239|128|48|95|0.5050|16|37|0.4320|16|21|0.7620|19|17|36|22|14|5|14|22|2|
|14|"42024"|1610612750|"MIN"|"Minnesota Timberwolves"|"0042400314"|"2025-05-26"|"MIN vs. OKC"|"L"|239|126|43|84|0.5120|18|41|0.4390|22|28|0.7860|19|22|41|30|8|3|21|20|-2|

