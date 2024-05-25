function data = loadData(filename)
    % loadData Function
    % Loads data from a specified CSV file into a table.
    % Validates file existence, readability, and required columns.
    % Inputs:
    %   filename - String specifying the path to the CSV file.
    % Outputs:
    %   data - Table containing the loaded data.
    % Throws:
    %   error - If the file does not exist, cannot be read, or is missing required columns.

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