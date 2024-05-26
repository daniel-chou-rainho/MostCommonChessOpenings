function plotOpenings(summaryTable, savePath, visible)
    % plotOpenings Function
    % Plots the top 10 most common chess openings from the provided summary table.
    % Optionally saves the plot to a specified file path.
    % Inputs:
    %   summaryTable - Table containing sorted counts of chess openings.
    %   savePath - (Optional) String specifying the path to save the figure.
    % Outputs:
    %   None, but displays a bar chart and optionally saves it as a figure.
    % Throws:
    %   error - If there is insufficient data to plot or if there is a failure during file saving.

    % Check for necessary data to plot
    if size(summaryTable, 1) < 10
        error('MATLAB:plotOpenings:InsufficientData', 'Not enough data to plot top 10 openings');
    end

    % Create the categorical array from the sorted table to enforce the order in the plot
    categories = categorical(summaryTable.opening_name(1:10), summaryTable.opening_name(1:10), 'Ordinal', true);

    % Create a new figure window with optional visibility
    if nargin < 3 || visible
        fig = figure;
    else
        fig = figure('Visible', 'off');
    end
    
    % Plot the data
    bar(categories, summaryTable.GroupCount(1:10));
    title('Top 10 Most Common Chess Openings');
    xlabel('Opening Name');
    ylabel('Frequency');
    xtickangle(45); % Rotate labels for better visibility
    grid on; % Enable grid for easier reading

    % Check if save path is provided and save the figure
    if nargin >= 2 && ~isempty(savePath)
        try
            saveas(fig, savePath);
        catch e
            error('MATLAB:plotOpenings:SaveFailed', 'Failed to save the figure: %s', e.message);
        end
    end
end
