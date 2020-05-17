%2D KINEMATICS p.1
%Created by: Daniel Kuhman
%Github: https://github.com/dkuhman
%Last updated: 2020-05-17

%Clear workspace
clear all
clc

%Calculate horizontal distance for a given velocity and height. Assume that
%air resistance/assistance is negligible. Launch angle is 0-degrees

%Initialize all variables of interest - these will become arrays as
%elements are appended in the while loop below
%y = vertical (up is + and down is -)
%x = horizontal
position_y = 30; %Initial position in vertical direction (height)
position_x = 0;

velocity_y = 0;
velocity_x = 4.1; %Horiszontal velocity; remains constant due to no air resistance

acceleration_y = -9.81; %Gravity
acceleration_x = 0; %Remains zero due to no air resistance

time = 0; %Initialize time as zero
sampling_rate = 0.01; %Specify a "sampling rate" which provides time steps in the loop below

%This loop will run until the projectile is no longer greater than zero. In
%other words, it will only run while the projectile is in the air. 
while position_y(end) > 0 
    time(end+1) = time(end) + sampling_rate; %Update time
    
    %Update velocity using velocity_final = acceleration * deltaT + velocity_initial
    velocity_y(end+1) = acceleration_y(end) * sampling_rate + velocity_y(end); 
    velocity_x(end+1) = acceleration_x(end) * sampling_rate + velocity_x(end);

    %Update position using position_final = velocity * deltaT + position_initial
    position_y(end+1) = velocity_y(end) * sampling_rate + position_y(end);
    position_x(end+1) = velocity_x(end) * sampling_rate + position_x(end);

    %Acceleration in both vertical and horizontal directions remain constant
    acceleration_y(end+1) = -9.81;
    acceleration_x(end+1) = 0;
end

horizontal_distance = position_x(end); %Get final horizontal position
disp(['Final horizontal displacement: ' num2str(horizontal_distance)])

%Plot displacement
figure
plot(position_x, position_y, 'LineWidth', 2)
xlabel('Horizontal Position')
ylabel('Vertical Position')
xlim([0 position_x(end)+1])
ylim([0 position_y(1)+5])