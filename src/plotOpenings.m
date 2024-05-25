function plotOpenings(summaryTable, savePath)
    % Check for necessary data to plot
    if size(summaryTable, 1) < 10
        error('Not enough data to plot top 10 openings');
    end

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

    % Check if save path is provided and save the figure
    if nargin == 2 && ~isempty(savePath)
        try
            saveas(fig, savePath);
        catch e
            error('Failed to save the figure: %s', e.message);
        end
    end
end
