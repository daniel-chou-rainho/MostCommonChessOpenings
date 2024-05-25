function plotOpenings(summaryTable, savePath)
    % Create the categorical array from the sorted table to enforce the order in the plot
    categories = categorical(summaryTable.opening_name(1:10), summaryTable.opening_name(1:10), 'Ordinal', true);

    % Create a new figure window
    fig = figure;
    
    % Plot the data
    bar(categories, summaryTable.GroupCount(1:10));
    title('Top 10 Most Common Chess Openings');
    xlabel('Opening Name');
    ylabel('Frequency');
    xtickangle(45); % Rotate labels for better visibility
    grid on; % Enable grid for easier reading
    
    % Save the figure
    saveas(fig, savePath);
end
