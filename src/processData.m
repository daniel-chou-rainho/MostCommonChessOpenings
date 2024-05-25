function summaryTable = processData(data)
    summaryTable = groupsummary(data, 'opening_name', 'IncludeMissingGroups', false);
    summaryTable = sortrows(summaryTable, 'GroupCount', 'descend');
end
