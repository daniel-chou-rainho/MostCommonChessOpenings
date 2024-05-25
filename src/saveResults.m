function saveResults(summaryTable, filename)
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