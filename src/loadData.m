function data = loadData(filename)
    % loadData Function
    % Loads data from a specified CSV file into a table.
    % Validates file existence, readability, and required column.
    % Inputs:
    %   filename - String specifying the path to the CSV file.
    % Outputs:
    %   data - Table containing the loaded data.
    % Throws:
    %   error - If the file does not exist, cannot be read, or is missing required columns.

    % Check if the file exists
    if ~isfile(filename)
        error('MATLAB:loadData:FileDoesNotExist', 'File does not exist: %s', filename);
    end

    % Attempt to read the table from the file
    try
        data = readtable(filename);
    catch e
        error('MATLAB:loadData:FailedToReadTable', 'Failed to read the table from file %s: %s', filename, e.message);
    end

    % Validate that expected columns exist
    requiredColumns = {'opening_name'};
    missingColumns = setdiff(requiredColumns, data.Properties.VariableNames);
    if ~isempty(missingColumns)
        error('MATLAB:loadData:MissingRequiredColumns', 'Missing required columns: %s', strjoin(missingColumns, ', '));
    end
end