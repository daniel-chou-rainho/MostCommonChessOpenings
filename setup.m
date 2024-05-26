% Setup script for adding necessary directories to MATLAB path

% Get the path of the current directory containing this script
myFolder = fileparts(mfilename('fullpath'));

% Add 'src' and 'tests' directories to the path
addpath(fullfile(myFolder, 'src'));
addpath(fullfile(myFolder, 'tests'));

% Display a success message
disp('Setup completed successfully. The necessary directories have been added to the MATLAB path.');
