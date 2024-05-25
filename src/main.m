% Load Data
chessData = loadData('../data/games.csv');

% Process Data
processedData = processData(chessData);

% Create the categorical array from the sorted table to enforce the order in the plot
categories = categorical(processedData.opening_name(1:10), processedData.opening_name(1:10), 'Ordinal', true);

% Define paths for saving results
resultsFolderPath = '../results';
figurePath = fullfile(resultsFolderPath, 'MostCommonOpenings.png');
csvPath = fullfile(resultsFolderPath, 'MostCommonOpeningsData.csv');

% Plot and save the figure of the top 10 openings
plotOpenings(processedData, figurePath);

% Save the data to CSV
topOpeningsData = processedData(1:10, :);
writetable(topOpeningsData, '../results/MostCommonOpeningsData.csv');
