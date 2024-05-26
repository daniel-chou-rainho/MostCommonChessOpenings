function tests = testProcessData()
    tests = functiontests(localfunctions);
end

function testValidData(testCase)
    % Create a sample data table
    data = table({'Ruy Lopez'; 'Sicilian Defense'; 'Ruy Lopez'; 'Caro-Kann'}, 'VariableNames', {'opening_name'});
    % Call processData
    result = processData(data);
    % Verify the output is as expected
    verifySize(testCase, result, [3 2]);  % Example: Expect 3 unique openings
    verifyEqual(testCase, result.opening_name{1}, 'Ruy Lopez');  % Verify that 'Ruy Lopez' is the most frequent
    verifyEqual(testCase, result.GroupCount(1), 2);  % Verify count of the most frequent opening
end

function testMissingOpeningColumn(testCase)
    % Create a sample data table without the required column
    data = table({'1'; '2'; '3'}, 'VariableNames', {'id'});
    % Verify error thrown
    verifyError(testCase, @() processData(data), 'MATLAB:undefinedVarOrClass');
end

function testMissingValues(testCase)
    % Create a sample data table with missing values
    data = table({'Ruy Lopez'; 'Sicilian Defense'; ''; 'Caro-Kann'}, 'VariableNames', {'opening_name'});
    % Verify error thrown
    verifyError(testCase, @() processData(data), 'MATLAB:validators:mustBeNonmissing');
end