function data = loadData(filename)
    % Check if the file exists
    if ~isfile(filename)
        error('File does not exist: %s', filename);
    end

    % Attempt to read the table from the file
    try
        data = readtable(filename);
    catch e
        error('Failed to read the table from file %s: %s', filename, e.message);
    end

    % Validate that expected columns exist
    requiredColumns = {'opening_name'};
    missingColumns = setdiff(requiredColumns, data.Properties.VariableNames);
    if ~isempty(missingColumns)
        error('Missing required columns: %s', strjoin(missingColumns, ', '));
    end
end