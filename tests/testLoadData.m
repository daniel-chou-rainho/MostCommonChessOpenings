function tests = testLoadData()
    tests = functiontests(localfunctions);
end

function testNonExistentFile(testCase)
    filename = 'data/nonexistent.csv';
    verifyError(testCase, @() loadData(filename), 'MATLAB:loadData:FileDoesNotExist');
end

function testMissingColumns(testCase)
    filename = 'data/missingColumns.csv'; % Assume missing required columns
    verifyError(testCase, @() loadData(filename), 'MATLAB:loadData:MissingRequiredColumns');
end

function testValidData(testCase)
    filename = 'data/validData.csv'; % Assume this file is correctly formatted
    data = loadData(filename);
    hasColumn = ismember('opening_name', data.Properties.VariableNames);
    verifyEqual(testCase, hasColumn, true)
end
