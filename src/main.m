% Load Data
chessData = loadData('../data/games.csv');

% Process Data
processedData = processData(chessData);

% Create the categorical array from the sorted table to enforce the order in the plot
categories = categorical(processedData.opening_name(1:10), processedData.opening_name(1:10), 'Ordinal', true);

% Display the most common openings in a bar chart
fig = figure; % Create a new figure window
bar(categories, processedData.GroupCount(1:10));
title('Top 10 Most Common Chess Openings');
xlabel('Opening Name');
ylabel('Frequency');
xtickangle(45); % Rotate labels for better visibility
grid on; % Enable grid for easier reading

% Save the figure
saveas(fig, '../results/MostCommonOpenings.png');

% Save the data to CSV
topOpeningsData = processedData(1:10, :);
writetable(topOpeningsData, '../results/MostCommonOpeningsData.csv');
