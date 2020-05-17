clear all; clc
%2D KINEMATICS
%%
%Find horizontal displacement of a projectile when the object is launched 
%at an angle with a given resultant velocity. The object is launched and
%lands at the same vertical position (no change in altitude). 

launch_angle = 40; %Launch angle (degrees)

%y = vertical (up is + and down is -)
%x = horizontal
position_y = 0; %Vertical position
position_x = 0; %Horizontal position

velocity_r = 5; %Resultant velocity
velocity_y = 0;
velocity_x = 0;

acceleration_y = -9.81; 
acceleration_x = 0;

time = 0;
sample_rate = 0.01;
j = 0;

while position_y(end) >= 0
    %Update time and iteration variable
    time(end+1) = time(end) + sample_rate;
    j = j + 1;
    
    %On first iteration, find vertical and horizontal velocity from the
    %resultant
    if j == 1 
        velocity_y(end) = sind(launch_angle)*velocity_r;
        velocity_x(end) = cosd(launch_angle)*velocity_r;
    else
        %Update velocity
        velocity_y(end+1) = acceleration_y(end) * sample_rate + velocity_y(end);
        velocity_x(end+1) = acceleration_x(end) * sample_rate + velocity_x(end);

        %Update position
        position_y(end+1) = velocity_y(end) * sample_rate + position_y(end);
        position_x(end+1) = velocity_x(end) * sample_rate + position_x(end);
   
        %Update acceleration
        acceleration_y(end+1) = -9.81;
        acceleration_x(end+1) = 0;
    end
end

disp(['Time: ' num2str(time(end))]) %Displays time projectile was in the air
disp(['Distance cleared: ' num2str(position_x(end))]) %Displays horizontal distance covered
disp(['Peak Height: ' num2str(max(position_y))]) %Displays projectile's peak height