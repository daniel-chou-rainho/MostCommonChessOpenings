function summaryTable = processData(data)
    % Check for the presence of the necessary column
    if ~ismember('opening_name', data.Properties.VariableNames)
        error('Data must include an "opening_name" column');
    end

    % Handle missing values in the 'opening_name' column
    if any(ismissing(data.opening_name))
        error('Missing values found in "opening_name" column');
    end

    % Group by 'opening_name' and count the occurrences
    try
        summaryTable = groupsummary(data, 'opening_name', 'IncludeMissingGroups', false);
    catch e
        error('Error during grouping: %s', e.message);
    end

    % Sort the table based on count in descending order
    try
        summaryTable = sortrows(summaryTable, 'GroupCount', 'descend');
    catch e
        error('Error during sorting: %s', e.message);
    end
end
