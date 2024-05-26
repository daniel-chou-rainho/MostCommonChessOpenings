function summaryTable = processData(data)
    % processData Function
    % Processes the input data table by grouping and sorting chess openings.
    % Checks for the required 'opening_name' column and handles missing values.
    % Inputs:
    %   data - Table containing chess game data.
    % Outputs:
    %   summaryTable - Table grouped by 'opening_name' and sorted by occurrence count.
    % Throws:
    %   error - If the 'opening_name' column is missing, contains missing values, or if an error occurs during grouping or sorting.

    % Check for the presence of the necessary column
    if ~ismember('opening_name', data.Properties.VariableNames)
        error('MATLAB:undefinedVarOrClass', 'Data must include an "opening_name" column');
    end

    % Handle missing values in the 'opening_name' column
    if any(ismissing(data.opening_name))
        error('MATLAB:validators:mustBeNonmissing', 'Missing values found in "opening_name" column');
    end

    % Group by 'opening_name' and count the occurrences
    try
        summaryTable = groupsummary(data, 'opening_name', 'IncludeMissingGroups', false);
    catch e
        error('processData:groupingError', 'Error during grouping: %s', e.message);
    end

    % Sort the table based on count in descending order
    try
        summaryTable = sortrows(summaryTable, 'GroupCount', 'descend');
    catch e
        error('processData:sortingError', 'Error during sorting: %s', e.message);
    end
end
