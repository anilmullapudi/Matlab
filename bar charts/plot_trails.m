clear all;
close all;
clc;
state_names={'NAVIGATION TO PICKING LOCATION','UNTUCK BEFORE PICK', 'MOVING MARKER TOWARDS MARKER', 'TIME BETWEEN OPENING GRIPPER AND CLOSING GRIPPER', 'TUCK THE OBJECT', 'NAVIGATION TO DROP LOCATION', 'PLACING OBJECT'};
timings = zeros(6,7)
timings(1,1:7) = [9.5 2.5 2.92 18.77 23.96 14.8 16.43];
timings(2,1:7) = [11 2.5 2.92 15.7 21.68 22.77 16.03];
timings(3,1:7) = [16.7 2.5 2.92 12.61 17.81 17.8 16.03];
timings(4,1:7) = [14 2.5 2.92 10.81 16.01 16 16.04];
timings(5,1:7) = [15.2 2.5 3 10.5 15.86 15.7 16.03];
timings(6,1:7) = [12.8 2.5 2.92 11.06 14.85 23.2 16.04];


for i=1:6
    h = figure('units','normalized','outerposition',[0 0 1 1]);
    bar(timings(i,1:7));
    set(gca, 'XTickLabel', {'NAVIGATION TO PICKING LOCATION','UNTUCK BEFORE PICK', 'MOVING MARKER TOWARDS MARKER', 'TIME BETWEEN OPENING GRIPPER AND CLOSING GRIPPER', 'TUCK THE OBJECT', 'NAVIGATION TO DROP LOCATION', 'PLACING OBJECT'})
    ax = gca;
    ax.XTickLabelRotation = 50; 
    ylabel('Time in seconds');
    mytitle = sprintf('Trail-%d',i);
    title(mytitle);
    %saveas(h,strcat(mytitle, '.jpg'));
end

means = mean(timings);
std_error = std(timings);

h=figure
hold on
b = bar(1:7,means,'c')
%set(b,'color','c')
e = errorbar(1:7,means,std_error,'.')
set(gca, 'XTickLabel', {'NAVIGATION TO PICKING LOCATION','UNTUCK BEFORE PICK', 'MOVING MARKER TOWARDS MARKER', 'TIME BETWEEN OPENING GRIPPER AND CLOSING GRIPPER', 'TUCK THE OBJECT', 'NAVIGATION TO DROP LOCATION', 'PLACING OBJECT'})
set(e,'color', 'r')
ax = gca;
ax.XTickLabelRotation = 50; 
ylabel('Time in seconds');
mytitle = sprintf('Mean and Standartd deviation chart',i);
title(mytitle);
saveas(h,strcat(mytitle, '.jpg'));
