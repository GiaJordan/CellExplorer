% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
% Tutorial for running CellExplorer on your own data from a basepath
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
clear
%  1. Define the basepath of the dataset to run. The dataset should at minimum consist of the raw data and spike sorted data.
basepath = 'C:\Users\Sam.Jordan\Desktop\Cell Explorer Test Data\8646\2007-9-16_Joinedpdone\CSC13'; % Z:\peterp03\IntanData\MS21\Peter_MS21_180627_143449_concat
%basepath = 'C:\Users\Sam.Jordan\Desktop\Cell Explorer Test Data\8646\2007-9-20_Joinedpdone\CSC13';
% basepath  = 'C:\Users\Sam.Jordan\Desktop\Cell Explorer Test Data\8646\2007-9-24_Joinedpdone\CSC13';
cd(basepath)
addpath(genpath('FD'))
TT_conversion
%% 2. Generate session metadata struct using the template function and display the meta data in a gui
session = sessionTemplate(pwd,'showGUI',true);

% You can inspect the session struct with the gui 
session = gui_session(session);
% And verify the required and optional fields
verifySessionStruct(session);

%% 3. Run the cell metrics pipeline 'ProcessCellMetrics' using the session struct as input

cell_metrics = ProcessCellMetrics('session', session);


%% 4. Visualize the cell metrics in CellExplorer
cell_metrics = CellExplorer('metrics',cell_metrics); 

% %% 5. Open several session from basepaths
% % basepaths = '/Volumes/buzsakilab/Buzsakilabspace/Datasets/GirardeauG/Rat08/Rat08-20130708','/Volumes/buzsakilab/Buzsakilabspace/Datasets/GirardeauG/Rat08/Rat08-20130709'}; % mac
% basepaths = {'Z:\Buzsakilabspace\Datasets\GirardeauG\Rat08\Rat08-20130708','Z:\Buzsakilabspace\Datasets\GirardeauG\Rat08\Rat08-20130709'}; % PC
% cell_metrics = loadCellMetricsBatch('basepaths',basepaths);
% cell_metrics = CellExplorer('metrics',cell_metrics);
% 
% %% 6. load a subset of units fullfilling multiple of criterium
% 
% % Get cells that are assigned as 'Interneuron'
% cell_metrics_idxs1 = loadCellMetrics('cell_metrics',cell_metrics,'putativeCellType',{'Interneuron'});
% 
% % Get cells that are have a tag 'InverseSpike' or 'Good' and are assigned as 'Interneuron'
% cell_metrics_idxs2 = loadCellMetrics('cell_metrics',cell_metrics,'tags',{'InverseSpike','Good'},'putativeCellType',{'Interneuron'});
% 
% %% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
% % Tutorial for running CellExplorer from the Buzsaki lab database
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
% 
% %  1. Define your credentials and local repositories by editing the two files:
% edit db_credentials.m
% edit db_local_repositories.m
% 
% %% 2. Define sessionName/basename of a dataset existing in the database. The dataset should at minimum consist of a sessionName.dat, a sessionName.xml and spike sorted data.
% sessionName = 'Rat08-20130708';
% 
% %% 3. Run the cell metrics pipeline using the session name as input
% cell_metrics = ProcessCellMetrics('sessionName', sessionName);
% 
% %% 4. Visualize the cell metrics in CellExplorer
% cell_metrics = CellExplorer('metrics',cell_metrics);
