%% nba_elo_BOS_NYK.m
% -------------------------------------------------------------
% One-frame horizontal comparizon of BOS vs NYK pre-game Elo
% (c) 2025 – adapt / extend as you wish
% -------------------------------------------------------------

%% 1. Load the BOS–NYK matchup --------------------------------
game = readtable("BOS_vs_NYK_pre.csv", TextType="string");
% game = readtable("BOS_vs_NYK_post.csv", TextType="string");

% Extract the two Elo ratings (row is NYK vs BOS)
elo = struct();
elo.NYK = game.elo_pre(1);        % NYK’s rating before the tip-off
elo.BOS = game.elo_opp_pre(1);    % BOS’s rating before the tip-off
% elo.NYK = game.elo_post(1);        % NYK’s rating after the tip-off
% elo.BOS = game.elo_opp_post(1);    % BOS’s rating after the tip-off

%% 2. Static colour map (reuse your RGB dictionary) -----------
keys = ["BOS";"NYK"];
rgb  = [  0 122  51 ;   0  43  92 ];     % BOS green  ·  NYK blue
teamRGB = containers.Map(keys, mat2cell(rgb/255, ones(numel(keys),1), 3));

%% 3. Prepare figure ------------------------------------------
figW = 900;  figH = 400;
fig  = figure('Units','pixels','Position',[100 100 figW figH], ...
              'Color','w','Resize','off');
ax   = axes('Parent',fig,'YDir','reverse');
axis(ax,'off');

%% 4. Assemble data for the bar plot --------------------------
abbr = fieldnames(elo);
vals = struct2array(elo).';

% sort high-to-low so best team appears at the top of the race
[valsSorted, idx] = sort(vals,"descend");
abbr = string(abbr(idx));

% bar colours
faceC = zeros(numel(abbr),3);
for k = 1:numel(abbr)
    faceC(k,:) = teamRGB(abbr(k));
end

%% 5. Draw the single frame -----------------------------------
cla(ax);
b = barh(ax, valsSorted, 'EdgeColor','none', 'FaceColor','flat');
b.CData = faceC;

ylim(ax,[0.5, numel(abbr)+0.5]);  set(ax,'YDir','reverse');
xlim(ax,[min(valsSorted)-20, max(valsSorted)+90]);

% add labels just to the right of each bar
for k = 1:numel(abbr)
    text(ax, valsSorted(k)+5, k, abbr(k), ...
         'FontSize',12,'FontWeight','bold', ...
         'VerticalAlignment','middle');
end

title(ax, sprintf('BOS vs NYK (%s)', ...
      datestr(game.date(1),'mmm dd, yyyy')), ...
      'FontWeight','bold');

axis(ax,'off');
drawnow;