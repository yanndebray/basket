%% nba_elo_race_animation.m
% -------------------------------------------------------------
% Horizontal bar-race of NBA Elo ratings through a season
% (c) 2025  –  feel free to adapt / extend
% -------------------------------------------------------------

%% 1. Load the game log ---------------------------------------
games = readtable("games-2024-25.csv", TextType="string");

% make sure the date column is datetime, then chronological order
if ~isdatetime(games.GAME_DATE)
    games.GAME_DATE = datetime(games.GAME_DATE,"InputFormat","yyyy-MM-dd");
end
games = sortrows(games,"GAME_DATE");

%% 2. Elo constants ------------------------------------------
K          = 20;       % sensitivity
defaultElo = 1500;

%% 3. Colour dictionary  (team → 1×3 RGB) ---------------------
keys = [ ...
    "ATL";"BOS";"BKN";"CHA";"CHI";"CLE";"DAL";"DEN";"DET";"GSW"; ...
    "HOU";"IND";"LAC";"LAL";"MEM";"MIA";"MIL";"MIN";"NOP";"NYK"; ...
    "OKC";"ORL";"PHI";"PHX";"POR";"SAC";"SAS";"TOR";"UTA";"WAS"];

rgb = [ ...
    225  68  52 ;   0 122  51 ;   0   0   0 ;  29  17  96 ; 206  17  65 ; ...
    134   0  56 ;   0  83 188 ;  13  34  64 ; 200  16  46 ;  29  66 138 ; ...
    206  17  65 ;   0  45  98 ; 237  23  76 ;  85  37 130 ;  15  33  87 ; ...
    152   0  46 ;   0  71  27 ;  12  35  64 ;   0  43  92 ;   0 107 182 ; ...
      0 125 195 ;   0 125 197 ;   0 107 182 ;  29  17  96 ; 224  58  62 ; ...
     91  43 130 ; 196 206 211 ; 206  17  65 ;   0  43  92 ;   0  43  92 ];

% containers.Map with each value a numeric 1×3 double
teamRGB = containers.Map(keys, mat2cell(rgb/255, ones(numel(keys),1), 3));
defaultColour = [0.6 0.6 0.6];

%% 4. Initialise Elo store -----------------------------------
elo   = struct();
for t = keys.'          % every known team starts at 1500
    elo.(t) = defaultElo;
end

%% 5. Walk through games, collect daily snapshots ------------
snapshots   = struct('date',{}, 'ratings',{});

currentDate = games.GAME_DATE(1);
for i = 1:height(games)

    g      = games(i,:);
    tname  = g.TEAM{1};        % abbreviations already valid as field names
    oname  = g.OPPONENT{1};

    % unseen teams mid-season
    if ~isfield(elo,tname), elo.(tname) = defaultElo; end
    if ~isfield(elo,oname), elo.(oname) = defaultElo; end

    % pre-game ratings
    r_team = elo.(tname);
    r_opp  = elo.(oname);

    % win indicator
    win    = strcmp(g.WL,"W");
    exp_t  = 1/(1 + 10^((r_opp - r_team)/400));

    % updates
    elo.(tname) = elo.(tname) + K*( win        - exp_t);
    elo.(oname) = elo.(oname) + K*((1-win) - (1-exp_t));

    % if date just rolled over (or last row) take snapshot
    nextDate = g.GAME_DATE;
    dayDone  = (i == height(games)) || (games.GAME_DATE(i+1) ~= currentDate);
    if dayDone
        snapshots(end+1).date    = nextDate;           %#ok<SAGROW>
        snapshots(end  ).ratings = elo;
        currentDate = nextDate;
    end
end

if numel(snapshots) < 2
    error("Need at least two snapshots to animate – check input data.");
end

%% 6. Figure & video writer ----------------------------------
figW = 1350;  figH = 780;
fig  = figure('Units','pixels','Position',[100 100 figW figH], ...
              'Color','w','Resize','off');
ax   = axes('Parent',fig,'YDir','reverse');
axis(ax,'off');
ylim(ax,[0.5 10.5]);
try
    vid = VideoWriter("nba_elo_race.mp4","MPEG-4");
catch
    vid = VideoWriter("nba_elo_race.avi","Motion JPEG AVI");
end
vid.FrameRate = 10;    % lower = slower
open(vid);

%% 7. Draw frames  (start at snapshot #2 so bars move) -------
for s = 2:numel(snapshots)

    % ---- pull & sort ratings ------------------------------
    R  = snapshots(s).ratings;
    fn = fieldnames(R);
    v  = struct2array(R).';
    [vSorted, idx] = sort(v,"descend");

    topN   = min(10,numel(idx));
    keep   = idx(1:topN);
    valsT  = vSorted(1:topN);
    abbr   = string(fn(keep));

    % ---- colour each bar ----------------------------------
    faceC = zeros(topN,3);
    for k = 1:topN
        if isKey(teamRGB, abbr(k))
            faceC(k,:) = teamRGB(abbr(k));
        else
            faceC(k,:) = defaultColour;
        end
    end

    % ---- plot ---------------------------------------------
    cla(ax);
    b = barh(ax, valsT, 'EdgeColor','none', 'FaceColor','flat');
    b.CData = faceC;

    ylim(ax,[0.5, topN+0.5]);  set(ax,'YDir','reverse');
    xlim(ax,[min(valsT)-20, max(valsT)+90]);

    % label bars with team abbreviations
    for k = 1:topN
        text(ax, valsT(k)+5, k, abbr(k), ...
             'FontSize',10,'FontWeight','bold', ...
             'VerticalAlignment','middle');
    end

    title(ax, sprintf('NBA Elo race — %s', ...
          datestr(snapshots(s).date,'mmm dd, yyyy')), ...
          'FontWeight','bold');

    axis(ax,'off');  drawnow;
    writeVideo(vid, getframe(fig));
end

close(vid);
fprintf("🎬  Finished!  Video saved as nba_elo_race\n");