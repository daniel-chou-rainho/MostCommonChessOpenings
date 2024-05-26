function tests = testPlotOpenings()
    tests = functiontests(localfunctions);
end

function testEnoughData(testCase)
    % Create a dummy summaryTable with 11 entries
    summaryTable = table((1:11)', cellstr(num2str((1:11)')), 'VariableNames', {'GroupCount', 'opening_name'});
    
    % Should not error out
    testCase.verifyWarningFree(@() plotOpenings(summaryTable, '', false));
end

function testInsufficientData(testCase)
    % Create a dummy summaryTable with less than 10 entries
    summaryTable = table((1:8)', cellstr(num2str((1:8)')), 'VariableNames', {'GroupCount', 'opening_name'});
    
    % Expect an error because there is not enough data to plot
    testCase.verifyError(@() plotOpenings(summaryTable, '', false), 'MATLAB:plotOpenings:InsufficientData');
end

function testSaveFunctionality(testCase)
    % Create a dummy summaryTable with enough data
    summaryTable = table((1:11)', cellstr(num2str((1:11)')), 'VariableNames', {'GroupCount', 'opening_name'});
    
    % Path for saving, including file extension
    savePath = [tempname, '.png'];
    
    % Plot and save the figure
    testCase.verifyWarningFree(@() plotOpenings(summaryTable, savePath, false));
    
    % Verify file exists
    testCase.verifyTrue(exist(savePath, 'file') == 2);
end