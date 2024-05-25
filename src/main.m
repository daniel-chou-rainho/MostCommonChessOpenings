% Load Data
filename = 'data/games.csv';
chessData = readtable(filename);

% Group by opening_name and count the occurrences
summaryTable = groupsummary(chessData, 'opening_name', 'IncludeMissingGroups', false);

% Sort the table based on count in descending order
sortedTable = sortrows(summaryTable, 'GroupCount', 'descend');

% Create the categorical array from the sorted table to enforce the order in the plot
categories = categorical(sortedTable.opening_name(1:10), sortedTable.opening_name(1:10), 'Ordinal', true);

% Display the most common openings in a bar chart
fig = figure; % Create a new figure window
bar(categories, sortedTable.GroupCount(1:10));
title('Top 10 Most Common Chess Openings');
xlabel('Opening Name');
ylabel('Frequency');
xtickangle(45); % Rotate labels for better visibility
grid on; % Enable grid for easier reading

% Save the figure
saveas(fig, 'results/MostCommonOpenings.png');

% Save the data to CSV
topOpeningsData = sortedTable(1:10, :);
writetable(topOpeningsData, 'results/MostCommonOpeningsData.csv');
