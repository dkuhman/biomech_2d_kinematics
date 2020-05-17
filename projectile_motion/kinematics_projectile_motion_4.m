%2D KINEMATICS p.1
%Created by: Daniel Kuhman
%Github: https://github.com/dkuhman
%Last updated: 2020-05-17

%Clear workspace
clear all
clc

%Optimize launch angle for a given velocity - This should always be
%45-degrees.

distance_cleared = []; %This will collect the distance cleared on each loop iteration

%Run the loop from 1 to 90 degrees in steps of 1 degree
for i = 1:90
    launch_angle = i; %Update launch angle (degrees)

    %y = vertical (up is + and down is -)
    %x = horizontal
    position_y = 0; %Vertical position
    position_x = 0; %Horizontal position

    velocity_r = 7; %Resultant velocity
    velocity_y = 0; %Vertical velocity
    velocity_x = 0; %Horizontal velocity

    acceleration_y = -9.81;
    acceleration_x = 0;

    time = 0;
    sample_rate = 0.01;
    j = 0;

    while position_y(end) >= 0
        time(end+1) = time(end) + sample_rate;
        j = j + 1;

        %On first iteration: find vertical and horizontal velocity from the
        %resultant velocity
        if j == 1
            velocity_y(end) = sind(launch_angle)*velocity_r;
            velocity_x(end) = cosd(launch_angle)*velocity_r;
        else
            velocity_y(end+1) = acceleration_y(end) * sample_rate + velocity_y(end);
            velocity_x(end+1) = acceleration_x(end) * sample_rate + velocity_x(end);

            position_y(end+1) = velocity_y(end) * sample_rate + position_y(end);
            position_x(end+1) = velocity_x(end) * sample_rate + position_x(end);

            acceleration_y(end+1) = -9.81;
            acceleration_x(end+1) = 0;
        end
    end
    
    %Append launch angle and associated distance cleared
    distance_cleared(i,:) = [launch_angle, position_x(end)];
end

%Find maximum distance cleared and it's associated launch angle
max_distance = max(distance_cleared(:,2));
best_angle = distance_cleared(distance_cleared(:,2)==max_distance, 1);

disp(['Max distance cleared: ' num2str(max_distance) ' at angle: ' num2str(best_angle)])

figure
plot(distance_cleared(:, 1), distance_cleared(:, 2), 'bo', 'MarkerSize', 3)
xlabel('Launch Angle (deg)')
ylabel('Distance Cleared')
ylim([0 max(distance_cleared(:,2))+1])