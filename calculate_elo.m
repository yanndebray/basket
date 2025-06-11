function records = calculate_elo(games)
%%
% Initialize constants
K = 20;
HOME_EDGE = 100;

% Unique teams
teams = unique(games.TEAM);
elo = struct();

% Initialize Elo ratings
for i = 1:length(teams)
    team = teams{i};
    elo.(team) = 1500;
end

% Prepare records
records = [];

% Sort games by date
games = sortrows(games, 'GAME_DATE');

for i = 1:height(games)
    row = games(i, :);
    team = row.TEAM{1};
    opp  = row.OPPONENT{1};
    gid = row.GAME_ID;
    date = row.GAME_DATE;
    
    % Ensure both teams exist in struct
    if ~isfield(elo, team), elo.(team) = 1500; end
    if ~isfield(elo, opp), elo.(opp) = 1500; end

    % Elo before the game (add home edge)
    r_team = elo.(team) + HOME_EDGE;
    r_opp  = elo.(opp);
    
    % Win or lose (1 or 0)
    y = strcmp(row.WL, 'W');
    
    % Store record
    record = table(...
        date, gid, ...
        {team}, {opp}, ...
        elo.(team), elo.(opp), ...
        r_team - r_opp, y, ...
        'VariableNames', {'date','game_id', ...
                          'team', 'opponent', ...
                          'elo_pre', 'elo_opp_pre', ...
                           'elo_diff', 'win'});
    records = [records; record];

    % Update Elo ratings
    exp_t = 1 / (1 + 10^((r_opp - r_team)/400));
    exp_o = 1 / (1 + 10^((r_team - r_opp)/400));
    
    elo.(team) = elo.(team) + K * (y - exp_t);
    elo.(opp) = elo.(opp) + K * ((1 - y) - exp_o);
end
end