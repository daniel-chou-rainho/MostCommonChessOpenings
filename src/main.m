function main(dataFilePath, resultsFolderPath)
    % Load Data
    chessData = loadData(dataFilePath);

    % Process Data
    processedData = processData(chessData);

    % Define paths for saving results
    figurePath = fullfile(resultsFolderPath, 'MostCommonOpenings.png');
    csvPath = fullfile(resultsFolderPath, 'MostCommonOpeningsData.csv');

    % Plot and save the figure of the top 10 openings
    plotOpenings(processedData, figurePath);

    % Save the processed data to a CSV file
    saveResults(processedData(1:10, :), csvPath);
end
