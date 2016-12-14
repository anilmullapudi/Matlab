function plot_data(states, time, row, fileNumber)
       
      %check whether atleast 8 states available from the time of andoid
      %input
      if(size(states,1) >= row+7)
          
          global trails
          trails = trails+1;
          
          
          timings=zeros(1,4);
           state_names={'NAVIGATION TO PICKING LOCATION', 'PICKING', 'NAVIGATION TO DROP LOCATION', 'PLACING'};
           for k=1:4
               timediff = time(row+1)-time(row);
               fprintf('%s time taken %f\n',states{row}',timediff );
               timings(1,k)=timediff;
               
               global valid_state_data;
               valid_state_data(trails,k)=timediff;
               row = row + 2;
           end
           h = figure('units','normalized','outerposition',[0 0 1 1]);
           bar(timings);
           set(gca,'xticklabel',state_names);
           
           %mytitle = sprintf('File-%d : Trail-%d',fileNumber, trails);
           mytitle = sprintf('Trail-%d', trails);
           title(mytitle);
           
           saveas(h,strcat(mytitle, '.jpg'));
      end
end