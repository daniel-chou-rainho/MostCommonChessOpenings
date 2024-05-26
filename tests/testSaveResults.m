function tests = testSaveResults()
    tests = functiontests(localfunctions);
end

function testEmptyTable(testCase)
    % Test error handling when the input table is empty
    summaryTable = table();
    filename = 'dummy.csv';
    testCase.verifyError(@() saveResults(summaryTable, filename), 'MATLAB:saveResults:EmptyTable');
end

function testInvalidDirectory(testCase)
    % Test error handling when the directory does not exist
    summaryTable = table((1:5)', 'VariableNames', {'Data'});
    filename = 'nonexistent/dummy.csv';
    testCase.verifyError(@() saveResults(summaryTable, filename), 'MATLAB:saveResults:InvalidDirectory');
end

function testSuccessfulSave(testCase)
    % Test successful save operation
    summaryTable = table((1:5)', 'VariableNames', {'Data'});
    filename = [tempname, '.csv']; % Using tempname to ensure it's a valid and unique path
    saveResults(summaryTable, filename);
    testCase.verifyTrue(exist(filename, 'file') == 2);
    % Clean up
    delete(filename);
end
