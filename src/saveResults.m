function saveResults(summaryTable, filename)
    % saveResults Function
    % Saves the provided summary table to a CSV file.
    % Inputs:
    %   summaryTable - Table to be saved.
    %   filename - String specifying the full path and file name for the CSV.
    % Outputs:
    %   None, but writes the table to the specified CSV file.
    % Throws:
    %   error - If the input table is empty, the directory does not exist, or there is a failure during file writing.

    if isempty(summaryTable)
        error('Input table is empty, cannot save results');
    end

    % Check if the path to the file is valid and if the directory exists
    [pathstr, ~, ~] = fileparts(filename);
    if ~isempty(pathstr) && ~exist(pathstr, 'dir')
        error('Directory does not exist: %s', pathstr);
    end

    % Try to write the table to a CSV file
    try
        writetable(summaryTable, filename);
    catch e
        error('Failed to write table to file %s: %s', filename, e.message);
    end
end