
function func_trim_foldernames(folder_to_sort, do_git_mv, dry_run)
%% Overview
% This script serves the purpose of removing the date/timestamp prefixes
% from folder names. For example, it would rename:
% d180321_t155456__kr_DeltaFig1a31_hcurrent6
% d180321_t155823__kr_DeltaFig1c21_hcurrent6
%
% to
%
% DeltaFig1a31_hcurrent6
% DeltaFig1c21_hcurrent6
%
% This is useful because, then, when viewing the folder, it will allow
% experiments to be sorted by figure number rather than chronologically

%% Setup input args

% Chosen parent folder to operate on
if nargin < 1
    folder_to_sort = 'd180207_t032136__hcurrent6';
end


if nargin < 2
    do_git_mv = true;   % true: does 'git mv'
end                     % false: does 'mv'

if nargin < 3
    dry_run = false;
end

%% Get list of subfolder names

if do_git_mv; cmd_prefix = 'git mv';
else cmd_prefix = 'mv';
end

D = dir(fullfile(folder_to_sort,'d*'));         % Folders with date prefix shoudl begin with d. This also exlcludes . and ..
names = {D.name};

%% For each subfolder, do the rename

for i = 1:length(names)
    cf = fullfile(folder_to_sort,names{i});     %curent folder
    
    % Check to make sure that this is actually a folder containing plots
    % and not some other subfolder.
    D2 = dir(fullfile(cf,'*.png'));
    if isempty(D2)  % If D2 is empty, this means that it doesn't contain any images,
                    % but rather might be another parent folder. Hence, recursively
                    % perform sorting operation on this folder!
        
        func_trim_foldernames(cf)
    else    % Otherwise, continue to perform the rename.
        % First, find where the date information ends
        [a,b,c] = fileparts(cf);
        
        % Drop the date information
        b = b(strfind(b,'__kr')+2:end);
        
        % Rebuild new name for current folder
        cf_new = fullfile(a,[b c]);
        
        % Perform the git mv
        mycommand = [cmd_prefix ' ' cf ' ' cf_new];
        fprintf('Running command: %s \n',mycommand);
        if ~dry_run; system(mycommand);end
    end
end


%% Repeat for subfolders beginning with "study"
D = dir(fullfile(folder_to_sort,'study_*'));         % Folders with date prefix shoudl begin with d. This also exlcludes . and ..
names = {D.name};

%% For each subfolder, do the rename (note this is slightly different than the block above)

for i = 1:length(names)
    cf = fullfile(folder_to_sort,names{i});     %curent folder
    
    % Check to make sure that this is actually a folder containing plots
    % and not some other subfolder.
    D2 = dir(fullfile(cf,'*.png'));
    if isempty(D2)  % If D2 is empty, this means that it doesn't contain any images,
                    % but rather might be another parent folder. Hence, recursively
                    % perform sorting operation on this folder!
        
        func_trim_foldernames(cf)
    else    % Otherwise, continue to perform the rename.
        % First, find where the date information ends
        [a,b,c] = fileparts(cf);
        
        % Drop the date information
        b = b(23:end);
        b = ['study_' b];
        
        % Rebuild new name for current folder
        cf_new = fullfile(a,[b c]);
        
        % Perform the git mv
        mycommand = [cmd_prefix ' ' cf ' ' cf_new];
        fprintf('Running command: %s \n',mycommand);
        if ~dry_run; system(mycommand);end
    end
end


end

