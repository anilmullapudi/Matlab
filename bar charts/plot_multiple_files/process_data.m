close all;
clear all; 
clc;

all_files = dir('*.mat');
files_size = size(all_files,1);


global trails;
trails = 0;

global valid_state_data;
valid_state_data = zeros(1,4);
for j=1:30
    % Load data
    fileName = all_files(j).name;
    fprintf('%s\n',fileName);
    load(fileName);
    filewise_trails = 0;
    for i=1:N
       if(isequal(states{i}','ANDROID INPUT RECEIVED') == 1)
           filewise_trails = filewise_trails +1;
           if(filewise_trails < 4)
               plot_data(states, time, i+2, j);
           end
       end
    end
end

M = mean(valid_state_data);
h = figure('units','normalized','outerposition',[0 0 1 1]);
bar(M);
state_names={'NAVIGATION TO PICKING LOCATION', 'PICKING', 'NAVIGATION TO DROP LOCATION', 'PLACING'};
set(gca,'xticklabel',state_names);
mytitle = sprintf('Average Timings for states');
title(mytitle);
saveas(h,strcat('Average_state_timings', '.jpg'));


